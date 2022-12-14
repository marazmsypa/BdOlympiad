select Routes.RouteNumber, TransportTypes.TransportTypeName, Carriers.CarrierName, Carriers.CarierUrAdr from Routes 
left join TransportTypes on Routes.TransportTypeId = TransportTypes.TransportTypeId
left join Carriers on Routes.CarrierId = Carriers.CarrierId
where Routes.RouteId = 1;