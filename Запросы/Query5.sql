select (select count(StationId) from RoutesStations where RoutesStations.StationId = 1) as '���-�� ���������', Stations.StationPavilion from RoutesStations 
left join Stations on RoutesStations.StationId = Stations.StationId
where RoutesStations.StationId = 1
group by Stations.StationPavilion;