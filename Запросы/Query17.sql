select StaffInfo.StaffName,
sum(case when TransportShedule.WorkDate > '2022-12-01' and TransportShedule.WorkDate < '2022-12-31' then 1 else 0 end) as '���������� ���� �� �����'
from TransportShedule
left join Drivers on Drivers.DriverId = TransportShedule.DriverId
left join StaffInfo on Drivers.DriverId = StaffInfo.TransportStaffId
group by StaffInfo.StaffName;

