/****Шаг 2**

В этом задании по описанию необходимо спроектировать таблицы, связи между ними и корректно определить типы данных. Здесь не важно, какой тип вы выберете, например, для данных, представленных в виде строки (varchar или text). Важно, что вы выберете один из строковых типов, а не числовых, например.

Описание структуры: у каждого человека есть машина. Причем несколько человек могут пользоваться одной машиной. У каждого человека есть имя, возраст и признак того, что у него есть права (или их нет). У каждой машины есть марка, модель и стоимость. Также не забудьте добавить таблицам первичные ключи и связать их.

В корне проекта нужно создать файл scripts422.sql и поместить в него запросы для создания таблиц.**/

CREATE TABLE car
(id SERIAL,
mark varchar(100) NOT NULL,
model varchar(100) NOT NULL,
cost numeric(10,2) NOT NULL
);
ALTER TABLE car
    ADD PRIMARY KEY (id);


CREATE TABLE person
(id SERIAL PRIMARY KEY ,
age INT not null,
is_driver BOOLEAN NOT NULL DEFAULT 'false',
car_id int REFERENCES car(id)
);

/**Шаг 3**

Составить первый JOIN-запрос, чтобы получить информацию обо всех студентах (достаточно получить только имя и возраст студента) школы Хогвартс вместе с названиями факультетов.
*/

SELECT s.name, s.age, f.name
FROM student s
         JOIN faculty f on s.faculty_id = f.id;

/**Составить второй JOIN-запрос, чтобы получить только тех студентов, у которых есть аватарки**/

SELECT s.id, s.name, s.age, s.faculty_id
FROM student s
         JOIN avatar a on s.id = a.student_id
WHERE a.data IS NOT NULL;





