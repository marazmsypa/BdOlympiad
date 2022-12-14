select (select count(StationId) from RoutesStations where RoutesStations.StationId = 1) as 'Кол-во маршрутов', Stations.StationPavilion from RoutesStations 
left join Stations on RoutesStations.StationId = Stations.StationId
where RoutesStations.StationId = 1
group by Stations.StationPavilion;