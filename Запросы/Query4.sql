select Routes.RouteNumber, Routes.RouteTime, RoutesDays.RouteDaysName, TransportTypes.TransportTypeName, Stations.StationName from Routes 
left join RoutesDays on Routes.ActiveDaysId = RoutesDays.RouteDaysId
left join TransportTypes on Routes.TransportTypeId = TransportTypes.TransportTypeId
left join RoutesStations on RoutesStations.RouteId = Routes.RouteId
left join Stations on RoutesStations.StationId = Stations.StationId
where Routes.RouteId = 1;