select count(TransportShedule.RouteId) as '���-�� ������ �� �����' 
from TransportShedule where RouteId = 1 and TransportShedule.WorkDate > '2022-12-01'
and TransportShedule.WorkDate < '2022-12-31';