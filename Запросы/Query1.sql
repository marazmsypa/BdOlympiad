select Routes.RouteNumber, Routes.RouteTime, RoutesDays.RouteDaysName, TransportTypes.TransportTypeName from Routes 
left join RoutesDays on Routes.ActiveDaysId = RoutesDays.RouteDaysId
left join TransportTypes on Routes.TransportTypeId = TransportTypes.TransportTypeId
where TransportTypes.TransportTypeName = '�������'
order by Routes.RouteNumber;