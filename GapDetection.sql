
insert into WD_Gaps select WatchDogTags.TagName, StartDateTime, EndDateTime, null from WatchDogTags 
  inner remote join AnalogSummaryHistory on AnalogSummaryHistory.TagName = WatchDogTags.TagName
where wwVersion = 'Latest'
AND wwRetrievalMode = 'Cyclic'
AND wwCycleCount = 1
AND StartDateTime >= DATEADD(minute,-1,getdate())
AND EndDateTime <= getdate()
and ValueCount < ValuesPerMinute
