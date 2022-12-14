select count(TransportShedule.RouteId) as 'Кол-во рейсов за месяц' 
from TransportShedule where RouteId = 1 and TransportShedule.WorkDate > '2022-12-01'
and TransportShedule.WorkDate < '2022-12-31';