Create view ÑanceledShedules as 
select Routes.RouteNumber, TransportShedule.WorkStartTime, 
TransportShedule.WorkEndTime, TransportShedule.WorkDate, SheduleChanges.NewStartTime, SheduleChanges.NewEndTime, SheduleChanges.NewWorkDate,
SheduleChanges.ChangeReason from TransportShedule
left join Routes on TransportShedule.RouteId = Routes.RouteId
left join SheduleChanges on SheduleChanges.SheduleId = TransportShedule.TransportSheduleId
where SheduleChanges.IsDeclined = 1;

