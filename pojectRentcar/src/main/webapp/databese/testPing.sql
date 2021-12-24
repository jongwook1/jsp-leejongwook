 create schema rentCar;

 use rentCar;

create table users(
	 id varchar(20) primary key,
	 pw varchar(20) NOT null,
     userName varchar(20) null,
     birth int(20)  null,
     sex varchar(20)  null,
     email varchar(20)  null,
     phoneNumber int(20) null, 
     regDate datetime default current_timestamp			-- default current_timestamp 는 써도되고안써댐 현재시간기준으로 timeetamp 해줌
        
 );

select * from users;


 create table userChoice(
	 id varchar(20) primary key,
	 startDate varchar(20) NOT null,
	 endDate varchar(20) NOT null,
     choiceSopt varchar(20) null,
     carChoice varchar(20)  null,
     carClass varchar(20)  null,
     carName varchar(20)  null,
     carPrice int(20) null,
     userName varchar(20) null,
     birth int(20) null,
     phoneN int(20) null,
     drLicense int(20) null,
     dayCount int(20) null,
     totalPrice int(20) null,
     regDate datetime default current_timestamp			
        
 );

select * from userchoice;


create table board(
	no integer primary key auto_increment,
    id varchar(20) not null,
    pw varchar(20) not null,
	title varchar(50) not null,
    content varchar(1000) not null,    
    regdate datetime not null
);

select * from board;

create table administrator(
	 id varchar(20) primary key,
	 pw varchar(20) NOT null,
     regDate datetime default current_timestamp			
 );

 insert into administrator(id, pw) values ('ZZZZ','1111');
 
 select * from administrator
 
 create table noticeBoard(
	no integer primary key auto_increment,
    id varchar(20) not null,
    pw varchar(20) not null,
	title varchar(50) not null,
    content varchar(1000) not null,    
    regdate datetime not null
);
 
 select * from noticeBoard;