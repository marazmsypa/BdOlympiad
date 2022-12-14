select Routes.RouteNumber, Routes.RouteTime, RoutesDays.RouteDaysName, TransportShedule.WorkStartTime, TransportShedule.WorkEndTime, TransportShedule.WorkDate from TransportShedule
left join Routes on TransportShedule.RouteId = Routes.RouteId
left join RoutesDays on Routes.ActiveDaysId = RoutesDays.RouteDaysId
where Routes.RouteId = 1;