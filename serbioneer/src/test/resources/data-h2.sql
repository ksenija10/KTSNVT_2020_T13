-- korisnici
-- password = admin
insert into users (type, name, surname, email, password, is_active) 
values ('Admin', 'Ksenija', 'Prcic', 'admin@admin.com', '$2a$04$SwzgBrIJZhfnzOw7KFcdzOTiY6EFVwIpG7fkF/D1w26G1.fWsi.aK', true);

-- password = user
insert into users (type, name, surname, email, password, activated, is_active)
values ('AuthenticatedUser', 'Isidor', 'Gavric', 'prvi@user.com', '$2a$04$Amda.Gm4Q.ZbXz9wcohDHOhOBaNQAkSS1QO26Eh8Hovu3uzEpQvcq', true, true);
insert into users (type, name, surname, email, password, activated, is_active)
values ('AuthenticatedUser', 'Mileva', 'Isic', 'drugi@user.com', '$2a$04$Amda.Gm4Q.ZbXz9wcohDHOhOBaNQAkSS1QO26Eh8Hovu3uzEpQvcq', true, true);
insert into users (type, name, surname, email, password, activated, is_active)
-- srdjabroj1 gmail
values ('AuthenticatedUser', 'Srdjan', 'Milic', 'srdjanmilic12@gmail.com', '$2y$12$3PKWDsIWuDRSKV4z8/9Su.NZIQanfAr9IcOxZCEEQoHYwasVJxYja', true, true);
insert into users (type, name, surname, email, password, activated, is_active)
-- katarina1! gmail
values ('AuthenticatedUser', 'Katarina', 'Donalnov', 'dolanovkatarina@gmail.com', '$2y$12$SIXeGBUz6VbA1LkQYp/U2uqqs5Ss0paG3KP4wuVEdFq9N30hXO94a', true, true);
insert into users (type, name, surname, email, password, is_active) 
values ('Admin', 'Marija', 'Maric', 'admin2@admin.com', '$2y$12$IVBar4DN2RFVW8TqTF/BnuvuErSbRAHC0M7esAx2l5KLjEH8DC6jO', true);
insert into users (type, name, surname, email, password, is_active) 
values ('Admin', 'Ignjat', 'Arsic', 'admin3@admin.com', '$2y$12$GzLhpKp2D3WWVBqKyybeu.zG7axbOaxwRkdMnOoBM/BdG70rpG9Gm', true);
insert into users (type, name, surname, email, password, activated, is_active)
values ('AuthenticatedUser', 'Sasa', 'Urosevic', 'treci@user.com', '$2y$12$8oX67pL6tceLNA1jYolVxOyXsrXeWPZsfo.jWibpWlczygR6mUUOW', false, true);

insert into authority (name) values ('ROLE_ADMIN');
insert into authority (name) values ('ROLE_USER');

-- admin has ROLE_ADMIN
insert into user_authority (user_id, authority_id) values (1, 1);
-- user has ROLE_USER
insert into user_authority (user_id, authority_id) values (2, 2);
insert into user_authority (user_id, authority_id) values (3, 2);
insert into user_authority (user_id, authority_id) values (4, 2);
insert into user_authority (user_id, authority_id) values (5, 2);
insert into user_authority (user_id, authority_id) values (6, 1);
insert into user_authority (user_id, authority_id) values (7, 1);
insert into user_authority (user_id, authority_id) values (8, 2);

-- kulturne kategorije
insert into cultural_category (name, is_active) values ('Institucija', true);
insert into cultural_category (name, is_active) values ('Manifestacija', true);
insert into cultural_category (name, is_active) values ('Kulturno nasledje', true);

-- tipovi kategorije
insert into category_type (name, category_id, is_active) values ('Biblioteka', 1, true);
insert into category_type (name, category_id, is_active) values ('Pozorište', 1, true);
insert into category_type (name, category_id, is_active) values ('Festival', 2, true);
insert into category_type (name, category_id, is_active) values ('Sajam', 2, true);
insert into category_type (name, category_id, is_active) values ('Spomenik', 3, true);

-- kulturna dobra
insert into cultural_site (name, lat, lng, address, city, description, rating, type_id, category_id, is_active)
values ('Biblioteka šabačka', 44.7556269, 19.6923025, 'Masarikova 18', 'Šabac',
'Библиотека шабачка је матична установа за све библиотеке на подручју осам општина Мачванског округа.', 3, 1, 1, true);

insert into cultural_site (name, lat, lng, address, city, description, rating, type_id, category_id, is_active)
values ('Srpsko narodno pozorište', 45.2553797, 19.8429706, 'Pozorišni trg 1', 'Novi Sad',
'Srpsko narodno pozorište je osnovano 16/28. jula 1861. godine u Novom Sadu, u tadašnjoj Carevini Austriji (od 1867. Austrougarska monarhija).', 4.8, 2, 1, true);

insert into cultural_site (name, lat, lng, address, city, description, rating, type_id, category_id, is_active)
values ('SLF', 44.7556269, 19.6923025, 'Sabacka Tvrdjava, Kralja Aleksandra', 'Šabac',
'Prvi Šabački letnji festival („ŠLF“) je održan 2003. godine. Naslednik je projekta „Move” koji je na neki način bio preteča današnjeg Šabačkog festivala.', 4.5, 3, 2, true);

insert into cultural_site (name, lat, lng, address, city, description, rating, type_id, category_id, is_active)
values ('Civijada', 44.75817531354519, 19.695439253822595, 'Cara Dusana 2', 'Šabac',
'Svake godine, septembra meseca, pred Malogospojinski Šabački vašar održava se u Šapcu „Čivijada“. To je kulturno-turistička manifestacija koja se održava od 1968. godine.', 4.6, 3, 2, true);

insert into cultural_site (name, lat, lng, address, city, description, rating, type_id, category_id, is_active)
values ('Beogradski sajam knjiga', 44.79699178445638, 20.439962626759797, 'Bulevar vojvode Mišića 14', 'Beograd',
'Međunarodni beogradski sajam knjiga jedna je od najstarijih i najvažnijih književnih manifestacija u regionu. Njegov osnovni cilj je pružanje mogućnosti izdavačima, autorima, knjižarima i bibliotekarima.', 4.6, 4, 2, true);

insert into cultural_site (name, lat, lng, address, city, description, rating, type_id, category_id, is_active)
values ('Beogradski sajam automobila', 44.79699178445638, 20.439962626759797, 'Bulevar vojvode Mišića 14', 'Beograd',
'Beogradski sajam automobila jedna je od najstarijih sajamskih manifestacija u Srbiji i najstarija manifestacija koja se organizuje u okviru danasnjeg Beogradskog sajma.', 3.8, 4, 2, true);

insert into cultural_site (name, lat, lng, address, city, description, rating, type_id, category_id, is_active)
values ('Pobednik', 44.823028, 20.447694, 'Bulevar vojvode Bojovića', 'Beograd',
'Pobednik je naziv trijumfalnog spomenika koji je podignut 1928. na Gornjem gradu Beogradske tvrdjave povodom proslave desetogodisnjice proboja Solunskog fronta.', 4.1, 5, 3, true);

--komentari
insert into comment (text, approved, user_id, site_id, is_active)
            values ('Bas je super biblioteka', false, 2, 1, true);
insert into comment (text, approved, user_id, site_id, is_active)
            values ('Zište', true, 3, 2, true);
insert into comment (text, approved, user_id, site_id, is_active)
            values ('Ovaj komentar odbij!', false, 3, 2, true);
insert into comment (text, approved, user_id, site_id, is_active)
            values ('test', true, 2, 2, true);

--news
insert into news (information, date_time, site_id, is_active) values ('Neke novosti za bibl', '2020-11-12', 1, true);
insert into news (information, date_time, site_id, is_active) values ('Neke novosti za bibl 2', '2020-11-14', 1, true);
insert into news (information, date_time, site_id, is_active) values ('Neke novosti pt2', '2020-11-11', 2, true);

insert into news (information, date_time, site_id, is_active) values ('test', '2020-11-11', 2, true);

--subscribed cultural sites Biblioteka sabacka for user 2 Isidor Gavric
insert into sites_users(site_id, user_id) values (1, 2);
--Snp za Isidor Gavric
insert into sites_users(site_id, user_id) values (2, 2);
--Civijada za Srdjana
insert into sites_users(site_id, user_id) values (3, 4);
--Civijada za Katarinu
insert into sites_users(site_id, user_id) values (3, 5);
--Civijada za Isidor Gavric
insert into sites_users(site_id, user_id) values (4, 2);

--rating
--Isidor je ocenio biblioteku sabacku sa 3
insert into rating (value, user_id, site_id, is_active) values (3, 2, 1, true);
insert into rating (value, user_id, site_id, is_active) values (5, 2, 2, true);


insert into image (id, is_active, name, path, comment) values (1, true, 'name1', 'path1', 1);
insert into image (id, is_active, name, path, news) values (2, true, 'name1', 'path1', 1);
insert into image (id, is_active, name, path, cultural_site) values (3, true, 'name1', 'path1', 1);
