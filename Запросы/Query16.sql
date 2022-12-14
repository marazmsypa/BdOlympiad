select Routes.RouteNumber,
sum(case when TransportShedule.WorkDate = '2022-12-05' then 1 else 0 end) as 'кол-во автобусов'
from TransportShedule
left join Routes on TransportShedule.RouteId = Routes.RouteId
group by Routes.RouteNumber;