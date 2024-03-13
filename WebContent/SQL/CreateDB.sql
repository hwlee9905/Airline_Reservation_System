DROP DATABASE IF EXISTS airport;
CREATE DATABASE IF NOT EXISTS airport;

drop table if exists passenger;
create table passenger(
   ID varchar(50),
   PW int,
   name varchar(20),
   address varchar(100),
   passport varchar(30),
   regdate DATE,
   tel varchar(30),
   grade varchar(5),
   primary key(ID)
);
drop table if exists administrator;
create table administrator(
   adID varchar(50),
   PW int,
   name varchar(20),
   address varchar(100),
   regdate DATE,
   tel varchar(30),
   rank varchar(20),
   primary key(adID)
);
drop table if exists aircraft;
create table aircraft(
   aircraftnum int,
   size int,
   weight int,
   speed int,
   holdpersonnumber int,
   productiondate DATE,
   price int,
   primary key(aircraftnum)
);
drop table if exists flight;
create table flight(
   date DATE,
   flightnum int,
   stime varchar(20),
   atime varchar(20),
   departpoint varchar(20),
   destination varchar(20),
   fightime varchar(20),
   fee int,
   primary key(date, stime, atime, flightnum)
);
drop table if exists assign;
create table assign(
   flightnum int,
   aircraftnum int,
   date DATE,
   leftseats int,
   refundyn varchar(20),
   primary key(flightnum, aircraftnum)
);
drop table if exists reservation;
create table reservation(
   ID varchar(50),
   date DATE,
   flightnum int,
   stime varchar(20),
   atime varchar(20),
   departpoint varchar(20),
   destination varchar(20),
   aircraftnum int,
   reservationum int,
   fee int,
   reserdate DATE,
   refundyn varchar(20),
   headcount int,
   primary key(date, stime, atime, flightnum, aircraftnum, ID, reservationum)
);
drop table if exists refund;
create table refund(
   reservationum int,
   ID varchar(50),
   adID varchar(50),
   refundreason varchar(100),
   refundate DATE,
   refundprice int,
   primary key(ID, reservationum)
);