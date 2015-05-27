--/
CREATE PROCEDURE `baimd05`.`analysisBaimd01`()
begin
        insert into xdat_middle_bai(number,imei,imsi,DevNo,DateTime)
        select count(1) as num, imei,imsi,devNo,'2015-05-23 00:00:00' from xdat_2015_05_23_00_23 group by imei,imsi,devNo;
        
end

--/

set global innodb_lock_wait_timeout=500;

drop table xdat_middle_bai

CREATE TABLE
    xdat_middle_bai
    (
        id bigint NOT NULL AUTO_INCREMENT,
        DevNo INT(4),
        imsi VARCHAR(15),
        imei VARCHAR(15),
        DATETIME DATETIME,
        number int(4),
        PRIMARY KEY (id),
        INDEX devNo (DevNo),
        INDEX DATETIME (DATETIME),
        INDEX imei (imei),
        INDEX imsi (imsi),
    )
    ENGINE=MyISAM DEFAULT CHARSET=utf8;





--
select * from(
select count(1) as  num, imsi, imei from (
select  imsi,imei from xdat_2015_05_21_00_23 where devNo=6 group by imsi,imei union all 
select  imsi,imei from xdat_2015_05_20_00_23 where devNo=6 group by imsi,imei union all
select  imsi,imei from xdat_2015_05_19_00_23 where devNo=6 group by imsi,imei union all
select  imsi,imei from xdat_2015_05_18_00_23 where devNo=6 group by imsi,imei union all
select  imsi,imei from xdat_2015_05_17_00_23 where devNo=6 group by imsi,imei union all
select  imsi,imei from xdat_2015_05_18_00_23 where devNo=6 group by imsi,imei union all
select  imsi,imei from xdat_2015_05_17_00_23 where devNo=6 group by imsi,imei ) as tmp group by imsi,imei ) as tmp1  where num >=3  group by imsi,imei



--4:00~6:00
select imei from (
select imsi,imei from xdat_2015_05_22_00_23 where devNo=6  and DateTime >='2015-05-22 04:00:00' and DateTime <= '2015-05-22 05:00:00' 
        group by imsi,imei ) as tmp where imei not in (
        select imei from(
select count(1) as  num, imsi, imei from (
select  imsi,imei from xdat_2015_05_21_00_23 where devNo=6 group by imsi,imei union all 
select  imsi,imei from xdat_2015_05_20_00_23 where devNo=6 group by imsi,imei union all
select  imsi,imei from xdat_2015_05_19_00_23 where devNo=6 group by imsi,imei union all
select  imsi,imei from xdat_2015_05_18_00_23 where devNo=6 group by imsi,imei union all
select  imsi,imei from xdat_2015_05_17_00_23 where devNo=6 group by imsi,imei union all
select  imsi,imei from xdat_2015_05_18_00_23 where devNo=6 group by imsi,imei union all
select  imsi,imei from xdat_2015_05_17_00_23 where devNo=6 group by imsi,imei ) as tmp group by imsi,imei ) as tmp1  where num >=3  group by imsi,imei
        )
        
        
--
insert into xdat_hmd_6_283(imei)
select imei from (
select imsi,imei from xdat_2015_05_22_00_23 where devNo=6  and DateTime >='2015-05-22 04:10:00' and DateTime <= '2015-05-22 04:40:00' 
        group by imsi,imei ) as tmp where imei not in (
        select imei from(
select count(1) as  num, imsi, imei from (
select  imsi,imei from xdat_2015_05_21_00_23 where devNo in (5,6,7) group by imsi,imei union all 
select  imsi,imei from xdat_2015_05_20_00_23 where devNo in (5,6,7) group by imsi,imei union all
select  imsi,imei from xdat_2015_05_19_00_23 where devNo in (5,6,7) group by imsi,imei union all
select  imsi,imei from xdat_2015_05_18_00_23 where devNo in (5,6,7) group by imsi,imei union all
select  imsi,imei from xdat_2015_05_17_00_23 where devNo in (5,6,7) group by imsi,imei union all
select  imsi,imei from xdat_2015_05_18_00_23 where devNo in (5,6,7) group by imsi,imei union all
select  imsi,imei from xdat_2015_05_17_00_23 where devNo in (5,6,7) group by imsi,imei ) as tmp group by imsi,imei ) as tmp1  where num >=3  group by imsi,imei
        )
 
        
select * from (
select * from xdat_2015_05_22_00_23 where imei in (select imei from xdat_hmd_6_283)
) as tmp  where devNo=6  and DateTime >='2015-05-22 04:00:00' and DateTime <= '2015-05-22 04:40:00'  order by DateTime

select * from xdat_2015_05_22_00_23 where imsi='460002840241983'

create index imsi_imei_datetime on xdat_2015_05_23_00_23(imsi,imei,datetime)
create index imsi_imei_datetime on xdat_2015_05_24_00_23(imsi,imei,datetime)
create index imsi_imei on xdat_2015_05_23_00_23(imsi,imei)
create index imsi_imei on xdat_2015_05_24_00_23(imsi,imei)
create index imsi_imei_devno on xdat_2015_05_23_00_23(imsi,imei,devno)
create index devno_datetime on xdat_2015_05_23_00_23(devno,datetime)

select * from (select count(1) as num,imsi,imei, devNo from xdat_2015_05_24_00_23  where Province= 28 and DateTime <='2015-05-24 04:00:00' group by imsi,imei, devNo order by imei, DateTime desc ) as tmp 



select v.id from vehicle v
select o.id, v.id,v.LICENSE_PLATE_NUMBER from orders o,vehicle v  where o.vehicle_id = v.id

select count(o.id), sum(o.PREDICT_AMOUNT), v.id,v.LICENSE_PLATE_NUMBER from vehicle v left join orders o on o.vehicle_id = v.id where o.status in(2,3,4) group by v.LICENSE_PLATE_NUMBER

(select v.id,v.license_plate_number,p. from vehicle v left join peccancy p on v.id=p.vehicle_id) union (select * from vehicle v left join malfunction m on v.id=m.vehicle_id)


select * from station_vehicle,vehicle,vehicle_type,station,district 
 where station_vehicle.vehicle_id=vehicle.id  and district_id=station.district_id  and station.id=station_vehicle.station_id 
  and vehicle_type.id = vehicle.vehicle_type_id  and station_vehicle.is_valid = 0  and station_vehicle.status=2  
  --and (station_vehicle.start_time between '2015-05-16 00:00:00'  and  '2015-05-23 23:59:59'  or station_vehicle.end_time ='2000-01-01 00:00:00')  
  and vehicle.STATUS = '1'   and station_vehicle.station_id=174  and district.id =3
  
  
  
 select *  from Heartbeat_Protocol hp where 1=1  and hp.posvalId=1  and hp.vehicle_id=142  and hp.heart_Time>='2015-05-13 10:07:17'  and hp.heart_Time<='2015-05-17 10:14:15'  group by hp.vehicle_id , hp.order_id 





 insert into xdat_middle_bai(number,imei,imsi,DevNo,DateTime)
        select count(1) as num, imei,imsi,devNo,'2015-05-23 00:00:00' from xdat_2015_05_23_00_23 group by imei,imsi,devNo