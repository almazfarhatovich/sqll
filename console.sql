CREATE TABLE sport_vid
(
    id    int PRIMARY KEY,
    name  varchar(40),
    time  varchar(40),
    price int not null,
    days  varchar(40)
);

CREATE TABLE trainers
(
    id         int PRIMARY KEY,
    first_name varchar(40),
    last_name  varchar(40),
    age        int not null
);

CREATE TABLE sportsmen
(
    id         int PRIMARY KEY,
    first_name varchar(40),
    last_name  varchar(40),
    age        int not null
);

INSERT INTO sport_vid(id, name, time, price, days)
VALUES (1, 'Boxing', '09:00-11:00', 3000, 'Monday-Wednesday-Friday'),
       (2, 'KickBoxing', '09:00-11:00', 3000, 'Tuesday-Thursday-Saturday'),
       (3, 'Muay-Thai', '16:00-18:00', 4000, 'Monday-Wednesday-Friday'),
       (4, 'Grappling', '16:00-18:00', 2000, 'Tuesday-Thursday-Saturday'),
       (5, 'Wrestling', '19:00-21:00', 2000, 'Monday-Wednesday-Friday');


INSERT INTO trainers (id, first_name, last_name, age)
VALUES (1, 'Калыс', 'Качкынбаев', 32),
       (2, 'Эдил', 'Сабыров', 30),
       (3, 'Мирбек', 'Камчыбеков', 35),
       (4, 'Айдар', 'Кочкоров', 22),
       (5, 'Чолпон', 'Тоголоков', 33);

INSERT INTO sportsmen (id, first_name, last_name, age)
VALUES (1, 'Алмаз', 'Жаныбеков', 20),
       (2, 'Тайфур', 'Алиев', 20),
       (3, 'Эрбол', 'Рамисов', 18),
       (4, 'Адил', 'Ырыскелдиев', 21),
       (5, 'Фарид', 'Салиев', 22),
       (6, 'Улан', 'Кубанычбеков', 26),
       (7, 'Тологон', 'Текебаев', 25),
       (8, 'Адилет', 'Жумакадыров', 18),
       (9, 'Нургазы', 'Нурмаматов', 19),
       (10, 'Бекжан', 'Бекжанов', 19),
       (11, 'Куба', 'Абдулазизов', 23),
       (12, 'Кубат', 'Кубатов', 20),
       (13,'Канат','Улукбеков',23),
       (14,'Азат','Азатов',32),
       (15,'Генадий','Головкин',40);



CREATE TABLE boxingGroup
(
    sport_vid_id int references sport_vid (id),
    trainer_id   int references trainers (id),
    sportsman_id int references sportsmen (id)

);

INSERT INTO boxingGroup (sport_vid_id, trainer_id, sportsman_id)
VALUES (1, 1, 1),
       (1, 1, 2),
       (1, 1, 3);


CREATE TABLE kickboxingGroup
(
    sport_vid_id int references sport_vid (id),
    trainer_id   int references trainers (id),
    sportsman_id int references sportsmen (id)

);

INSERT INTO kickboxingGroup (sport_vid_id, trainer_id, sportsman_id)
VALUES (2, 2, 4),
       (2, 2, 5),
       (2, 2, 6);


CREATE TABLE muaythayGroup
(
    sport_vid_id int references sport_vid (id),
    trainer_id   int references trainers (id),
    sportsman_id int references sportsmen (id)

);

INSERT INTO muaythayGroup (sport_vid_id, trainer_id, sportsman_id)
VALUES (3, 3, 7),
       (3, 3, 8),
       (3, 3, 9);

CREATE TABLE grapplingGroup
(
    sport_vid_id int references sport_vid (id),
    trainer_id   int references trainers (id),
    sportsman_id int references sportsmen (id)

);

INSERT INTO grapplingGroup (sport_vid_id, trainer_id, sportsman_id)
VALUES (4, 4, 10),
       (4, 4, 11),
       (4, 4, 12);

CREATE TABLE wrestlingGroup
(
    sport_vid_id int references sport_vid (id),
    trainer_id   int references trainers (id),
    sportsman_id int references sportsmen (id)

);

INSERT INTO wrestlingGroup (sport_vid_id, trainer_id, sportsman_id)
VALUES (5, 5, 13),
       (5, 5, 14),
       (5, 5, 15);



ALTER TABLE sportsmen
    ADD COLUMN sport_vid_id int references sport_vid (id);
ALTER TABLE sportsmen
    ADD COLUMN trainer_id int references trainers (id);
ALTER TABLE sportsmen
    ADD COLUMN sportsman_id int references sportsmen (id);

SELECT * FROM boxingGroup;
SELECT * FROM sport_vid;
SELECT * FROM trainers;
SELECT * FROM sportsmen;
SELECT * FROM kickboxingGroup;
SELECT * FROM muaythayGroup;
SELECT * FROM grapplingGroup;
SELECT * FROM wrestlingGroup;


SELECT * FROM sportsmen  JOIN boxingGroup bG on sportsmen.id = bG.sportsman_id
    join kickboxingGroup kG on sportsmen.id = kG.sportsman_id
    join muaythayGroup mG on sportsmen.id = mG.sportsman_id
    join grapplingGroup gG on sportsmen.id = gG.sportsman_id
    join wrestlingGroup wG on sportsmen.id = wG.sportsman_id;