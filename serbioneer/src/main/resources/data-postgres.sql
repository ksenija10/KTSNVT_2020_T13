-- korisnici
-- password = admin
insert into users (type, name, surname, email, password) 
values ('Admin', 'Ksenija', 'Prcic', 'neki_email', '$2a$04$SwzgBrIJZhfnzOw7KFcdzOTiY6EFVwIpG7fkF/D1w26G1.fWsi.aK');

-- password = user
insert into users (type, name, surname, email, password) 
values ('AuthenticatedUser', 'Isidor', 'Gavric', 'neki_drugi_email', '$2a$04$Amda.Gm4Q.ZbXz9wcohDHOhOBaNQAkSS1QO26Eh8Hovu3uzEpQvcq');

insert into authority (name) values ('ROLE_ADMIN');
insert into authority (name) values ('ROLE_USER');

-- admin has ROLE_ADMIN
insert into user_authority (user_id, authority_id) values (1, 1);
-- user has ROLE_USER
insert into user_authority (user_id, authority_id) values (2, 2);


-- kulturne kategorije
insert into cultural_category (name) values ('Institucija');

-- tipovi kategorije
insert into category_type (name, category_id) values ('Biblioteka', 1);
insert into category_type (name, category_id) values ('Pozorište', 1);

-- kulturna dobra
insert into cultural_site (name, lat, lng, address, city, description, rating, type_id, category_id)
values ('Biblioteka šabačka', 44.7556269, 19.6923025, 'Masarikova 18', 'Šabac',
'Библиотека шабачка је матична установа за све библиотеке на подручју осам општина Мачванског округа.', 4.8, 1, 1);

insert into cultural_site (name, lat, lng, address, city, description, rating, type_id, category_id)
values ('Srpsko narodno pozorište', 45.2553797, 19.8429706, 'Pozorišni trg 1', 'Novi Sad',
'Srpsko narodno pozorište je osnovano 16/28. jula 1861. godine u Novom Sadu, u tadašnjoj Carevini Austriji (od 1867. Austrougarska monarhija).', 4.8, 1, 1);

--komentari
insert into comment (text, approved, user_id, site_id)
            values ('Bas je super biblioteka', false, 1, 1);

insert into comment (text, approved, user_id, site_id)
            values ('Zište', true, 1, 2);

--news
insert into news (information, date_time, site_id) values ('Neke novosti', '2020-11-11', 1);
insert into news (information, date_time, site_id) values ('Neke novosti pt2', '2020-11-11', 2);
