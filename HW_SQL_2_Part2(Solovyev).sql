-- 1. Вывести всех работников чьи зарплаты есть в базе, вместе с зарплатами.
select e.employee_name, s.monthly_salary from employees as e
join employee_salary as es on e.id = es.employee_id 
join salary as s on s.id = es.salary_id;

-- 2. Вывести всех работников у которых ЗП меньше 2000.
select e.employee_name, s.monthly_salary from employees as e
join employee_salary as es on e.id = es.employee_id 
join salary as s on s.id = es.salary_id
where s.monthly_salary < 2000;

-- 3. Вывести все зарплатные позиции, но работник по ним не назначен. (ЗП есть, но не понятно кто её получает.)
select s.id, s.monthly_salary from employees as e
join employee_salary as es on e.id = es.employee_id 
right join salary as s on s.id = es.salary_id
where e.employee_name is null;

-- 4. Вывести все зарплатные позиции  меньше 2000 но работник по ним не назначен. (ЗП есть, но не понятно кто её получает.)
select s.id, s.monthly_salary from employees as e
join employee_salary as es on e.id = es.employee_id 
right join salary as s on s.id = es.salary_id
where e.employee_name is null and s.monthly_salary < 2000;