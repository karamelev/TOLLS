create table salary(
id serial primary key,
monthly_salary int not null
);

create table employees(
id serial primary key,
employee_name Varchar(50) not null
);

create table roles(
id serial primary key,
role_name varchar(30) not null unique
);

create table roles_employee(
id serial primary key,
employee_id int not null unique, 
role_id int not null, 
	foreign key(employee_id)
		references employees(id),
	foreign key (role_id)
		references roles(id)
);

create table employee_salary(
id serial primary key,
employee_id int not null unique,
salary_id int not null
);

INSERT INTO salary(monthly_salary)
VALUES
(1000),
(1100),
(1200),
(1300),
(1400),
(1500),
(1600),
(1700),
(1800),
(1900),
(2000),
(2100),
(2200),
(2300),
(2400);

INSERT INTO employees (employee_name)
VALUES 
('Смирнов'),
('Иванов'),
('Кузнецов'),
('Соколов'),
('Попов'),
('Лебедев'),
('Козлов'),
('Новиков'),
('Морозов'),
('Петров'),
('Волков'),
('Соловьёв'),
('Васильев'),
('Зайцев'),
('Павлов'),
('Семёнов'),
('Голубев'),
('Виноградов'),
('Богданов'),
('Воробьёв'),
('Фёдоров'),
('Михайлов'),
('Беляев'),
('Тарасов'),
('Белов'),
('Комаров'),
('Орлов'),
('Киселёв'),
('Макаров'),
('Андреев'),
('Ковалёв'),
('Ильин'),
('Гусев'),
('Титов'),
('Кузьмин'),
('Кудрявцев'),
('Баранов'),
('Куликов'),
('Алексеев'),
('Степанов'),
('Яковлев'),
('Сорокин'),
('Сергеев'),
('Романов'),
('Захаров'),
('Борисов'),
('Королёв'),
('Герасимов'),
('Пономарёв'),
('Григорьев'),
('Лазарев'),
('Медведев'),
('Ершов'),
('Никитин'),
('Соболев'),
('Рябов'),
('Поляков'),
('Цветков'),
('Данилов'),
('Жуков'),
('Фролов'),
('Журавлёв'),
('Николаев'),
('Крылов'),
('Максимов'),
('Сидоров'),
('Осипов'),
('Белоусов'),
('Федотов'),
('Дорофеев');

INSERT INTO roles (role_name)
VALUES 
('Junior Python developer'),
('Middle Python developer'),
('Senior Python developer'),
('Junior Java developer'),
('Middle Java developer'),
('Senior Java developer'),
('Junior JavaScript developer'),
('Middle JavaScript developer'),
('Senior JavaScript developer'),
('Junior Manual QA engineer'),
('Middle Manual QA engineer'),
('Senior Manual QA engineer'),
('Project Manager'),
('Designer'),
('HR'),
('CEO'),
('Sales manager'),
('Junior Automation QA engineer'),
('Middle Automation QA engineer'),
('Senior Automation QA engineer');

INSERT INTO roles_employee(employee_id,role_id)
VALUES
(1,2),
(2,15),
(3,9),
(4,3),
(5,13),
(6,7),
(7,2),
(8,2),
(9,4),
(10,9),
(11,2),
(12,2),
(13,4),
(14,4),
(15,5),
(16,5),
(17,5),
(18,6),
(19,6),
(20,4),
(21,3),
(22,13),
(23,4),
(24,7),
(25,7),
(26,8),
(27,8),
(28,8),
(29,9),
(30,9),
(31,10),
(32,10),
(33,11),
(34,4),
(35,11),
(36,12),
(37,14),
(38,16),
(39,18),
(40,19);

INSERT INTO employee_salary (employee_id,salary_id)
VALUES 
(1,4),
(2,6),
(3,7),
(4,14),
(5,9),
(6,2),
(7,2),
(8,2),
(9,3),
(10,18),
(11,2),
(12,3),
(13,3),
(14,2),
(15,13),
(16,1),
(17,7),
(18,13),
(19,13),
(20,3),
(21,15),
(22,11),
(23,4),
(24,2),
(25,2),
(26,4),
(27,7),
(33,7),
(52,10),
(40,13),
(71,6),
(72,7),
(73,9),
(74,2),
(75,5),
(76,9),
(77,16),
(78,9),
(79,3),
(80,6);



 1. В(ывести всех работников чьи зарплаты есть в базе, вместе с зарплатами.

SELECT
    employees.employee_name,
    salary.monthly_salary
FROM
    employees
JOIN employee_salary ON employees.id = employee_salary.employee_id
JOIN salary ON salary.id = employee_salary.salary_id

 2. Вывести всех работников у которых ЗП меньше 2000.

SELECT
   employee_name,
   monthly_salary
FROM
    employees
JOIN employee_salary ON employees.id = employee_salary.employee_id
JOIN salary ON salary.id = employee_salary.salary_id
WHERE monthly_salary<2000

 3. Вывести все зарплатные позиции, но работник по ним не назначен. (ЗП есть, но не понятно кто её получает.)

SELECT employee_salary.employee_id,monthly_salary FROM salary 
JOIN employee_salary ON salary.id = employee_salary.salary_id
WHERE employee_salary.employee_id NOT IN(SELECT id FROM employees)

 4. Вывести все зарплатные позиции  меньше 2000 но работник по ним не назначен. (ЗП есть, но не понятно кто её получает.)

SELECT employee_salary.employee_id,monthly_salary FROM salary 
JOIN employee_salary ON salary.id = employee_salary.salary_id
WHERE employee_salary.employee_id NOT IN(SELECT id FROM employees) 
AND salary.monthly_salary<2000

 5. Найти всех работников кому не начислена ЗП.

SELECT employees.id,employee_name FROM employees
WHERE employees.id NOT IN(SELECT employee_id FROM employee_salary) 


6. Вывести всех работников с названиями их должности.

SELECT
    employee_name,
    role_name
FROM
    employees
JOIN roles_employee ON employees.id = roles_employee.employee_id
JOIN roles ON roles_employee.role_id = roles.id

7. Вывести имена и должность только Java разработчиков.

SELECT
    employee_name,
    role_name
FROM
    employees
JOIN roles_employee ON employees.id = roles_employee.employee_id
JOIN roles ON roles_employee.role_id = roles.id
WHERE role_name LIKE ('%Java %')

8. Вывести имена и должность только Python разработчиков.

SELECT
    employee_name,
    role_name
FROM
    employees
JOIN roles_employee ON employees.id = roles_employee.employee_id
JOIN roles ON roles_employee.role_id = roles.id
WHERE role_name LIKE ('%Python%')

 9. Вывести имена и должность всех QA инженеров.

SELECT
    employee_name,
    role_name
FROM
    employees
JOIN roles_employee ON employees.id = roles_employee.employee_id
JOIN roles ON roles_employee.role_id = roles.id
WHERE role_name LIKE ('%QA%')

 10. Вывести имена и должность ручных QA инженеров.

SELECT
    employee_name,
    role_name
FROM
    employees
JOIN roles_employee ON employees.id = roles_employee.employee_id
JOIN roles ON roles_employee.role_id = roles.id
WHERE role_name LIKE ('%Manual QA%')

11. Вывести имена и должность автоматизаторов QA

SELECT
    employee_name,
    role_name
FROM
    employees
JOIN roles_employee ON employees.id = roles_employee.employee_id
JOIN roles ON roles_employee.role_id = roles.id
WHERE role_name LIKE ('%Automation QA%')

 12. Вывести имена и зарплаты Junior специалистов

SELECT
    employee_name,
    monthly_salary,
    role_name
FROM
    employees
JOIN roles_employee ON employees.id = roles_employee.employee_id
JOIN roles ON roles_employee.role_id = roles.id
JOIN employee_salary ON roles_employee.employee_id = employee_salary.employee_id
JOIN salary ON employee_salary.salary_id = salary.id
WHERE role_name LIKE ('%Junior%')

13. Вывести имена и зарплаты Middle специалистов

SELECT
    employee_name,
    monthly_salary,
    role_name
FROM
    employees
JOIN roles_employee ON employees.id = roles_employee.employee_id
JOIN roles ON roles_employee.role_id = roles.id
JOIN employee_salary ON roles_employee.employee_id = employee_salary.employee_id
JOIN salary ON employee_salary.salary_id = salary.id
WHERE role_name LIKE ('%Middle%')

 14. Вывести имена и зарплаты Senior специалистов

SELECT
    employee_name,
    monthly_salary,
    role_name
FROM
    employees
JOIN roles_employee ON employees.id = roles_employee.employee_id
JOIN roles ON roles_employee.role_id = roles.id
JOIN employee_salary ON roles_employee.employee_id = employee_salary.employee_id
JOIN salary ON employee_salary.salary_id = salary.id
WHERE role_name LIKE ('%Senior%')

15. Вывести зарплаты Java разработчиков

SELECT
    employee_name,
    monthly_salary,
    role_name
FROM
    employees
JOIN roles_employee ON employees.id = roles_employee.employee_id
JOIN roles ON roles_employee.role_id = roles.id
JOIN employee_salary ON roles_employee.employee_id = employee_salary.employee_id
JOIN salary ON employee_salary.salary_id = salary.id
WHERE role_name LIKE ('%Java %')

 16. Вывести зарплаты Python разработчиков

SELECT
    employee_name,
    monthly_salary,
    role_name
FROM
    employees
JOIN roles_employee ON employees.id = roles_employee.employee_id
JOIN roles ON roles_employee.role_id = roles.id
JOIN employee_salary ON roles_employee.employee_id = employee_salary.employee_id
JOIN salary ON employee_salary.salary_id = salary.id
WHERE role_name LIKE ('%Python%')

 17. Вывести имена и зарплаты Junior Python разработчиков
 
SELECT
    employee_name,
    monthly_salary,
    role_name
FROM
    employees
JOIN roles_employee ON employees.id = roles_employee.employee_id
JOIN roles ON roles_employee.role_id = roles.id
JOIN employee_salary ON roles_employee.employee_id = employee_salary.employee_id
JOIN salary ON employee_salary.salary_id = salary.id
WHERE role_name LIKE ('%Junior Python%')

 18. Вывести имена и зарплаты Middle JS разработчиков

SELECT
    employee_name,
    monthly_salary,
    role_name
FROM
    employees
JOIN roles_employee ON employees.id = roles_employee.employee_id
JOIN roles ON roles_employee.role_id = roles.id
JOIN employee_salary ON roles_employee.employee_id = employee_salary.employee_id
JOIN salary ON employee_salary.salary_id = salary.id
WHERE role_name LIKE ('%Middle JavaScript%')

 19. Вывести имена и зарплаты Senior Java разработчиков
 
SELECT
    employee_name,
    monthly_salary,
    role_name
FROM
    employees
JOIN roles_employee ON employees.id = roles_employee.employee_id
JOIN roles ON roles_employee.role_id = roles.id
JOIN employee_salary ON roles_employee.employee_id = employee_salary.employee_id
JOIN salary ON employee_salary.salary_id = salary.id
WHERE role_name LIKE ('%Senior Java %')

 20. Вывести зарплаты Junior QA инженеров

SELECT
    employee_name,
    monthly_salary,
    role_name
FROM
    employees
JOIN roles_employee ON employees.id = roles_employee.employee_id
JOIN roles ON roles_employee.role_id = roles.id
JOIN employee_salary ON roles_employee.employee_id = employee_salary.employee_id
JOIN salary ON employee_salary.salary_id = salary.id
WHERE role_name LIKE ('%Junior%QA%')

 21. Вывести среднюю зарплату всех Junior специалистов

SELECT
     ROUND(AVG(monthly_salary),0) AS средняя_зарплата_Junior
FROM
    employees
JOIN roles_employee ON employees.id = roles_employee.employee_id
JOIN roles ON roles_employee.role_id = roles.id
JOIN employee_salary ON roles_employee.employee_id = employee_salary.employee_id
JOIN salary ON employee_salary.salary_id = salary.id
WHERE role_name LIKE ('%Junior%')

 22. Вывести сумму зарплат JS разработчиков

SELECT
    SUM(monthly_salary)AS Сумма_зарплат_JS_Developers
FROM
    employees
JOIN roles_employee ON employees.id = roles_employee.employee_id
JOIN roles ON roles_employee.role_id = roles.id
JOIN employee_salary ON roles_employee.employee_id = employee_salary.employee_id
JOIN salary ON employee_salary.salary_id = salary.id
WHERE role_name LIKE ('%JavaScript%')

23. Вывести минимальную ЗП QA инженеров

SELECT
    MIN(monthly_salary)AS min_salary_QA
FROM
    employees
JOIN roles_employee ON employees.id = roles_employee.employee_id
JOIN roles ON roles_employee.role_id = roles.id
JOIN employee_salary ON roles_employee.employee_id = employee_salary.employee_id
JOIN salary ON employee_salary.salary_id = salary.id
WHERE role_name LIKE ('%QA%')

 24. Вывести максимальную ЗП QA инженеров

SELECT
	MAX(monthly_salary)AS MAX_salary_QA
FROM
    employees
JOIN roles_employee ON employees.id = roles_employee.employee_id
JOIN roles ON roles_employee.role_id = roles.id
JOIN employee_salary ON roles_employee.employee_id = employee_salary.employee_id
JOIN salary ON employee_salary.salary_id = salary.id
WHERE role_name LIKE ('%QA%')

 25. Вывести количество QA инженеров

SELECT
    COUNT(roles_employee.role_id)AS количество_QA_инженеров
FROM
    employees
JOIN roles_employee ON employees.id = roles_employee.employee_id
JOIN roles ON roles_employee.role_id = roles.id
JOIN employee_salary ON roles_employee.employee_id = employee_salary.employee_id
JOIN salary ON employee_salary.salary_id = salary.id
WHERE role_name LIKE ('%QA%')

 26. Вывести количество Middle специалистов.

SELECT
    COUNT(roles_employee.role_id)AS количество_Middle
FROM
    employees
JOIN roles_employee ON employees.id = roles_employee.employee_id
JOIN roles ON roles_employee.role_id = roles.id
JOIN employee_salary ON roles_employee.employee_id = employee_salary.employee_id
JOIN salary ON employee_salary.salary_id = salary.id
WHERE role_name LIKE ('%Middle%')

 27. Вывести количество разработчиков

SELECT
    COUNT(roles_employee.role_id)AS количество_Middle
FROM
    employees
JOIN roles_employee ON employees.id = roles_employee.employee_id
JOIN roles ON roles_employee.role_id = roles.id
JOIN employee_salary ON roles_employee.employee_id = employee_salary.employee_id
JOIN salary ON employee_salary.salary_id = salary.id
WHERE role_name LIKE ('% developer')

 28. Вывести фонд (сумму) зарплаты разработчиков.

SELECT
    SUM(monthly_salary)AS Сумма_зарплат_Developers
FROM
    employees
JOIN roles_employee ON employees.id = roles_employee.employee_id
JOIN roles ON roles_employee.role_id = roles.id
JOIN employee_salary ON roles_employee.employee_id = employee_salary.employee_id
JOIN salary ON employee_salary.salary_id = salary.id
WHERE role_name LIKE ('%developer%')

 29. Вывести имена, должности и ЗП всех специалистов по возрастанию

SELECT
    employee_name,
    role_name,
    monthly_salary
FROM
    employees
JOIN roles_employee ON employees.id = roles_employee.employee_id
JOIN roles ON roles_employee.role_id = roles.id
JOIN employee_salary ON roles_employee.employee_id = employee_salary.employee_id
JOIN salary ON employee_salary.salary_id = salary.id
ORDER BY monthly_salary

 30. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП от 1700 до 2300

SELECT
    employee_name,
    role_name,
    monthly_salary
FROM
    employees
JOIN roles_employee ON employees.id = roles_employee.employee_id
JOIN roles ON roles_employee.role_id = roles.id
JOIN employee_salary ON roles_employee.employee_id = employee_salary.employee_id
JOIN salary ON employee_salary.salary_id = salary.id
WHERE (monthly_salary BETWEEN 1700 AND 2300)
ORDER BY monthly_salary

 31. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП меньше 2300

SELECT
    employee_name,
    role_name,
    monthly_salary
FROM
    employees
JOIN roles_employee ON employees.id = roles_employee.employee_id
JOIN roles ON roles_employee.role_id = roles.id
JOIN employee_salary ON roles_employee.employee_id = employee_salary.employee_id
JOIN salary ON employee_salary.salary_id = salary.id
WHERE monthly_salary < 2300
ORDER BY monthly_salary

 32. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП равна 1100, 1500, 2000

SELECT
    employee_name,
    role_name,
    monthly_salary
FROM
    employees
JOIN roles_employee ON employees.id = roles_employee.employee_id
JOIN roles ON roles_employee.role_id = roles.id
JOIN employee_salary ON roles_employee.employee_id = employee_salary.employee_id
JOIN salary ON employee_salary.salary_id = salary.id
WHERE monthly_salary IN (1100,1500,2000) 
ORDER BY monthly_salary
