HW1_1

CREATE TABLE public.students (
	id serial4 NOT NULL,
	"name" varchar(50) NOT NULL,
	email varchar(50) NOT NULL,
	"password" varchar(50) NOT NULL,
	created_on timestamp NOT NULL,
	CONSTRAINT students_email_key UNIQUE (email),
	CONSTRAINT students_pkey PRIMARY KEY (id)
);
-- 1. Вывести все поля и все строки.
 
select * from public.students;

-- 2. Вывести всех студентов в таблице
 
select name from public.students;

-- 3. Вывести только Id пользователей
 
select id from public.students;

-- 4. Вывести только имя пользователей

select email from public.students;

 6. Вывести имя и email пользователей

-- 5. Вывести только email пользователей

select name,email from public.students;

-- 7. Вывести id, имя, email и дату создания пользователей
 
select id,name,email from public.students;

-- 8. Вывести пользователей где password 12333

select id,name,email,password from public.students
where password = '12333';

-- 9. Вывести пользователей которые были созданы 2021-03-26 00:00:00

select id,name,email,password,created_on from public.students
where created_on = '2021-03-26 00:00:00';

--10.Вывести пользователей где в имени есть слово Анна

select id,name,email,password,created_on from public.students
where name like '%Anna%';

-- 11. Вывести пользователей где в имени в конце есть 8

select id,name,email,password,created_on from public.students
where name like '%8%';

-- 12. Вывести пользователей где в имени в есть буква а

select id,name,email,password,created_on from public.students
where name like '%a%';

-- 13. Вывести пользователей которые были созданы 2021-07-12 00:00:00

select id,name,email,password,created_on from public.students
where created_on = '2021-07-12 00:00:00';

-- 14. Вывести пользователей которые были созданы 2021-07-12 00:00:00 и имеют пароль 1m313

select id,name,email,password,created_on from public.students
where created_on = '2021-07-12 00:00:00' and "password" = '1m313';

-- 15. Вывести пользователей которые были созданы 2021-07-12 00:00:00 и у которых в имени есть слово Andrey

select id,name,email,password,created_on from public.students
where created_on = '2021-07-12 00:00:00' and "name" like '%Andrey%';

--16. Вывести пользователей которые были созданы 2021-07-12 00:00:00 и у которых в имени есть цифра 8

select id,name,email,password,created_on from public.students
where created_on = '2021-07-12 00:00:00' and "name" like '%8%';

-- 17. Вывести пользователя у которых id равен 110

select id,name,email,password,created_on from public.students
where id = 110;

-- 17. Вывести пользователя у которых id равен 153

select id,name,email,password,created_on from public.students
where id = 153;

-- 17. Вывести пользователя у которых id больше 140

select id,name,email,password,created_on from public.students
where id > 140;

--20. Вывести пользователя у которых id меньше 130

select id,name,email,password,created_on from public.students
where id < 130;

--21. Вывести пользователя у которых id меньше 127 или больше 188
select id,name,email,password,created_on from public.students
where id < 127 or id > 188

-- 22. Вывести пользователя у которых id меньше либо равно 137

select id,name,email,password,created_on from public.students
where id <= 137
order by id desc; 

-- 23. Вывести пользователя у которых id больше либо равно 137

select id,name,email,password,created_on from public.students
where id >= 137
order by id; 

--24. Вывести пользователя у которых id больше 180 но меньше 190

select id,name,email,password,created_on from public.students
where id > 180 and id < 190
order by id; 

-- 25. Вывести пользователя у которых id между 180 и 190

select id,name,email,password,created_on from public.students
where id between 180 and 190;

--26. Вывести пользователей где password равен 12333, 1m313, 123313

select id,name,email,password,created_on from public.students
where "password" in ('12333', '1m313', '123313');

 27. Вывести пользователей где created_on равен 2020-10-03 00:00:00, 2021-05-19 00:00:00, 2021-03-26 00:00:00
 
select id,name,email,password,created_on from public.students
where created_on  in ('2020-10-03 00:00:00', '2021-05-19 00:00:00', '2021-03-26 00:00:00')
order by created_on asc;

-- 28. Вывести минимальный id 

select  min(id) as min_id from public.students;

-- 29. Вывести максимальный id.

select  max(id) as max_id from public.students;

-- 30. Вывести количество пользователей

select  count(id) as лоличество_пользователей from public.students;

-- 31. Вывести id пользователя, имя, дату создания пользователя. Отсортировать по порядку возрастания даты добавления пользоватлеля
select id,name,created_on from public.students
order by created_on asc;
.
-- 32. Вывести id пользователя, имя, дату создания пользователя. Отсортировать по порядку убывания даты добавления пользоватлеля.

select id,name,created_on from public.students
order by created_on desc; 





