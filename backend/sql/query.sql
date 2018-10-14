create database Training

create table Trainee(trainee_id int(10) unsigned not null AUTO_INCREMENT primary key, name varchar(255) not null, email varchar(255) not null)
create table Course(course_id int(10) unsigned not null AUTO_INCREMENT primary key, name varchar(255) not null, description varchar(255) not null)
create table History(history_id int(10) unsigned not null AUTO_INCREMENT primary key, trainee_id int(10) unsigned not null, course_id int(10) unsigned not null, start int(11) not null, end int(11) not null, status tinyint(4) not null)

alter table History add constraint History$trainee_id foreign key(trainee_id) references Trainee(trainee_id)
alter table History add constraint History$course_id foreign key(course_id) references Course(course_id)

insert into Trainee(name, email) values('Kuroi Saku', 'kuroi.saku@yandex.jp')
insert into Trainee(name, email) values('Kuroi Risa', 'risa_chan@yandex.jp')
insert into Trainee(name, email) values('Matsuda Rika', 'rikarika@yahoo.jp')
insert into Trainee(name, email) values('Fumine Erika', 'fumine.erika@yahoo.jp')
insert into Trainee(name, email) values('Kanzaki Hiroshi', 'destroyerrr@yandex.jp')
insert into Trainee(name, email) values('Wanaoka Aki', 'wanaoka.bigboy@yandex.jp')

insert into Course(name, description) values('PHP', 'Course about PHP')
insert into Course(name, description) values('JS', 'Course about JS')
insert into Course(name, description) values('HTML+CSS', 'Course about HTML and CSS')
insert into Course(name, description) values('SQL', 'Course about databases')

insert into History(trainee_id, course_id, start, end, status) values(1,1,5,9,0)
insert into History(trainee_id, course_id, start, end, status) values(2,1,5,9,1)
insert into History(trainee_id, course_id, start, end, status) values(3,1,6,8,1)
insert into History(trainee_id, course_id, start, end, status) values(4,1,7,9,1)
insert into History(trainee_id, course_id, start, end, status) values(5,2,3,10,0)
insert into History(trainee_id, course_id, start, end, status) values(6,2,4,10,1)
insert into History(trainee_id, course_id, start, end, status) values(3,3,5,10,1)
insert into History(trainee_id, course_id, start, end, status) values(4,3,6,10,1)
insert into History(trainee_id, course_id, start, end, status) values(4,4,7,10,1)
insert into History(trainee_id, course_id, start, end, status) values(2,4,8,9,1)

select Trainee.name, Trainee.email, Course.name, History.course_end 
from History inner join Trainee on History.trainee_id = Trainee.trainee_id inner join Course on History.course_id = Course.course_id 
where Course.name = 'PHP' and History.course_end = 9 and History.course_status = 1

select Course.name, count(*) 
from History inner join Course on History.course_id = Course.course_id 
where History.course_status = 1 and History.course_end = 10 
group by Course.name