select Routes.RouteNumber, Routes.RouteTime, RoutesDays.RouteDaysName, TransportTypes.TransportTypeName, Carriers.CarrierName from Routes 
left join RoutesDays on Routes.ActiveDaysId = RoutesDays.RouteDaysId
left join TransportTypes on Routes.TransportTypeId = TransportTypes.TransportTypeId
left join Carriers on Routes.CarrierId = Carriers.CarrierId
where Routes.CarrierId = 4;



