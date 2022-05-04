-- 1. Создать таблицу employees
--			-id. serial,  primary key,
--			-employee_name. Varchar(50), not null
create table employees (
	id serial primary key,
	employee_name varchar(50) not null
);

-- 2. Наполнить таблицу employee 70 строками.
insert into employees(employee_name)
values	('Smirnov Ivan'), ('Popov Aleksey'), ('Mironov Stepan'), ('Morozova Polina'), ('Sidorova Ekaterina'), ('Titov Nikita'), ('Polunina Alla'), ('Alekseeva Nataliya'), ('Sokolov Vadim'), ('Urovskaya Irina'),
		('Alaev Murad'), ('Nikonova Ekaterina'), ('Sergeev Pavel'), ('Sotin Kirill'), ('Gaziev Artur'), ('Turova Viktoriya'), ('Kiselev Aleksey'), ('Lisina Irina'), ('Talaev David'), ('Mirolubova Anastasiya'),
		('Koshkina Anastasiya'), ('Novikova OLga'), ('Soboleva Nataliya'), ('Radaev Pavel'), ('Mikabidze Kristina'), ('Starov Vladimir'), ('Polov Nikita'), ('Hataev Islam'), ('Kirova Uliya'), ('Podolskaya Viktoriya'),
		('Zavidov Aleksandr'), ('Stepnov Aleksandr'), ('Lebedeva Svetlana'), ('Stepanov Vladimir'), ('Petrov Nikita'), ('Ivanov Aleksandr'), ('Pavshin Kirill'), ('Smolnikova Irina'), ('Kyrov Pavel'), ('Gadiev Aleksandr'),
		('Suvorov Sergey'), ('Pozharova Ekaterina'), ('Samohodov Stasislav'), ('Pechorin Timur'), ('Parloyan Ararat'), ('Kotov Ivan'), ('Stoeva Ekaterina'), ('Fadiev Oleg'), ('Proshkin Nikolay'), ('Lipova Svetlana'),
		('Rataev Timur'), ('Rebrov Nikita'), ('Solodov Mikhail'), ('Firsov Ilya'), ('Mihailov Stanislav'), ('Nadiev Mikhail'), ('Rogoshev Ivan'), ('Silaeva Polina'), ('Plyev Vladimir'), ('Sizov Dmitriy'),
		('Hatayan Sarkis'), ('Bakyradze David'), ('Simonova Anastasiya'), ('Nilov Sergey'), ('Faradov Aleksandr'), ('Kulikov Pavel'), ('Rakiev Nikolay'), ('Shotin Vladimir'), ('Povlaev Atrem'), ('Volkov Dmitriy');

-- 3. Создать таблицу salary
--			- id. serial,  primary key,
--			- monthly_salary. Int, not null
create table salary (
	id serial primary key,
	monthly_salary int not null
);

-- 4. Наполнить таблицу salary 15 строками
insert into salary(monthly_salary)
values	(1000), (1100), (1200), (1300), (1400),
		(1500), (1600), (1700), (1800), (1900),
		(2000), (2100), (2200), (2300), (2400);

-- 5. Создать таблицу employee_salary
--			- id. serial,  primary key,
-- 			- employee_id. Int, not null, unique,
--			- salary_id. Int, not null
create table employee_salary (
	id serial primary key,
	employee_id int not null unique,
	salary_id int not null
);

-- 6. Наполнить таблицу employee_salary 40 строками
--			- в 10 строк из 40 вставить несуществующие employee_id
insert into employee_salary(employee_id, salary_id)
values	(1, 1), (6, 1), (10, 1), (15, 6), (28, 4), (70, 15), (30, 10), (80, 12), (22, 7), (23, 7),
		(83, 8), (18, 9), (34, 11), (33, 11), (45, 13), (88, 1), (27, 8), (5, 2), (9, 5), (14, 7),
		(11, 7), (16, 6), (71, 10), (35, 13), (50, 14), (55, 11), (90, 1), (13, 9), (44, 14), (94, 9),
		(75, 5), (2, 2), (7, 5), (46, 14), (99, 5), (92, 8), (52, 10), (20, 9), (66, 14), (73, 8);

-- 7. Создать таблицу roles
--			- id. serial,  primary key,
-- 			- role_name. int, not null, unique
create table roles (
	id serial primary key, 
	role_name int not null unique
);

-- 8. Поменять тип столба role_name с int на varchar(30)
alter table roles 
alter column role_name set data type varchar(30) using role_name::varchar(30);

-- 9. Наполнить таблицу roles 20 строками
insert into roles(role_name)
values	('Junior Python Developer'),
		('Middle Python Developer'),
		('Senior Python Developer'),
		('Junior Java Developer'),
		('Middle Java Developer'),
		('Senior Java Developer'),
		('Junior JavaScript Developer'),
		('Middle JavaScript Developer'),
		('Senior JavaScript Develope'),
		('Junior Manual QA Engineer'),
		('Middle Manual QA Engineer'),
		('Senior Manual QA Engineer'),
		('Project Manager'),
		('Designer'),
		('HR'),
		('CEO'),
		('Sales Manager'),
		('Junior Automation QA Engineer'),
		('Middle Automation QA Engineer'),
		('Senior Automation QA Engineer');

-- 10. Создать таблицу roles_employee
-- 				- id. Serial  primary key,
-- 				- employee_id. Int, not null, unique (внешний ключ для таблицы employees, поле id),
-- 				- role_id. Int, not null (внешний ключ для таблицы roles, поле id)
create table roles_employee (
	id serial primary key, 
	employee_id int not null unique, 
	foreign key (employee_id)
		references employees(id),
	role_id int not null, 
	foreign key (role_id)
		references roles(id)
);

-- 11. Наполнить таблицу roles_employee 40 строками
insert into roles_employee(employee_id, role_id)
values	(44, 6), (35, 3), (46, 12), (10, 1), (9, 17), (6, 17), (65, 16), (50, 20), (42, 19), (25, 18),
		(33, 14), (32, 15), (12, 15), (27, 18), (2, 1), (3, 2), (22, 10), (17, 11), (41, 8), (18, 10),
		(14, 1), (13, 4), (67, 9), (64, 13), (59, 13), (49, 20), (19, 2), (24, 5), (36, 5), (11, 2),
		(53, 6), (57, 6), (69, 16), (7, 17), (51, 13), (39, 8), (28, 9), (15, 14), (21, 1), (43, 7);