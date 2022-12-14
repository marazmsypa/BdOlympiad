select Routes.RouteNumber, Routes.RouteTime, RoutesDays.RouteDaysName, TransportShedule.WorkStartTime, 
TransportShedule.WorkEndTime, TransportShedule.WorkDate, Stations.StationName, Stations.PreviousStationDistanse,
stations.PreviousStationTime from TransportShedule
left join Routes on TransportShedule.RouteId = Routes.RouteId
left join RoutesDays on Routes.ActiveDaysId = RoutesDays.RouteDaysId
left join RoutesStations on RoutesStations.RouteId = Routes.RouteId
left join Stations on RoutesStations.StationId = Stations.StationId
where TransportShedule.TransportSheduleId = 1;