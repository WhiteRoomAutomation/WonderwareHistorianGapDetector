


insert into WD_Gaps select WatchDogTags.TagName, StartDateTime, null, null from WatchDogTags left join WD_Gaps on WatchDogTags.TagName = WD_Gaps.WD_Name
  inner remote join AnalogSummaryHistory on AnalogSummaryHistory.TagName = WatchDogTags.TagName
where wwVersion = 'Latest'
AND wwRetrievalMode = 'Cyclic'
AND wwCycleCount = 1
AND StartDateTime >= DATEADD(minute,-1,getdate())
AND EndDateTime <= getdate()
and ValueCount < ValuesPerMinute
and (GapStart is null or GapEnd is not null)

IF OBJECT_ID('tempdb..#opengaps') IS NOT NULL
    DROP TABLE #opengaps

select WatchDogTags.TagName, GapStart, StartDateTime into #opengaps from WatchDogTags left join WD_Gaps on WatchDogTags.TagName = WD_Gaps.WD_Name
  inner remote join AnalogSummaryHistory on AnalogSummaryHistory.TagName = WatchDogTags.TagName
where wwVersion = 'Latest'
AND wwRetrievalMode = 'Cyclic'
AND wwCycleCount = 1
AND StartDateTime >= DATEADD(minute,-1,getdate())
AND EndDateTime <= getdate()
and ValueCount >= ValuesPerMinute
and GapStart is not null and GapEnd is null

select * from #opengaps

update WD_Gaps

set WD_Gaps.GapEnd = #opengaps.StartDateTime
from WD_Gaps
inner join #opengaps on WD_Gaps.WD_Name = #opengaps.TagName and WD_Gaps.GapStart = #opengaps.GapStart



IF OBJECT_ID('tempdb..#opengaps') IS NOT NULL
    DROP TABLE #opengaps



