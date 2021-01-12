-- korisnici
-- password = admin
insert into users (type, name, surname, email, password, is_active, birthday)
values ('Admin', 'Ksenija', 'Prcic', 'admin@admin.com', '$2a$04$SwzgBrIJZhfnzOw7KFcdzOTiY6EFVwIpG7fkF/D1w26G1.fWsi.aK', true, '2016-06-23');

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
values ('Admin', 'Ksenija', 'Prcic', 'admin2@admin.com', '$2y$12$gUay6OjlceRVx93A/bhMXekaalqkDavEEzUG43h9E9XiF0kwUXxe2', true);
insert into users (type, name, surname, email, password, is_active)
values ('Admin', 'Timi', 'Timic', 'admin3@admin.com', '$2y$12$gUay6OjlceRVx93A/bhMXekaalqkDavEEzUG43h9E9XiF0kwUXxe2', true);
insert into users (type, name, surname, email, password, is_active)
values ('Admin', 'Timika', 'Timikic', 'admin4@admin.com', '$2y$12$gUay6OjlceRVx93A/bhMXekaalqkDavEEzUG43h9E9XiF0kwUXxe2', true);

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

--news
insert into news (information, date_time, site_id, is_active) values ('Neke novosti za bibl', '2020-11-12', 1, true);
insert into news (information, date_time, site_id, is_active) values ('Neke novosti za bibl 2', '2020-11-14', 1, true);
insert into news (information, date_time, site_id, is_active) values ('Neke novosti pt2', '2020-11-11', 2, true);

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

insert into image (id, is_active, name, path, comment) values (1, true, 'name1', 'src/main/resources/images/comment/1/name1.jpg', 1);
insert into image (id, is_active, name, path, comment) values (2, true, 'name2', 'src/main/resources/images/comment/1/name2.png', 1);
insert into image (id, is_active, name, path, comment) values (3, true, 'name3', 'src/main/resources/images/comment/1/name3.png', 1);
insert into image (id, is_active, name, path, comment) values (4, true, 'name4', 'src/main/resources/images/comment/1/name4.png', 1);
insert into image (id, is_active, name, path, comment) values (5, true, 'name5', 'src/main/resources/images/comment/1/name5.png', 1);
insert into image (id, is_active, name, path, comment) values (6, true, 'name6', 'src/main/resources/images/comment/1/name6.png', 1);
insert into image (id, is_active, name, path, comment) values (7, true, 'name7', 'src/main/resources/images/comment/1/name7.png', 1);
insert into image (id, is_active, name, path, comment) values (8, true, 'name8', 'src/main/resources/images/comment/1/name8.png', 1);
insert into image (id, is_active, name, path, comment) values (9, true, 'name9', 'src/main/resources/images/comment/1/name9.png', 1);
insert into image (id, is_active, name, path, comment) values (10, true, 'name10', 'src/main/resources/images/comment/1/name10.png', 1);
insert into image (id, is_active, name, path, comment) values (11, true, 'name11', 'src/main/resources/images/comment/1/name11.png', 1);
insert into image (id, is_active, name, path, comment) values (12, true, 'name12', 'src/main/resources/images/comment/1/name12.png', 1);
insert into image (id, is_active, name, path, comment) values (13, true, 'name13', 'src/main/resources/images/comment/1/name13.png', 1);


--email = krsmanija.backalic@email.com password = 7345
insert into users (type, name, surname, email, password, is_active, birthday) values ('Admin', 'Krsmanija', 'Bačkalić', 'krsmanija.backalic@email.com', '$2b$12$T0XUDHG8JZuc63avXJcatO9ANz8K3YthH3oXx1TV4Z.upwZVqwK2y', 'true', '1995-12-01');

--email = isidor.zlicic@email.com password = 7458
insert into users (type, name, surname, email, password, is_active, birthday) values ('Admin', 'Isidor', 'Zličić', 'isidor.zlicic@email.com', '$2b$12$qdmfNK40Z5ECaKp4QN7haOSlZ2CeParOVNJVd.a0ZMsct9t52VjSm', 'true', '1902-03-23');

--email = adam.zavisic@email.com password = 5652
insert into users (type, name, surname, email, password, is_active, birthday) values ('Admin', 'Adam', 'Zavišić', 'adam.zavisic@email.com', '$2b$12$kToRfCCVRs.C9/xlR.5WQuatK0vow25e50BBXAUn9PvbGbLwV74N6', 'true', '1931-11-23');

--email = slobodan.ciculic@email.com password = 8096
insert into users (type, name, surname, email, password, is_active, birthday) values ('Admin', 'Slobodan', 'Čičulić', 'slobodan.ciculic@email.com', '$2b$12$6KOCuRMnlcJIRcEKgWYSHemqlLPuGJtlZVixdPpl71zNhygF4PN.u', 'true', '1932-02-13');

--email = svetislava.predic@email.com password = 9777
insert into users (type, name, surname, email, password, is_active, birthday) values ('Admin', 'Svetislava', 'Predić', 'svetislava.predic@email.com', '$2b$12$Le0vomQMXmjCKsCT9GiJguXGPDmXMIU7lZxQZR2i1f1wV/LHyPaIa', 'true', '1921-11-05');

--email = stamena.ciplic@email.com password = 6788
insert into users (type, name, surname, email, password, is_active, birthday) values ('Admin', 'Stamena', 'Čiplić', 'stamena.ciplic@email.com', '$2b$12$ElDFeYKBC4GssDFLVRmmLOfUsdie0n4nvyg/l6xQGFN1eYzLPNe7u', 'true', '1968-06-23');

--email = sibinka.porobic@email.com password = 9046
insert into users (type, name, surname, email, password, is_active, birthday) values ('Admin', 'Sibinka', 'Porobić', 'sibinka.porobic@email.com', '$2b$12$jdbWFK.7RrvLbjK./sL9WObNoN5aQNGaxWukiE6E/hiFVwjJch7NC', 'true', '1937-09-09');

--email = strahinja.parivodic@email.com password = 7690
insert into users (type, name, surname, email, password, is_active, birthday) values ('Admin', 'Strahinja', 'Parivodić', 'strahinja.parivodic@email.com', '$2b$12$Kc2FeWdVIaWpXbEsYUjFlezYgD6iNkHNGCJyywyk4VH05m5zk9yp6', 'true', '1906-02-18');

--email = gabrijela.radisic@email.com password = 9719
insert into users (type, name, surname, email, password, is_active, birthday) values ('Admin', 'Gabrijela', 'Radišić', 'gabrijela.radisic@email.com', '$2b$12$SYhXXeJsnbUDj/6OXl2ME.thbtsq.nPHLMmhykCHmd9BwTf6dIqry', 'true', '1973-08-14');

--email = negomir.gilic@email.com password = 5624
insert into users (type, name, surname, email, password, is_active, birthday) values ('Admin', 'Negomir', 'Gilić', 'negomir.gilic@email.com', '$2b$12$zpL8v.Lv98B7I0U0Qa5JD.qE4J5bHPCkMq95EpvGxmfXfj0mNXqmi', 'true', '1938-10-15');

--email = aco.nikosavic@email.com password = 4493
insert into users (type, name, surname, email, password, is_active, birthday) values ('Admin', 'Aco', 'Nikosavić', 'aco.nikosavic@email.com', '$2b$12$poDhtScPnNstP.hHRL9S0.7qgYxKfA8E1xoD9IMoGWLpTVUM61Jgm', 'true', '1924-10-16');

--email = kristina.curdic@email.com password = 7053
insert into users (type, name, surname, email, password, is_active, birthday) values ('Admin', 'Kristina', 'Ćurdić', 'kristina.curdic@email.com', '$2b$12$m7PrRQo2p.nVICVp//kYq.beGmYnJl8ire8IoQ8902U1XqiISzRk6', 'true', '1962-08-27');

--email = stanoje.caprnjic@email.com password = 2090
insert into users (type, name, surname, email, password, is_active, birthday) values ('Admin', 'Stanoje', 'Čaprnjić', 'stanoje.caprnjic@email.com', '$2b$12$ca8RY5mF7ew8mufcqg.eiuGO0vRAspAkNrCrfvEUvqxEzxo1G0se6', 'true', '1970-04-11');

--email = spridon.zivankic@email.com password = 4916
insert into users (type, name, surname, email, password, is_active, birthday) values ('Admin', 'Spridon', 'Živankić', 'spridon.zivankic@email.com', '$2b$12$bt9NzsoVK59z5XLXarQiZeOvl1QLFdTpF/FSslN.M0faOONMWEMMG', 'true', '1957-02-22');

--email = ljupce.jastrebic@email.com password = 3332
insert into users (type, name, surname, email, password, is_active, birthday) values ('Admin', 'Ljupče', 'Jastrebić', 'ljupce.jastrebic@email.com', '$2b$12$fmqguMCJ2fX0XVMoM6W7VeeLLExlUt1G/hDP89hfN58mQtQ6tyXgq', 'true', '1972-08-25');

--email = sofija.eskic@email.com password = 6708
insert into users (type, name, surname, email, password, is_active, birthday) values ('Admin', 'Sofija', 'Eskić', 'sofija.eskic@email.com', '$2b$12$NN4RyLNwRup.6KQY5UN8Q.xUDjb3./Oyyuxk8/cka5MIfyRmB9lDW', 'true', '1910-05-22');

--email = anastasija.laketic@email.com password = 1098
insert into users (type, name, surname, email, password, is_active, birthday) values ('Admin', 'Anastasija', 'Laketić', 'anastasija.laketic@email.com', '$2b$12$G/.kxfj7sK9rNOZbMaPqBekM0/0yFQIF5JGz9D8Qn9/DUqILknwNC', 'true', '1951-04-18');

--email = isak.jogric@email.com password = 3330
insert into users (type, name, surname, email, password, is_active, birthday) values ('Admin', 'Isak', 'Jogrić', 'isak.jogric@email.com', '$2b$12$hhGfEpA65ES9gm/UAkmkhuVoo5OA7M38yTcbcgiS1O0FufWlKU0jK', 'true', '1976-02-19');

--email = vuk.davinic@email.com password = 8612
insert into users (type, name, surname, email, password, is_active, birthday) values ('Admin', 'Vuk', 'Davinić', 'vuk.davinic@email.com', '$2b$12$XzG40i3ynbPRO4snQEz0COnqRgue2f90YuuyRzNVjoyv0jX5Zvq8u', 'true', '1922-04-04');

--email = njegoje.konculic@email.com password = 7309
insert into users (type, name, surname, email, password, is_active, birthday) values ('Admin', 'Njegoje', 'Konculić', 'njegoje.konculic@email.com', '$2b$12$BU5FvMjsJ3bzXRwuL08QPuGOQhrT7eXyFKmevrGbXjOu6uegF2QHm', 'true', '1966-10-26');

--email = jevta.budisic@email.com password = 3720
insert into users (type, name, surname, email, password, is_active, birthday) values ('Admin', 'Jevta', 'Budišić', 'jevta.budisic@email.com', '$2b$12$AnhJtf9umOAq4191dyEMAuA7cL3SmSPRS..ZgwTvZ762XtixVVemC', 'true', '1940-11-05');

--email = lepa.krantic@email.com password = 5539
insert into users (type, name, surname, email, password, is_active, birthday) values ('Admin', 'Lepa', 'Krantić', 'lepa.krantic@email.com', '$2b$12$6LebOM/dciCelfnBGoGkyOTk60fCoAkLL249KyMpLQx1dSCOJsp3G', 'true', '1991-10-12');

--email = bozana.gancolic@email.com password = 7965
insert into users (type, name, surname, email, password, is_active, birthday) values ('Admin', 'Božana', 'Gancolić', 'bozana.gancolic@email.com', '$2b$12$LQcUa7yteCYg12N0Rk41m.mcOnDJojrpsd2f5IpNt8UOVLxfhPYBe', 'true', '1982-06-07');

--email = caslavka.lilic@email.com password = 8930
insert into users (type, name, surname, email, password, is_active, birthday) values ('Admin', 'Časlavka', 'Lilić', 'caslavka.lilic@email.com', '$2b$12$1NogYoNpebiX/GrpVM8ku.p949Hn74HLQa6x1vvDTiCdWYfONZxvS', 'true', '1973-01-24');

--email = zelimirka.mandusic@email.com password = 1237
insert into users (type, name, surname, email, password, is_active, birthday) values ('Admin', 'Želimirka', 'Mandušić', 'zelimirka.mandusic@email.com', '$2b$12$KlJR9jwNxVTXcFce2ArGDerPRCHZTQSsS6cIVCZkpksj0k5dAbgV6', 'true', '1980-02-19');

--email = njegoslava.rakonic@email.com password = 5577
insert into users (type, name, surname, email, password, is_active, birthday) values ('Admin', 'Njegoslava', 'Rakonić', 'njegoslava.rakonic@email.com', '$2b$12$pfjbMrTI.RZa2irD2xqg4ewGPM9Pw259ry0sEa1oqXHkeuThyNM8G', 'true', '1995-06-23');

--email = aleksandra.treskic@email.com password = 9435
insert into users (type, name, surname, email, password, is_active, birthday) values ('Admin', 'Aleksandra', 'Treskić', 'aleksandra.treskic@email.com', '$2b$12$VSlQTH5Nf0YBrOL0OH4bBugx.9PQvco.ijNaTWmZS92gIqnhnIyj.', 'true', '1957-01-05');

--email = negovan.doganjic@email.com password = 9705
insert into users (type, name, surname, email, password, is_active, birthday) values ('Admin', 'Negovan', 'Doganjić', 'negovan.doganjic@email.com', '$2b$12$WmTopPo1XHv5KRoa4tZ0G.jgXLp4cI0OlYiCqevXkTPc.FB1CoqhC', 'true', '1979-04-20');

--email = cedomir.cekic@email.com password = 8616
insert into users (type, name, surname, email, password, is_active, birthday) values ('Admin', 'Čedomir', 'Cekić', 'cedomir.cekic@email.com', '$2b$12$N.Zr2yjbNEeiWOaPObSPLuA4K4dmHxjjju6bfO/08rikn2QYy9.sm', 'true', '1905-05-28');

--email = mateja.brodalic@email.com password = 4981
insert into users (type, name, surname, email, password, is_active, birthday) values ('Admin', 'Mateja', 'Brodalić', 'mateja.brodalic@email.com', '$2b$12$9cye0Jrek07PQgpZlafLR.mZvQCl7W2yYU5a2wfxJddbQ.PJA.KQy', 'true', '1951-10-22');

--email = ozren.zambelic@email.com password = 7975
insert into users (type, name, surname, email, password, is_active, birthday) values ('Admin', 'Ozren', 'Zambelić', 'ozren.zambelic@email.com', '$2b$12$0pZycMVpMznhHGtfiSs9Pe01FmAQyCN7YRP6SF0SMSUuOSojgWpBm', 'true', '1976-09-15');

--email = justin.kolorogic@email.com password = 4170
insert into users (type, name, surname, email, password, is_active, birthday) values ('Admin', 'Justin', 'Kolorogić', 'justin.kolorogic@email.com', '$2b$12$mzvinEATDFsaUhcJwvZwUezMFqvczpH3IeXT1L7t2hOzqUkMiYOZa', 'true', '1962-01-07');

--email = aleksa.bocic@email.com password = 2101
insert into users (type, name, surname, email, password, is_active, birthday) values ('Admin', 'Aleksa', 'Bocić', 'aleksa.bocic@email.com', '$2b$12$ocOUtc39ijR997y95i/Saubbkg1S.0pctDJHt9BRG8umbOuP5rW5W', 'true', '1948-03-18');

--email = zivoratka.cickaric@email.com password = 6416
insert into users (type, name, surname, email, password, is_active, birthday) values ('Admin', 'Živoratka', 'Čičkarić', 'zivoratka.cickaric@email.com', '$2b$12$8On8zakaPjutQVxX1SFbcOgduW00PQZOKwNRnoMk7dWWparw392fS', 'true', '1981-04-15');

--email = stanoje.dzamic@email.com password = 2173
insert into users (type, name, surname, email, password, is_active, birthday) values ('Admin', 'Stanoje', 'Džamić', 'stanoje.dzamic@email.com', '$2b$12$Cp5jVB6YJ2WdPukME6Gl5uNmdZWDrvvbv4bDUEhc7KX75n9wul3HK', 'true', '1994-02-21');

--email = zlatibor.grdinic@email.com password = 8357
insert into users (type, name, surname, email, password, is_active, birthday) values ('Admin', 'Zlatibor', 'Grdinić', 'zlatibor.grdinic@email.com', '$2b$12$H8bJ4mxNgcRMJ5T8ua55bO2NAzp.Bp6NNt07FILDrVP7yow4OjONG', 'true', '1954-09-04');

--email = visnja.vajkaric@email.com password = 2872
insert into users (type, name, surname, email, password, is_active, birthday) values ('Admin', 'Višnja', 'Vajkarić', 'visnja.vajkaric@email.com', '$2b$12$61tPeDPPDp2YD/y8gEGZB.ekKjLQqpIQvSxhXz.fi7CN0iJhRDjBW', 'true', '1939-04-25');

--email = radovan.tatisic@email.com password = 4191
insert into users (type, name, surname, email, password, is_active, birthday) values ('Admin', 'Radovan', 'Tatišić', 'radovan.tatisic@email.com', '$2b$12$izpbc4b7T96F64CPsB93KO1jZokCH3Il4Nvqi7rt/jg0yBugYwb/m', 'true', '1944-09-27');

--email = leposava.neoricic@email.com password = 5255
insert into users (type, name, surname, email, password, is_active, birthday) values ('Admin', 'Leposava', 'Neoričić', 'leposava.neoricic@email.com', '$2b$12$x3fq1CT4l.KZEZjMS1ETJuRRn3k.u1aJvrCfy.kQORxBm2yjLLoeq', 'true', '1919-06-27');

--email = zdravko.tubonjic@email.com password = 6382
insert into users (type, name, surname, email, password, is_active, birthday) values ('Admin', 'Zdravko', 'Tubonjić', 'zdravko.tubonjic@email.com', '$2b$12$IgrdXqSL/c4X.jipwvZTeuV.1zZOndbZtnehekipWFGDzSVqIIjfq', 'true', '1948-02-05');

--email = julija.popadic@email.com password = 6309
insert into users (type, name, surname, email, password, is_active, birthday) values ('Admin', 'Julija', 'Popadić', 'julija.popadic@email.com', '$2b$12$uc80h8g6.L/CwTue1MljH.U.hM.xv7TYWH82sW8fAUlJy4cU2Ti..', 'true', '1936-11-22');

--email = nebojsa.krkotic@email.com password = 9760
insert into users (type, name, surname, email, password, is_active, birthday) values ('Admin', 'Nebojša', 'Krkotić', 'nebojsa.krkotic@email.com', '$2b$12$ATFviORR/B.pQ9PM9.4wdOtUud7TX.bA5OQttUp45fr5xvbw4gqQS', 'true', '1955-07-14');

--email = stevan.stancic@email.com password = 7534
insert into users (type, name, surname, email, password, is_active, birthday) values ('Admin', 'Stevan', 'Stančić', 'stevan.stancic@email.com', '$2b$12$eCXr4MLm59ny26KEUubnAessQproevyDZLQfMrF.KLsBuSRf3T07m', 'true', '1981-10-10');

--email = eva.savatic@email.com password = 8641
insert into users (type, name, surname, email, password, is_active, birthday) values ('Admin', 'Eva', 'Savatić', 'eva.savatic@email.com', '$2b$12$vQi9voAmyTdYMlKLBi4WJeQ0c4kv4HzNEC6CrMZqMLKvdiGDcGA7q', 'true', '1946-06-04');

--email = teodor.rankic@email.com password = 8147
insert into users (type, name, surname, email, password, is_active, birthday) values ('Admin', 'Teodor', 'Rankić', 'teodor.rankic@email.com', '$2b$12$RFWPTXJ/3BgANfwXCD9fUOnTVqdf.EyjsQVeGDNqOJosnZ0LcPIN6', 'true', '1929-08-06');

--email = jelisije.kurcubic@email.com password = 5161
insert into users (type, name, surname, email, password, is_active, birthday) values ('Admin', 'Jelisije', 'Kurčubić', 'jelisije.kurcubic@email.com', '$2b$12$jpWyE8fg9t9Iva2YsVhE.OVbcW2sjCEi4zBfcqANYkRrxGWyOGHzC', 'true', '1935-04-10');

--email = dusica.besjedic@email.com password = 3439
insert into users (type, name, surname, email, password, is_active, birthday) values ('Admin', 'Dušica', 'Besjedić', 'dusica.besjedic@email.com', '$2b$12$gflfg29PfCKGi28kJTydGOoydEBbZLwthG6nu58L9i7TPoTWmLS8.', 'true', '1926-05-21');

--email = tatjana.stulic@email.com password = 7230
insert into users (type, name, surname, email, password, is_active, birthday) values ('Admin', 'Tatjana', 'Štulić', 'tatjana.stulic@email.com', '$2b$12$iH2vts6S0ZliGBfUVbbAr.ee/MdH5eSpJqseStWPCrmHuoYAG2XOe', 'true', '1903-07-01');

--email = natalija.zokic@email.com password = 4125
insert into users (type, name, surname, email, password, is_active, birthday) values ('Admin', 'Natalija', 'Zokić', 'natalija.zokic@email.com', '$2b$12$fW9/LDgQMumG6ElDz5Qmuec8ao21X5JVJ/z2sQd6FnDitvJhReNJa', 'true', '1913-02-20');

--email = selena.ilincic@email.com password = 4093
insert into users (type, name, surname, email, password, is_active, birthday) values ('Admin', 'Selena', 'Ilinčić', 'selena.ilincic@email.com', '$2b$12$bgQ3EadBUmyGIG486rE82OWR3vUm5.1PU9Uazpnhve2hbzD.cEFpa', 'true', '1983-09-05');

--email = trajko.jeftic@email.com password = 7514
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Trajko', 'Jeftić', 'trajko.jeftic@email.com', '$2b$12$dMCmE30adNOHyq3T4jSpZeQVSonC3U5hc3ROKX/zQW9HN9Lnwsdq2', 'true', 'true');

--email = elizabeta.pelagic@email.com password = 8372
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Elizabeta', 'Pelagić', 'elizabeta.pelagic@email.com', '$2b$12$x82r0Xy7N2Dp6gYTVl.J9ODW8XNnFplSHKz5DfIzCTicITP643XGa', 'true', 'true');

--email = stojan.keseric@email.com password = 9157
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Stojan', 'Keserić', 'stojan.keseric@email.com', '$2b$12$k39RlTq6v..e9NHyIxp67u/v47acjp7Cm1zudNpoEDYcqHojLV.3C', 'true', 'true');

--email = tosa.pupic@email.com password = 4323
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Toša', 'Pupić', 'tosa.pupic@email.com', '$2b$12$ZEUwDkKfNHDzIjkDS5hLBuWFtLSALlc/8dcL7yMBmHPCmlv61HgdO', 'true', 'true');

--email = slavka.lucic@email.com password = 3674
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Slavka', 'Lučić', 'slavka.lucic@email.com', '$2b$12$t7iEtY0vfTpPR4S2er9Bi.w7xiRNzN4MS4wnP8MnkIwlNa8LhU2PC', 'true', 'true');

--email = perka.bosnjacic@email.com password = 1449
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Perka', 'Bošnjačić', 'perka.bosnjacic@email.com', '$2b$12$UnFva/zpmcy24UoGhW2RDODKqvwlWsf9nqYhoHn8A4Ohsn2rOi5aW', 'true', 'true');

--email = miroljub.povic@email.com password = 5547
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Miroljub', 'Pović', 'miroljub.povic@email.com', '$2b$12$BReg2jYtcahZ86cIu3atNOWuJYOnSm6QuWBwaKcf2/4arR/QZanm.', 'true', 'true');

--email = caka.djapic@email.com password = 6083
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Caka', 'Đapić', 'caka.djapic@email.com', '$2b$12$uYc2BHpYS3Wpp6Pb8nQ41OpdBYxfln1I8NjQxq7XY3VRYQ3Tj3PUa', 'true', 'true');

--email = gavrilo.poparic@email.com password = 3834
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Gavrilo', 'Poparić', 'gavrilo.poparic@email.com', '$2b$12$tgJi82viLczBZ2MIjiNR0eOpxR5Fn64yR9DjR8XPbT/KgfasV5.Y2', 'true', 'true');

--email = toplica.mickic@email.com password = 4681
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Toplica', 'Mickić', 'toplica.mickic@email.com', '$2b$12$pm8Jhv7H7/uzHfNWXUPWKuoC90mKsEH88bkJIbkEXBiFk74EHKjxK', 'true', 'true');

--email = biljana.beljic@email.com password = 9769
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Biljana', 'Beljić', 'biljana.beljic@email.com', '$2b$12$VPkZZtWO/XOwhBXuDEWDAOsScCQSsoiIrXsOekT2xixdE7g1WqXO2', 'true', 'true');

--email = elena.babanic@email.com password = 8199
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Elena', 'Babanić', 'elena.babanic@email.com', '$2b$12$gbefRvw81R4ExHYpefV4JuMebtaB.jzs/vWur3885zEeu3g7OlpI.', 'true', 'true');

--email = cana.grozdic@email.com password = 8530
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Ćana', 'Grozdić', 'cana.grozdic@email.com', '$2b$12$1y1sLkFVM/oAMW7v/ckLM.M0C8m/fBtpvNng8KAv6sb.McqCfQZxm', 'true', 'true');

--email = vukica.cendic@email.com password = 9313
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Vukica', 'Ćendić', 'vukica.cendic@email.com', '$2b$12$vMSd91ln5ubr7N/AKRt/UeAI.aMKITRXf1oaK5EG4m46yyhYML8Y.', 'true', 'true');

--email = ugren.poljcic@email.com password = 4751
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Ugren', 'Poljčić', 'ugren.poljcic@email.com', '$2b$12$IM9tUrpV8laVumvYij3ZOOX6Pw/vSXja5sIkOlf.QKDbLpKoKj0ei', 'true', 'true');

--email = bratislava.aljetic@email.com password = 6604
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Bratislava', 'Aljetić', 'bratislava.aljetic@email.com', '$2b$12$sTUjKFoZN3GQPrRvcdTiyu6mPrjr6v7vcLD8QkSSh/scshv1UNw4W', 'true', 'true');

--email = joksim.velikic@email.com password = 2316
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Joksim', 'Velikić', 'joksim.velikic@email.com', '$2b$12$n68G9wvUX6WtWELHaipDkuPp8uTR/hoGfz/P7FUMHkZXZXrJS3/Pq', 'true', 'true');

--email = filip.srebric@email.com password = 5947
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Filip', 'Srebrić', 'filip.srebric@email.com', '$2b$12$AF4b2iAVwzaJpdijHqnNI.sZTyjTRltqozKgod6dcaKeI/j9mtoWW', 'true', 'true');

--email = kleopatra.ludajic@email.com password = 2678
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Kleopatra', 'Ludajić', 'kleopatra.ludajic@email.com', '$2b$12$91pKlqKsiUKHCxJxS5ub9eFWtViFe.lmTSQ83t0OliuKb/uzSeIpW', 'true', 'true');

--email = ostoja.batajic@email.com password = 7270
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Ostoja', 'Batajić', 'ostoja.batajic@email.com', '$2b$12$xtnOz9ZrWF2dENBEzSAiU.I8WyW6TyAtrayeZ8zbq.y9e4oBdRsRa', 'true', 'true');

--email = bozidarka.tupajic@email.com password = 5843
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Božidarka', 'Tupajić', 'bozidarka.tupajic@email.com', '$2b$12$x13IK7/96CJjBxrp35xe6eo3LkgnAziQ5Myq/d5d0ZDYBRgCQzNZ6', 'true', 'true');

--email = cvetana.krickic@email.com password = 5427
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Cvetana', 'Kričkić', 'cvetana.krickic@email.com', '$2b$12$qBcXLqskWrKtodEKOCXhH.Jn0Qkaf.SYwic5noADV5mgSnPmVcfN.', 'true', 'true');

--email = ivka.puslojic@email.com password = 3614
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Ivka', 'Puslojić', 'ivka.puslojic@email.com', '$2b$12$i6/RvqeIP5RreVUb7hPEeuUs5nYZHDqHA6pl7XwAxdA1bI/OP3OZC', 'true', 'true');

--email = vidoje.gudzulic@email.com password = 1320
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Vidoje', 'Gudžulić', 'vidoje.gudzulic@email.com', '$2b$12$fCxiS2Kb2VJT9CyxIKNo7eetVwAL6wMIdeCbcBGexylY0RIUk13/y', 'true', 'true');

--email = canka.vorkapic@email.com password = 9617
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Ćanka', 'Vorkapić', 'canka.vorkapic@email.com', '$2b$12$d1jfy7U0wOU5zzZEaIZC8.KJPGo66OozOIpa4sPcPgcUFy1Eco5ua', 'true', 'true');

--email = dragojlo.zivotic@email.com password = 1205
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Dragojlo', 'Životić', 'dragojlo.zivotic@email.com', '$2b$12$Tp.bIzXeDIc1f3.HbfZZ..PSLl5hbtOCxkIWMDQ2lwMaNMTAVtqz6', 'true', 'true');

--email = jordanka.divic@email.com password = 2404
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Jordanka', 'Divić', 'jordanka.divic@email.com', '$2b$12$JY7fXF8jpHF/W6EbqRs2..NKb2og.ejkKFq.h/PtnDJ4UR3./utZ.', 'true', 'true');

--email = dobrivoj.kureljusic@email.com password = 5872
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Dobrivoj', 'Kureljušić', 'dobrivoj.kureljusic@email.com', '$2b$12$/Gl3w6znVEiNevcPqsffKOpskw82hTBBKbq/GJm8Fvdrc3gNOxGIW', 'true', 'true');

--email = lola.goranic@email.com password = 4122
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Lola', 'Goranić', 'lola.goranic@email.com', '$2b$12$0d.i1u9xPPE/1qGCz1/JOeFop632xc8luwUXKy4ZCp6mJ3C0zHDR2', 'true', 'true');

--email = irena.stevic@email.com password = 1751
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Irena', 'Stević', 'irena.stevic@email.com', '$2b$12$7emC/4pem9BeVihR0Q8fhunmLiHlST3cQnkcK2cRioRhYxzum3MOy', 'true', 'true');

--email = djurica.kezic@email.com password = 6369
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Đurica', 'Kežić', 'djurica.kezic@email.com', '$2b$12$hk7HIWRUxYv/r4nPpBlvLe4PfSE2.5l.Drvk5KoCYl8.l3XQlehd2', 'true', 'true');

--email = filiman.trivunic@email.com password = 1367
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Filiman', 'Trivunić', 'filiman.trivunic@email.com', '$2b$12$nmwfhvAyGEvkwYC6FCzB6esX3aW2/Z2qb/9UTfwPcDCFCJL3ZXuTa', 'true', 'true');

--email = trifun.paranosic@email.com password = 7482
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Trifun', 'Paranosić', 'trifun.paranosic@email.com', '$2b$12$aPewJwokKzk64SN13huwZOgfKoLCLeP2i3ZCIqUl5/LZsmpXIn9/K', 'true', 'true');

--email = bosko.moracic@email.com password = 5738
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Boško', 'Moračić', 'bosko.moracic@email.com', '$2b$12$/yEfwM5H764SWONPYfnJXeg7EADugRD3fObmj4pyShH5eDOYFgEXq', 'true', 'true');

--email = srba.sorajic@email.com password = 9487
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Srba', 'Sorajić', 'srba.sorajic@email.com', '$2b$12$2cQiJ4a9lEaiy00iucCLaufAvssIGcRwyen/keGn3KqRcfam05xee', 'true', 'true');

--email = zivodarka.jasic@email.com password = 7551
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Živodarka', 'Jašić', 'zivodarka.jasic@email.com', '$2b$12$cohuHXij68RA2Ddm7qHW6.HQnrCJYo7kF1Iz0t5AAo6ikopTG/cXK', 'true', 'true');

--email = verica.paunic@email.com password = 1687
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Verica', 'Paunić', 'verica.paunic@email.com', '$2b$12$FaVpvAxTb5FQMDXS4NL7N.N9DPQ/cT9YaPUqIQFA34ZU9gOR.Fwfy', 'true', 'true');

--email = ristivoje.opalic@email.com password = 4454
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Ristivoje', 'Opalić', 'ristivoje.opalic@email.com', '$2b$12$gOJjub/ffIMi955qtPMr4ur6H4We3FIMd9/6M2jVmIcxv8sivJ2nW', 'true', 'true');

--email = gaga.grajic@email.com password = 6393
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Gaga', 'Grajić', 'gaga.grajic@email.com', '$2b$12$Jx3381e.7Bdqd9pxJ9oL/./ysa3gN7LOfwIVNqMSi/rpqXV7EKvZe', 'true', 'true');

--email = njegus.ocinic@email.com password = 3148
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Njeguš', 'Očinić', 'njegus.ocinic@email.com', '$2b$12$J.pnRKKbb2G6kkbQ3y3s8OQ4d79KFfyC5KKJfJSkMf6DpQJQGN7T.', 'true', 'true');

--email = grigorije.mihaljcic@email.com password = 4906
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Grigorije', 'Mihaljčić', 'grigorije.mihaljcic@email.com', '$2b$12$M6.obVLckwbgQwizpeB3q.eDxjmY20EXTcuH/ME3nGhYgbxVFU9p6', 'true', 'true');

--email = stojna.timotic@email.com password = 6206
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Stojna', 'Timotić', 'stojna.timotic@email.com', '$2b$12$UNXlber5ArjLqSFs99TLWePOsdLoELVqOrgeXAeXft8WRQl2NKinW', 'true', 'true');

--email = persa.ljubic@email.com password = 8953
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Persa', 'Ljubić', 'persa.ljubic@email.com', '$2b$12$EUFHonYq5GcrvTvarjPpzendl1ipbe8jfcBciZ506sPm/296.RT06', 'true', 'true');

--email = luka.jesic@email.com password = 7991
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Luka', 'Ješić', 'luka.jesic@email.com', '$2b$12$MsVBRnIgArlpfKxY0GDqQex.OuCRHX96XqDxX7eORmEQ1k5CdtkL6', 'true', 'true');

--email = ljuban.dangic@email.com password = 1441
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Ljuban', 'Dangić', 'ljuban.dangic@email.com', '$2b$12$YhAf06ialFC3Yh56UlmZNeDol4GxZvwciFphfF9Z78biA3j7asZBG', 'true', 'true');

--email = spiro.radnic@email.com password = 6134
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Špiro', 'Radnić', 'spiro.radnic@email.com', '$2b$12$QDngih3goBLnghiS65E0bOZPXMyiMMCi5d35s81sSgU072hfFiwCe', 'true', 'true');

--email = cajka.nikezic@email.com password = 7321
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Cajka', 'Nikezić', 'cajka.nikezic@email.com', '$2b$12$Nfdq5wTTsma2eUJb0AOZjevGOFKI4V6pVuvPkcZIys/qt77XDaiQO', 'true', 'true');

--email = todora.stikic@email.com password = 8081
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Todora', 'Stikić', 'todora.stikic@email.com', '$2b$12$T0C59w7to9i2s6ITP15FROmMuxqvBb9PMhOGjvECzyz90jrPfH.c6', 'true', 'true');

--email = trivun.boljanic@email.com password = 8977
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Trivun', 'Boljanić', 'trivun.boljanic@email.com', '$2b$12$2Yq46Ze9qIRJAMp.5xnDOOLQplha3FEkfKE6rdmCfUfxz4FCg7CV.', 'true', 'true');

--email = anastasija.bradonjic@email.com password = 6634
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Anastasija', 'Bradonjić', 'anastasija.bradonjic@email.com', '$2b$12$A6OaFPwKmvwmNZ/L30G3T.VS5AWmHK.lRklmjRP36ZnCXMn8RpRCe', 'true', 'true');

--email = simonida.pecic@email.com password = 9734
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Simonida', 'Pecić', 'simonida.pecic@email.com', '$2b$12$nr.QlvS2cFlmiT895P2eLeA2HFh7cJuoaQ0cgHYXJ/kTFpNaYUuRK', 'true', 'true');

--email = radonja.kaldesic@email.com password = 3831
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Radonja', 'Kaldesić', 'radonja.kaldesic@email.com', '$2b$12$TXIXRg/HQVivH7PpwQ26he56wasoloT1yxAjzydESVY1096aBSxs2', 'true', 'true');

--email = golub.tosnic@email.com password = 5776
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Golub', 'Tošnić', 'golub.tosnic@email.com', '$2b$12$P1RLB6bTjGnzCSyKhAshzePk2NtHe1BcTV0FAM2MEkqM031e1N9QC', 'true', 'true');

--email = mitra.simakic@email.com password = 3987
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Mitra', 'Simakić', 'mitra.simakic@email.com', '$2b$12$LSDE6BIGP5T2qI598N7cp.FQ5P9L2RZ3Xe78ZiuqE4feYMvHGK1c.', 'true', 'true');

--email = obradinka.fustic@email.com password = 2532
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Obradinka', 'Fuštić', 'obradinka.fustic@email.com', '$2b$12$2LTEjowMUz.qv9B.VB4/8.dUJygawDc3SUYmsjvLztw/LxIFv4lV.', 'true', 'true');

--email = novica.mektic@email.com password = 7365
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Novica', 'Mektić', 'novica.mektic@email.com', '$2b$12$Ay3GMT7o1/17yY.16QFjBum3648iLwwzhfQZDQrUA7gTZPODnX34i', 'true', 'true');

--email = vitomir.najdic@email.com password = 5147
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Vitomir', 'Najdić', 'vitomir.najdic@email.com', '$2b$12$r.TvPEcRq5/GmQkf1zQ9vultn8/6V6AXTPW5Y5wnto7kqjL3RTPSm', 'true', 'true');

--email = jagos.krdzalic@email.com password = 1369
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Jagoš', 'Krdžalić', 'jagos.krdzalic@email.com', '$2b$12$oAFyR7zGIamzuVoft6kYG.SyP3skUTUrVxJ29/GbUTch24TKll1Bq', 'true', 'true');

--email = stavra.dragojic@email.com password = 8865
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Stavra', 'Dragojić', 'stavra.dragojic@email.com', '$2b$12$pjjxWFQqMXt/wJA9NMeFHuZu9fcXN.xmIGW/.ybnrfoCvC/ElL7QK', 'true', 'true');

--email = ivona.stancic@email.com password = 2743
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Ivona', 'Stančić', 'ivona.stancic@email.com', '$2b$12$/6UVP2NZPWYYEdnTQMEofuvmjeWNG1lqwgMR8oz4jk28nceQoBhFa', 'true', 'true');

--email = selimir.galonic@email.com password = 1299
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Selimir', 'Galonić', 'selimir.galonic@email.com', '$2b$12$u2nb9bIPfDvbkb2A2VTdDuoUL8olnMngB8AnsDZUbGQhJF9HiWo3K', 'true', 'true');

--email = leonora.zrilic@email.com password = 8067
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Leonora', 'Zrilić', 'leonora.zrilic@email.com', '$2b$12$kg/cd4vdxx72Dvvtw62ypev4qBtOk64atZlEkAr1x6D2eUEK9LdWe', 'true', 'true');

--email = elizabeta.lopicic@email.com password = 6353
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Elizabeta', 'Lopičić', 'elizabeta.lopicic@email.com', '$2b$12$7O7vOtyFfeGtqi6RHTerH.Ph1D37riW.7YIkWQ9FL5d.7BNNZp38a', 'true', 'true');

--email = ljuba.drobic@email.com password = 4768
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Ljuba', 'Drobić', 'ljuba.drobic@email.com', '$2b$12$hFOragrDqwJHVcf3ydTaQeUqnNPR1qP/NNotFylgEajZt2X32336G', 'true', 'true');

--email = zlata.guresic@email.com password = 2853
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Zlata', 'Gurešić', 'zlata.guresic@email.com', '$2b$12$9SIYE7OH.B52StIiKkC8jeM2jUdUw3o4H9KkmRMd6IPE46hG1FtVC', 'true', 'true');

--email = stanko.kaldesic@email.com password = 8822
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Stanko', 'Kaldesić', 'stanko.kaldesic@email.com', '$2b$12$CCkiVU1BWyHlD8h.hYqOKeufZCqYASnX6KStKiz.4vMgYmbLicm0i', 'true', 'true');

--email = radojka.balandzic@email.com password = 3310
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Radojka', 'Balandžić', 'radojka.balandzic@email.com', '$2b$12$PK.lWmOasbZ2KbHFIZjpDu3kRzuLMdesx1VSAy1bP6AN0bTtkuzn6', 'true', 'true');

--email = anastasija.laketic@email.com password = 3303
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Anastasija', 'Laketić', 'anastasija.laketic@email.com', '$2b$12$lw3SlE/WqtWAw/BLFUNnoOCZ8VR9D0V/G6mQkHSHnJp45VnCcA8Dm', 'true', 'true');

--email = laza.divnic@email.com password = 3551
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Laza', 'Divnić', 'laza.divnic@email.com', '$2b$12$Nd1PRLM5Yk1M7HNO1lO2gOItS0d61xT8/5QwOrvOV32amuuq/yLOi', 'true', 'true');

--email = dimitrije.jeremic@email.com password = 3790
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Dimitrije', 'Jeremić', 'dimitrije.jeremic@email.com', '$2b$12$fvllpofqMBZ6YOQOj6g0R.XPC2yRx6VhQSZkSplL9D2B7jBpMUCWy', 'true', 'true');

--email = bozidar.perucic@email.com password = 5821
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Božidar', 'Perucić', 'bozidar.perucic@email.com', '$2b$12$RBlIhJowtip87cF3kXyL5eNowX7fDfXyRc4ZfIQ19t5xTfNGhbDgm', 'true', 'true');

--email = nina.ciplic@email.com password = 9826
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Nina', 'Čiplić', 'nina.ciplic@email.com', '$2b$12$FFM8Icd0EU044d0.QMbLreI.E3.vyE/NdETroXkfzv4kY86vIAJui', 'true', 'true');

--email = ranka.lestaric@email.com password = 2888
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Ranka', 'Leštarić', 'ranka.lestaric@email.com', '$2b$12$Jh3Cl3q28cWbAUEbfhPNxeyQJWLEYuNNnpKP1PJEyK8hCrnG6kG9O', 'true', 'true');

--email = sretoje.guveljic@email.com password = 5978
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Sretoje', 'Guveljić', 'sretoje.guveljic@email.com', '$2b$12$PBeb4cFtWDG6gGAchCC7V.bWdyEuHsEYZcbgVpwTORzESubui7M9e', 'true', 'true');

--email = julijan.tosic@email.com password = 5018
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Julijan', 'Tošić', 'julijan.tosic@email.com', '$2b$12$D3WFkBC13y1sDe8Ak6TS3ekC2Oblv0LYGpHFUi6dH.ui2XS2fi4j2', 'true', 'true');

--email = jevrem.dzekulic@email.com password = 3293
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Jevrem', 'Džekulić', 'jevrem.dzekulic@email.com', '$2b$12$je9xQfa7ozbq3O4Di89bWeBKtcAu1EDR1hrQbvjqGXR8Do2V07fkq', 'true', 'true');

--email = slavisa.rogic@email.com password = 8023
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Slaviša', 'Rogić', 'slavisa.rogic@email.com', '$2b$12$jrEr0bWK0p1RDrfj4WfuaeEo0X.K/HCm.ML46s8TtQRYVRnERKDKG', 'true', 'true');

--email = todor.aleksic@email.com password = 6186
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Todor', 'Aleksić', 'todor.aleksic@email.com', '$2b$12$jD3nc4wLYm7zs4agmQhfRO3aVN93OJD1AVoOpNJWk189TppyzesDC', 'true', 'true');

--email = ljubomirka.stefic@email.com password = 8516
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Ljubomirka', 'Stefić', 'ljubomirka.stefic@email.com', '$2b$12$0WCcdvDi1nxdgf2FS.l17.r6SFxEdfRmRZhcIOFGekdqzUYkA1eo.', 'true', 'true');

--email = radoljub.stokic@email.com password = 3263
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Radoljub', 'Stokić', 'radoljub.stokic@email.com', '$2b$12$NK6yvgSw.rc.1cWjiX7jdeaT4ZXUtLEnX2txF6SvSpElK6gUiaB0q', 'true', 'true');

--email = ljubinko.ranisavic@email.com password = 7888
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Ljubinko', 'Ranisavić', 'ljubinko.ranisavic@email.com', '$2b$12$yOZlKmf4Jowzw/VJxVPxpuXb9UQAS6SDV22XNoly/ZCXzzmmb221.', 'true', 'true');

--email = bogomir.gazdic@email.com password = 6069
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Bogomir', 'Gazdić', 'bogomir.gazdic@email.com', '$2b$12$WM8lAB0jTZ09.XMkf3GHD.d/t5Gl851RWFSndskHStwpcN/d9ng5G', 'true', 'true');

--email = jordanka.karaklajic@email.com password = 9291
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Jordanka', 'Karaklajić', 'jordanka.karaklajic@email.com', '$2b$12$6h0HLcvb.BxTfiutImn9IuIAKwOTLqCeD0KaY5woYl2lj1EMn4YH6', 'true', 'true');

--email = atanasije.copic@email.com password = 9866
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Atanasije', 'Ćopić', 'atanasije.copic@email.com', '$2b$12$cQYmbSH4xYtZOdkzMiA3xeFexlQtZEeYAUrIwPCzEtXD30H2e8TmG', 'true', 'true');

--email = djurdjija.kojic@email.com password = 3139
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Đurđija', 'Kojić', 'djurdjija.kojic@email.com', '$2b$12$fSCsYrxOx2ICk708Amawq.Cg/6WXVxc40JnADz.rjIo7PbwhFdsgG', 'true', 'true');

--email = simeuna.palalic@email.com password = 9752
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Simeuna', 'Palalić', 'simeuna.palalic@email.com', '$2b$12$hmpmTbk3a062B7LvcdshuOEgjb8mOM5i/BglpRc8GFRvsknzYmeQe', 'true', 'true');

--email = poljka.janjic@email.com password = 5854
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Poljka', 'Janjić', 'poljka.janjic@email.com', '$2b$12$KcGNjeihxe5ddgZ5pJos/.nWdXoPaEnhFad7GS2TpvZVbmnpi6a3K', 'true', 'true');

--email = bogomir.prikic@email.com password = 3880
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Bogomir', 'Prikić', 'bogomir.prikic@email.com', '$2b$12$bI9K2sqrULyBitLxTeskTuRGx3F68lx0vvV9U84yMJgfe7WRpW1wW', 'true', 'true');

--email = spasenija.karetic@email.com password = 6710
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Spasenija', 'Karetić', 'spasenija.karetic@email.com', '$2b$12$CIZrIugCWSkaKozasJxfEeaT55raWn/oS7EKMpalre7ypNwRk2Q2S', 'true', 'true');

--email = djura.milunic@email.com password = 2987
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Đura', 'Milunić', 'djura.milunic@email.com', '$2b$12$qUchvvrmtZerzW.W57JSguZ6pLOweQVemeA4HkeFFFy4wZj0RUZau', 'true', 'true');

--email = radoje.vasilic@email.com password = 2188
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Radoje', 'Vasilić', 'radoje.vasilic@email.com', '$2b$12$4Am1fQws1PdFvMshWy8pa.v7OAs7pzVTKDt6xQsF0CLgz9lTsurtK', 'true', 'true');

--email = petruska.raljic@email.com password = 7123
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Petruška', 'Raljić', 'petruska.raljic@email.com', '$2b$12$1HgB7Z1nyy49sBGjgG8AqeqX1sd8C.8lU8T4MUiVVcgXRxyMQ6un6', 'true', 'true');

--email = caja.borovinic@email.com password = 2459
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Caja', 'Borovinić', 'caja.borovinic@email.com', '$2b$12$NcacdCO/QZGBDQpcI.HKQ.vo9KMsccPjJ5acMOu6SKEUWqf0Hp7uK', 'true', 'true');

--email = ratimir.grubesic@email.com password = 7322
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Ratimir', 'Grubešić', 'ratimir.grubesic@email.com', '$2b$12$GvdqUKcAvkYBJizHOtUklekM5iaJmuX.K/pVEzt1SmBjqRKmO1txa', 'true', 'true');

--email = adam.dimitric@email.com password = 6315
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Adam', 'Dimitrić', 'adam.dimitric@email.com', '$2b$12$A3m.An/TPSrYIhEQykT5qud6z5pPtwwAM8qZySvzSP6UdqqTQMDZW', 'true', 'true');

--email = petrija.nuzdic@email.com password = 6531
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Petrija', 'Nuždić', 'petrija.nuzdic@email.com', '$2b$12$h3xy8TXJJ6gNrBnR1NCjH.M5CaQqRf1zYRdLCvw3Nawoc23j.bpFO', 'true', 'true');

--email = stojka.krasnic@email.com password = 8037
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Stojka', 'Krasnić', 'stojka.krasnic@email.com', '$2b$12$PaBq4aS6UJoEwFq6XBiVQeMi1vFldK0gtIZ6tn3ByJHC16dfm2Iqm', 'true', 'true');

--email = uranko.borjanic@email.com password = 8709
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Uranko', 'Borjanić', 'uranko.borjanic@email.com', '$2b$12$gO7a6KQZP7wi4R7xC3zBLOTYZmqrRJwkE1KXCKpD9H6PJA8PBDuWu', 'true', 'true');

--email = leposava.radotic@email.com password = 4329
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Leposava', 'Radotić', 'leposava.radotic@email.com', '$2b$12$1pMM9OMQY/ivw2HZ/smHEuU7Bie5SIceoSKHMHTI8zkX/XzQUCCPy', 'true', 'true');

--email = dobrosav.sekaric@email.com password = 7697
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Dobrosav', 'Šekarić', 'dobrosav.sekaric@email.com', '$2b$12$9HuXqf/J0TENfZqCGhuG5O2y7jwx4FB49iy/x280TWxzppWdkUmFW', 'true', 'true');

--email = kruna.gruzanic@email.com password = 9193
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Kruna', 'Gružanić', 'kruna.gruzanic@email.com', '$2b$12$ApgRrveShB8jDapsUjTCp.aHybcmeQnI2PDmF9KbUVp3Rk24gm6PS', 'true', 'true');

--email = svetoje.glodic@email.com password = 8242
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Svetoje', 'Glodić', 'svetoje.glodic@email.com', '$2b$12$e8miGnt6u4SCMeE63/5bHOgH7V0UW/TeTckEoqOnKwPqww0AS6ftS', 'true', 'true');

--email = dobrosav.vladicic@email.com password = 7062
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Dobrosav', 'Vladičić', 'dobrosav.vladicic@email.com', '$2b$12$m4lszjjU50CVSasaYWa6Me4IuzRvESX8.94Xz6gMxCNFN4V4X.Sze', 'true', 'true');

--email = trajanka.sakotic@email.com password = 9517
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Trajanka', 'Šakotić', 'trajanka.sakotic@email.com', '$2b$12$9EJeBkJe36Dh9QA97fJ6PeUugObx8etpyZYOpZ3yC6wnwkeuu7Zki', 'true', 'true');

--email = radan.ceprnic@email.com password = 6524
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Radan', 'Čeprnić', 'radan.ceprnic@email.com', '$2b$12$z4rycJWTzyxiFlrj2KfbPOiUqGzH1GvX9EabsqO5rSZZqaUp0aTf.', 'true', 'true');

--email = verica.orlandic@email.com password = 7579
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Verica', 'Orlandić', 'verica.orlandic@email.com', '$2b$12$ozxA2NR.H6k2sdyFcpNS3.WZXX441Mu4GPEvAOzPZzHuw0ZcqcKo6', 'true', 'true');

--email = masinka.sodic@email.com password = 2284
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Mašinka', 'Šodić', 'masinka.sodic@email.com', '$2b$12$V68shhXz6pFiu0PGOr7OauAqwf621EOgBiVZBgFuMLpPVwM3jaqGK', 'true', 'true');

--email = ninko.topic@email.com password = 8300
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Ninko', 'Topić', 'ninko.topic@email.com', '$2b$12$iEQ8FWjp.2XT6qSV.IIPrOv75kfx31Kp2WJ.8UcKsTG9OaK3V71aC', 'true', 'true');

--email = stojadinka.trudic@email.com password = 6382
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Stojadinka', 'Trudić', 'stojadinka.trudic@email.com', '$2b$12$idBIPCAPLxMldVeXMRdRrOu3L7NjmMShhsuKgBLk7oWlYtUkGJyMy', 'true', 'true');

--email = stanija.josic@email.com password = 8299
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Stanija', 'Jošić', 'stanija.josic@email.com', '$2b$12$u/YgQxKd3k5L/K8KzQLBZuw2uwSuC/d30DAKaGUPoRBxXdB87cJgG', 'true', 'true');

--email = aco.vukoicic@email.com password = 6283
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Aco', 'Vukoičić', 'aco.vukoicic@email.com', '$2b$12$fRiHWLeGGm3qcBviFfELKOUjLY4JELJvp4eBDKasBNWD3DBn9DjBS', 'true', 'true');

--email = ivo.glodic@email.com password = 4089
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Ivo', 'Glodić', 'ivo.glodic@email.com', '$2b$12$kFzy00lr2p8kteNkrwk1uO4aLJVFXJJz9eXYkwO2U4HZ.d8ZG7.5i', 'true', 'true');

--email = milenija.tesankic@email.com password = 4201
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Milenija', 'Tešankić', 'milenija.tesankic@email.com', '$2b$12$3TwFteKS2uQTbNW/KMwCEeGtwFu7S68XrPrLKRdAzFw1gDs.2qDfO', 'true', 'true');

--email = goca.beslic@email.com password = 3959
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Goca', 'Bešlić', 'goca.beslic@email.com', '$2b$12$AuuRYsPLKvlr8/sw8lgJbOpIZfn/23qNfszZsjvbjomyFGGukrkBW', 'true', 'true');

--email = tamara.jekic@email.com password = 1074
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Tamara', 'Jekić', 'tamara.jekic@email.com', '$2b$12$EqnmqH/0zMG74JNUEgbEY.xSeWHoqgJC7jY/9elRBs/Z6IrPLLaQO', 'true', 'true');

--email = milijan.melentic@email.com password = 1481
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Milijan', 'Melentić', 'milijan.melentic@email.com', '$2b$12$SzWAvz1k6MEKjBrP6/94u.7dVIa17.VwCFlasvhOheKI93DrVfQy2', 'true', 'true');

--email = stamenko.drobic@email.com password = 9797
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Stamenko', 'Drobić', 'stamenko.drobic@email.com', '$2b$12$bjgPMRRwt1eR6faZLPZtm.1IRxogjZXzlXbzvWypgzKx4EWw0iqWi', 'true', 'true');

--email = jelika.vracaric@email.com password = 1347
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Jelika', 'Vračarić', 'jelika.vracaric@email.com', '$2b$12$S5MpbsvXeZHyz128OFRlg.BsVA625kwqGkW6r81adJIT8M0qjLiHC', 'true', 'true');

--email = djordje.kajganic@email.com password = 6836
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Đorđe', 'Kajganić', 'djordje.kajganic@email.com', '$2b$12$CweflW446u3qB.T7sIxt9.RTVHCguPQl5fU.ktokywOh4OPDy1nza', 'true', 'true');

--email = nedeljka.jesretic@email.com password = 2022
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Nedeljka', 'Jesretić', 'nedeljka.jesretic@email.com', '$2b$12$U2YZpXbEZNdEY9spkAPz1OOPbCW6V8PbqywIYtQ.kQ9slf6/fnD9W', 'true', 'true');

--email = aleksandra.zambelic@email.com password = 1862
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Aleksandra', 'Zambelić', 'aleksandra.zambelic@email.com', '$2b$12$m8SDtHQhrDEggoZsC.cabOGeifW.nrHKyByfhKl//qBkg6Y0VBQom', 'true', 'true');

--email = bisenija.nikic@email.com password = 7636
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Bisenija', 'Nikić', 'bisenija.nikic@email.com', '$2b$12$HDtIbywAwkPo6WMUNrPw.OadBr.7eDNEatFdFhjWrHkQ7bT1yGF06', 'true', 'true');

--email = aksentije.vrkatic@email.com password = 4236
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Aksentije', 'Vrkatić', 'aksentije.vrkatic@email.com', '$2b$12$zhcb3RM9jpcqDSLhImzfY.JXvRH0gGjWBOZh6Vo9M0W5LjIG2Ihsm', 'true', 'true');

--email = goca.grbatinic@email.com password = 9094
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Goca', 'Grbatinić', 'goca.grbatinic@email.com', '$2b$12$vcYU49qvVRT70Z.YJ5nCuepU4tfioMLCcJGbB7f4xvzOGZ9kllrOW', 'true', 'true');

--email = srboljub.jajic@email.com password = 6288
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Srboljub', 'Jajić', 'srboljub.jajic@email.com', '$2b$12$eD2FXqEfTRhYnz5aEoC9pucJAHapMyvMGnKKNXVqsj9rVB0VSjCkK', 'true', 'true');

--email = radisa.bunardzic@email.com password = 6446
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Radiša', 'Bunardžić', 'radisa.bunardzic@email.com', '$2b$12$ox42HXEgdHO6wDpSJOxsC.oDeMMAsoTH3CbrRw.YlumfxfGR5jI.q', 'true', 'true');

--email = stojna.bocokic@email.com password = 8281
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Stojna', 'Bocokić', 'stojna.bocokic@email.com', '$2b$12$JYj1XZ0VLgC.eB.F6V6G0.2KwFdh7nZ.qWOFNoJoC3ir7pUeYLYze', 'true', 'true');

--email = nadezda.drulic@email.com password = 7195
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Nadežda', 'Drulić', 'nadezda.drulic@email.com', '$2b$12$X1IFuf.TEgMatEoIDVaAz.NtdtkYvy7M8Wqmfh9SKoNJNFTT5/Wqa', 'true', 'true');

--email = uranko.zisic@email.com password = 1772
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Uranko', 'Zisić', 'uranko.zisic@email.com', '$2b$12$e5ZZ4P/hBz9j9vaqDwcj3u9.obGArHboLIUbfUfBqf4L1R4j0AvyO', 'true', 'true');

--email = zorana.dincic@email.com password = 7642
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Zorana', 'Dinčić', 'zorana.dincic@email.com', '$2b$12$DjTrA6De44QAMD.8zKzr0ejDur6ZDO2xjmFYCEFfGb9816sba4q.O', 'true', 'true');

--email = toma.levnaic@email.com password = 5140
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Toma', 'Levnaić', 'toma.levnaic@email.com', '$2b$12$HIkYlavqfQkFk7AaMrmoUO65zqAIp/oQ/r.pRP6gfFgIdboXIpEi.', 'true', 'true');

--email = stojadinka.perutic@email.com password = 9380
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Stojadinka', 'Perutić', 'stojadinka.perutic@email.com', '$2b$12$OVlwSGbQ6tWagZpiOyrFSOwFUv2mt/fscBcDHdyR7mycTKdSmHjsK', 'true', 'true');

--email = aca.bondokic@email.com password = 3352
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Aca', 'Bondokić', 'aca.bondokic@email.com', '$2b$12$nTREEHk/Pn07jfPxq1fVQemLSueVZOHj5/PZomfFqKDiPj6g7/CJu', 'true', 'true');

--email = teodora.jesretic@email.com password = 2809
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Teodora', 'Jesretić', 'teodora.jesretic@email.com', '$2b$12$pijdJQd9kTWsDqmMqkA31uJW24LBjoSlH3ApqQY/NdbIWw4MmSwli', 'true', 'true');

--email = zivadinka.tojic@email.com password = 5275
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Živadinka', 'Tojić', 'zivadinka.tojic@email.com', '$2b$12$RcT0.9F5ZxjvmUG4JSfs8em/id0jKYCaoWNrL19vlYz7zLdMxmIVS', 'true', 'true');

--email = cvijo.kokelic@email.com password = 6473
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Cvijo', 'Kokelić', 'cvijo.kokelic@email.com', '$2b$12$2UGoUTuGHM1BMsIe0Bthhe5fUYqNm4w4OSNqFUSqBs32CYsAvDJUq', 'true', 'true');

--email = biserka.japundzic@email.com password = 8928
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Biserka', 'Japundžić', 'biserka.japundzic@email.com', '$2b$12$dnfZ4I/L/xKtrTmKywiUduQjF2ObLOMT9m16U/LFLDDSJWhaRQ0Vy', 'true', 'true');

--email = luka.jankelic@email.com password = 4927
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Luka', 'Jankelić', 'luka.jankelic@email.com', '$2b$12$aDcVfiBS4vqjCn6OEzhb1.1/iR4c4tKA3oJHmk/RqI7IYoKjRfsSq', 'true', 'true');

--email = milojko.spiric@email.com password = 7580
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Milojko', 'Špirić', 'milojko.spiric@email.com', '$2b$12$Z2mFqdWosWxNtbINy8joYuyGXqKxT3E/UdTc2kcyfxqqb24c4XUJe', 'true', 'true');

--email = spridon.guduric@email.com password = 7328
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Spridon', 'Gudurić', 'spridon.guduric@email.com', '$2b$12$MXz.qsjLiDY2x07CRuj2xeur32Tg8NEhe/GC/5MhRdLQ/.00sMLgW', 'true', 'true');

--email = dragomir.drmoncic@email.com password = 3030
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Dragomir', 'Drmončić', 'dragomir.drmoncic@email.com', '$2b$12$HJmL9A.x7h05eN2yjLu1wul/NOrptQLgan91yeg5IgUjwwybjaVmS', 'true', 'true');

--email = stojadinka.lupikic@email.com password = 3013
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Stojadinka', 'Lupikić', 'stojadinka.lupikic@email.com', '$2b$12$5bwMQCwhHOwU17Ua50O0VupdgmuQgOFXQSCnoAUL60XcQB30jR.fS', 'true', 'true');

--email = mladomir.jaglicic@email.com password = 1824
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Mladomir', 'Jagličić', 'mladomir.jaglicic@email.com', '$2b$12$Dpfb9cJ.b57y3HJlpBnrQeY3FR2oTbibS2ryxecXcK0WZZ0KuFr/6', 'true', 'true');

--email = maksim.pencic@email.com password = 2285
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Maksim', 'Penčić', 'maksim.pencic@email.com', '$2b$12$QJrr.JTLrjLPrm3rmwcrUukrV1wEf231NTkRfzwzjMBSJC9xAXFr6', 'true', 'true');

--email = tanasko.kovijanic@email.com password = 5908
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Tanasko', 'Kovijanić', 'tanasko.kovijanic@email.com', '$2b$12$NwJARjmF2B1QQLHp47C/M./vhmRBiNuNevSSdO9THs3XVc2wLD7cy', 'true', 'true');

--email = dragana.klinic@email.com password = 9405
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Dragana', 'Klinić', 'dragana.klinic@email.com', '$2b$12$kRqWN3GnfhJdbXxSzeV/re1rs8kCqbcZ/42QB6h0433W3B7NKkOzy', 'true', 'true');

--email = dragisa.bradajic@email.com password = 3492
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Dragiša', 'Bradajić', 'dragisa.bradajic@email.com', '$2b$12$kqRFa.Ed3ic5poDe0x.Hw.m9a2pJ/XmN2myXxrs2jL18ulkyTs2hW', 'true', 'true');

--email = bosiljka.susic@email.com password = 2333
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Bosiljka', 'Šušić', 'bosiljka.susic@email.com', '$2b$12$T1IpPR8p8QB9gADDTT/opO9CtP7ctoih9nDHc5imiHBUK5dNLYNBG', 'true', 'true');

--email = cirka.percic@email.com password = 1073
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Ćirka', 'Perčić', 'cirka.percic@email.com', '$2b$12$ntZcN/71DhlW/cysuAdC0u6/.ZgGAVbVC8acrpT9OAz141Azj2p.i', 'true', 'true');

--email = radivoj.pasajlic@email.com password = 4793
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Radivoj', 'Pašajlić', 'radivoj.pasajlic@email.com', '$2b$12$dzqHgD.lmvcMye.AqBCUcO0eu8p7e5CnByCWZp/gkgcen2f2eiGD.', 'true', 'true');

--email = djurdjija.saicic@email.com password = 5102
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Đurđija', 'Saičić', 'djurdjija.saicic@email.com', '$2b$12$HL9XAr1z2Qzp.w9F3LF6BOt66gIsT1EhL5BXJvU3HhGeNnSCF8lg2', 'true', 'true');

--email = djurdje.kaldesic@email.com password = 7298
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Đurđe', 'Kaldesić', 'djurdje.kaldesic@email.com', '$2b$12$sd.7OaXrgTKHzL4KE/0Q/.qEHuyZYQnSbkmmTeGdRchM5tfMbt58S', 'true', 'true');

--email = dobrilo.koljancic@email.com password = 5862
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Dobrilo', 'Koljančić', 'dobrilo.koljancic@email.com', '$2b$12$FoPXOf5SDkJZfdHXx9k2Z.JDp9iib9bf2LZjbb2U3IoaHutQFC3jK', 'true', 'true');

--email = djura.kentric@email.com password = 2169
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Đura', 'Kentrić', 'djura.kentric@email.com', '$2b$12$qcx0OpQ4HDzgxgy1ebTco.7jwxzaCWY2Qj2giTBcLtytKCxwy/kaa', 'true', 'true');

--email = sava.piric@email.com password = 9359
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Sava', 'Pirić', 'sava.piric@email.com', '$2b$12$w7phPSpqfMawsoRIL0lmq.NsbgYLMshaltFChxy03dHgcYVnKUT.S', 'true', 'true');

--email = milesa.kvrzic@email.com password = 4671
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Milesa', 'Kvržić', 'milesa.kvrzic@email.com', '$2b$12$RXImc9JVzs462NjZbQJq/.m8N6pk2CXn9ZpkyMij4pZodHfcM7saO', 'true', 'true');

--email = ranko.blazetic@email.com password = 5798
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Ranko', 'Blažetić', 'ranko.blazetic@email.com', '$2b$12$o56GY7acLUpq8TkibsT2yusGH.Ow71PoNoGvN.rvl64AjYi3fmCku', 'true', 'true');

--email = nicifor.jelusic@email.com password = 3945
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Nićifor', 'Jelušić', 'nicifor.jelusic@email.com', '$2b$12$GmtfnDu4rcZoSBZqI7FYCuC6IcLe2hJJ6HYjFnhVXtHD3t1vJrY2q', 'true', 'true');

--email = radojka.stegnjajic@email.com password = 3726
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Radojka', 'Stegnjajić', 'radojka.stegnjajic@email.com', '$2b$12$zQVGLI7Xs9r2p.cjeO5xpOP7vK2pc.Vs/Mh7Pwl2r5hdszdL7KRxS', 'true', 'true');

--email = makarije.pjevic@email.com password = 8675
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Makarije', 'Pjević', 'makarije.pjevic@email.com', '$2b$12$tD3TWErU/nUW8P5JaBgYYuwDfsrlG3WUAqCiiznvawubzEZ05oveW', 'true', 'true');

--email = anka.kljunic@email.com password = 1901
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Anka', 'Kljunić', 'anka.kljunic@email.com', '$2b$12$b0tvYoo0QYhxuopnvfJmxO04qsXSflKoW.A08vHDFeLJM0BgOV/z.', 'true', 'true');

--email = bojan.becic@email.com password = 2493
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Bojan', 'Bečić', 'bojan.becic@email.com', '$2b$12$JV3u1R9K7CRAJuhCyk8Dye60q1r03nEow9Z8AoWWJTWYtlu.2hqHa', 'true', 'true');

--email = varvara.bondzulic@email.com password = 4506
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Varvara', 'Bondžulić', 'varvara.bondzulic@email.com', '$2b$12$bv/z92uPjdO5r0vBqYrTgeKVin4v2EppdgeMbJXapZuYZ6iLm1wJ2', 'true', 'true');

--email = vladanka.lepojic@email.com password = 5869
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Vladanka', 'Lepojić', 'vladanka.lepojic@email.com', '$2b$12$5NGxNlpaLI8k3xN4F4G.5O2dOCD09lmBhZxiASxr/prpIpcKgmF5u', 'true', 'true');

--email = ranka.deuric@email.com password = 3255
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Ranka', 'Deurić', 'ranka.deuric@email.com', '$2b$12$mQ9xl8oMKduyDFc1RIafPuFb5ymEL.4wZnA0/aMNdoZ7v.YJrbYJ2', 'true', 'true');

--email = perunika.nojkic@email.com password = 8959
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Perunika', 'Nojkić', 'perunika.nojkic@email.com', '$2b$12$Ju4a.CPyQFt1sE9zZ0oRB.Ml2DsbzgyHatlMQiGZR.wci/4di9KuC', 'true', 'true');

--email = kostadin.tejic@email.com password = 2707
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Kostadin', 'Tejić', 'kostadin.tejic@email.com', '$2b$12$HZubwUIPM9wx5s.dNj0MLuhgwXHxfOGnUbmZ.oecp7WF181HXwfGq', 'true', 'true');

--email = poleksija.bozinic@email.com password = 4224
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Poleksija', 'Božinić', 'poleksija.bozinic@email.com', '$2b$12$fvK5vH9umXTPSiSZfGTbgurwulMnJTl.TT.wN74fep2wswhXOqOIe', 'true', 'true');

--email = jakov.rosandic@email.com password = 2479
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Jakov', 'Rosandić', 'jakov.rosandic@email.com', '$2b$12$Z4RBZxXnTbfO/oLaLTwCq.ZJrmWjwy2XGhnpiT0JqMfqFl/3jfCqe', 'true', 'true');

--email = zlatoje.topolic@email.com password = 5792
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Zlatoje', 'Topolić', 'zlatoje.topolic@email.com', '$2b$12$LBGVYCZWJ2WC9Vj2eHmAm.nVp02E0.jgKVO.ELiTzPdJrEvNj91IC', 'true', 'true');

--email = danilo.jelacic@email.com password = 2319
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Danilo', 'Jelačić', 'danilo.jelacic@email.com', '$2b$12$1Ct3drcNmYLhvb1XV.yAKeIaaTzX4I2J.7h/4xU691AwnE6i0fTaO', 'true', 'true');

--email = magdalena.bobic@email.com password = 3825
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Magdalena', 'Bobić', 'magdalena.bobic@email.com', '$2b$12$/k1Lycbd2hTjp4TjNI5rsOLV9bQfT75f/z5BkuZe8xzOzXqlt884K', 'true', 'true');

--email = steva.tunic@email.com password = 9613
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Steva', 'Tunić', 'steva.tunic@email.com', '$2b$12$EAEX3VpN2Fv/EHCajhClr.p2c0xgvvskE5DZPvepGmrCLv9V5vjpW', 'true', 'true');

--email = gavra.buzdokic@email.com password = 8779
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Gavra', 'Buzdokić', 'gavra.buzdokic@email.com', '$2b$12$NKWzlXGgVtGWaXFhsrQ2L.jyT7vwHVNScY7U7fcHiBtsTnZiRa90y', 'true', 'true');

--email = lepa.dovijanic@email.com password = 4388
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Lepa', 'Dovijanić', 'lepa.dovijanic@email.com', '$2b$12$lPEODtCHcjB8cHCWA.XtGOYc0YLcIzfnfu.QSOwYjUc6FpXyrrdUq', 'true', 'true');

--email = sotir.stelkic@email.com password = 1323
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Sotir', 'Stelkić', 'sotir.stelkic@email.com', '$2b$12$us0j9dcQjiZH7Lmo54kXseQf2j57dLw1W4XgvHratfBYEdrB87a2C', 'true', 'true');

--email = vitomir.radosavljevic@email.com password = 1638
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Vitomir', 'Radosavljević', 'vitomir.radosavljevic@email.com', '$2b$12$H8efQkgmU3MQsvUxVu2/oey1AveIn.AYzBkIbJufIf5qx1ctSfyuO', 'true', 'true');

--email = dmitar.vladnic@email.com password = 8487
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Dmitar', 'Vladnić', 'dmitar.vladnic@email.com', '$2b$12$rLgLkcIAnU/eUXAUnD3AOed0gE0etWaBdSqZHN85c/B6iruEcYZsS', 'true', 'true');

--email = njegosav.ujic@email.com password = 3901
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Njegosav', 'Ujić', 'njegosav.ujic@email.com', '$2b$12$4ouHDziAvRMaqtLX0hl0TeoKWDtIO0u8bpx0.o2pv7MAzYdolVh5S', 'true', 'true');

--email = srbislav.makic@email.com password = 5466
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Srbislav', 'Makić', 'srbislav.makic@email.com', '$2b$12$bZ58GzbIN43zC8swO5fSCupnx0pMrl86zlJ/j9vOVa.B.0bXtgqKG', 'true', 'true');

--email = joksim.poljcic@email.com password = 2671
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Joksim', 'Poljčić', 'joksim.poljcic@email.com', '$2b$12$B3r7KZq36z7WmXDemDHjtuu9QSIbnsd1IJM.aWjmvQmS2CmPh3Wj6', 'true', 'true');

--email = miroslav.skipic@email.com password = 7769
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Miroslav', 'Škipić', 'miroslav.skipic@email.com', '$2b$12$tc3w.dKp5DJV/G3Es3yIdONnsgXR5t0/TbaADIpe0XPPSn.GrTBeu', 'true', 'true');

--email = ninoslava.bosancic@email.com password = 9414
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Ninoslava', 'Bosančić', 'ninoslava.bosancic@email.com', '$2b$12$WWDhfG59/ZvRHAgmzDFY6eIdoEkE3OiajILLjzmaNqFLvosd8dyS6', 'true', 'true');

--email = selena.milic@email.com password = 4219
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Selena', 'Milić', 'selena.milic@email.com', '$2b$12$3N4iAzMr1jAKI.QT2ybJBOG59b581YKggHo5h.C6Kez8E8YcBIGqW', 'true', 'true');

--email = zivodarka.seratlic@email.com password = 6586
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Živodarka', 'Seratlić', 'zivodarka.seratlic@email.com', '$2b$12$hlSfrYhzcgKpAPjE6sxJgelAnl2YCsjbODBNdn1FMU9MYGEKK4PCe', 'true', 'true');

--email = zivka.mudrenic@email.com password = 4379
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Živka', 'Mudrenić', 'zivka.mudrenic@email.com', '$2b$12$TdsRA8IgD0XYAZ7iv2If7OjM/rOm4TE03c9kOpQQinlLRah630T5y', 'true', 'true');

--email = blaginja.kosic@email.com password = 1497
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Blaginja', 'Kosić', 'blaginja.kosic@email.com', '$2b$12$pGvOncxv6ic6wdCh/ojP0ufd21bifBduUOvBsRESh1BTv7EuSh6aW', 'true', 'true');

--email = caka.pelkic@email.com password = 3203
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Caka', 'Pelkić', 'caka.pelkic@email.com', '$2b$12$lMTw9wmhWwEinRNjuQpAAO/ukvt.1TNb6BAOSFhjjWVRA2XjqnT9C', 'true', 'true');

--email = drasko.beksedic@email.com password = 6933
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Draško', 'Beksedić', 'drasko.beksedic@email.com', '$2b$12$Wx9tu2R5SlZdt0JgPva1Wexwg7ucEzu258H0NmCbHxJvZLokmD88G', 'true', 'true');

--email = caslav.nincic@email.com password = 1669
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Časlav', 'Ninčić', 'caslav.nincic@email.com', '$2b$12$WUS/usgSvP1ntVg4h8nhdePH7YhvBjMmnlf2pjNVmbOR6JtA/nUPK', 'true', 'true');

--email = vladanka.belodedic@email.com password = 1949
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Vladanka', 'Belodedić', 'vladanka.belodedic@email.com', '$2b$12$U5UPdVhAIn4.1qVGJX9UveqKvPlvpH0PnhNXgX.zd.OJPbNXro1sK', 'true', 'true');

--email = ilija.bobusic@email.com password = 6918
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Ilija', 'Bobušić', 'ilija.bobusic@email.com', '$2b$12$8tM.QJ9FaxMIJfMehmRcsOrSDGdqFksfUzQDR2xQpTNHV7YsBRHCy', 'true', 'true');

--email = novko.senicic@email.com password = 4219
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Novko', 'Seničić', 'novko.senicic@email.com', '$2b$12$ZVDffW//3S.9H84/bhVIZeJOvCCgXlvzqawqgMVFz5E0/4AzVio6i', 'true', 'true');

--email = vukosav.odadzic@email.com password = 7979
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Vukosav', 'Odadžić', 'vukosav.odadzic@email.com', '$2b$12$waVXBczYu6Usz7XnIbnX5.Qj2JlzU0Bm6XapgQSS4TEQfeqNMEN0m', 'true', 'true');

--email = prvoslava.botoric@email.com password = 2003
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Prvoslava', 'Botorić', 'prvoslava.botoric@email.com', '$2b$12$5xHpLgwthXg035z2cYA8juQ5JN0J1txsJhrApwbayeiNaxSvUO1p.', 'true', 'true');

--email = ratomir.tekic@email.com password = 3679
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Ratomir', 'Tekić', 'ratomir.tekic@email.com', '$2b$12$rhGtKLbp4Wz/q6kSC1RJnOheB/uHU2oiOb/bCo6dcp5YSzGNIOzkW', 'true', 'true');

--email = caka.bulbic@email.com password = 8205
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Caka', 'Bulbić', 'caka.bulbic@email.com', '$2b$12$leVnkrT809KqwKVNFsnFRekamLbRj0QkRiC10qIqMY5KvVK0itJ7C', 'true', 'true');

--email = milija.milunic@email.com password = 2048
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Milija', 'Milunić', 'milija.milunic@email.com', '$2b$12$RV9G.hpUWJqpn9zabMFE3OUwv10KazeA4/X0Gp.ymcgD4uOiyTtqq', 'true', 'true');

--email = marijan.kezic@email.com password = 6194
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Marijan', 'Kežić', 'marijan.kezic@email.com', '$2b$12$AFk75cJPtj1ksSkSOgN5v.wv0DY/i/G9PC9NCxnnfkNGRLJ/8qJka', 'true', 'true');

--email = dalibor.macic@email.com password = 2600
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Dalibor', 'Maćić', 'dalibor.macic@email.com', '$2b$12$JKfQRujww.Z4Sq.EeW1rBuCtf8KLxN15Dtwl3OaYob0bupADErpGW', 'true', 'true');

--email = roksanda.plemic@email.com password = 4261
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Roksanda', 'Plemić', 'roksanda.plemic@email.com', '$2b$12$AW1EyagvUQT8WMeaI0GpUeOJmLHynyKp/I24HSVcxwcWJEK9.uo76', 'true', 'true');

--email = andjelija.trisic@email.com password = 5331
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Anđelija', 'Trišić', 'andjelija.trisic@email.com', '$2b$12$11p1nGtm5Cc5O3wmZX/4AeGuUL4KA.35siuaFDMILQzwYRhKt3ZPu', 'true', 'true');

--email = bogdana.umeljic@email.com password = 5637
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Bogdana', 'Umeljić', 'bogdana.umeljic@email.com', '$2b$12$ruu0cW9qTlC/yUBqHzii6OKWr5mJLbko4P5L8sd4PPsvgdo4htBhm', 'true', 'true');

--email = spasenija.pauskic@email.com password = 6563
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Spasenija', 'Pauškić', 'spasenija.pauskic@email.com', '$2b$12$hdKQOP5nPLz7YhrOoNss2enwJwTFwmqtRRcSlRNUZV6egpU9D8/Ea', 'true', 'true');

--email = olja.strajnic@email.com password = 3305
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Olja', 'Strajnić', 'olja.strajnic@email.com', '$2b$12$wCHp0iSVdV099ukZAy.4UO1U3MtmwF.pAQQm.K9oIve5lrKOf4b9a', 'true', 'true');

--email = kristina.prekic@email.com password = 6823
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Kristina', 'Prekić', 'kristina.prekic@email.com', '$2b$12$etLmwQXdgH/k0uvGRnuyB.aHDw6Hn3E1SfXAWPe.jfOUbcWDiD00G', 'true', 'true');

--email = ozrenka.sabic@email.com password = 1805
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Ozrenka', 'Šabić', 'ozrenka.sabic@email.com', '$2b$12$/o3mR7Jmm3ca9FcnfUM9euCsgIqupHRkZMrFZ.nfzM0mSfjnGwBsq', 'true', 'true');

--email = kristivoje.duletic@email.com password = 4787
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Kristivoje', 'Duletić', 'kristivoje.duletic@email.com', '$2b$12$PXu3E7t0KZKhiMgRX4yraOLKJq5HAdaZpVoQcK720r.kuOK9Wl3Hq', 'true', 'true');

--email = mitar.savelic@email.com password = 3582
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Mitar', 'Savelić', 'mitar.savelic@email.com', '$2b$12$6uin98qZbMAqRVPRi65eZeoePo1vsbdC72dddDK573TG3ZU09H8dK', 'true', 'true');

--email = branko.cankic@email.com password = 3159
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Branko', 'Cankić', 'branko.cankic@email.com', '$2b$12$R02cONQlwuwZCLYK7HkPDuyCLVHNiWE5wU43N01ndtGtevC7EpLvm', 'true', 'true');

--email = radan.mazibradic@email.com password = 4550
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Radan', 'Mažibradić', 'radan.mazibradic@email.com', '$2b$12$FnvuFYiq4CIzHby5ua9yieYrNvceA.LzDXBFP8p9sDGQtbO4Q2.yG', 'true', 'true');

--email = rafailo.gacic@email.com password = 2250
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Rafailo', 'Gačić', 'rafailo.gacic@email.com', '$2b$12$BAI76UgsJ6reCSz2KZphSuiWfRTnOcpnAhSlmjUuwUopl6LUP1lfq', 'true', 'true');

--email = prodan.potparic@email.com password = 9292
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Prodan', 'Potparić', 'prodan.potparic@email.com', '$2b$12$qN.ReHBdXxxRl3rtQ1AKkOy68tysR.QOlr/6Hh4G2IUn3fCCQvZNi', 'true', 'true');

--email = ruzmirka.kukulicic@email.com password = 6195
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Ruzmirka', 'Kukuličić', 'ruzmirka.kukulicic@email.com', '$2b$12$7uraA3o6k8DP/5Tat5Qo8evW9I7xzObnGM584L5O3zAgAvF7uSJyq', 'true', 'true');

--email = ljubo.zaric@email.com password = 9103
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Ljubo', 'Zarić', 'ljubo.zaric@email.com', '$2b$12$SEPBQr7fAyJPv.ILT7ivDO83CPdEJlVugQZVupRoU2Jaso4H5dYse', 'true', 'true');

--email = milutin.dzelebdzic@email.com password = 6231
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Milutin', 'Dželebdžić', 'milutin.dzelebdzic@email.com', '$2b$12$6LwM9M9S4LsfUZMaP4e9Ee17uh4XahK1NfsBCkOn4oxtzH0vDJA3i', 'true', 'true');

--email = viseslav.teslic@email.com password = 9756
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Višeslav', 'Teslić', 'viseslav.teslic@email.com', '$2b$12$zsuHRdux4WQk6OY36Edchu/HblIr/PBwjC2uopPH1Q.BagPZ3Oiyu', 'true', 'true');

--email = stanislava.karetic@email.com password = 1484
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Stanislava', 'Karetić', 'stanislava.karetic@email.com', '$2b$12$vJFeJqgx6rgXjkPWltwuBOLPs/pkkVEIDc2XwJNf5j2MIacyna.rm', 'true', 'true');

--email = tesman.kandic@email.com password = 7465
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Tešman', 'Kandić', 'tesman.kandic@email.com', '$2b$12$ErouEweGHyYYQpMWJQVLg.0DJ6tpeW.zTKlnH0NRNWkwwNW.ajOgy', 'true', 'true');

--email = tijana.rundic@email.com password = 6647
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Tijana', 'Rundić', 'tijana.rundic@email.com', '$2b$12$3feejOGw1oxWiIwwAIzJlu8Z61l0Rwd/DmDWDMkJJxfLyRly2nTRi', 'true', 'true');

--email = tadija.vuic@email.com password = 8246
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Tadija', 'Vuić', 'tadija.vuic@email.com', '$2b$12$KfDvwIUTVF.V0JkAX7mfcOKJvEAWLRgXSuAsAp03nrovku0kKMgNi', 'true', 'true');

--email = nemanja.novic@email.com password = 3153
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Nemanja', 'Nović', 'nemanja.novic@email.com', '$2b$12$foTeW1Ar/EGhQ26nYc.1K.i0adVrUCfdxmA4QyAmnSbT5c5oRRSUq', 'true', 'true');

--email = veliborka.stingic@email.com password = 9174
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Veliborka', 'Stingić', 'veliborka.stingic@email.com', '$2b$12$VUgwNSHtNvHcC1Q0JtX7zuYCD1C.GVgXdnq/4OzCYI6o7TZVe8goe', 'true', 'true');

--email = trifun.masonicic@email.com password = 4763
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Trifun', 'Masoničić', 'trifun.masonicic@email.com', '$2b$12$VqzzMoXP/jZCS3h.4TUBW.UZTyP5APFk2Y7eK09hDr6N82ncFVVnS', 'true', 'true');

--email = radoljub.nastic@email.com password = 2796
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Radoljub', 'Nastić', 'radoljub.nastic@email.com', '$2b$12$YOOH3Ifr0lLaPO8l.x18ruej9cOQ52V2n3M0mpls4bx/UWuHc.XC6', 'true', 'true');

--email = stojadin.malisic@email.com password = 2575
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Stojadin', 'Mališić', 'stojadin.malisic@email.com', '$2b$12$GpoBjgpi8Hgtz9AkplEU5.aHVUjv43jvSRKAt4UBl2xUOf10bISSy', 'true', 'true');

--email = relja.rasetic@email.com password = 4365
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Relja', 'Rašetić', 'relja.rasetic@email.com', '$2b$12$cafZ5FJ5dC/0NEvHvtfq8OtoS/ytYy2YrXOA3gSr7bGDvLSqn.2lm', 'true', 'true');

--email = emilija.porcic@email.com password = 1243
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Emilija', 'Porčić', 'emilija.porcic@email.com', '$2b$12$v2JB6.xuYBfE3veC5gOmLusY3M6dXfcTBJpI.28235g78S/bqpDYO', 'true', 'true');

--email = grujica.sindic@email.com password = 6075
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Grujica', 'Šindić', 'grujica.sindic@email.com', '$2b$12$mfBrnRBgL5JkeL53CSVTb.04YfLUghN6rTLI8BGYLo/bILGr83HAG', 'true', 'true');

--email = fanija.rakulic@email.com password = 4329
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Fanija', 'Rakulić', 'fanija.rakulic@email.com', '$2b$12$UwN6GvOYoY9Ize59o9eEguhBuhGkX6ACTa1TUWciYdnivKzMSuRjy', 'true', 'true');

--email = zoran.borongic@email.com password = 9076
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Zoran', 'Borongić', 'zoran.borongic@email.com', '$2b$12$gtNKnVYhfs8KNYEci3.MeOTLh10D7hsIEtCGG6ku6FrGuEBL/.eOC', 'true', 'true');

--email = ivka.diskic@email.com password = 2250
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Ivka', 'Diskić', 'ivka.diskic@email.com', '$2b$12$7HNctXtqxcvHkoPmxST.6umlOv288MGFOWouFgZKkyxi5Om/JNG.G', 'true', 'true');

--email = roksanda.ciplic@email.com password = 8682
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Roksanda', 'Čiplić', 'roksanda.ciplic@email.com', '$2b$12$lBdB2bM2Vg/HIMohyssY6.JOfVaHdtFc25CaBkyCs3TPkhnPAex1y', 'true', 'true');

--email = radojla.pendic@email.com password = 5215
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Radojla', 'Pendić', 'radojla.pendic@email.com', '$2b$12$L2QHxDayxRURSulRqHW52ut9917ZxMmyiny0suOnE.jwGY7r0.lI.', 'true', 'true');

--email = bratislava.djakusic@email.com password = 9051
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Bratislava', 'Đakušić', 'bratislava.djakusic@email.com', '$2b$12$0iPRhJvG9JcxLG.6YMDkbOSb3yzXm6tFPUGvcy/YYB4TeLL6tMeXe', 'true', 'true');

--email = stracimir.bibercic@email.com password = 6773
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Stracimir', 'Biberčić', 'stracimir.bibercic@email.com', '$2b$12$FcjFrO5vl0YGkgfKMI71Y.M/kdU9Rw16ftev08aTGizFByzSPBDUK', 'true', 'true');

--email = vlastimir.senicic@email.com password = 7496
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Vlastimir', 'Seničić', 'vlastimir.senicic@email.com', '$2b$12$6leKpHt8v0JvWkKYAYkJx.h0Ax0i4RR8Ho9j.IskSTOWDC8g2GA/y', 'true', 'true');

--email = dobrinka.mikonjic@email.com password = 2943
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Dobrinka', 'Mikonjić', 'dobrinka.mikonjic@email.com', '$2b$12$LBvalVghZDJT1cOj/IWT8evqo8rgMppfRikCpDdDewqq1A8T4lqQS', 'true', 'true');

--email = radojka.apelic@email.com password = 1981
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Radojka', 'Apelić', 'radojka.apelic@email.com', '$2b$12$0nYJzapwoJwPQCOeZ5k9Vu5XKZSH1aDH2NLIeyWCxnPtv4zO39SG2', 'true', 'true');

--email = lenka.jekic@email.com password = 5647
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Lenka', 'Jekić', 'lenka.jekic@email.com', '$2b$12$cXzOoiKPMTtDLBiVssgYs.kE1v0bQ65gZNalQ6ZPrQYbqKV9EuDyq', 'true', 'true');

--email = emil.zapukic@email.com password = 9754
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Emil', 'Zapukić', 'emil.zapukic@email.com', '$2b$12$hUK7TZjGjUvNZuz9duQOm.9uaAnFwNLkLmOnXcWtroycSNfj7op/2', 'true', 'true');

--email = milun.kajganic@email.com password = 7709
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Milun', 'Kajganić', 'milun.kajganic@email.com', '$2b$12$NnZEFtg1cnJZblO4/tX2We41s.9s/7UYhQB1cFIh1MhyGFaPrtdVW', 'true', 'true');

--email = cvetko.badrkic@email.com password = 5315
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Cvetko', 'Badrkić', 'cvetko.badrkic@email.com', '$2b$12$BTcaR/ZzhAanxYzYICs6j.bgLfDmnFZ90asxip7ZThBJVa2WSbYQy', 'true', 'true');

--email = milesa.gavrisic@email.com password = 3666
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Milesa', 'Gavrišić', 'milesa.gavrisic@email.com', '$2b$12$npm1RdPVVrXFzh2HBvI3ieLdHVDaB9shTvDAab/WgvrdEj1wkHklG', 'true', 'true');

--email = relja.stanicic@email.com password = 7809
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Relja', 'Staničić', 'relja.stanicic@email.com', '$2b$12$duMLQDeJ3nJGq5Fah70tzu1vDu/sq2STFnQsHb2xwFxLFvhTSw1cK', 'true', 'true');

--email = poljka.lestaric@email.com password = 7222
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Poljka', 'Leštarić', 'poljka.lestaric@email.com', '$2b$12$Mc3SbGrCGkuEPUypqJEPH.nsM78Bk7Uj4ndgTEdoDoi8AYoz7VFOq', 'true', 'true');

--email = dobrila.zeravcic@email.com password = 6140
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Dobrila', 'Žeravčić', 'dobrila.zeravcic@email.com', '$2b$12$Gf4GsBppKYRjL0ibH95.tegFKGjbQdVuFP6Oawnn0uPQcqjGHITxm', 'true', 'true');

--email = simeon.stanojcic@email.com password = 5617
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Simeon', 'Stanojčić', 'simeon.stanojcic@email.com', '$2b$12$FGDBdcK4SwzS5eEuTGf1IeUKn6SLHQCS2g8Rtgnl7EgP7WaehvD96', 'true', 'true');

--email = zelimirka.cirjanic@email.com password = 3166
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Želimirka', 'Ćirjanić', 'zelimirka.cirjanic@email.com', '$2b$12$KdrullMR0O6pCQMIGSLWne/3qnEJpuQTExLOljdXKr5BznEqXpfpe', 'true', 'true');

--email = ivka.coguric@email.com password = 2954
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Ivka', 'Čogurić', 'ivka.coguric@email.com', '$2b$12$.oobJYmJAX0bEeZcgksokuIw4sP42HbplCTnK1tn7.mlM8ysi9UBa', 'true', 'true');

--email = jevta.gavaric@email.com password = 7986
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Jevta', 'Gavarić', 'jevta.gavaric@email.com', '$2b$12$g05h1PErpatEXkZeQhcmLO9elfnTG2SYcbkmWnQaz4dAyQj7iBj2K', 'true', 'true');

--email = danojlo.vefic@email.com password = 2720
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Danojlo', 'Vefić', 'danojlo.vefic@email.com', '$2b$12$OoZ09sllinRonb5OK796K.71zM0HnmX/iiw9gKxQhv4ojpquRshaW', 'true', 'true');

--email = zivan.kmezic@email.com password = 7642
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Živan', 'Kmezić', 'zivan.kmezic@email.com', '$2b$12$Zvi6HuVZgh7n8OTF8T.JIerj.ztJ7SQ3dZVnxW5epSlD.iK1d50yu', 'true', 'true');

--email = veselinka.kimcetic@email.com password = 5836
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Veselinka', 'Kimčetić', 'veselinka.kimcetic@email.com', '$2b$12$tn3xEtNBfZjRBp19T2r03.wEVBJ5QCW91OGEHnd8/wTOWPWt0.SBe', 'true', 'true');

--email = doroteja.stokanic@email.com password = 2503
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Doroteja', 'Stokanić', 'doroteja.stokanic@email.com', '$2b$12$B6S375ukFSHTZ2r.p12jx.NzzUkbWD9mVlx0nfXM0K6/gFHeE.7qy', 'true', 'true');

--email = milka.calisic@email.com password = 5460
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Milka', 'Čališić', 'milka.calisic@email.com', '$2b$12$IXODYKbxziRUcIUiPxK7C.HM7JBW1JNy5BztrDU1y31Y3EfGr.Uw6', 'true', 'true');

--email = bogosav.zivanic@email.com password = 5020
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Bogosav', 'Živanić', 'bogosav.zivanic@email.com', '$2b$12$XiNBeXhxx.iMq/fcNnbVYOZH1TyoWrKDd725qs9VzglvYjY687bVC', 'true', 'true');

--email = cveta.bajicic@email.com password = 4464
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Cveta', 'Bajičić', 'cveta.bajicic@email.com', '$2b$12$rso7xjzOe8rIXKCMZWJV3.0S27I.0IiU2j0Ug0MAidYD471GnNpKm', 'true', 'true');

--email = zorka.mihaldzic@email.com password = 1652
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Zorka', 'Mihaldžić', 'zorka.mihaldzic@email.com', '$2b$12$X.wlhsURQ8LnLDgevCT99.rpsCM4nomqV0uSXbgJyQP0L5l7XY37q', 'true', 'true');

--email = dobrivoj.zizic@email.com password = 3307
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Dobrivoj', 'Žižić', 'dobrivoj.zizic@email.com', '$2b$12$GWEJkEV/yRTP5hxxx9VI5.0h/9hZB.hsSnted5sFqkBPEl3mkF/qe', 'true', 'true');

--email = ozren.bajagic@email.com password = 6963
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Ozren', 'Bajagić', 'ozren.bajagic@email.com', '$2b$12$v2qLYMCjGQ3nUBii2FxpE.EdSXOvfqxFv78JJm2T/GYSSjUmLOlre', 'true', 'true');

--email = ubavka.garabandic@email.com password = 4319
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Ubavka', 'Garabandić', 'ubavka.garabandic@email.com', '$2b$12$CZ.701PEUwrg02RrDTPdfe51P4a/wVh8mEhcEkBMo./Rw2sF7Xna6', 'true', 'true');

--email = dobroslavka.strojic@email.com password = 3727
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Dobroslavka', 'Strojić', 'dobroslavka.strojic@email.com', '$2b$12$8BUljLWlm2Z4TdydJyCrqufJxHmwZYs/29kCPTSsZyYU5oyVvmwdi', 'true', 'true');

--email = nemanja.bostrunic@email.com password = 7973
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Nemanja', 'Boštrunić', 'nemanja.bostrunic@email.com', '$2b$12$sOLpFRnAHaMyOcSbLD3H1.wrcgL2hOCrKHQhPAApB6anwBeoYEUGq', 'true', 'true');

--email = stojadin.dotlic@email.com password = 2924
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Stojadin', 'Dotlić', 'stojadin.dotlic@email.com', '$2b$12$tFxhIO/nt8neKJSZ9urIpua/DY6qCZNCgupB9rSFioQz.Dbvpxosm', 'true', 'true');

--email = avram.mitucic@email.com password = 1260
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Avram', 'Mitucić', 'avram.mitucic@email.com', '$2b$12$WuhsxqEeJmO5UjKtkZAjZeaf7Kc4uGJQzl.X.sApFpCLcK5LYuOFa', 'true', 'true');

--email = leonora.batinic@email.com password = 6250
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Leonora', 'Batinić', 'leonora.batinic@email.com', '$2b$12$qCigZ0VorkJg7P2QVV9p/.0UrVy5tHH4lW8aKqnBEaP6fYEowopS2', 'true', 'true');

--email = ristivoj.stepanic@email.com password = 8151
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Ristivoj', 'Stepanić', 'ristivoj.stepanic@email.com', '$2b$12$hKf/kQHhV7oGsDv/GgPduuvOCOqlm4ehetyR4Mfrl.B8qcYFpzRPa', 'true', 'true');

--email = zivomir.tomecic@email.com password = 6938
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Živomir', 'Tomecić', 'zivomir.tomecic@email.com', '$2b$12$Tx2trxyj4nY5wMdjXIh.9ejUUqA0ptHAgTvBFtvdz1a7MfnbNwoAS', 'true', 'true');

--email = vera.bastic@email.com password = 2531
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Vera', 'Baštić', 'vera.bastic@email.com', '$2b$12$pgJ.KJot9BlMyLNgvjAJMeeophN71ofTCiewY9m6qqpYsmpL/lThm', 'true', 'true');

--email = jevta.butric@email.com password = 1606
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Jevta', 'Butrić', 'jevta.butric@email.com', '$2b$12$068KUHXBD1e3IY5OzWEKGOx6YwgoW9g2vzLmIRLuJEd7/SOS0Q7l.', 'true', 'true');

--email = uros.cocuric@email.com password = 9617
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Uroš', 'Čočurić', 'uros.cocuric@email.com', '$2b$12$En/N7q1U3cw8.ejVrdhMQezr/L8AsAaR14iLNUeWmAcSTI27RwWFy', 'true', 'true');

--email = melentije.vasiljkic@email.com password = 7270
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Melentije', 'Vasiljkić', 'melentije.vasiljkic@email.com', '$2b$12$3QTx.i.voe6R8MTwkCBlz.Iz9g7ssv/1nBBdWgF4kqpHwskCpzoqy', 'true', 'true');

--email = momir.vranic@email.com password = 8818
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Momir', 'Vranić', 'momir.vranic@email.com', '$2b$12$49o7kYS.ywwvLHfUtknoJuMalI8p.h0exnszsT2neMa79r06GmpIu', 'true', 'true');

--email = helena.biljic@email.com password = 8725
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Helena', 'Biljić', 'helena.biljic@email.com', '$2b$12$ByF0FlywJxSHpFGfDEO9heoMxLMw9Vi6wuSngR.Un5sWBmjh.nRS2', 'true', 'true');

--email = zivka.veljic@email.com password = 1484
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Živka', 'Veljić', 'zivka.veljic@email.com', '$2b$12$jgzPsIh4b6Zf3DgTuumbruxlRqG39pbfEpRyu3KPKns4VxXx.F1BC', 'true', 'true');

--email = kuzman.jajic@email.com password = 4602
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Kuzman', 'Jajić', 'kuzman.jajic@email.com', '$2b$12$f4f3MnSNnF12wLNGr/LeZO3oBkg1ZBzbr/FV8bUKuHKxFeHBMabUe', 'true', 'true');

--email = tomislav.sovric@email.com password = 2768
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Tomislav', 'Sovrić', 'tomislav.sovric@email.com', '$2b$12$z8KC2qHrECAOUEdUcs/Zy.OKVFE8q48VIV8A/lCA2v9qmqvAAyXcC', 'true', 'true');

--email = ivan.boricic@email.com password = 7149
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Ivan', 'Boricić', 'ivan.boricic@email.com', '$2b$12$3ri.irxMjKSBP9LE5NsqG.4KLaNvlL7GC.yB7jMTjU1G4jtL5BkK.', 'true', 'true');

--email = savka.djacic@email.com password = 7397
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Savka', 'Đačić', 'savka.djacic@email.com', '$2b$12$phBZxZKqcXZx2aK7dxjJ9OqdtqgHTO/i5x2RxGHjlAR8qs7T9keky', 'true', 'true');

--email = nina.surdic@email.com password = 8605
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Nina', 'Šurdić', 'nina.surdic@email.com', '$2b$12$B9aiNRtdbbyj1oX88XNgq..UX6BkCCfEAk66OsiylVF4yjVArUCmW', 'true', 'true');

--email = mladen.tesic@email.com password = 4987
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Mladen', 'Tešić', 'mladen.tesic@email.com', '$2b$12$qlx09Mnj/8m25YPQWisnMukZAkS08WF3XgukaMTmoyoH9QN0k8ZKe', 'true', 'true');

--email = petrija.svojic@email.com password = 4020
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Petrija', 'Svojić', 'petrija.svojic@email.com', '$2b$12$nb534ok/MbKynsoeyzHDOexPcOiSeDk1mtvPCwbhxnFqXRTzs5C9i', 'true', 'true');

--email = jasminka.vagic@email.com password = 3723
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Jasminka', 'Vagić', 'jasminka.vagic@email.com', '$2b$12$pn/YtoMzNhY2QBZ9NEx3Q.HrmvqR0n0.fsDINa6Ij4Oz1W/MmlOSq', 'true', 'true');

--email = lale.ivezic@email.com password = 3310
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Lale', 'Ivezić', 'lale.ivezic@email.com', '$2b$12$GoyrLHnUwH4BqOcPEEuD9uJrweK9hTsUltYUYNJXnu2ovmlumIhPi', 'true', 'true');

--email = zeljko.karetic@email.com password = 3831
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Željko', 'Karetić', 'zeljko.karetic@email.com', '$2b$12$qYNbgKYytXgUVJSFgJAc8uRm0NfivioKN2SNtd44Zr/1ywnN7Bpn.', 'true', 'true');

--email = grigorije.josic@email.com password = 1324
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Grigorije', 'Josić', 'grigorije.josic@email.com', '$2b$12$pVbtof.DbUR6dcH984tZ5egaFArzA3w6gwqW94mxb2s0C4SryKZAu', 'true', 'true');

--email = stevanija.pestoric@email.com password = 5498
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Stevanija', 'Pestorić', 'stevanija.pestoric@email.com', '$2b$12$nqptcErsWSJWZbwG2halg.aVhTjdtUW3mWGn8/OAJ7sVdlX6f0vqe', 'true', 'true');

--email = goran.belodedic@email.com password = 6579
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Goran', 'Belodedić', 'goran.belodedic@email.com', '$2b$12$jxfBcef8nZNndKkXHBBWuOS5yc.d0kqUCF7oORGkW5Ng4e/HHW8pO', 'true', 'true');

--email = milutin.kolundzic@email.com password = 7295
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Milutin', 'Kolundžić', 'milutin.kolundzic@email.com', '$2b$12$4nC3tQeiuk80mEm4l6WPMuGwlDef6qo/taA1wTy/Tx1OXS0TLQjym', 'true', 'true');

--email = milka.dragusic@email.com password = 4173
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Milka', 'Dragušić', 'milka.dragusic@email.com', '$2b$12$NKZgjdMmngRih2momqg0NucARbmNx6Ym7c4BosX0N9OtP/muOgcsa', 'true', 'true');

--email = tihomir.punisic@email.com password = 6188
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Tihomir', 'Punišić', 'tihomir.punisic@email.com', '$2b$12$QuOBD2.fHGwvmwSjFzvJOeXw1wcn7tMeEUnGmyxlfTVFmbQ8XBtOu', 'true', 'true');

--email = julija.kacaniklic@email.com password = 3152
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Julija', 'Kačaniklić', 'julija.kacaniklic@email.com', '$2b$12$iQGT696kSrv.fnuO5ghlgudFCP8AugCKRozoNp.i/4gJMvuIbZXVW', 'true', 'true');

--email = cvetomir.caloveic@email.com password = 5594
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Cvetomir', 'Čaloveić', 'cvetomir.caloveic@email.com', '$2b$12$dmZqUuDDib2Os6cn61w4num9oVGbhNSNp4lykj6YSJxiR3H7RPT2q', 'true', 'true');

--email = spasenija.mavric@email.com password = 3411
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Spasenija', 'Mavrić', 'spasenija.mavric@email.com', '$2b$12$6xQ05WykhdFeONChnZe7juQlKHKdAJrmgmdfRusVqXdaRz6sxy/Ou', 'true', 'true');

--email = bosiljka.lopandic@email.com password = 1643
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Bosiljka', 'Lopandić', 'bosiljka.lopandic@email.com', '$2b$12$jwK4JTZWgSMxe103nMw4/eONVOB3VpPsr3vxkap.2tNJ2vjOS4M56', 'true', 'true');

--email = bogdan.mandic@email.com password = 2389
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Bogdan', 'Mandić', 'bogdan.mandic@email.com', '$2b$12$GVP5hxVyzEE/jDxKNTxxmexSIr0ZB0WNc5pMQnfdRRerGi.m6/E.K', 'true', 'true');

--email = tomka.sarkic@email.com password = 1489
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Tomka', 'Šarkić', 'tomka.sarkic@email.com', '$2b$12$jwWQru1IT06Y4VQ8ZYsfkO4oYMRE.4B6rQpZ31/La9Kgc5fbW4no.', 'true', 'true');

--email = tanasije.dregic@email.com password = 2589
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Tanasije', 'Dregić', 'tanasije.dregic@email.com', '$2b$12$SXat0oPJU9n2xiOEfkE7teuqi8r2spmxD1levVs4JeYlBeo3J5BvS', 'true', 'true');

--email = joksim.mikulic@email.com password = 9025
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Joksim', 'Mikulić', 'joksim.mikulic@email.com', '$2b$12$eVVTlPwQ54VkWBRjiC7SXO2krVxLWRmkJ4fi1mRQUxt6J87E3gsnG', 'true', 'true');

--email = krstan.despinic@email.com password = 5436
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Krstan', 'Despinić', 'krstan.despinic@email.com', '$2b$12$cx2v.g46rZSILEdLhU4TkutuQJCW9v365/jPkqpRs1spGhNpqYYl6', 'true', 'true');

--email = rajko.blazic@email.com password = 4736
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Rajko', 'Blažić', 'rajko.blazic@email.com', '$2b$12$x3Qv2LrXTOEh6ZGnUd5G3uqEsywdyR1z66/pA6c9tib6ND4d0XQ/S', 'true', 'true');

--email = dobrica.kovjenic@email.com password = 5441
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Dobrica', 'Kovjenić', 'dobrica.kovjenic@email.com', '$2b$12$MqU8BROFtv9pLRntunGwvecxcz.WskpnadelhEZM..NWx4uXk/qcW', 'true', 'true');

--email = sonja.dimcic@email.com password = 7402
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Sonja', 'Dimčić', 'sonja.dimcic@email.com', '$2b$12$2KmwJkwnxDlMB7C5R1uHZuHcAwKldJLaJBFlLtKtieulVlsasozjG', 'true', 'true');

--email = cvetko.kendrisic@email.com password = 7770
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Cvetko', 'Kendrišić', 'cvetko.kendrisic@email.com', '$2b$12$vhYN/T2gv/wjE2pwfPrSFuT5SCoPQRVM0wNEDYE1V.ywfhbb62Ocm', 'true', 'true');

--email = stevanija.bilic@email.com password = 1083
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Stevanija', 'Bilić', 'stevanija.bilic@email.com', '$2b$12$bfSIoqGfO2pbqCChC6Z6duYvRWdvDaN41jTlKmBJVl59RJF.rv3Gy', 'true', 'true');

--email = gruja.camagic@email.com password = 8555
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Gruja', 'Čamagić', 'gruja.camagic@email.com', '$2b$12$bgHV7nnQQBAdjmEVcn/MhOvxfhomWx14AJvkybHmcbg6sMpt.fYMC', 'true', 'true');

--email = angelina.trivalic@email.com password = 8656
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Angelina', 'Trivalić', 'angelina.trivalic@email.com', '$2b$12$wKiQPu43j5.ojb4CPQziIuYDAmaLMam4OLCqYMaiMEczOYdcFbc7u', 'true', 'true');

--email = kristina.florikic@email.com password = 5052
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Kristina', 'Florikić', 'kristina.florikic@email.com', '$2b$12$twx5nlWmckSmP6wb.eXXhuG/ZBST744UmGGYZCuHI/Pod5KgJfpKa', 'true', 'true');

--email = jelisije.gospavic@email.com password = 3060
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Jelisije', 'Gospavić', 'jelisije.gospavic@email.com', '$2b$12$KyPWFiHbYw2LOYc2fyQofuApcYLOQMtJsKkNEZzO1jxxXp5v/WUvS', 'true', 'true');

--email = danojlo.krsmancic@email.com password = 9159
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Danojlo', 'Krsmančić', 'danojlo.krsmancic@email.com', '$2b$12$GTIz7vOSQKngDFARBtR2Zuc4Szwol4C2P2YQ.x41CO0lfmZJlb8/6', 'true', 'true');

--email = ranka.conic@email.com password = 3821
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Ranka', 'Conić', 'ranka.conic@email.com', '$2b$12$4PnzQyG9wLXmNKyKDsWjfuofO/24h5Z12fFH01KDxGAlhlbw1.3Im', 'true', 'true');

--email = stokan.tutic@email.com password = 2944
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Stokan', 'Tutić', 'stokan.tutic@email.com', '$2b$12$g0uGEMvrfkblCq1FDlJs7uroQtG5ZZ9J/zUDvBecUS1VshNbXWHKO', 'true', 'true');

--email = stojka.varezic@email.com password = 7228
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Stojka', 'Varezić', 'stojka.varezic@email.com', '$2b$12$w5cAjQ2YCHp.Js5hOxpioe4I0hsETQIS/gCf14gL0LIOJMewUmFQ2', 'true', 'true');

--email = stojmen.vacic@email.com password = 1189
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Stojmen', 'Vacić', 'stojmen.vacic@email.com', '$2b$12$3c8nsgmSqVhJerIA/PBtRufN6BOmMK2wyPozqaCbx/DrSIxEcfZEy', 'true', 'true');

--email = sima.mazic@email.com password = 1976
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Sima', 'Mažić', 'sima.mazic@email.com', '$2b$12$hEj.MP2EoNAjPZFTZ56Nee6nYd8.xBx9VCwD9p7tGgsAXfg4hgN0S', 'true', 'true');

--email = antonina.pipercic@email.com password = 1580
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Antonina', 'Piperčić', 'antonina.pipercic@email.com', '$2b$12$PGePIAv4oUMCGkva4N3z4uxCFH.44sD9kP2gINQ.GrW3T1bPAgRMu', 'true', 'true');

--email = rastko.kotlajic@email.com password = 5098
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Rastko', 'Kotlajić', 'rastko.kotlajic@email.com', '$2b$12$PpYr4jwseae.Zgswa19MduTdKhc/AZFS/Ww2gll2zlV0fp/Ab50Ey', 'true', 'true');

--email = savka.milojicic@email.com password = 4957
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Savka', 'Milojičić', 'savka.milojicic@email.com', '$2b$12$azR7k4pOlVYndjMZnA8MQOuE2Ea145wKn2GM22HDrgehnI.GnRgD2', 'true', 'true');

--email = canka.sibincic@email.com password = 5720
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Ćanka', 'Sibinčić', 'canka.sibincic@email.com', '$2b$12$KXbmJF2YjxbrUI7B8XXdhuUxxYjO4Jt.bIcu4bihNPagWNJnlyHlO', 'true', 'true');

--email = toplica.palcic@email.com password = 3026
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Toplica', 'Palčić', 'toplica.palcic@email.com', '$2b$12$YJntw9PQ9BYCOzxO5PbHR.MqfWBL.2urj0LYIBd5SKO2On2wb.Pp6', 'true', 'true');

--email = njegoje.dimcic@email.com password = 6726
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Njegoje', 'Dimčić', 'njegoje.dimcic@email.com', '$2b$12$/ZG3vgvY5bWpSzAKBgRvdu2edK2zIJhaJRCekelFX1XkbIBmEhOva', 'true', 'true');

--email = zivomir.jestrotic@email.com password = 3273
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Živomir', 'Jestrotić', 'zivomir.jestrotic@email.com', '$2b$12$8KLWcijz.qWF1sdElADM2O81gBDHXXQ6WHD31EZOWzkZ0RPSMPMeu', 'true', 'true');

--email = vojimir.bisercic@email.com password = 5997
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Vojimir', 'Biserčić', 'vojimir.bisercic@email.com', '$2b$12$nQx9p/fW66rjiYx4qWqzD.Hzkb4YfSS0U6YhDdwdtJGHuHxfDCD4O', 'true', 'true');

--email = ljuba.bukvic@email.com password = 5983
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Ljuba', 'Bukvić', 'ljuba.bukvic@email.com', '$2b$12$qD8AAnALu/ewzAQ9nj2Jgu5lgLFyWAtnr6J2i2Xm4VXFEp0/VwCfy', 'true', 'true');

--email = krsmanija.vujnic@email.com password = 9206
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Krsmanija', 'Vujnić', 'krsmanija.vujnic@email.com', '$2b$12$oT.edUs8eb.qhRtBywlPwetZEZQ3si9M7Opr9jEIpjOUhxlT7pODK', 'true', 'true');

--email = slavka.predic@email.com password = 1259
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Slavka', 'Predić', 'slavka.predic@email.com', '$2b$12$B/YNzE/PCW/vIK19E4jq6eGyW23nmpXjhIsS.WHvgMJ0MOcVmA38G', 'true', 'true');

--email = anka.veljic@email.com password = 9110
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Anka', 'Veljić', 'anka.veljic@email.com', '$2b$12$orap.bed8WkWJhthGQy3pOTw4ETO8e/4gAVZNqhHfU3giHuS2v0D.', 'true', 'true');

--email = djokica.djelkapic@email.com password = 5357
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Đokica', 'Đelkapić', 'djokica.djelkapic@email.com', '$2b$12$UDaWRKoDW0pP3RPvYf2WEOx3e2yxqjI.lftaSfI4QS2oqC74YbjRi', 'true', 'true');

--email = petronije.strinic@email.com password = 8919
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Petronije', 'Strinić', 'petronije.strinic@email.com', '$2b$12$OMj8rECYhH6DM2VkAdLRl.KdIZTVdbnnVFBk8ddOcaQeBz9y/fBHO', 'true', 'true');

--email = srbislav.nikolesic@email.com password = 8166
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Srbislav', 'Nikolešić', 'srbislav.nikolesic@email.com', '$2b$12$wnIbLZRQ/xoBuWSXeaHey.wwfSscKeHKEO8mqE6G8wphZucU522My', 'true', 'true');

--email = simka.jestrotic@email.com password = 8115
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Simka', 'Jestrotić', 'simka.jestrotic@email.com', '$2b$12$scynHgIYV07usC444kqux.9lKOoRvc6Q4q88frcnGQcmy4pCd5NMe', 'true', 'true');

--email = slavna.varajic@email.com password = 9232
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Slavna', 'Varajić', 'slavna.varajic@email.com', '$2b$12$t5uHSvnidxeFjAVyFgVDKuhzQ8HNvyoLBVExIiCS87tT.pWaVEIYy', 'true', 'true');

--email = roksanda.skrbic@email.com password = 2525
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Roksanda', 'Škrbić', 'roksanda.skrbic@email.com', '$2b$12$.C/cbztAI2ys8YJa3c7zh.w.KnCEOklvdC2/D2M5ilwPQdDB9nrRW', 'true', 'true');

--email = novak.sakic@email.com password = 5797
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Novak', 'Sakić', 'novak.sakic@email.com', '$2b$12$XLWq/DjjOWB3R7RNaPgyXenyKAcNSqT9Cs7wthiAeqn.TUw8wYc72', 'true', 'true');

--email = radivoj.grkinic@email.com password = 4058
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Radivoj', 'Grkinić', 'radivoj.grkinic@email.com', '$2b$12$5aDhTzpFULlc/GUvdgi2EOdMdRR9.msuOBFqxV00wbLroXOQDLDi6', 'true', 'true');

--email = biserka.perkic@email.com password = 6817
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Biserka', 'Perkić', 'biserka.perkic@email.com', '$2b$12$yg2GkTdPQ6/vx/AYYhjFLer7syRAIloBQWHUaljPgl5UEnUsoD.3W', 'true', 'true');

--email = zika.rajcic@email.com password = 5316
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Žika', 'Rajčić', 'zika.rajcic@email.com', '$2b$12$xVURNDdKo7L.2neBJUqTHegP4x3V4uiCdqTIiwOE2pd9E5Z9GzLiO', 'true', 'true');

--email = mijat.krstanic@email.com password = 1144
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Mijat', 'Krstanić', 'mijat.krstanic@email.com', '$2b$12$vT39Qk0Y.59LJR2x5th64eOQlYuBm.b/fvrPl9hEGYrtgbeUYIf3C', 'true', 'true');

--email = kosovka.stukeljic@email.com password = 8489
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Kosovka', 'Štukeljić', 'kosovka.stukeljic@email.com', '$2b$12$vBO3.l1975Wq4iDzQI.AYuvC2FNDsbB3Y2nCtZa7GTHMv12KqZI9O', 'true', 'true');

--email = viseslav.gulic@email.com password = 9041
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Višeslav', 'Gulić', 'viseslav.gulic@email.com', '$2b$12$J3tbi7nQnhuN1WCNfU8Zju.V..gG5zIE7lSySeHiYcs1mkwh1kXCG', 'true', 'true');

--email = draginja.kustudic@email.com password = 3533
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Draginja', 'Kustudić', 'draginja.kustudic@email.com', '$2b$12$URfJ4Tdu3L4QDkEgtsBRhuKotcvuOu85D83.q.JnTJ5bvdDxsgohO', 'true', 'true');

--email = ugljesa.kalajic@email.com password = 8820
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Uglješa', 'Kalajić', 'ugljesa.kalajic@email.com', '$2b$12$zllWFnE25Mqn0C06p6faX.2py.bWnVIBPjH4Wv5yE6U91wPGB0Xve', 'true', 'true');

--email = stanislava.ponjausic@email.com password = 1505
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Stanislava', 'Ponjaušić', 'stanislava.ponjausic@email.com', '$2b$12$TlOZ3S562lIcI.bfmZqQCedMOXsWxB2HlVjL7OWlOX3f0nN8NmSza', 'true', 'true');

--email = zivodarka.otic@email.com password = 9635
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Živodarka', 'Otić', 'zivodarka.otic@email.com', '$2b$12$GOuG4eUy4yNQ/iEi9jCQ3.CWN6Bl8SnWk8nWEr7JgWwG6JgCpqsQe', 'true', 'true');

--email = paun.trenkic@email.com password = 3041
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Paun', 'Trenkić', 'paun.trenkic@email.com', '$2b$12$vIwfHh7zmYdNOK5sZxLyQePpNaxjpCXPef2pwN7oXBUCjeEaBjgbe', 'true', 'true');

--email = andja.besarabic@email.com password = 1899
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Anđa', 'Besarabić', 'andja.besarabic@email.com', '$2b$12$Y6YJYh6dbucm9UPTb2hcZuXursJP3m0d9HmAQ7TJm5FDH4f2nVDeW', 'true', 'true');

--email = jasmina.zatezic@email.com password = 9097
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Jasmina', 'Zatežić', 'jasmina.zatezic@email.com', '$2b$12$71Z/fTSG.zjC3OV7I8JpUeFL0Zg6TgW1h28LxeSQNsxyaoGmSdX0y', 'true', 'true');

--email = branka.jeremic@email.com password = 3278
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Branka', 'Jeremić', 'branka.jeremic@email.com', '$2b$12$dlHv0ByNZU803K47qZU0nOoge7Zv8Fl/VTy8qr6olPBJmeHE0/.BK', 'true', 'true');

--email = persa.pacaric@email.com password = 1478
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Persa', 'Pačarić', 'persa.pacaric@email.com', '$2b$12$b8zNVWHZEJOxmmjdJmLtE.9MPr.RTQLRZxzrUzsaNlGQXwc6Pv0cG', 'true', 'true');

--email = ratko.visic@email.com password = 7336
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Ratko', 'Višić', 'ratko.visic@email.com', '$2b$12$H4aGkLhEuMj2jL1WstUZAOWeVg9cYBFGFF0iN.m01ly6fufFVVRIK', 'true', 'true');

--email = una.masalusic@email.com password = 9845
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Una', 'Masalušić', 'una.masalusic@email.com', '$2b$12$BzdSt0V9XPiYv81YcfqULeWIDV8Svq4Bf4QwCl9/7LRq76onAADhW', 'true', 'true');

--email = rodoljub.buljubasic@email.com password = 1780
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Rodoljub', 'Buljubašić', 'rodoljub.buljubasic@email.com', '$2b$12$QVauh8FBFwRWgCY1MMPBJux15utDSwTWQKgAiUU..N/fKU3gVvRpC', 'true', 'true');

--email = ljubinka.skulic@email.com password = 5498
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Ljubinka', 'Škulić', 'ljubinka.skulic@email.com', '$2b$12$69cCkDSZCUjXJSpMKAbC7eOinaLZUQTxR75wQRxA5XFto3.zQm6ea', 'true', 'true');

--email = stojka.bojcetic@email.com password = 6492
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Stojka', 'Bojčetić', 'stojka.bojcetic@email.com', '$2b$12$9QBGJFM54YMLyHB8/FQ8..KD7w3i19KSgTFqMszEQYkZoqkNU2am.', 'true', 'true');

--email = veselinka.janicic@email.com password = 9616
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Veselinka', 'Janičić', 'veselinka.janicic@email.com', '$2b$12$RjeivwKwYDy7u5RrnW7duOTpyjnUFOVzP6DIlBWu.E64MQjW0NI1y', 'true', 'true');

--email = branka.djikic@email.com password = 3637
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Branka', 'Đikić', 'branka.djikic@email.com', '$2b$12$AvmIErKupIC4JfD0WYx2VuHthownA1RD0Ki/6t6B4r6I/K8FhqH/2', 'true', 'true');

--email = stamenija.busic@email.com password = 1002
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Stamenija', 'Bušić', 'stamenija.busic@email.com', '$2b$12$cZZMHvLwyhON0oPSPGFiWecxB1N4KiyCpBzW5nIfJpFPvzhjjDm.O', 'true', 'true');

--email = kosta.stanojcic@email.com password = 6726
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Kosta', 'Stanojčić', 'kosta.stanojcic@email.com', '$2b$12$/dwjIrIUuTd9Hbppe/0sMOpjwIY65xLBe4gGmTRVzbl8Dn23UVNgm', 'true', 'true');

--email = cvetana.baralic@email.com password = 9334
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Cvetana', 'Baralić', 'cvetana.baralic@email.com', '$2b$12$XYlpZJlWaj3B9GENMrk6Ou48OzPI4Sjq1noQazjge6O5j3LT9DZGm', 'true', 'true');

--email = bratislav.tojcic@email.com password = 9976
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Bratislav', 'Tojčić', 'bratislav.tojcic@email.com', '$2b$12$1vszRdeBO3Ffw8yVAdqbuOaEwzNXN7Mpj/BLxyKKf3nXx.7NQqqza', 'true', 'true');

--email = vasilija.apelic@email.com password = 4692
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Vasilija', 'Apelić', 'vasilija.apelic@email.com', '$2b$12$Xq1wzD0Vp3SYyqbzGKv/Uuv4GC6ZKdT3cqNdxAQnXlztPuXwMd0qG', 'true', 'true');

--email = violeta.krmpotic@email.com password = 7177
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Violeta', 'Krmpotić', 'violeta.krmpotic@email.com', '$2b$12$Ikk6eon39equuCeAVRP1ruXfyeMQjA1Nm06pqKnXx0wmc7J8z0Hq2', 'true', 'true');

--email = fotije.kizic@email.com password = 5316
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Fotije', 'Kizić', 'fotije.kizic@email.com', '$2b$12$MvE8W2cCDSoKK49DAo5CcOhqvg7p4uGn/sUy3ABtNu8b513rSLEfK', 'true', 'true');

--email = miladin.egaric@email.com password = 2891
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Miladin', 'Egarić', 'miladin.egaric@email.com', '$2b$12$0z2./ndScB5IWV7e4BN9I.cjN2Z6nZ8mcbaLUpB2sALk1ofZQidRi', 'true', 'true');

--email = zivodarka.kurilic@email.com password = 1927
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Živodarka', 'Kurilić', 'zivodarka.kurilic@email.com', '$2b$12$dmNmF1x8MCnVwMjlJqZL5eIDQ90NdQ6RvaYk7QXlKt2T8RiTCDCYW', 'true', 'true');

--email = spomenka.plavic@email.com password = 7793
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Spomenka', 'Plavić', 'spomenka.plavic@email.com', '$2b$12$lsNIIZcZGGiH1xFIySiF.uUrVdxRZmwowtJ9VQvfgh940H3HSheH.', 'true', 'true');

--email = miladin.ticic@email.com password = 5568
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Miladin', 'Tičić', 'miladin.ticic@email.com', '$2b$12$I2bvKXjJ6vEuGlZpTd5sKOtoaMfE6RmasDkhElQW8fMW66s80z3aC', 'true', 'true');

--email = bogdanka.vranic@email.com password = 2804
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Bogdanka', 'Vranić', 'bogdanka.vranic@email.com', '$2b$12$awjqh/17X90AY5ynDRvEhusdUbVumAWJyynHXcSr/tx2CtE04pEVG', 'true', 'true');

--email = nadezda.nojkic@email.com password = 6861
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Nadežda', 'Nojkić', 'nadezda.nojkic@email.com', '$2b$12$kshMxmXLQhq3.PLeITYlBuigAIjvfAT35u33slxuDlUguWtuMOtXS', 'true', 'true');

--email = stefan.drajic@email.com password = 7789
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Stefan', 'Drajić', 'stefan.drajic@email.com', '$2b$12$635rxu1LXBMrIUI.uoqdnOdPSqKYYoqZeHeKojhqv89oD7b2vzEEG', 'true', 'true');

--email = vidak.sarkic@email.com password = 2792
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Vidak', 'Šarkić', 'vidak.sarkic@email.com', '$2b$12$ptzNHM4asNL8K1Nrx6QFvO8N5wcBjHXkOnE6pBXIIooOFiyEVNN9W', 'true', 'true');

--email = vlajko.nagradic@email.com password = 3791
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Vlajko', 'Nagradić', 'vlajko.nagradic@email.com', '$2b$12$EckDziIY40uJKOVXip/2AuWpQMB.vA3TQW.5napw2Eog0fDKYcnW6', 'true', 'true');

--email = gabrijela.rakitic@email.com password = 7741
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Gabrijela', 'Rakitić', 'gabrijela.rakitic@email.com', '$2b$12$vZq2kdG20d3wmJXkvtLMmufCytyNN0sjda6i44j3eNYJyxGLPJ9ga', 'true', 'true');

--email = steva.brinic@email.com password = 4421
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Steva', 'Brinić', 'steva.brinic@email.com', '$2b$12$4IpngMLt9cIyIK1KuO9Ncei28vW15ixtbRFUBlwT4YQpdrredQ13u', 'true', 'true');

--email = srbislava.skoric@email.com password = 6405
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Srbislava', 'Skorić', 'srbislava.skoric@email.com', '$2b$12$BTiYwphG4jEvKElXCQ0pqedlPbjmSxfA0B3ARXje5/.PVBkH7fsK.', 'true', 'true');

--email = caka.vinokic@email.com password = 8749
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Caka', 'Vinokić', 'caka.vinokic@email.com', '$2b$12$NSkqg3X/GDUsTxs7/oCEDOJB7ipsGSodvNt6kvbEnRfYDFzKVNMya', 'true', 'true');

--email = jugoslav.tirnanic@email.com password = 2287
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Jugoslav', 'Tirnanić', 'jugoslav.tirnanic@email.com', '$2b$12$tDIpic4SYiHGWqFVFcXjGe/fnMkkzsoy22Fdb93gFKtdRqon0I31G', 'true', 'true');

--email = malina.jergic@email.com password = 2883
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Malina', 'Jergić', 'malina.jergic@email.com', '$2b$12$HPtaau2oLSnnP5mBcuGDgOMN00QConStKDT5KGn6M.Hmxl2bzpPI6', 'true', 'true');

--email = aleksandra.kalajic@email.com password = 2499
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Aleksandra', 'Kalajić', 'aleksandra.kalajic@email.com', '$2b$12$wPk16hqYZwIDwQGGCzajiuJQFfU7ELys4p5LOAe9t5KB/cv1vZvCu', 'true', 'true');

--email = vlajko.lajsic@email.com password = 4564
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Vlajko', 'Lajšić', 'vlajko.lajsic@email.com', '$2b$12$kwiZh4Tu4KuqHhtUJjnO/eAxo/lUi3ZkwC7K5klAWlYIlFWTt1.by', 'true', 'true');

--email = tanasije.rokic@email.com password = 5382
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Tanasije', 'Rokić', 'tanasije.rokic@email.com', '$2b$12$JWR5DVto9t7t0Ci0ItLTceAIXLZImoyQ394aa/xtfn2ctR6Zdxa6i', 'true', 'true');

--email = krunoslava.pelagic@email.com password = 7152
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Krunoslava', 'Pelagić', 'krunoslava.pelagic@email.com', '$2b$12$96yf/6.yHcgivYG3biN3au49gQaQkmvgLLrojGm2DFA7jiTF51A8m', 'true', 'true');

--email = kosara.picuric@email.com password = 1869
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Kosara', 'Pićurić', 'kosara.picuric@email.com', '$2b$12$g9s7A3ox/fBKzAVT7vQcDOnIg1pI3/BZ1Eb3VnBzepL6hpK6mSCpq', 'true', 'true');

--email = miroljub.plesic@email.com password = 8476
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Miroljub', 'Plešić', 'miroljub.plesic@email.com', '$2b$12$y835LrrNvyd7Z7SDeozyrOyeAKgAjNNpdOwNbZtN6FViqlPEy6DIy', 'true', 'true');

--email = rastko.cotric@email.com password = 2004
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Rastko', 'Čotrić', 'rastko.cotric@email.com', '$2b$12$EJd.FAKyYwWkvKuuuS.B2uXRh64yUB9KAcIDgwMVLje1HKiJlrgvW', 'true', 'true');

--email = angelina.mostic@email.com password = 1562
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Angelina', 'Mostić', 'angelina.mostic@email.com', '$2b$12$3ygrK/T0OPrM.DjYqs2Y9eMe8gLQTB9YbBxPXtUa9xTKHtuU7it4K', 'true', 'true');

--email = dragoje.lilic@email.com password = 2650
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Dragoje', 'Lilić', 'dragoje.lilic@email.com', '$2b$12$aTxdBVcW2x66ZLhSa1EVAuie4cr7fHryzPsITFWHuvqHqxSHYLS1.', 'true', 'true');

--email = njegosav.panincic@email.com password = 9514
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Njegosav', 'Paninčić', 'njegosav.panincic@email.com', '$2b$12$V2N0776jyw64EKz5b/DOZOlw/64gb1I86KSOQZP28d1ny8r/W1b52', 'true', 'true');

--email = teodor.jercic@email.com password = 6865
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Teodor', 'Jerčić', 'teodor.jercic@email.com', '$2b$12$7rPPj/xjtSWEA5HGkJ6JOO90VIraEgptMFG.UxTni1fWQn7JnoapO', 'true', 'true');

--email = violeta.malisic@email.com password = 9708
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Violeta', 'Mališić', 'violeta.malisic@email.com', '$2b$12$aLdcWMskS1hvpY38nxNQTOnqBlpipzEquDr6kSrXBacnL2qpckKV2', 'true', 'true');

--email = olja.dasic@email.com password = 7440
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Olja', 'Dašić', 'olja.dasic@email.com', '$2b$12$VNdkcwT9TOZrkYtUGs8QU.ytNfu6cccxQlKVrgLZI/XlcKdOG66L2', 'true', 'true');

--email = dunja.mandaric@email.com password = 2006
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Dunja', 'Mandarić', 'dunja.mandaric@email.com', '$2b$12$gabT3ObOZ20Yrao11RlGL.bp2POUgVrNq1LUzWCkC7CJrmIuezhH6', 'true', 'true');

--email = latinka.regulic@email.com password = 4459
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Latinka', 'Regulić', 'latinka.regulic@email.com', '$2b$12$xR2hOxTkq0LubCqkGWylHuTbBhq.hc873Et0EHLUutL9dvOUwQLb6', 'true', 'true');

--email = slobodan.malenic@email.com password = 6714
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Slobodan', 'Malenić', 'slobodan.malenic@email.com', '$2b$12$01jw6JymWUCUYl0HhiTu7O6bUTl.cfq4iSC9MMf8ZwGu5wn8VK3Cy', 'true', 'true');

--email = randja.curic@email.com password = 3354
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Ranđa', 'Ćurić', 'randja.curic@email.com', '$2b$12$HEBC7Bolxq2/MYOMf2E3ve06r/LlsQbkjwStUx6Kuw/KhrjUGECq.', 'true', 'true');

--email = jovana.trivic@email.com password = 9433
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Jovana', 'Trivić', 'jovana.trivic@email.com', '$2b$12$aLl7d2pbOc2rbDeTlkmeA.ZjGyW9c4Ak9e6b9ysDNgC7Ug3KEearW', 'true', 'true');

--email = viseslav.pirgic@email.com password = 5609
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Višeslav', 'Pirgić', 'viseslav.pirgic@email.com', '$2b$12$Uu/z9j2uF52IQzzibQ6aaOBtrl37DHfkP6MNfpE0I0wpiapow9QpW', 'true', 'true');

--email = djurica.skovric@email.com password = 6385
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Đurica', 'Škovrić', 'djurica.skovric@email.com', '$2b$12$8evkUndPGS54714RN56tIOejLpaAS18ZmPSP.xS3McaepjvfhWGVK', 'true', 'true');

--email = bogosav.karatosic@email.com password = 5320
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Bogosav', 'Karatošić', 'bogosav.karatosic@email.com', '$2b$12$DzJGR8V4xCvbY6H0k8za/ulx/OPPV1w/RYNvFAqLFOIVN8fvEXU.q', 'true', 'true');

--email = lenka.zarkic@email.com password = 7565
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Lenka', 'Žarkić', 'lenka.zarkic@email.com', '$2b$12$nmt41e89JPNdgliclCGXOOVkxrUdwp4zwjZ/LBvIQVbPeIxjvvpx.', 'true', 'true');

--email = latinka.neoricic@email.com password = 5656
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Latinka', 'Neoričić', 'latinka.neoricic@email.com', '$2b$12$dksur7I.no.WfPCL9PsfqudmyXkNLXotTvNNuspMgNf1vhMQzDeLi', 'true', 'true');

--email = hranislavka.prazic@email.com password = 7113
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Hranislavka', 'Pražić', 'hranislavka.prazic@email.com', '$2b$12$2.60rJg5A6IOQJKdqJ4vKuamr.1vxWYp0N5X1mt8ftDrXPkSEkvue', 'true', 'true');

--email = zlatomir.savicic@email.com password = 7936
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Zlatomir', 'Savičić', 'zlatomir.savicic@email.com', '$2b$12$1xg4DZNPdYUWNDK8R8IfpuG7fWCHgkFUrV7ub5fRzUfPCVnAdqXHu', 'true', 'true');

--email = dalibor.drmanic@email.com password = 8776
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Dalibor', 'Drmanić', 'dalibor.drmanic@email.com', '$2b$12$o/ytDFT4B0V1CJVtOTR/hurIsBJiozODxE4U.RKVMXVpawDNcBzfi', 'true', 'true');

--email = ljeposava.kapetinic@email.com password = 3306
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Ljeposava', 'Kapetinić', 'ljeposava.kapetinic@email.com', '$2b$12$HZkkhuZuMPuID75AQIhJn.AKtsX0sYrHd2Tfe..wjhBZBhwRxneva', 'true', 'true');

--email = stojmen.miliksic@email.com password = 2778
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Stojmen', 'Milikšić', 'stojmen.miliksic@email.com', '$2b$12$0PQJoH34Ltc/rJ9ZcRY0hOJeJx27dJWwqzZOnYen5wl/.evH3YUeW', 'true', 'true');

--email = ljubisa.sakotic@email.com password = 8128
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Ljubiša', 'Šakotić', 'ljubisa.sakotic@email.com', '$2b$12$6NONZEmK/byQVAXwFtWV2OQUClqiF5CS3r1QUxSNO7dYbybWAo3V2', 'true', 'true');

--email = aleksa.furnjigic@email.com password = 5398
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Aleksa', 'Furnjigić', 'aleksa.furnjigic@email.com', '$2b$12$gPp.UwTkhzLdJqUonortResWPGc1HA3K8aczEBf2jyR7VUq0XmsiO', 'true', 'true');

--email = stojka.tejic@email.com password = 9406
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Stojka', 'Tejić', 'stojka.tejic@email.com', '$2b$12$xywPcuyHKDtMcgtBEPy2Q.MxQjcwojdVKgmQwh3azlhCgfUzrw3c2', 'true', 'true');

--email = sofija.budnic@email.com password = 4782
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Sofija', 'Budnić', 'sofija.budnic@email.com', '$2b$12$Mwbo4A.8x6wVJzXAbkmy3.KEbr2LHU2ttSnYyvvZ6N.QjnfxCktkG', 'true', 'true');

--email = ratka.mazalic@email.com password = 6553
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Ratka', 'Mazalić', 'ratka.mazalic@email.com', '$2b$12$MKraIMd6q4KqWDLa6A.fy.MuYtrHalOdLz.kYacsACAN8Cu9H7Mri', 'true', 'true');

--email = miodrag.vascic@email.com password = 5370
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Miodrag', 'Vaščić', 'miodrag.vascic@email.com', '$2b$12$xOlwN.NnCOAOMIPSj.4/Nu.QWpnaMANma0TbXvfjmi4K8tGC/lhIe', 'true', 'true');

--email = novak.selinkic@email.com password = 5891
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Novak', 'Selinkić', 'novak.selinkic@email.com', '$2b$12$XRRv4rS7D3uSYNWUbBkdV.ElYc0X5HsFmXmepbezuv5OEuGyVCi3m', 'true', 'true');

--email = njegoslav.klicaric@email.com password = 3436
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Njegoslav', 'Kličarić', 'njegoslav.klicaric@email.com', '$2b$12$bvSX8KtrqATIP2HX.6mL2.uyswLzM1nu9goring5lbdAUeD/UEYMS', 'true', 'true');

--email = andjelka.kvekic@email.com password = 9811
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Anđelka', 'Kvekić', 'andjelka.kvekic@email.com', '$2b$12$gpbJDkyj5KzQ3p2iq8KmuedpweLuGCP4tLUE/3BsiCyirIsyafa/C', 'true', 'true');

--email = ljubisa.dzankic@email.com password = 8411
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Ljubiša', 'Džankić', 'ljubisa.dzankic@email.com', '$2b$12$HJTZ9azbpkYL7yJPuVI/t.BCu1U0o3SXxc9GQlffSuYPidDEvPgXS', 'true', 'true');

--email = zorka.apelic@email.com password = 9017
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Zorka', 'Apelić', 'zorka.apelic@email.com', '$2b$12$8.43StzSutx3hwLjHlcRp.HSE/cmnCy2PdUZK0mL13revLDhpc4DK', 'true', 'true');

--email = ignjat.stetic@email.com password = 6428
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Ignjat', 'Štetić', 'ignjat.stetic@email.com', '$2b$12$CVzy.lglpudvbjKOoqC//uwDL428aU52Upi2trdrdw.8tfiRh/GaO', 'true', 'true');

--email = radisav.certic@email.com password = 3709
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Radisav', 'Ćertić', 'radisav.certic@email.com', '$2b$12$unS4pHgMJJW17VlWGDgLSeF/NA335XRNYvyVv/5dDyWxE.YD..mMK', 'true', 'true');

--email = trifun.karisic@email.com password = 2759
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Trifun', 'Karišić', 'trifun.karisic@email.com', '$2b$12$bzjxC32YknQdZq8BS/GHz.5vNB42H8Z1yY6QqoH4Dh2vRin2OHIii', 'true', 'true');

--email = zivomir.sljivic@email.com password = 1903
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Živomir', 'Šljivić', 'zivomir.sljivic@email.com', '$2b$12$HUg7oev2FtLhGlB19VVbRufuhsJxzXoB/5pYAH4bojTBT.SbQPK0K', 'true', 'true');

--email = kristivoje.sagic@email.com password = 1406
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Kristivoje', 'Šagić', 'kristivoje.sagic@email.com', '$2b$12$clyoI6E.cn.Gey0jX0YDW.fkY7C6mgwqis12vQYiZOZz7I3Is26oa', 'true', 'true');

--email = ivona.andic@email.com password = 9759
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Ivona', 'Andić', 'ivona.andic@email.com', '$2b$12$2DRcPmruHUGMkCH8SsjxnuCev14W04QfFyyjOUnYvz4sRXyFMjY.q', 'true', 'true');

--email = ljubomir.diklic@email.com password = 6897
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Ljubomir', 'Diklić', 'ljubomir.diklic@email.com', '$2b$12$eYDiuWQQeWhsyyYk2Cuet.XO/.KizXJbkvRgy2GG6hFz.Ah6.TJmG', 'true', 'true');

--email = ljubomirka.karaulic@email.com password = 1305
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Ljubomirka', 'Karaulić', 'ljubomirka.karaulic@email.com', '$2b$12$Dt.65qKdp/zKnVzFVSZgq.dUFAMng1aWj2xwydcHyKkfcVAUWMP/G', 'true', 'true');

--email = stanija.docic@email.com password = 7273
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Stanija', 'Docić', 'stanija.docic@email.com', '$2b$12$VxTM4Qh8PkxjSE.dkzmY3O7YqevvXsZ9jTn4lmOFSGAGj0yvW4iva', 'true', 'true');

--email = dobrasin.buljubasic@email.com password = 3609
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Dobrašin', 'Buljubašić', 'dobrasin.buljubasic@email.com', '$2b$12$a3zvP0k.dRjTC8zSAW/n2udTOCRjFMygvnB4v5FbKlnwX1DZ5JfrK', 'true', 'true');

--email = ozarija.stancic@email.com password = 5416
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Ozarija', 'Stančić', 'ozarija.stancic@email.com', '$2b$12$nLKlNTETW2omoAXQDpCq9.3jhlXp2IbUHsHNbWNdMAkMBLRRFb5CS', 'true', 'true');

--email = suzana.bosancic@email.com password = 8911
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Suzana', 'Bosančić', 'suzana.bosancic@email.com', '$2b$12$EZAdBhOtOoUDYupbaiqVcOCtb/9og0hS4Cq2sb7W6HpimdCKI6rCS', 'true', 'true');

--email = bogosav.vojvodic@email.com password = 7119
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Bogosav', 'Vojvodić', 'bogosav.vojvodic@email.com', '$2b$12$FvZG6QKqEljRYOrN1dxV9.TlpCA9e44rcWE7hZTAWmxWRbjiDscIq', 'true', 'true');

--email = svetomir.vilotic@email.com password = 6930
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Svetomir', 'Vilotić', 'svetomir.vilotic@email.com', '$2b$12$4mVW1jKdglGIZj/a1WsC0eb4mo69J/6SoLF4uCvuJR7FYZR4329/K', 'true', 'true');

--email = srba.mrkonjic@email.com password = 1201
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Srba', 'Mrkonjić', 'srba.mrkonjic@email.com', '$2b$12$lGPz7F7BPBSVPlwW.eFTzebeleNlSbDysPSCuPA9Olq5vsZxDFGOy', 'true', 'true');

--email = rodoljub.gradic@email.com password = 8932
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Rodoljub', 'Gradić', 'rodoljub.gradic@email.com', '$2b$12$TxK.FsWLatmPfRe759ICneBIIBMjrhejl.n3iMBoizrh3XX9CPQ92', 'true', 'true');

--email = cvijo.savelic@email.com password = 1608
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Cvijo', 'Savelić', 'cvijo.savelic@email.com', '$2b$12$rnspFge2j16BTYONcXJJ9ujHj0Q7V7DqWJcrtWEFhYfX6vwjvRL2O', 'true', 'true');

--email = violeta.njegric@email.com password = 9171
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Violeta', 'Njegrić', 'violeta.njegric@email.com', '$2b$12$fmaIWjqikN2cT8V6LZZax.oSqakqY1flRIwm//pUGBWLLwGDRuO2O', 'true', 'true');

--email = gradimir.likusic@email.com password = 7532
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Gradimir', 'Likušić', 'gradimir.likusic@email.com', '$2b$12$zu2QcAEc4MTDNOxD9ioOM.KChVgstJyu1E.RjrE9IgxhD2SI2Wj3a', 'true', 'true');

--email = vukadin.cenic@email.com password = 6557
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Vukadin', 'Cenić', 'vukadin.cenic@email.com', '$2b$12$wxoY9t0b8Hkws/EnG4DV/uC8pZt/my7p4beFUpBtqrDa5bD2OJDeG', 'true', 'true');

--email = elena.kolacaric@email.com password = 6188
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Elena', 'Kolačarić', 'elena.kolacaric@email.com', '$2b$12$4UD2jQZAsAmq8kE2ddiegOsZuEzGsQmfyz6B4YSREdtX0UTvswI/a', 'true', 'true');

--email = bojana.materic@email.com password = 2039
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Bojana', 'Materić', 'bojana.materic@email.com', '$2b$12$Aquwzwr.blQl2kUBiBGydez7CZkvTwWEoQuhFzbJuRcAazh0L/aYS', 'true', 'true');

--email = miomir.plavljanic@email.com password = 2481
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Miomir', 'Plavljanić', 'miomir.plavljanic@email.com', '$2b$12$aiJprKqHLR/CxX1bqy9ZMOgvJR5GxZKdwcgt.5hHBh78otAJQLyAy', 'true', 'true');

--email = eva.vulisic@email.com password = 7483
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Eva', 'Vulišić', 'eva.vulisic@email.com', '$2b$12$s.VrVwkrDG6HAmC4q.JsDu3.u3MxFK4m4b4IHuKQihOXkpgazxC9i', 'true', 'true');

--email = jelika.milijic@email.com password = 3286
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Jelika', 'Milijić', 'jelika.milijic@email.com', '$2b$12$aW6CsIV33iUMJw/947qx0.6HsMHE/TUFxU2VVw/RxidUJgndMZVIa', 'true', 'true');

--email = ratibor.varaklic@email.com password = 5008
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Ratibor', 'Varaklić', 'ratibor.varaklic@email.com', '$2b$12$aKpTGDJXqoeAjw4ZBmL0wulsea9a0WmkJYs935v4U4VrYpua1UDym', 'true', 'true');

--email = cuba.kilic@email.com password = 4529
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Ćuba', 'Kilić', 'cuba.kilic@email.com', '$2b$12$/4YQveUTkQH4whJZ55ycjuR93NoYvROg3Me.VjLeKywkJuzLbez96', 'true', 'true');

--email = elena.curcic@email.com password = 7605
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Elena', 'Ćurčić', 'elena.curcic@email.com', '$2b$12$TTYsWW2u7i./bpMQqEJJoOmA.7DywUwPi.sJOlvY0qZiapfIUedG2', 'true', 'true');

--email = radoslava.aksic@email.com password = 4507
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Radoslava', 'Aksić', 'radoslava.aksic@email.com', '$2b$12$uMGUU/7lNwzWj846Nz/9S.EfSB9eAI7Bd21NM.58dAlfAePqPyeH6', 'true', 'true');

--email = perunika.culjic@email.com password = 6983
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Perunika', 'Čuljić', 'perunika.culjic@email.com', '$2b$12$xwy9UUUNRpTdjJv/qh/I4uCDBUaPu/zDj4bEZ/APMUcDS/PsfJfuO', 'true', 'true');

--email = zaga.bobusic@email.com password = 5062
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Zaga', 'Bobušić', 'zaga.bobusic@email.com', '$2b$12$TvoCFqdKl.RoyEViHjGHB.HJVWVCn/IfDxnUUXptiUYcNLxaK1nou', 'true', 'true');

--email = jovanka.jocic@email.com password = 2227
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Jovanka', 'Jocić', 'jovanka.jocic@email.com', '$2b$12$iUDh/mPs9XFwHfxNlQ.44uOaaUez5/qTeASd6pbjExa6qYu5MF4Ue', 'true', 'true');

--email = zivoslava.knezic@email.com password = 2407
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Živoslava', 'Knežić', 'zivoslava.knezic@email.com', '$2b$12$pmizUBdurbCTR.yG1zWPzuQUMsFpfStJapSNuypwE7.es13uzr9DK', 'true', 'true');

--email = jasminka.kapetinic@email.com password = 3427
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Jasminka', 'Kapetinić', 'jasminka.kapetinic@email.com', '$2b$12$UIeH0sudu.fsXiRDmh/cael2yAVZUCYUX5hBNvB6bfuX8ZmO8YL9i', 'true', 'true');

--email = julija.stekic@email.com password = 3579
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Julija', 'Stekić', 'julija.stekic@email.com', '$2b$12$MYwCte27mdoYQGaZzTtDf.HriOe7PObY/QsaIqucgJNIDey9GH23y', 'true', 'true');

--email = slavna.nedeljcic@email.com password = 7579
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Slavna', 'Nedeljčić', 'slavna.nedeljcic@email.com', '$2b$12$ybNiQXsZJiicXmzZhiKucOsCgnCPFCcDYbdxTWq6zAXazeuLbf.sO', 'true', 'true');

--email = nebojsa.opricic@email.com password = 9786
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Nebojša', 'Opricić', 'nebojsa.opricic@email.com', '$2b$12$LStHodesLenTjVJQjD1smuCzbo/4MFNylwqviFO0ixo7tamx0vKKS', 'true', 'true');

--email = nenad.erletic@email.com password = 7863
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Nenad', 'Erletić', 'nenad.erletic@email.com', '$2b$12$JfDeDiY.ZwXBeKENFinP/OpPlz.sPfBaaNN3MQtVku9mS7N0fGfjC', 'true', 'true');

--email = draginja.gancolic@email.com password = 8992
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Draginja', 'Gancolić', 'draginja.gancolic@email.com', '$2b$12$B2Xbjqv5qnEYSiTcaFIYROPo8bONn.iPKGUV8dauu8V8tvFFYpsO2', 'true', 'true');

--email = slavka.alimpic@email.com password = 8477
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Slavka', 'Alimpić', 'slavka.alimpic@email.com', '$2b$12$VhGd8wYZ.vr2/6r2EFiwbeGFmWJMCEvEJ2jGaA/Q8Ba5Ovh2HN1um', 'true', 'true');

--email = kristivoje.balabusic@email.com password = 7108
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Kristivoje', 'Balabušić', 'kristivoje.balabusic@email.com', '$2b$12$DE3TwNRpUUPxEFgo1rezdeyXpq4SEdwTOs7aIPysydoEa8UA6ymTW', 'true', 'true');

--email = zoran.kordic@email.com password = 8049
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Zoran', 'Kordić', 'zoran.kordic@email.com', '$2b$12$I7ifHz9X6mnC/WjBGB6QC.wbAz4CXbjnxbu67NPA3U5GbF82PZM7u', 'true', 'true');

--email = radojlo.levnaic@email.com password = 3585
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Radojlo', 'Levnaić', 'radojlo.levnaic@email.com', '$2b$12$/mvU2qazjUSAFGl5pt8/1ePiKa.iIxsGbnZbRXIqULVp3ieAu5hJS', 'true', 'true');

--email = vekoslav.percic@email.com password = 5595
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Vekoslav', 'Perčić', 'vekoslav.percic@email.com', '$2b$12$I/LdLffZK4FGgooCIlH.i.MqMqrjiXN0Uk.5lR7bEuo9VVHltOlCq', 'true', 'true');

--email = sajka.zivic@email.com password = 4579
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Sajka', 'Živić', 'sajka.zivic@email.com', '$2b$12$O4IV.5Xp/2Zez4j00m5NEukB32eiJOmPGd4Xb8NiBMAffQruHiyi.', 'true', 'true');

--email = trajanka.bantulic@email.com password = 6220
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Trajanka', 'Bantulić', 'trajanka.bantulic@email.com', '$2b$12$qQaQEgL1NM4xdv5W8AOC9O/AM5ddeCvmTSWW3cNAyiBNHFM3spzgu', 'true', 'true');

--email = vidosava.kragic@email.com password = 4591
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Vidosava', 'Kragić', 'vidosava.kragic@email.com', '$2b$12$MHtB/1qV8ksjhh2cv.XkW.mAMz9TR865wKgu7dY5QSi10mWgNvCaK', 'true', 'true');

--email = jordan.bokanic@email.com password = 1765
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Jordan', 'Bokanić', 'jordan.bokanic@email.com', '$2b$12$A4EAF6hmZseDEz97rG99i.RsFkDZCYxNb6kDLZEjhpezOaQWLrwLm', 'true', 'true');

--email = cetko.rusalic@email.com password = 5568
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Ćetko', 'Rusalić', 'cetko.rusalic@email.com', '$2b$12$kC3h6xCntsEj5dVZ.Ou8PeC7wZLn3Wx35GeoWfEXk562NMe.d5YLy', 'true', 'true');

--email = slaven.padic@email.com password = 1252
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Slaven', 'Padić', 'slaven.padic@email.com', '$2b$12$DW1Xu6OSp5Xwh7rR6A41A.h2WxE.EWIPXHNNmsTOP9dZjEUSQz/by', 'true', 'true');

--email = isak.sogonic@email.com password = 7245
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Isak', 'Sogonić', 'isak.sogonic@email.com', '$2b$12$.cJskeCK1QJlTokUdVjv3.XG8bSAr.onteaEn4ko0vL.8SXckEqcW', 'true', 'true');

--email = radomirka.janjic@email.com password = 7745
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Radomirka', 'Janjić', 'radomirka.janjic@email.com', '$2b$12$Yi69h1QyGDK5O4XW5MB4BOgpIsbdviM31Ys2OOmu5SxBJMZouP8Kq', 'true', 'true');

--email = dragoljub.budincic@email.com password = 7984
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Dragoljub', 'Budinčić', 'dragoljub.budincic@email.com', '$2b$12$.6bLOSJTcyehr.6jSwKa6uiR27iojQcUaCWJdvHNn72k95Hybu9IO', 'true', 'true');

--email = ljilja.ljamic@email.com password = 2288
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Ljilja', 'Ljamić', 'ljilja.ljamic@email.com', '$2b$12$2vSdteEHYXEC70Kgl7/yuOtFlfVb.Z3tdqqC6O4Npg45mSe20bTgO', 'true', 'true');

--email = nikola.subic@email.com password = 5021
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Nikola', 'Šubić', 'nikola.subic@email.com', '$2b$12$GUVQ6JdR3ddRHO3ftHLkBurARsX3KW1dsHhDAdLpoFVbZ5NvEUAtG', 'true', 'true');

--email = sotir.saronjic@email.com password = 1224
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Sotir', 'Šaronjić', 'sotir.saronjic@email.com', '$2b$12$LWgNs1J9IH8Y9e7N2m7U..634Zb6RdBdC0632jmRBwjEqxSlxpYKC', 'true', 'true');

--email = djordje.jukic@email.com password = 3009
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Đorđe', 'Jukić', 'djordje.jukic@email.com', '$2b$12$VErqHFUZLhP4jag0CJbOX.WYGVng/Ghl6Ou5JkBny9HGVC8uxqynC', 'true', 'true');

--email = bosko.likodric@email.com password = 5382
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Boško', 'Likodrić', 'bosko.likodric@email.com', '$2b$12$Ks5xexBaGsiLlr87SzZDFeuFpn5bKqxsbgvbSc43X92LDMMK/fPi2', 'true', 'true');

--email = kosta.sekaric@email.com password = 7695
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Kosta', 'Šekarić', 'kosta.sekaric@email.com', '$2b$12$J5vlHRdIcvOf7rP5spKO3ORMlcAfq31ihrxqytjG9f6XgPBZEbnOq', 'true', 'true');

--email = divna.grujanic@email.com password = 6083
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Divna', 'Grujanić', 'divna.grujanic@email.com', '$2b$12$ud3XiZE9dpx61ilPzYyNGecSD39s8VVVGw.sKvIKYtJIoFXrV/o62', 'true', 'true');

--email = rastko.borikic@email.com password = 5019
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Rastko', 'Borikić', 'rastko.borikic@email.com', '$2b$12$IGH8ehLTxdETy63CHz3H2OTKP8SPKlEnVrq6Pkv2TrVH9xJUB6EOC', 'true', 'true');

--email = stanko.gveric@email.com password = 6179
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Stanko', 'Gverić', 'stanko.gveric@email.com', '$2b$12$MVt7umoeRHbYRuI.3Eh4i.wPV/kNyDlmq6.jKtbtSp3JCrrU8UVMm', 'true', 'true');

--email = zivana.sofijanic@email.com password = 7296
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Živana', 'Sofijanić', 'zivana.sofijanic@email.com', '$2b$12$dCbb9W54uGuIkvhjBnxeSexk17bOLDt0z7KKsmjNLl.Qfx/dn0KPG', 'true', 'true');

--email = ozren.romanic@email.com password = 3226
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Ozren', 'Romanić', 'ozren.romanic@email.com', '$2b$12$FmTKtjfMApOJU76GYqeb7ecqCrBG3lmp7fpbm5wSHECx8dgWYqCKK', 'true', 'true');

--email = darko.gancolic@email.com password = 7056
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Darko', 'Gancolić', 'darko.gancolic@email.com', '$2b$12$gXeKZZ2IIBwCOhP8lq5N3.Cyq4Paeittfhf9GQnzwbp8In9IKAXkq', 'true', 'true');

--email = krunoslava.bjelotomic@email.com password = 7472
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Krunoslava', 'Bjelotomić', 'krunoslava.bjelotomic@email.com', '$2b$12$qPcCs.lSb5CCGy7Dp8UqgeY/CJzUtDLEiQ1p6dgpfg8Hf6fQ5g3Qu', 'true', 'true');

--email = randja.stanisic@email.com password = 7382
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Ranđa', 'Stanišić', 'randja.stanisic@email.com', '$2b$12$3x2uDvofW85kL0Xan8eKu.TXb.GOK/n6jQ0MyPEJLBfguImOe3hua', 'true', 'true');

--email = dejan.njegusic@email.com password = 5799
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Dejan', 'Njegušić', 'dejan.njegusic@email.com', '$2b$12$MKgihpwg5cW9GhXIlRlX4OeZ6sVFbNKwVFabCSCmkW.e2VxPeburK', 'true', 'true');

--email = andrijana.stuparusic@email.com password = 3100
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Andrijana', 'Stuparušić', 'andrijana.stuparusic@email.com', '$2b$12$J6PbseruPTqgDBrOB/A/h.mhlDMXudvtUSfAwTGS8LE/wHCEYObuC', 'true', 'true');

--email = njegos.piljic@email.com password = 9735
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Njegoš', 'Piljić', 'njegos.piljic@email.com', '$2b$12$qKIvyYCfIk..smTjdbdvt.IgOugvljs9g0Sx9elEH7A19H5eA9snq', 'true', 'true');

--email = caslav.vujicic@email.com password = 9173
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Časlav', 'Vujičić', 'caslav.vujicic@email.com', '$2b$12$TMcdZkZ0p1S0HkbMYfVt3OgTVCp2E739mRgakzwfpbWTeXA/W4ycW', 'true', 'true');

--email = budimir.glumicic@email.com password = 9238
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Budimir', 'Glumičić', 'budimir.glumicic@email.com', '$2b$12$NJ2siO4zpnbA6soO6ZeDO.BbbGBHZqIuEGeTvp6CoJRFZjKRxmggy', 'true', 'true');

--email = ljuba.malbasic@email.com password = 7556
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Ljuba', 'Malbašić', 'ljuba.malbasic@email.com', '$2b$12$51TTAKDbReYk5MInKBTJyer2ERIr7PXTb.pUQxv71BD4/9Q9o/jkG', 'true', 'true');

--email = anastasija.jovicic@email.com password = 3554
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Anastasija', 'Jovičić', 'anastasija.jovicic@email.com', '$2b$12$ZIrrqPclNS7LjTKSwbdise.FHWKVJ0x7aDZT7BeuNB66Rb8CQUBve', 'true', 'true');

--email = krunoslava.karamucic@email.com password = 6827
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Krunoslava', 'Karamučić', 'krunoslava.karamucic@email.com', '$2b$12$5jqPKaXE6GsRD9t193XA6epbcp0UqLI7Smyt8m8ksCZuD1bdfNDu2', 'true', 'true');

--email = lola.sevkusic@email.com password = 5571
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Lola', 'Ševkušić', 'lola.sevkusic@email.com', '$2b$12$p25JVxeWEv4zaYA3Wamqa..pumdQsGgD/2cULbOKEQWI1Zf6H0gbi', 'true', 'true');

--email = bane.udovcic@email.com password = 1236
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Bane', 'Udovčić', 'bane.udovcic@email.com', '$2b$12$rcIdnfYPSwhfqp6t2gk4luxpQq81jx1Ry7GmBGT4hw6m1pSiDbbhu', 'true', 'true');

--email = danojlo.dolinic@email.com password = 8653
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Danojlo', 'Dolinić', 'danojlo.dolinic@email.com', '$2b$12$J7eet2b46iN.MKiI0cY0U.g9LpLsScumvLmZgKRsrmU5dfke5bAUe', 'true', 'true');

--email = miladin.bulic@email.com password = 6285
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Miladin', 'Bulić', 'miladin.bulic@email.com', '$2b$12$DGu4LzJxgZXuBMQEhr/9QOFJgsMcU/iG7xjN9XOLG5OnLj0tZspwe', 'true', 'true');

--email = vuksana.rupic@email.com password = 2713
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Vuksana', 'Rupić', 'vuksana.rupic@email.com', '$2b$12$kUGOjkipMXrF4ykGtkyYmOPr3bcy.WCJ1q/tcTXPPEcu5wRZ0G3ae', 'true', 'true');

--email = radomir.koplic@email.com password = 3750
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Radomir', 'Koplić', 'radomir.koplic@email.com', '$2b$12$pI1InedHjRyuMylQb09rVOpX4QBE7bjNzyHh6C0VHskLH7J4VzwAy', 'true', 'true');

--email = gruja.cuic@email.com password = 3641
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Gruja', 'Ćuić', 'gruja.cuic@email.com', '$2b$12$1t6L8A6ZgIXXEIAZ6qX3MuIB/9tTKAZhXdWMw2HOjFYCJAPLNthGu', 'true', 'true');

--email = dragica.cembic@email.com password = 3952
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Dragica', 'Čembić', 'dragica.cembic@email.com', '$2b$12$hhTFJFTGsOLvP8eqFQKlz.7e8/nxpGcoaYaVeBlbX7z3DSWScveDm', 'true', 'true');

--email = dragisa.brusic@email.com password = 1459
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Dragiša', 'Brusić', 'dragisa.brusic@email.com', '$2b$12$lKUAsneoC44IFkQ/QQxZL.HAkWD0aEXkDfvrP0TOq/ENcWouJpDU.', 'true', 'true');

--email = radul.micic@email.com password = 4994
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Radul', 'Micić', 'radul.micic@email.com', '$2b$12$BgfUUy5TJYtD7xhNPGhHXuOfO1ZijfSIA6krJmCug6TjPXFFVYcDe', 'true', 'true');

--email = zivanko.jonesic@email.com password = 3652
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Živanko', 'Jonesić', 'zivanko.jonesic@email.com', '$2b$12$OSSHHSJHszbHM5FztRFHdugQmLOYhgTrGQE2hklUGyqsXWhKgRg.q', 'true', 'true');

--email = georgije.bacunic@email.com password = 6725
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Georgije', 'Bačunić', 'georgije.bacunic@email.com', '$2b$12$NqofetblRF1Vac8r0sjlBObBLieVso2Vb7xKDjxJLLRSsi0ZObu4q', 'true', 'true');

--email = viseslav.sjenicic@email.com password = 4432
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Višeslav', 'Sjeničić', 'viseslav.sjenicic@email.com', '$2b$12$hzfLsCRYgdSZ./n4fw5DV.1CzaNxNYqR9L2kVUI0ajnl2d4Vo572.', 'true', 'true');

--email = ljuba.ananic@email.com password = 4418
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Ljuba', 'Ananić', 'ljuba.ananic@email.com', '$2b$12$zf2sLY7rgt6JzMd67NC9e.H7ZVuY.WuuCj0/Ya9giZ2MiJWL./GbW', 'true', 'true');

--email = egenija.matusic@email.com password = 3724
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Egenija', 'Matušić', 'egenija.matusic@email.com', '$2b$12$BaYnCF02lLlnJ.WCoWozvubfIj4HOU9dJwfGxavPeiopKKslDh4BC', 'true', 'true');

--email = pauna.culjic@email.com password = 5310
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Pauna', 'Čuljić', 'pauna.culjic@email.com', '$2b$12$.4BaWyA2cMqtvGIeKpXCZ.3gh/dve1EmwcvPUf0yfwEoODZkN3BEK', 'true', 'true');

--email = cuba.vlaketic@email.com password = 5198
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Ćuba', 'Vlaketić', 'cuba.vlaketic@email.com', '$2b$12$c9v1TESTY/mQp/zSXtQPvuQG/ppAYT3Zp5A6hW7SFD8IJAUmAD9m2', 'true', 'true');

--email = una.stozinic@email.com password = 7842
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Una', 'Stožinić', 'una.stozinic@email.com', '$2b$12$aE4XYkqXxZ/ZMQpJ4XV.4.PVDvIUlRlc3/UrWs1LnTfTntTucVvb6', 'true', 'true');

--email = soja.djenisic@email.com password = 2615
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Soja', 'Đenisić', 'soja.djenisic@email.com', '$2b$12$E.hCeKjU1i5ZJ.zijdYWre.O8rtQFxQ/38VhIwNmyrde1rStN3fse', 'true', 'true');

--email = zlatoslav.ijacic@email.com password = 6131
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Zlatoslav', 'Ijačić', 'zlatoslav.ijacic@email.com', '$2b$12$rWBuJW0XKmfxYhvEl5O1TunDpVJlZFM3BhLeGCYaLeXOe0DF2hGYe', 'true', 'true');

--email = borisav.balandzic@email.com password = 8257
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Borisav', 'Balandžić', 'borisav.balandzic@email.com', '$2b$12$lIlbefvkPlBZUEfD22U4MuwqXX00NWH5ZemL7qQ2Xy3KMSYymdh.G', 'true', 'true');

--email = bozana.golic@email.com password = 1314
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Božana', 'Golić', 'bozana.golic@email.com', '$2b$12$UKzK8KIJHgnt2qbuxZ9Qc.0Mldy1UPya9aiWpUxkfNgpVmViwAZVG', 'true', 'true');

--email = milovan.banzic@email.com password = 4845
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Milovan', 'Banzić', 'milovan.banzic@email.com', '$2b$12$RmyNIlWHgH4fCOJW/4DCQe2oMkhHhf2UMKdFTgbXxOTE2xU81fkSy', 'true', 'true');

--email = ilija.videkanic@email.com password = 4058
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Ilija', 'Videkanić', 'ilija.videkanic@email.com', '$2b$12$f0YyPhqGPpepJgQS4mtDJeTeE6VfZZR8VB3iE/9vnHdb7vjAsaf.q', 'true', 'true');

--email = lola.divicic@email.com password = 4940
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Lola', 'Divičić', 'lola.divicic@email.com', '$2b$12$.vEExfQfkcV6PTGz73CB9ejl5UjX5cTKDA5YmK7GmY4oAFPB6XER2', 'true', 'true');

--email = jeremije.stamatic@email.com password = 3293
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Jeremije', 'Stamatić', 'jeremije.stamatic@email.com', '$2b$12$aRDKLTDFPe6DmmjCZ6iPLOsx1M.F/rBLM97mmzd9X.qawex.oaWjq', 'true', 'true');

--email = zorislava.gancolic@email.com password = 3009
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Zorislava', 'Gancolić', 'zorislava.gancolic@email.com', '$2b$12$RymUWma6PQ8bOMNDNYTqoOLwapd69OUsbyguUtR4B03c.megCSD8u', 'true', 'true');

--email = milija.sunaric@email.com password = 7643
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Milija', 'Sunarić', 'milija.sunaric@email.com', '$2b$12$sBbXghZZmHp3Wa15V.yaZueyNFOYNn3t3Wpxtikr0BP8ZSB69Zwvm', 'true', 'true');

--email = sin|elija.nikosavic@email.com password = 6215
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Sin|elija', 'Nikosavić', 'sin|elija.nikosavic@email.com', '$2b$12$oKaht3jaHZ9haNLH2fCPSOff40t30ZJWJzBvLm3l7s6lxMraHmTnW', 'true', 'true');

--email = kleopatra.rancic@email.com password = 7807
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Kleopatra', 'Rančić', 'kleopatra.rancic@email.com', '$2b$12$Je2zPS6KtZ4H/42M0G/7jOVwtUwv0nzqqJGFXOc9QSOt3R3bGgmri', 'true', 'true');

--email = danojlo.komlenic@email.com password = 1388
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Danojlo', 'Komlenić', 'danojlo.komlenic@email.com', '$2b$12$BRR6EusKAp7PxZsUxe47HeC3Iuor6e6rmVRTGm71ebAGpH58qKqfq', 'true', 'true');

--email = jelenko.dondic@email.com password = 2727
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Jelenko', 'Dondić', 'jelenko.dondic@email.com', '$2b$12$GNT09E.L6qdi16dIC9OC3e84CN/VP4odW6w2mGL3Y1s0hmfdBT8xG', 'true', 'true');

--email = stokan.sapic@email.com password = 8675
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Stokan', 'Šapić', 'stokan.sapic@email.com', '$2b$12$8NZI8P91ixaDuX1lM8VEm.maZPyRCYjwk4F16VO55VTku9plKI1uu', 'true', 'true');

--email = smilja.balsic@email.com password = 7185
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Smilja', 'Balšić', 'smilja.balsic@email.com', '$2b$12$PpxqrlL.6XPo1CGNaI5y6.bviC5/ou6v.LvK9zMlcVRvQOLnNuaPu', 'true', 'true');

--email = ostoja.baltic@email.com password = 8518
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Ostoja', 'Baltić', 'ostoja.baltic@email.com', '$2b$12$PhKd.u4G/OIVThBy/eUE7uGhbgGW1HBjKVepvbaeeoUpCDXRdsZCS', 'true', 'true');

--email = uros.kisic@email.com password = 9735
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Uroš', 'Kisić', 'uros.kisic@email.com', '$2b$12$rjB3gHYRU/1Si2uhdAVTZOtdB7eWsofnHaA9eN2A063xjEVhe1/y6', 'true', 'true');

--email = prohor.cvijakic@email.com password = 7849
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Prohor', 'Cvijakić', 'prohor.cvijakic@email.com', '$2b$12$fwlO97JA6jYwqwSMS4KTJeFSD9q3ReXD..1/tqVwEdJ.i2Z.7chSO', 'true', 'true');

--email = savka.stevic@email.com password = 4175
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Savka', 'Stević', 'savka.stevic@email.com', '$2b$12$xoCR/VKzS1BFKmA5krYAWugfqC/qtVcsruzKTvvTYljvjIchRkb7q', 'true', 'true');

--email = uros.vergic@email.com password = 8321
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Uroš', 'Vergić', 'uros.vergic@email.com', '$2b$12$SsSLPwzta1AEQZlnbHWUbuPVPJricv/5I6Vl9V4eRkXVgWsV/XgsC', 'true', 'true');

--email = negovan.zlatic@email.com password = 8527
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Negovan', 'Zlatić', 'negovan.zlatic@email.com', '$2b$12$pjIOI377QBMzXL8yz1B5BuF7zvZggwkq6bAnvFR8Vr8ZpXq7PV1Ju', 'true', 'true');

--email = janovka.vukolic@email.com password = 6244
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Janovka', 'Vukolić', 'janovka.vukolic@email.com', '$2b$12$GC7E.JAKryz3b9VeoNppFOvZz/KPRpY4B.2B6zaw5/TRne1bYedoa', 'true', 'true');

--email = jelisije.abramic@email.com password = 8707
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Jelisije', 'Abramić', 'jelisije.abramic@email.com', '$2b$12$7eCZtFhi4UBW6x7qZHdzKeuJXw6t5.6K5yMYbfmguFRSRPsB2jOrW', 'true', 'true');

--email = vukan.tesinic@email.com password = 6502
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Vukan', 'Tešinić', 'vukan.tesinic@email.com', '$2b$12$4xuHHkdKSby9zjcGPI7MNeYi3lYvLpA3mP5oKDFwQVYj4Usjj/vF.', 'true', 'true');

--email = goran.tijanic@email.com password = 7682
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Goran', 'Tijanić', 'goran.tijanic@email.com', '$2b$12$pe4QYtyZInQdsVyHOwin0OwntoZaIWlOYTMOR.mwnyCM/Pisk/R9q', 'true', 'true');

--email = sima.gleznic@email.com password = 4636
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Sima', 'Gležnić', 'sima.gleznic@email.com', '$2b$12$X0WAfI2laojntOI2/w7g.eWN85F4USOhzD.az3yiwuycaWbP2NmEi', 'true', 'true');

--email = milorad.cvokic@email.com password = 1609
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Milorad', 'Čvokić', 'milorad.cvokic@email.com', '$2b$12$F/QNWARVcInZyTe8eOtlUuno8KCokCSY5qzbLzlZvYVU3wELVOMEO', 'true', 'true');

--email = krsta.selenic@email.com password = 5202
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Krsta', 'Selenić', 'krsta.selenic@email.com', '$2b$12$Ci3cHVWAdtX0JFhNVP63qODhop5B3ZjvfGdxgcOC2PehMT2rd5g8.', 'true', 'true');

--email = stoja.mijic@email.com password = 9111
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Stoja', 'Mijić', 'stoja.mijic@email.com', '$2b$12$y6igLNMAbug/R5WvjcBxE.Xj2HiomY/.xqTeTrE3OhLJBp9JhFb3m', 'true', 'true');

--email = srdjan.stevanetic@email.com password = 6591
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Srđan', 'Stevanetić', 'srdjan.stevanetic@email.com', '$2b$12$I0sgM4DlP7U1eu7vbhKd5u8kBAa18WrM1kmR14dZnc7fZHoqZRgfG', 'true', 'true');

--email = cubrilo.sobacic@email.com password = 6529
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Čubrilo', 'Šobačić', 'cubrilo.sobacic@email.com', '$2b$12$Ig6BHzj/zjrlsLM9l.mI6OIQA/91INcdTyqwIuFsl/3fxkVshdBua', 'true', 'true');

--email = momcilo.buzejic@email.com password = 1722
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Momcilo', 'Buzejić', 'momcilo.buzejic@email.com', '$2b$12$g0p6Gg8HuV4wa8h82OOs5eILG/rFN1F3jDJz9DW8WarHkn95S22Lu', 'true', 'true');

--email = mijat.raducic@email.com password = 6101
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Mijat', 'Raducić', 'mijat.raducic@email.com', '$2b$12$ys9.bmZO18VN2KSpgtkq/.JFyQvldUscO1nsk8/DPB5l4edhy9y0u', 'true', 'true');

--email = radomirka.zutinic@email.com password = 3218
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Radomirka', 'Žutinić', 'radomirka.zutinic@email.com', '$2b$12$h.0zX3ONZYOxZPg9cvpR6.lscEU3Rmz0vbKqKXfRGLdumT4Wwc9lS', 'true', 'true');

--email = sana.sindic@email.com password = 2389
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Šana', 'Šindić', 'sana.sindic@email.com', '$2b$12$tFucatNFcWaPREOquaTzGOhsjQ3h0V35aChyO57BRWuzswNTDbrLS', 'true', 'true');

--email = drasko.nedinic@email.com password = 6115
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Draško', 'Nedinić', 'drasko.nedinic@email.com', '$2b$12$ibPEchvOD1ezsuJV3VG2FOQD0lqIzkFCX2jw/y9v.iOX/EF998ZAK', 'true', 'true');

--email = trivun.alagic@email.com password = 6331
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Trivun', 'Alagić', 'trivun.alagic@email.com', '$2b$12$1fRWFEH.i7ujw.4aY29MBu1Tgh5ky56eJQWK66.S.Ejm6ZJuDEjE6', 'true', 'true');

--email = tamara.dinjicic@email.com password = 3618
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Tamara', 'Dinjičić', 'tamara.dinjicic@email.com', '$2b$12$PdkeOkYleY2eJ57y0IIxNOeJlWEgfpUwagNIfoEMkbf3HkBWlFwYu', 'true', 'true');

--email = vladan.gmizic@email.com password = 3956
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Vladan', 'Gmizić', 'vladan.gmizic@email.com', '$2b$12$IzDZZLQGrDJTxPKgdLedRueFZcq7lQIrnunXkXE3Vqn7lv7Fefa56', 'true', 'true');

--email = dejan.boric@email.com password = 1243
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Dejan', 'Borić', 'dejan.boric@email.com', '$2b$12$XLx3eWRneHrW2EGcO1DwsuEU71k2iKGfyGPKoYT328x4sox9dQEUO', 'true', 'true');

--email = zivadin.ikonic@email.com password = 8361
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Živadin', 'Ikonić', 'zivadin.ikonic@email.com', '$2b$12$2xHLzubmf81MbkufCJVJzOlPML2/038mDXGkPfubvTPcpjrFzm8mS', 'true', 'true');

--email = ceca.stopic@email.com password = 6148
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Ceca', 'Stopić', 'ceca.stopic@email.com', '$2b$12$S2gOs.jpvnfhmqDnb4FFhOIcslDWTuw3Fn1lXlkb4BBjNjxd5PhEu', 'true', 'true');

--email = purisa.marunkic@email.com password = 5046
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Puriša', 'Marunkić', 'purisa.marunkic@email.com', '$2b$12$u9o/LNnej2DHIj8A2ltOo.J4ouFkFrZrdN0sa0A8z0tdiWcXXOFT6', 'true', 'true');

--email = slavko.egaric@email.com password = 6007
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Slavko', 'Egarić', 'slavko.egaric@email.com', '$2b$12$bqwsNlqQ/tb5ybkgWWyuauusDJ64araFbGGo9mcFOZAb1EMBYVdBW', 'true', 'true');

--email = tanasije.fustic@email.com password = 9170
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Tanasije', 'Fuštić', 'tanasije.fustic@email.com', '$2b$12$0MeOV1mReW/kGtCewh/tx.VAahG.o0Cm4K4HwGhgqRa8pnFOD737m', 'true', 'true');

--email = djura.terzic@email.com password = 8299
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Đura', 'Terzić', 'djura.terzic@email.com', '$2b$12$eqeOjZh0iTSdIJnsJLbnXu0SkILD.wTs1zjK3x7WBhfBETihEharm', 'true', 'true');

--email = leposava.buzdokic@email.com password = 5321
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Leposava', 'Buzdokić', 'leposava.buzdokic@email.com', '$2b$12$ySROdnoYHDunYXtK0t.6U./9QKWIM/bktyJvuOeMIO2vs0byRCWP6', 'true', 'true');

--email = mateja.milesic@email.com password = 7741
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Mateja', 'Milešić', 'mateja.milesic@email.com', '$2b$12$iDkfuIbLq1yQqKQ6yXTPV.1KbWNX2dv0Jh1A5VG7Y.Bfkn8rjB7/G', 'true', 'true');

--email = cvetko.aguridic@email.com password = 6274
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Cvetko', 'Aguridić', 'cvetko.aguridic@email.com', '$2b$12$oFPmY3DYNXeHFlSjqUYnv.yVLssZUgCJoty4EmBS3eISzKizvBGGq', 'true', 'true');

--email = stamenko.dornic@email.com password = 5180
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Stamenko', 'Dornić', 'stamenko.dornic@email.com', '$2b$12$JJj3mswrBDdtO20VNU8TD.iRk.x.CVg9wikv8Be5r1YX4XlbccGAC', 'true', 'true');

--email = velimir.kukavcic@email.com password = 8246
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Velimir', 'Kukavčić', 'velimir.kukavcic@email.com', '$2b$12$9d2wIZdQ9lotYxYms96HY.wA9BIclOuCwOHVjk9j53DMauiNBZBoG', 'true', 'true');

--email = stepan.stegnjaic@email.com password = 7865
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Stepan', 'Stegnjaić', 'stepan.stegnjaic@email.com', '$2b$12$i.UtbsF9gWfJ53VDvxG5FOajLm4rKYCAiUdtjh7XGxskslMxlTg3u', 'true', 'true');

--email = andrija.buloscic@email.com password = 4125
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Andrija', 'Buloščić', 'andrija.buloscic@email.com', '$2b$12$TL6oXjOnL3zoShtD7BlogORm2IufWYtsrCdtoyibIfofBtbzMWsKq', 'true', 'true');

--email = nikola.setencic@email.com password = 5474
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Nikola', 'Setenčić', 'nikola.setencic@email.com', '$2b$12$iGQ472ykG23UduAjdbyXMe3a5e2lJNs3.jryFn3L9YtXBo9XIXjoW', 'true', 'true');

--email = bane.buduric@email.com password = 7170
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Bane', 'Budurić', 'bane.buduric@email.com', '$2b$12$mR5eU.giJGHrZHhRFzCYGO0AuE58Lxni5oQwu/i6.z1dhfro.DDQi', 'true', 'true');

--email = dobrasin.zinajic@email.com password = 2212
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Dobrašin', 'Zinajić', 'dobrasin.zinajic@email.com', '$2b$12$uDG8FyYi9QOtvt6NGGZqnewgQBmIBLeLOqs7W2IIFXPCuUbCy.fbq', 'true', 'true');

--email = veliborka.likusic@email.com password = 7733
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Veliborka', 'Likušić', 'veliborka.likusic@email.com', '$2b$12$GoxgMMv8bOMAb/TYG2dtUe2eGXE9i8tcxLh2c.WHdwZc1Qe5F1ZZi', 'true', 'true');

--email = jagos.milincic@email.com password = 3155
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Jagoš', 'Milinčić', 'jagos.milincic@email.com', '$2b$12$z8.iglYag5ZCs/4mkNc9nOtPdwwVGecpVQvtrGKCd3r2KQasddRNq', 'true', 'true');

--email = sandra.tosanic@email.com password = 6733
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Sandra', 'Tošanić', 'sandra.tosanic@email.com', '$2b$12$yAjE1QpfyzCvReoA4AVqK.BnrPd6DAXOF64xVPeNjPWnx5WVgFpV6', 'true', 'true');

--email = perka.krstonosic@email.com password = 1353
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Perka', 'Krstonošić', 'perka.krstonosic@email.com', '$2b$12$EcUDGiM/109JsOpwQYAxQu2UCGXA9Oqp67dyLUFnGdh0Dc49VVirO', 'true', 'true');

--email = miloje.jelenic@email.com password = 4946
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Miloje', 'Jelenić', 'miloje.jelenic@email.com', '$2b$12$4cw/I8cFqcS1zw0skwyS1ODaGw8Rlwq2fzG9d5rctZjXvsyMLkFMG', 'true', 'true');

--email = cviko.trekelic@email.com password = 4054
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Cviko', 'Trekelić', 'cviko.trekelic@email.com', '$2b$12$/XuCTURLQ7lG53RziTRHRORkG6rE2tduWIa3aRLQiPXSJJvxFxnZ6', 'true', 'true');

--email = mitar.malecic@email.com password = 8402
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Mitar', 'Malečić', 'mitar.malecic@email.com', '$2b$12$8T8paCUA7Dr6Dgu14TuT8O8.fRL9r9sqAcIIUbDcJqjdzyYeskWcW', 'true', 'true');

--email = spomenko.savicic@email.com password = 5480
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Spomenko', 'Savičić', 'spomenko.savicic@email.com', '$2b$12$C6652VdW8VnZXRt5lj0rwOv.yP940R8xSlo4DE7jcVswf8t4utbsm', 'true', 'true');

--email = doroteja.ivezic@email.com password = 4997
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Doroteja', 'Ivezić', 'doroteja.ivezic@email.com', '$2b$12$CM5o7dCnXx3DMCIyZwdvkeAf3UohsfA5Wu8.dKnqrVaR.R3mhRpAu', 'true', 'true');

--email = ozrenka.saronjic@email.com password = 6107
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Ozrenka', 'Šaronjić', 'ozrenka.saronjic@email.com', '$2b$12$YFodz4nMxJC5YW0/lm9O8OE4jJ1BpUjkRVYYS5pdNzQTipCuZrUWK', 'true', 'true');

--email = stojadinka.jercic@email.com password = 9374
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Stojadinka', 'Jerčić', 'stojadinka.jercic@email.com', '$2b$12$CJfERpd.K5P4DYMlKTY/B.Hv9eyjPzRUJSoG0YeoFKbHStjEi6h3e', 'true', 'true');

--email = radenko.sosic@email.com password = 3944
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Radenko', 'Šošić', 'radenko.sosic@email.com', '$2b$12$SQXUukd3Rf77nHUSJHngauPzVd7IkqObbPB./G.bW7bbGR7EKUVfy', 'true', 'true');

--email = andjelko.alicic@email.com password = 4972
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Anđelko', 'Aličić', 'andjelko.alicic@email.com', '$2b$12$ESzxU0IFxDm4Kz1qjWhzOurSbsn8Vv22N9gtVbj2YNCcpB9DQFbrS', 'true', 'true');

--email = andja.rabadzic@email.com password = 4708
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Anđa', 'Rabadžić', 'andja.rabadzic@email.com', '$2b$12$vyHKwP06HO1d/VIWDeW7teKRrd9YoW/4yHVDVQVGLmguqztdHctTi', 'true', 'true');

--email = stojadin.okulic@email.com password = 8663
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Stojadin', 'Okulić', 'stojadin.okulic@email.com', '$2b$12$fMF3pU/N5EC9gA34RiFGNu0ktIMIH0vz8L9MqVnPKikJW1S5Q4gAG', 'true', 'true');

--email = selena.sulkic@email.com password = 4455
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Selena', 'Šulkić', 'selena.sulkic@email.com', '$2b$12$WQVGIEYj6PgSERw73IH3Vey95SEr8Pk59GUCGgObIfyiTlZ8a9zWi', 'true', 'true');

--email = trajanka.zikic@email.com password = 8414
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Trajanka', 'Žikić', 'trajanka.zikic@email.com', '$2b$12$eAacQk2wjpbUY0WdCzENYu3woBOjuRG6tgQRM1hS01NgJxfGN8NAG', 'true', 'true');

--email = mijat.komnenic@email.com password = 5441
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Mijat', 'Komnenić', 'mijat.komnenic@email.com', '$2b$12$5S4vMMqJsVk743gESPYJbOnQWKS0r315wD9HW2wcLI1MNdpwijJMq', 'true', 'true');

--email = milijan.selinkic@email.com password = 3084
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Milijan', 'Selinkić', 'milijan.selinkic@email.com', '$2b$12$HCtT/.sOYknaYLwI3QoSfuGg/ZAsvNf9pkMybyPdff05t75oLHTie', 'true', 'true');

--email = filiman.mirjanic@email.com password = 7248
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Filiman', 'Mirjanić', 'filiman.mirjanic@email.com', '$2b$12$UZ1A4l1RFsBsaXIvWlGoa.pURWSLqIXMVI4iaibD7DNp3jpYHej2G', 'true', 'true');

--email = slavko.lisicic@email.com password = 2772
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Slavko', 'Lisičić', 'slavko.lisicic@email.com', '$2b$12$UV4cVsDiEAqA9biwhV5iZentdPpG/mkO1lyE5LgqmsiLWn/W.UvOO', 'true', 'true');

--email = dubravka.gledic@email.com password = 8876
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Dubravka', 'Gledić', 'dubravka.gledic@email.com', '$2b$12$kTPpAfWZm.ADcZ9u2M5qa.45ZVegwsZAz3Ug6GEkSVKhGmmK4nkpe', 'true', 'true');

--email = vukasin.nevenic@email.com password = 5787
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Vukašin', 'Nevenić', 'vukasin.nevenic@email.com', '$2b$12$yoJfghE509nIcPZKaaNIGOsGNS2xWKEfbdxsBj34BkvsOWc8vjTDi', 'true', 'true');

--email = mladen.trosic@email.com password = 8058
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Mladen', 'Trošić', 'mladen.trosic@email.com', '$2b$12$2Sbe35JMnhn65I9G7OdlFe2TJ0kojD9XrQvAS8pGQikb4YUdHsDFK', 'true', 'true');

--email = simonida.ralcic@email.com password = 8657
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Simonida', 'Ralčić', 'simonida.ralcic@email.com', '$2b$12$Po50mi7RhMrM9k5C7UQHVuBiEuDmLUhd.Z0oPPcEAOUp.ZNnCUoby', 'true', 'true');

--email = ristivoj.djelkapic@email.com password = 3105
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Ristivoj', 'Đelkapić', 'ristivoj.djelkapic@email.com', '$2b$12$o3EeNlb/4geVhEwB2VjttOqPCq7S0hlr9zJJxZzBKLomdcE4FeHhy', 'true', 'true');

--email = cile.cekrlic@email.com password = 6711
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Ćile', 'Čekrlić', 'cile.cekrlic@email.com', '$2b$12$6oYyd7791u7RHR8s0J.lPeZISu4cKV7c4g4F/TrKoHaEu/GxkIxoi', 'true', 'true');

--email = vladislav.zinaic@email.com password = 9574
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Vladislav', 'Zinaić', 'vladislav.zinaic@email.com', '$2b$12$xfv6Y/JuCNsP5zhpZummtemiHS.V21C7qUD7dmoqrvFFjR46oJZO6', 'true', 'true');

--email = zlatibor.gojnic@email.com password = 4103
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Zlatibor', 'Gojnić', 'zlatibor.gojnic@email.com', '$2b$12$E7puEX6uWBCRAxwPmRh4gu4pqTNA65uDYNa7ROs3ogE1S2Sg40ma.', 'true', 'true');

--email = melentije.polic@email.com password = 7952
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Melentije', 'Polić', 'melentije.polic@email.com', '$2b$12$VI3vekt0GgOB8ge6Fs0Jd.1Y7RunU1SbXMXP6urqxOfnCD6SHKnfK', 'true', 'true');

--email = mateja.kosoric@email.com password = 2919
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Mateja', 'Kosorić', 'mateja.kosoric@email.com', '$2b$12$Ex9OOqnzNU2ZB48tZc.Y9e/1bu1ImIhNvod/N68V25RuyDJA.Bohe', 'true', 'true');

--email = stanoje.canic@email.com password = 7258
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Stanoje', 'Canić', 'stanoje.canic@email.com', '$2b$12$jwOkxI2GpVPL1gcDTuQFcOzW7tRZV8A0H62/NpNDTO4Ou.Tt.U0Q2', 'true', 'true');

--email = mijalko.pacaric@email.com password = 5648
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Mijalko', 'Pačarić', 'mijalko.pacaric@email.com', '$2b$12$0SFk4ePzUzuEVLe5TcUHIOCgjzIqEjRS8ijAy0XvwRaxU.lov231a', 'true', 'true');

--email = ljuban.pavlicic@email.com password = 6279
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Ljuban', 'Pavličić', 'ljuban.pavlicic@email.com', '$2b$12$iKb0Pf6w2HUS2pIZ6cK/mOgRis5AB2cHdlfwERQguJxZK5EOaVAsm', 'true', 'true');

--email = caslav.vojkic@email.com password = 3374
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Časlav', 'Vojkić', 'caslav.vojkic@email.com', '$2b$12$BrPJVQO2ojGDR163OIZjgeOeDhb.85ubkZqW52sc2Wt.etrqpBW6e', 'true', 'true');

--email = slavna.mirnic@email.com password = 2902
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Slavna', 'Mirnić', 'slavna.mirnic@email.com', '$2b$12$OAJLEyyWxOM///qh6SwnG.SEIxzlIjHqUYsboQQjPbHofcx7F3F5m', 'true', 'true');

--email = margareta.lepetic@email.com password = 4858
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Margareta', 'Lepetić', 'margareta.lepetic@email.com', '$2b$12$ivjT5ejo21YMiRjWFTGRkeIyQUXufwa93zBIeKt6D..lylNos6nmG', 'true', 'true');

--email = krsman.grgulic@email.com password = 9161
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Krsman', 'Grgulić', 'krsman.grgulic@email.com', '$2b$12$k/y0axlGrMWRIiwe.dznaugUgLFLjUMJRyTLXl2tq0fhWipAPWiC2', 'true', 'true');

--email = krsman.navalusic@email.com password = 4087
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Krsman', 'Navalušić', 'krsman.navalusic@email.com', '$2b$12$9MhV6AD12MdkLDk6t.jqYeHpkeRv1ISLAgIt2LA14M3hZnnjiaHEm', 'true', 'true');

--email = novak.jakic@email.com password = 8015
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Novak', 'Jakić', 'novak.jakic@email.com', '$2b$12$z5tfS4YAYOekOaOg2YLyKOTfABQMskqfa37A86QIGQKjthptYzJsy', 'true', 'true');

--email = milesa.stakic@email.com password = 4310
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Milesa', 'Stakić', 'milesa.stakic@email.com', '$2b$12$kPsACfD9uM7gMNhXT55Mr.1ltAqPlPG1LzDPBimEXYXOg3XH8Atza', 'true', 'true');

--email = dragan.janojkic@email.com password = 9771
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Dragan', 'Janojkić', 'dragan.janojkic@email.com', '$2b$12$2kGITz2hlSBNT33FFR1nFet0UfXdP1GHjeHKi9CCNUCharYEyRf0i', 'true', 'true');

--email = dragomir.kragic@email.com password = 7004
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Dragomir', 'Kragić', 'dragomir.kragic@email.com', '$2b$12$Qe1chvcJhZrJGM2k1xNafeoO56KhQEAn8NCSKmJ47gr/HCSiAHviq', 'true', 'true');

--email = mihailo.pikulic@email.com password = 2439
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Mihailo', 'Pikulić', 'mihailo.pikulic@email.com', '$2b$12$.LvWEzOyiMZsEnyG51U5f..Tg0Ke8LAti3JWN8YS7IyBTFSFImIqi', 'true', 'true');

--email = goran.dorongic@email.com password = 7391
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Goran', 'Dorongić', 'goran.dorongic@email.com', '$2b$12$I1KCSzTz6IrzewUQzieenOHdMMvMZ13.AMjbrWmXIReLhwbl1Yira', 'true', 'true');

--email = jovan.milkic@email.com password = 4713
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Jovan', 'Milkić', 'jovan.milkic@email.com', '$2b$12$hcxkR8alyHOYI.eybwRwpOWv/4W9X3ljlO1oMo4z1f3vM6/MqDROK', 'true', 'true');

--email = lepomir.vuksic@email.com password = 6848
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Lepomir', 'Vuksić', 'lepomir.vuksic@email.com', '$2b$12$Jm7ltN2XewQpAkfJfZiX7OoCC/wPtv7GkxRlyzZ5HQgsDeH.6JjQC', 'true', 'true');

--email = ivanka.catic@email.com password = 8591
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Ivanka', 'Ćatić', 'ivanka.catic@email.com', '$2b$12$2eRXYm5GzChOntC2Za584OqXBR9.370dRU/246zVdi6s1SB1cxMvC', 'true', 'true');

--email = vukosav.mladic@email.com password = 6931
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Vukosav', 'Mladić', 'vukosav.mladic@email.com', '$2b$12$xlVLo5qLZHinsEfZNoZ24eYUPM2dcao5ouYwY5JfjzborZs/NCc3a', 'true', 'true');

--email = randjel.folic@email.com password = 6099
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Ranđel', 'Folić', 'randjel.folic@email.com', '$2b$12$iRoA3IHAMp5e9KvBQDP.1elhfeBNi5CFBDdXTYp.u4IVMT4Y/2kkG', 'true', 'true');

--email = dejan.poljcic@email.com password = 3027
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Dejan', 'Poljčić', 'dejan.poljcic@email.com', '$2b$12$deteyn4nhhs8liy9XFV7NOKDH8ng3EciXvs1kIsCRUVALe2gD2uRC', 'true', 'true');

--email = simka.celeketic@email.com password = 5390
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Simka', 'Čeleketić', 'simka.celeketic@email.com', '$2b$12$nVDvEMPC09/mv4iM1bdJde4i9J6qDhRKsOk1rzwk64ZekNRayOOL6', 'true', 'true');

--email = tasko.zigic@email.com password = 4548
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Taško', 'Žigić', 'tasko.zigic@email.com', '$2b$12$bvvPjRhfmeMxlcAAIQr0L.dZ3x0T5Qwhzg28Q9C.1eorTmK9Z.OFu', 'true', 'true');

--email = milanko.niksic@email.com password = 3128
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Milanko', 'Nikšić', 'milanko.niksic@email.com', '$2b$12$YUvNErkQs.PjMZosd8uVaOXdYSKBYH80FP7T1x1vIggxA.qvfuiEu', 'true', 'true');

--email = zarko.sataric@email.com password = 3307
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Žarko', 'Satarić', 'zarko.sataric@email.com', '$2b$12$1DtSmJp4WuExfbLMUxpmQe/CXo3Gh6JXNLwSm00XRPeTr4lE07OGK', 'true', 'true');

--email = ratko.ranisavic@email.com password = 7090
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Ratko', 'Ranisavić', 'ratko.ranisavic@email.com', '$2b$12$AsN1FLPCn40q/DCdlLAoyuSvMgCVXLXTC8EoJu5.8AZBzZZmb76R6', 'true', 'true');

--email = grigorije.malencic@email.com password = 2054
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Grigorije', 'Malenčić', 'grigorije.malencic@email.com', '$2b$12$wSeABrt/nIBfiRsx7.zl9OvSRfBaHfi0RRqDB32WAJTPljwRwGKWe', 'true', 'true');

--email = jelenko.stanacic@email.com password = 2128
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Jelenko', 'Stanačić', 'jelenko.stanacic@email.com', '$2b$12$tkXydgusWqoArETgKzaVcucZt/WS38KG61qTZzQDXaN4a3WHKkXwa', 'true', 'true');

--email = zorka.dincic@email.com password = 7012
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Zorka', 'Dinčić', 'zorka.dincic@email.com', '$2b$12$PkoK9UtUQxj4zQLBtwWPZ.iVhX6fxP/FP9mec0oVwNc/dSnkp7zsK', 'true', 'true');

--email = kuzman.rabadzic@email.com password = 6405
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Kuzman', 'Rabadžić', 'kuzman.rabadzic@email.com', '$2b$12$6SjZtAasPDLCQ0RZUMx2zOklukJ.ZYooL7qHnk1EctMTpQkOsgswW', 'true', 'true');

--email = prvoslava.rokic@email.com password = 8235
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Prvoslava', 'Rokić', 'prvoslava.rokic@email.com', '$2b$12$3JKFKyoH6BPyyPH4vWjbiej1c5PB1N76aZicU9xP/n.CKMBM8mGH2', 'true', 'true');

--email = djoka.jokicic@email.com password = 4937
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Đoka', 'Jokičić', 'djoka.jokicic@email.com', '$2b$12$ibdIf9X4BFLSNH.MCDoVe.nKZt/0YwMlp8bZVllmxabU4qD2eCUfm', 'true', 'true');

--email = lena.krompic@email.com password = 2040
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Lena', 'Krompić', 'lena.krompic@email.com', '$2b$12$MHVx07RBsmUytqi.j2jdyOP1DzojbdC9Xk029AG8ko4njqLXFWFmm', 'true', 'true');

--email = ugren.cavnic@email.com password = 1042
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Ugren', 'Cavnić', 'ugren.cavnic@email.com', '$2b$12$zFJXwr.Bl6zKqVP/.f3SKexYpCOscoPFm24B7oDVvadjQpLhgLsUK', 'true', 'true');

--email = andjelija.plesic@email.com password = 9453
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Anđelija', 'Plešić', 'andjelija.plesic@email.com', '$2b$12$BK73LOK25GPmGu3syIXjp.AJaO2N9FqTx9sIIF/eOpU9m8.VWMZ6S', 'true', 'true');

--email = gaga.garalejic@email.com password = 2427
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Gaga', 'Garalejić', 'gaga.garalejic@email.com', '$2b$12$wlMFoqrwRCNwS1hFl/vuuOkIgNmyQV76SyoV7givPiFUYIkNNxC2u', 'true', 'true');

--email = milentije.andesilic@email.com password = 2990
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Milentije', 'Andesilić', 'milentije.andesilic@email.com', '$2b$12$9obvPmfwkjZXwXHuYVE/HO1Xrg/kWf/q5dfXmNOONkJXm6IRgJKze', 'true', 'true');

--email = stojana.surlic@email.com password = 4957
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Stojana', 'Surlić', 'stojana.surlic@email.com', '$2b$12$6BFrynoKNx4Ej8JcIQirEOiTmBsbFFDErYIo9EMDgZRgZTz1jeQ.e', 'true', 'true');

--email = zlatica.deletic@email.com password = 2432
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Zlatica', 'Deletić', 'zlatica.deletic@email.com', '$2b$12$cEU3YeP.nvZXeqKQC.o.O.2T4X9QIDwWZ5sYvLooAgvkBXqM0m12O', 'true', 'true');

--email = cvijan.sindjelic@email.com password = 3636
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Cvijan', 'Sinđelić', 'cvijan.sindjelic@email.com', '$2b$12$.cxRR1RmKuWdafgAsovtuOWvXrRssC0OdSD3DD3QRBEhA.1W5pjfW', 'true', 'true');

--email = cviko.trific@email.com password = 4675
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Cviko', 'Trifić', 'cviko.trific@email.com', '$2b$12$ITkrs9uCazifCiTeWVBkGOL7JUtumXierCnrQYqxfMWe7AbCnIGvC', 'true', 'true');

--email = tiosav.brezonic@email.com password = 8479
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Tiosav', 'Brezonić', 'tiosav.brezonic@email.com', '$2b$12$ogJSjc6kP5Cof5Q.dueWzuzBDYdNf2aE4j84UsM7H43zEP99AlX4a', 'true', 'true');

--email = djurica.lilic@email.com password = 8634
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Đurica', 'Lilić', 'djurica.lilic@email.com', '$2b$12$5oab3q8WqSidv4rPO3QuV.OTbSjjChZb8w81j39Jdg9LPsYfQYYYm', 'true', 'true');

--email = leontijr.cvokic@email.com password = 6739
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Leontijr', 'Čvokić', 'leontijr.cvokic@email.com', '$2b$12$4dY2gnatBaLkr9wfLG9T6.sQDq9ECq0ww4w2MEJshh2x3AFYbme/C', 'true', 'true');

--email = andjelka.tomcic@email.com password = 7750
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Anđelka', 'Tomčić', 'andjelka.tomcic@email.com', '$2b$12$pWGpH.bkk62bffy6EuL4MuIDmmAH1WPYTAvX9cf4XYnKm29tX44R.', 'true', 'true');

--email = bosiljka.jegdic@email.com password = 1376
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Bosiljka', 'Jegdić', 'bosiljka.jegdic@email.com', '$2b$12$kHUpE.Xp20McURbSVa1LEu8Ft8BJLB1azS0n4G.5Wve4DmG9lqCma', 'true', 'true');

--email = petronije.anicic@email.com password = 5509
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Petronije', 'Aničić', 'petronije.anicic@email.com', '$2b$12$LxdZ1Qur1M.z5i6hTfvWPePRECbbKfHVPnp2hU8XV8h.lRnHzKxoO', 'true', 'true');

--email = acim.dobranic@email.com password = 9685
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Aćim', 'Dobranić', 'acim.dobranic@email.com', '$2b$12$8OiaTKLLJFaZFkkkpXsMTO6pC8Wn5MzIb4BwNA2Xt7xcYC8yQC6Bq', 'true', 'true');

--email = miladin.draskic@email.com password = 3313
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Miladin', 'Draškić', 'miladin.draskic@email.com', '$2b$12$t.tDwLuZK1Ohj6CBlEWlIO25QBm2tIk3Ngis.S1PxGHcwzMGgJp5W', 'true', 'true');

--email = prerad.tojagic@email.com password = 5827
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Prerad', 'Tojagić', 'prerad.tojagic@email.com', '$2b$12$4piyM6qgDLFzmoMXQyLUV.ZDxzFFW3u3z2A.ZfYONh34uSJL.xpmW', 'true', 'true');

--email = tanasije.bidzic@email.com password = 7579
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Tanasije', 'Bidžić', 'tanasije.bidzic@email.com', '$2b$12$fm89An9VyP1imMqant6AsuT1DR2qU/vMqNxEPLy0z2cIOmAElv5qi', 'true', 'true');

--email = djurica.simisic@email.com password = 5680
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Đurica', 'Simišić', 'djurica.simisic@email.com', '$2b$12$819BiGj/jwoFAJb3Zrwhtu6ra9sg0/8FQpypZ/aLzoIK0tOlAG3K6', 'true', 'true');

--email = pava.terentic@email.com password = 4709
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Pava', 'Terentić', 'pava.terentic@email.com', '$2b$12$YJFnLOzEibrv96fdBGs2g.c6ilVF4QRmatnlCltMfKdbpGNvx/hN6', 'true', 'true');

--email = momcilo.mitrovcic@email.com password = 5770
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Momcilo', 'Mitrovčić', 'momcilo.mitrovcic@email.com', '$2b$12$E7v6a4pUVpJ17XcVpz3ESuJfVD886T4c8UjGHVklGT0lJjW.ksaHm', 'true', 'true');

--email = cuba.arsekic@email.com password = 8028
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Ćuba', 'Arsekić', 'cuba.arsekic@email.com', '$2b$12$KQZ3lY5sm8gwdfPLcCgArObXfowpIxJonkZHdo9KzqSbFR46JKATC', 'true', 'true');

--email = sako.rutonic@email.com password = 8088
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Šako', 'Rutonić', 'sako.rutonic@email.com', '$2b$12$Ed3ZwuHA9qtPpnSr8zCiBuWiAPwYWtZ2TauB/GNOerA1JNbdo6eI.', 'true', 'true');

--email = dragojlo.radic@email.com password = 4262
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Dragojlo', 'Radić', 'dragojlo.radic@email.com', '$2b$12$8pGEtAHX7DrkDYJz1g.obu6B995eHxq3OgzYmTFIEu6luKnZByoOa', 'true', 'true');

--email = lela.eskic@email.com password = 2718
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Lela', 'Eskić', 'lela.eskic@email.com', '$2b$12$hFg.WGHeyHi4/VpCNzytHOy.8MgUp0EQ4pEpPaI/qI6HCt2DZVzb6', 'true', 'true');

--email = mirko.burcic@email.com password = 3421
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Mirko', 'Burčić', 'mirko.burcic@email.com', '$2b$12$5ujS2Hs1HU3jv2g814ipu.H8F085jdAil1LILNuYtyo9gY9EOqSY2', 'true', 'true');

--email = simonida.toplicic@email.com password = 1821
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Simonida', 'Topličić', 'simonida.toplicic@email.com', '$2b$12$cHsAKoSOuApvB.plIIYVt.ApW1Y3yBdAJfo5PnKo6XGOwcmQK3kIO', 'true', 'true');

--email = kojadin.sopic@email.com password = 9962
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Kojadin', 'Sopić', 'kojadin.sopic@email.com', '$2b$12$s5X.3X/mooRWq/gC5hTem.z6vl5C7GIhZsKMmAEBS8hJIACa19OYa', 'true', 'true');

--email = cetko.pevalic@email.com password = 1495
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Ćetko', 'Pevalić', 'cetko.pevalic@email.com', '$2b$12$E37om17c.O39p9Q3jS1JFuQu.wxAAz/SqwcFFp3uwY2haRjVjlbnS', 'true', 'true');

--email = velibor.kusic@email.com password = 6019
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Velibor', 'Kusić', 'velibor.kusic@email.com', '$2b$12$BIZBrc6WvtpaRolxBmOmDumCKi2MtXjrQ4f99gd9au8F.6NjaiwlG', 'true', 'true');

--email = bisenija.lovric@email.com password = 6952
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Bisenija', 'Lovrić', 'bisenija.lovric@email.com', '$2b$12$g90Hu8MEXCIU4YKmnNjSje3VHTnH6ziwHv1hwRjTjeg/I4AolakT.', 'true', 'true');

--email = despot.baric@email.com password = 3780
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Despot', 'Barić', 'despot.baric@email.com', '$2b$12$jPoR/OtKrFedGklDv7UzqeXWGObBZGvM3shlXXsNYsriLssJ1Ayla', 'true', 'true');

--email = kamenko.perkic@email.com password = 4706
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Kamenko', 'Perkić', 'kamenko.perkic@email.com', '$2b$12$hJgG.Xt8m4rH6UlObb1yEO587nmgd7j81b1ZRmBk2axusuYtKqH1G', 'true', 'true');

--email = zivko.kutlasic@email.com password = 7816
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Živko', 'Kutlašić', 'zivko.kutlasic@email.com', '$2b$12$E70MSIHmLuctr2YSlMQyhOgsJzCs8Rv1FubBGcZN.CaNYuvMDKoQO', 'true', 'true');

--email = stanimir.raducic@email.com password = 4716
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Stanimir', 'Raducić', 'stanimir.raducic@email.com', '$2b$12$tu3UFMJBf.HiJcDxvCtKE.QDh3/Ju0IKre.D4pqrqPWR1VjhJbicm', 'true', 'true');

--email = tomislav.alimpic@email.com password = 6317
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Tomislav', 'Alimpić', 'tomislav.alimpic@email.com', '$2b$12$uPAdOcqjEiqQn593/HjS/Od/rwjbRczykLwL/3vyD4sASdLa3oleG', 'true', 'true');

--email = jana.zugic@email.com password = 3816
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Jana', 'Žugić', 'jana.zugic@email.com', '$2b$12$t9LlaFfmiy9ypL0LZR0WdO2x4X4TuekGyZvOMv0wMU62rnJENbMXS', 'true', 'true');

--email = lena.caloveic@email.com password = 6830
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Lena', 'Čaloveić', 'lena.caloveic@email.com', '$2b$12$SALcifMLLuB1qMbDj/kLBOxtWSCvlNiLs578KTvG8Css6Rt72x4b6', 'true', 'true');

--email = dobrosav.grubic@email.com password = 7191
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Dobrosav', 'Grubić', 'dobrosav.grubic@email.com', '$2b$12$Z75.JUCPdXn/hvXPOwIYj.OSM7JDuyytAz.z0kOLLS0Ad/SmnAeYO', 'true', 'true');

--email = marjan.guberinic@email.com password = 8821
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Marjan', 'Guberinić', 'marjan.guberinic@email.com', '$2b$12$qu/HKTpknzQqnJdwAglF9eMyxZ4DV3LS1u7u2mMySZtDtIhbwE0n2', 'true', 'true');

--email = helena.brezic@email.com password = 3057
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Helena', 'Brezić', 'helena.brezic@email.com', '$2b$12$rOzD/F4vtP1/Y3ECjQZEleLlUYVqjGfCSwMbEkXE2fUaFmCjE1iWW', 'true', 'true');

--email = radoljub.sparic@email.com password = 2830
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Radoljub', 'Sparić', 'radoljub.sparic@email.com', '$2b$12$edDYQnQcD34ot8aJayZqsOIKWvuie2.SlEhQeIW/esSUOtooMXhjK', 'true', 'true');

--email = latinka.magdalenic@email.com password = 7850
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Latinka', 'Magdalenić', 'latinka.magdalenic@email.com', '$2b$12$hFjAN4UvfhUgAPKaK6BJMO4SsiJu.aswEFgnk9OvwfP4acQ.PRIUi', 'true', 'true');

--email = tomislav.stijepcic@email.com password = 1830
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Tomislav', 'Stijepčić', 'tomislav.stijepcic@email.com', '$2b$12$DzfYtmAZF6ovBhx/psv7uu86gZtOl8ZXB9JcW7JxjfvjYWU/d3XcG', 'true', 'true');

--email = ranka.folic@email.com password = 6477
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Ranka', 'Folić', 'ranka.folic@email.com', '$2b$12$vGlKQKj7FQGuNiRXNdpf0Oi5UyrUyUiArfYmg4ZQ8.m0pjlxxxvsq', 'true', 'true');

--email = stefan.nozinic@email.com password = 9263
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Stefan', 'Nožinić', 'stefan.nozinic@email.com', '$2b$12$AyMNaCzbgKkzIj62.3WHeOeZjVHMTur0fxIQH8IRD2GtQrTE7.Shi', 'true', 'true');

--email = srboljub.stajkic@email.com password = 3985
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Srboljub', 'Stajkić', 'srboljub.stajkic@email.com', '$2b$12$C16O132aNVO/NOO8uooGre7SPMAQdqharjyT2m/4tErrStdOrGUyK', 'true', 'true');

--email = vuksan.mirotic@email.com password = 1622
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Vuksan', 'Mirotić', 'vuksan.mirotic@email.com', '$2b$12$nf4JfcG2kS6/i0Kz2fli7e6VICEzwTgd2EzvwKXmMgZfnBwelvQcu', 'true', 'true');

--email = una.lambulic@email.com password = 3475
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Una', 'Lambulić', 'una.lambulic@email.com', '$2b$12$GanekTm2swPaNkGGEXGzHuJ5Prkc6XH9o3pUEYAaI4C2tkxqhidWW', 'true', 'true');

--email = andjelka.patric@email.com password = 4837
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Anđelka', 'Patrić', 'andjelka.patric@email.com', '$2b$12$p39dyioqgpAZVP10ywv8.Oor0yetD6GuDOgIw6ZHGMr3F79FDB8Iq', 'true', 'true');

--email = ivan.bibic@email.com password = 6043
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Ivan', 'Bibić', 'ivan.bibic@email.com', '$2b$12$Nl5dGCL8mVFhk.eCck5d7eHfay3.WPPNTgjWAqiBXd0ilG76iJuuG', 'true', 'true');

--email = punisa.pandzic@email.com password = 8235
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Puniša', 'Pandžić', 'punisa.pandzic@email.com', '$2b$12$Oa2ZLQ.IBRX3.MZwToBoDO9I4uYhkX7DbIg7DBRLsmY5ksdw5k65i', 'true', 'true');

--email = rastko.niketic@email.com password = 9918
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Rastko', 'Niketić', 'rastko.niketic@email.com', '$2b$12$inb2B9Fd9rMATR5SMwMo3OXLZijMPzYQefQ5etm9TvHZdjgPtNoE2', 'true', 'true');

--email = dusanka.pribic@email.com password = 8955
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Dušanka', 'Pribić', 'dusanka.pribic@email.com', '$2b$12$f71rovOLkNLirORCUczKAO8JLzR36dttV6hoVJ5CtK1uNzinUP5wC', 'true', 'true');

--email = irena.bulakic@email.com password = 9334
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Irena', 'Bulakić', 'irena.bulakic@email.com', '$2b$12$Ud0aSUHIQe5HPqoqDTqLL.6vWVbj8HPDxIDwew2ztl1vw0fV2usve', 'true', 'true');

--email = vukica.ostojic@email.com password = 5152
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Vukica', 'Ostojić', 'vukica.ostojic@email.com', '$2b$12$iTI0y3Zjikc489M6vpZK1eSP.Bff..dfqRn29xwKE/xz1DT9K/I/.', 'true', 'true');

--email = zivanka.zerajic@email.com password = 4501
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Živanka', 'Žerajić', 'zivanka.zerajic@email.com', '$2b$12$vUd2IsJro94svkM388UTI.uC7zcFjxVwpkO5OTgUibtEEWHFSI4.6', 'true', 'true');

--email = vidosava.dragincic@email.com password = 1733
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Vidosava', 'Draginčić', 'vidosava.dragincic@email.com', '$2b$12$//OJ2kSLdw4JoDv8.ywrnOnKtAbnGs5ahhzUnB02QtOSKvheBc80O', 'true', 'true');

--email = pantelija.bacotic@email.com password = 9918
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Pantelija', 'Bacotić', 'pantelija.bacotic@email.com', '$2b$12$FAxH83HwKxQhMHYe2pFZjeOHwOv0L.upxqFHyUcdaG2WbwQWHYc3S', 'true', 'true');

--email = jovan.brodalic@email.com password = 2945
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Jovan', 'Brodalić', 'jovan.brodalic@email.com', '$2b$12$Bc6YDuU56fz21hOvnl1aIOhL2kmsNyLl08BxKuqOFwylcu7udTpey', 'true', 'true');

--email = trivun.bjeletic@email.com password = 3500
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Trivun', 'Bjeletić', 'trivun.bjeletic@email.com', '$2b$12$0anndK39.RR81EAl8UDM8.GWF5w4ErT9rpVO6gNgmbU8cto88X.mq', 'true', 'true');

--email = jelena.taricic@email.com password = 9864
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Jelena', 'Taricić', 'jelena.taricic@email.com', '$2b$12$ACzYN/0ummQdL/zmyZ6R8OdDjBpQ3g7EKVZtDVMIgYt4RcswiD4Xq', 'true', 'true');

--email = milojko.tatic@email.com password = 8053
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Milojko', 'Tatić', 'milojko.tatic@email.com', '$2b$12$1dBnhVYfy/AwPzFp6kIPU.oqki4D29NowUhXevlMBRFyaA1jDMtpW', 'true', 'true');

--email = djuradj.blagic@email.com password = 6200
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Đurađ', 'Blagić', 'djuradj.blagic@email.com', '$2b$12$pYweep/T8ypleCLX7Vlyq.nslJF6TadrjUx5csD5nQ7Fhsq6JAuq2', 'true', 'true');

--email = bane.garabandic@email.com password = 4434
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Bane', 'Garabandić', 'bane.garabandic@email.com', '$2b$12$8vLskecYsiCGOS9.pvx/D.IdUWlPdgewvJsT0OQKrTUlRfl31XFcW', 'true', 'true');

--email = jefimija.pejdic@email.com password = 6805
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Jefimija', 'Pejdić', 'jefimija.pejdic@email.com', '$2b$12$9QRmoBn.05q1KFbAaZN4d.MImVLE4CNJ4/Ms/6/dQw.MGfCgZlo8C', 'true', 'true');

--email = vladanka.zatezic@email.com password = 8650
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Vladanka', 'Zatežić', 'vladanka.zatezic@email.com', '$2b$12$Q1ObkOS22XDlE98pCDPaQuweQ4YdEJG5pHf4gvARlu0Ntu9m51Pzm', 'true', 'true');

--email = filiman.dornic@email.com password = 6667
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Filiman', 'Dornić', 'filiman.dornic@email.com', '$2b$12$632zLGZn86uaUt6B8xp0CujUeavZXEnIrm6PtGutlvRENKw/DIi62', 'true', 'true');

--email = zlatko.sevarlic@email.com password = 9229
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Zlatko', 'Ševarlić', 'zlatko.sevarlic@email.com', '$2b$12$tAF6hum4CQuR1Idq6f4djOkuXT9l0O6qF9SbGh2/RGzqcgC7owwU6', 'true', 'true');

--email = prodan.terzic@email.com password = 1293
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Prodan', 'Terzić', 'prodan.terzic@email.com', '$2b$12$P1M/.igmUbb9AWJHKK39ouEtmY1gO6oEAHTDbOfjOT/naCaNoSGyq', 'true', 'true');

--email = zivota.cickaric@email.com password = 4768
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Života', 'Čičkarić', 'zivota.cickaric@email.com', '$2b$12$FSvQcgGWqVc3oj.bBiXVbeMYxMov59AK7AMSSUThtzBC7TVeSqFBu', 'true', 'true');

--email = rajica.tesic@email.com password = 8110
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Rajica', 'Tešić', 'rajica.tesic@email.com', '$2b$12$ETX8XJLLfer45uT/R.C5qek3Uius0IjKnMSrFzVQulQ1GNsW0KwY.', 'true', 'true');

--email = biljana.jandric@email.com password = 1594
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Biljana', 'Jandrić', 'biljana.jandric@email.com', '$2b$12$jeoW1XhAXZQolmI0TZ0LEu30MAPRy1kczcq4W0LBv87qfbUjNIdXC', 'true', 'true');

--email = djuradj.grubljesic@email.com password = 6415
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Đurađ', 'Grublješić', 'djuradj.grubljesic@email.com', '$2b$12$TB5Iz.PJwZnpqO3A4hHtXe2R.DRkVDi7B7h2EaOocPDI8OmxlU4um', 'true', 'true');

--email = radenka.jovikic@email.com password = 8794
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Radenka', 'Jovikić', 'radenka.jovikic@email.com', '$2b$12$yJT5GnmS602bo2EwWrrmDuQg08NvpSgn9144lPfJ0MnT917dn6OJu', 'true', 'true');

--email = tamara.kukric@email.com password = 9061
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Tamara', 'Kukrić', 'tamara.kukric@email.com', '$2b$12$fU65aTXNVD/6VPLAWtxB/OzRw1XxdXemKe1XQUlhbt67XqIXI/4Hi', 'true', 'true');

--email = peladija.lekic@email.com password = 1293
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Peladija', 'Lekić', 'peladija.lekic@email.com', '$2b$12$B9cTIDCPth1G9qCsT3k6dOWzZPgQYIcMoGx5OecSod53tuZyR4wde', 'true', 'true');

--email = radul.bajcic@email.com password = 1861
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Radul', 'Bajčić', 'radul.bajcic@email.com', '$2b$12$0lWFYIxinC1zF.HTyjxnM.Mym7jKKiSpumz7B10HoJimsVL/0AuSG', 'true', 'true');

--email = aleksandar.karetic@email.com password = 4941
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Aleksandar', 'Karetić', 'aleksandar.karetic@email.com', '$2b$12$s65Q.zOcJUi1cvs27g8hseiTe6PmPUEbnZ7W76BlJ4vtRkjAT5Qee', 'true', 'true');

--email = momcilo.gruzanic@email.com password = 7116
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Momcilo', 'Gružanić', 'momcilo.gruzanic@email.com', '$2b$12$SYCwCdgzXohQLe3RvgOU/OmyiiV59cggXWbgONgSD2hcgmfmPp3qy', 'true', 'true');

--email = djuro.miloradic@email.com password = 7869
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Đuro', 'Miloradić', 'djuro.miloradic@email.com', '$2b$12$gDDTvxRPT/gQD5oAyegBiuIGLZjyYHXh4moVxuVDnqopg1hijL26q', 'true', 'true');

--email = egenija.palic@email.com password = 4141
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Egenija', 'Palić', 'egenija.palic@email.com', '$2b$12$hJ3Z7a.2u9qR1wwD4U7jKuB/xBgjt.eDFzC64wthlHf1EEmS5Z9My', 'true', 'true');

--email = dobrosav.misic@email.com password = 7829
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Dobrosav', 'Mišić', 'dobrosav.misic@email.com', '$2b$12$ViMN6.Q6FNhNibW1cm5Ca.R3HTkAEaPWPTj4pll6j6f2BI4kl7bI2', 'true', 'true');

--email = dobrilo.spurnic@email.com password = 1556
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Dobrilo', 'Spurnić', 'dobrilo.spurnic@email.com', '$2b$12$sQqT4okkk4.kQXbJv/M.we4bzAGMLqGxF3UMciRxlG4C44nCSiHU2', 'true', 'true');

--email = dragan.cipcic@email.com password = 8562
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Dragan', 'Čipčić', 'dragan.cipcic@email.com', '$2b$12$dyUrChTK.KBQ6UvEDFEIjOVPxRNqnEzXzP1bSiZ2ngz23FpQ45PK2', 'true', 'true');

--email = stojko.zepinic@email.com password = 6800
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Stojko', 'Žepinić', 'stojko.zepinic@email.com', '$2b$12$1Fp3L1b3wvBXss2Vj0blku6sHpTvE/s.ScAjebnEGvW/icdxI.smS', 'true', 'true');

--email = zivoslavka.rincic@email.com password = 6554
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Živoslavka', 'Rinčić', 'zivoslavka.rincic@email.com', '$2b$12$UELlzMA56oDP897GGb/ql.1L1SQvNHl4lxp.Vsh3RfYGnwejG.1nO', 'true', 'true');

--email = stamenija.selenic@email.com password = 2075
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Stamenija', 'Selenić', 'stamenija.selenic@email.com', '$2b$12$Twf8uQZNsU/vBGWCh/oV.ux8FimNNIHtivKAXgpoLaRORxHItjhJC', 'true', 'true');

--email = cvijo.cmolic@email.com password = 5702
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Cvijo', 'Cmolić', 'cvijo.cmolic@email.com', '$2b$12$4XNqae2t00BlykkWC1nivu0Dx4V5oZjEY//j1a1aC9DF7VT/QXmKm', 'true', 'true');

--email = radoslav.bosankic@email.com password = 6061
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Radoslav', 'Bosankić', 'radoslav.bosankic@email.com', '$2b$12$0wjgSDTK5zbimYEntYNi1uFRtIakJSddg15wucTJ3BUGKt/M9W4Q6', 'true', 'true');

--email = zorica.jolacic@email.com password = 6285
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Zorica', 'Jolačić', 'zorica.jolacic@email.com', '$2b$12$gd6529bTF8Ejbs1XkWhVnuDfL/PrmwpO8mxuSgR9QP94K./P3tHfC', 'true', 'true');

--email = selena.cipranic@email.com password = 6195
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Selena', 'Ćipranić', 'selena.cipranic@email.com', '$2b$12$fcM9HeftFljbKIUgkX8ZoudBEatw9VxswlqSapCG.5KRV.RdPDIHy', 'true', 'true');

--email = sofronije.risancic@email.com password = 4112
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Sofronije', 'Risančić', 'sofronije.risancic@email.com', '$2b$12$LxJvj6n0r3fVMSFQG73a3O7CsR7gDV.4SJPEVTIpRTPOxhzfxtCbC', 'true', 'true');

--email = jagoda.rajicic@email.com password = 5327
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Jagoda', 'Rajičić', 'jagoda.rajicic@email.com', '$2b$12$aMTOPKTUPFZSGqAHG7mLO.EgU6NzPHjOQRvwBGWwY1Zubv87hkgEC', 'true', 'true');

--email = snezana.ugljesic@email.com password = 2858
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Snežana', 'Uglješić', 'snezana.ugljesic@email.com', '$2b$12$.Pj3JuVAdXihfcRFukYpnO.TTNFENE/DH1DNrhxcXsezI647E6Viy', 'true', 'true');

--email = andjelija.vulezic@email.com password = 4482
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Anđelija', 'Vulezić', 'andjelija.vulezic@email.com', '$2b$12$aSsGxCL8KhZsnUpsO9h.pOc/gSmT/ZYrpwGbBlsfmj3NM.CKWB82i', 'true', 'true');

--email = zoran.vlajcic@email.com password = 4721
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Zoran', 'Vlajčić', 'zoran.vlajcic@email.com', '$2b$12$oUig4CujxB4NvP6vIttp0uuPO3DVoDhyY3Mq6xDmYnRCGPSDabYTm', 'true', 'true');

--email = nikola.karamucic@email.com password = 9312
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Nikola', 'Karamučić', 'nikola.karamucic@email.com', '$2b$12$vjDpEc..04/O4EeNL0hvSOcFhtMiz6oOAGIuM02ymGZHrVmNVJZaS', 'true', 'true');

--email = srba.lutkic@email.com password = 7303
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Srba', 'Lutkić', 'srba.lutkic@email.com', '$2b$12$Pd1swLEk0OH4IBleEOMoX.1eUXqjVDlS91/NhluAcWgMZLBuRDhn6', 'true', 'true');

--email = zora.dubic@email.com password = 4660
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Zora', 'Dubić', 'zora.dubic@email.com', '$2b$12$Zy4AbFTp8pUd7ahXh.8WmuAEB6FX..9fSJFYJRNLHExh2EtjZb9FW', 'true', 'true');

--email = hristina.paucic@email.com password = 8763
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Hristina', 'Paucić', 'hristina.paucic@email.com', '$2b$12$X7BxoGYb2V1xlDpWL7XY/.pyt/FEtxj1KfmUD0Q.M.RKkexxC2QHq', 'true', 'true');

--email = tiosav.stavric@email.com password = 5839
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Tiosav', 'Stavrić', 'tiosav.stavric@email.com', '$2b$12$jmBAriG/dOQXu3G5pvq5U.DqD/gda8C1MIG80ZXUHXy4w4/B5.EGq', 'true', 'true');

--email = branislava.ibrocic@email.com password = 9278
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Branislava', 'Ibročić', 'branislava.ibrocic@email.com', '$2b$12$p0Li5PR7qPRKyYy8Dq5mDeg1EFdz6KyAB0k8pHQVtfw7zZCikcU8e', 'true', 'true');

--email = javorka.trujkic@email.com password = 7750
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Javorka', 'Trujkić', 'javorka.trujkic@email.com', '$2b$12$wP43AP3pb5TQny1mZdab9eLb2NSfNN.mX0/voBTMLdE63NhAdby.y', 'true', 'true');

--email = stepan.vilendecic@email.com password = 3174
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Stepan', 'Vilendečić', 'stepan.vilendecic@email.com', '$2b$12$bfPYZuhQ26ld6Xo6fIiGxO46RI5Sms0UNPOOev.HHXhHbPoIWxmXy', 'true', 'true');

--email = dragojla.koranjic@email.com password = 5117
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Dragojla', 'Koranjić', 'dragojla.koranjic@email.com', '$2b$12$HhEgJZ5CfqKC5sB6RvX4MevUawWHhmI0p2CCtCoQdw6uBaYOEMiVS', 'true', 'true');

--email = suzana.cokic@email.com password = 9885
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Suzana', 'Čokić', 'suzana.cokic@email.com', '$2b$12$ORx04FDY9yqQT5E9FJUih.7OTxsIH1OqA70naBnKU85GPM2Oak.pG', 'true', 'true');

--email = vladeta.urzikic@email.com password = 4930
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Vladeta', 'Urzikić', 'vladeta.urzikic@email.com', '$2b$12$mQAzBzsZN9h.22LKzzFsQ.hB/ZocyHNMOIcZX.iQul2GQj5DNPX86', 'true', 'true');

--email = ivona.sajtovidzic@email.com password = 1621
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Ivona', 'Šajtovidžić', 'ivona.sajtovidzic@email.com', '$2b$12$mK7gjDnxcnDNAAjZxiqxcONg1LisKE7FiCjcNshLepINKdH08Hzne', 'true', 'true');

--email = damjanka.pasalic@email.com password = 5548
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Damjanka', 'Pašalić', 'damjanka.pasalic@email.com', '$2b$12$KPZ4pi29ienQzVKRGd9VLeVSg59YnquyK8DAz3HRIxmY0R2HhDdOa', 'true', 'true');

--email = tijana.mudrinic@email.com password = 3356
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Tijana', 'Mudrinić', 'tijana.mudrinic@email.com', '$2b$12$CfsmFKQB/r1/BRc73J.psOOYEQkSne2LrvNcLuZps3DrI4nOrvmli', 'true', 'true');

--email = hranislavka.vukolic@email.com password = 6339
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Hranislavka', 'Vukolić', 'hranislavka.vukolic@email.com', '$2b$12$WLiOVOgHCeaULgcTdPl9yOyKVcPnJW0Tbc4H9UM0XW3aZQjkODYMa', 'true', 'true');

--email = pajka.trivuncic@email.com password = 9720
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Pajka', 'Trivunčić', 'pajka.trivuncic@email.com', '$2b$12$ySU4A0heJLuHljOd.Kect.bJ5b.Bhl15oh3867yk8ezptRC1ZC2XG', 'true', 'true');

--email = hristivoj.aloric@email.com password = 9663
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Hristivoj', 'Alorić', 'hristivoj.aloric@email.com', '$2b$12$Y/ECM65cYEDQUAhYk6rlyeaBCHbNlew9TM3eWNOgdu1viEhLX9.du', 'true', 'true');

--email = ivo.sladic@email.com password = 1615
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Ivo', 'Sladić', 'ivo.sladic@email.com', '$2b$12$sd2Vvj64omCaYjHu/EptHOZ.yQ1ytUmJ32ry3p2x5JSnB3mU4i0.S', 'true', 'true');

--email = vlastimirka.pujic@email.com password = 2619
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Vlastimirka', 'Pujić', 'vlastimirka.pujic@email.com', '$2b$12$.2pZUJVpMJi1aOYQKK3eIO5/zm7u1XXmFXXngJk5CnqllPMprwJNy', 'true', 'true');

--email = prvoslavka.biseric@email.com password = 9996
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Prvoslavka', 'Biserić', 'prvoslavka.biseric@email.com', '$2b$12$zC98/9uhiNAQDH16In/.RuKUra5sHFqQep21OepbjcSyOfytXBo0W', 'true', 'true');

--email = radoslav.ekmedzic@email.com password = 9912
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Radoslav', 'Ekmedžić', 'radoslav.ekmedzic@email.com', '$2b$12$eI39BgbNB4.5HcjOGt.b/.C8e9ezs0zaytRfmecwnmc21SLiIVvZq', 'true', 'true');

--email = divna.tvrdisic@email.com password = 2298
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Divna', 'Tvrdišić', 'divna.tvrdisic@email.com', '$2b$12$4tKkHiTd8M.JI67pphYI0OGcdXVmukW4eerB1FzjvXQF0rKXRcaTO', 'true', 'true');

--email = stojko.radukic@email.com password = 8636
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Stojko', 'Radukić', 'stojko.radukic@email.com', '$2b$12$KBouOgM81qQQ4PDAuQtQx.XKwoyEGez5A9M72QBnduH8qc.M5fqgG', 'true', 'true');

--email = vojislav.mirjanic@email.com password = 4616
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Vojislav', 'Mirjanić', 'vojislav.mirjanic@email.com', '$2b$12$7f3hbbbBYifq8nH8tbeVR.jEMqMRjtSUZmLIA0LW3sfMUB/6m9tqy', 'true', 'true');

--email = srboljub.kozokic@email.com password = 4340
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Srboljub', 'Kožokić', 'srboljub.kozokic@email.com', '$2b$12$vYot7AkaV1pZa4mYl8n9ROfMeC1QWBB9CIK/DbyN0H.WYNzSnnOGa', 'true', 'true');

--email = filotej.kujundzic@email.com password = 6488
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Filotej', 'Kujundžić', 'filotej.kujundzic@email.com', '$2b$12$3mEhmHFi21s8HgBhhjJqguvvVC43wweMgvgAGIm3DcWTiVt469eJq', 'true', 'true');

--email = randja.dukanic@email.com password = 2773
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Ranđa', 'Dukanić', 'randja.dukanic@email.com', '$2b$12$buPjOyfsCMDSX0lrZdb6Ie3StH9hIT87yP/fUDS9xYAjX6u4v0fWO', 'true', 'true');

--email = tadija.macuric@email.com password = 4239
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Tadija', 'Macurić', 'tadija.macuric@email.com', '$2b$12$xKOVbrCtqIPTkACpd.18BuJA/mouHD01skBscSSwCF.x.I8RqujQe', 'true', 'true');

--email = zivadinka.evdjenic@email.com password = 5011
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Živadinka', 'Evđenić', 'zivadinka.evdjenic@email.com', '$2b$12$ZCVOc3kIhEkI7//zmixX3u0v1AEf.0CvRObQvh2X7CA706W1d6why', 'true', 'true');

--email = bozidarka.trokicic@email.com password = 1273
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Božidarka', 'Trokicić', 'bozidarka.trokicic@email.com', '$2b$12$YlYieX0hu6Kal57a3gv8tOs.6ZMeYfTj4GqEEi1okJ668VMw4dLAW', 'true', 'true');

--email = tasko.sumatic@email.com password = 8610
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Taško', 'Šumatić', 'tasko.sumatic@email.com', '$2b$12$MzF6qQrNFRWIp.6ZpLMKmub8NNz8BubyR475h2INPHC6WZsDlllMe', 'true', 'true');

--email = milisav.leontic@email.com password = 8004
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Milisav', 'Leontić', 'milisav.leontic@email.com', '$2b$12$EBXhjPX55dXgIwEwuXmnreEA1nzv2d1jRZfPndefhlGI/V6OhWyla', 'true', 'true');

--email = zivana.djapic@email.com password = 7305
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Živana', 'Đapić', 'zivana.djapic@email.com', '$2b$12$qTi4IxtGM.nx/.Sm4ar.Ke1ekjtMr0dM5Vk.AiHBIV3oZxO7Hoj3q', 'true', 'true');

--email = zivoratka.sakic@email.com password = 3335
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Živoratka', 'Šakić', 'zivoratka.sakic@email.com', '$2b$12$2tMgeeuAPZbpCJuHhVQFWevuEXi0QLIJqNdIZO/aSRoU.0WcT5Rtu', 'true', 'true');

--email = djulijana.bajicic@email.com password = 6558
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Đulijana', 'Bajičić', 'djulijana.bajicic@email.com', '$2b$12$LYi6Ga9Sl1IKTqDxSdu1dO.xIZJKdV3uvxCJDjYW7QDE6BWCXBsXi', 'true', 'true');

--email = hristivoje.brencic@email.com password = 1254
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Hristivoje', 'Brenčić', 'hristivoje.brencic@email.com', '$2b$12$dDuoOnbIplTQVTS8gCVNauUAZTbeaJKNN2RvylVi0gZiJa061VsoO', 'true', 'true');

--email = pelagija.brezonic@email.com password = 5244
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Pelagija', 'Brezonić', 'pelagija.brezonic@email.com', '$2b$12$EECLG1YpzKNk7wu8rsISVOqNuSbE69o5pOnEEzlRWLXboFAJOUw0W', 'true', 'true');

--email = jerotije.prekogacic@email.com password = 7114
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Jerotije', 'Prekogačić', 'jerotije.prekogacic@email.com', '$2b$12$iv5eyc34he.gBHmgIM8.NOr595k9uzQAfvjSin.FtkfD8rOo.pP5y', 'true', 'true');

--email = ranko.parojcic@email.com password = 2569
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Ranko', 'Parojčić', 'ranko.parojcic@email.com', '$2b$12$C173UCsGJFWllDbExgNMA.rwaAXRb4bKFMS9aOSNb6L4gq8g1lrjS', 'true', 'true');

--email = ljiljana.lilic@email.com password = 9566
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Ljiljana', 'Lilić', 'ljiljana.lilic@email.com', '$2b$12$fTbe/2JiW/xv1IDWJy9RsOpbQA/lWNyNgOnpCfzj/uMtuN84t5.9y', 'true', 'true');

--email = ugren.zeravcic@email.com password = 3341
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Ugren', 'Žeravčić', 'ugren.zeravcic@email.com', '$2b$12$qTzSq2KeNybKpTWgf59wleKKEoqNP0WcDmeKzqF1TcN0F5Tg6Swt6', 'true', 'true');

--email = lidija.pimic@email.com password = 9594
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Lidija', 'Pimić', 'lidija.pimic@email.com', '$2b$12$XgV1Bve0lj3yyCKrRdn2u.6LtnbECL3e02.HbSMo8caVwRH2rqY1q', 'true', 'true');

--email = rastko.milic@email.com password = 2627
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Rastko', 'Milić', 'rastko.milic@email.com', '$2b$12$xgG2iQvNMIohgJfmkhfkDOGVmopqkSaX7xFrCoogkMwldRGMPsMti', 'true', 'true');

--email = kristivoje.mrkusic@email.com password = 9759
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Kristivoje', 'Mrkušić', 'kristivoje.mrkusic@email.com', '$2b$12$F1GLm.7ckZYdBgL2F2yflestDkOYGjHpnoqJ0Abqqx3k1L4i7cD8K', 'true', 'true');

--email = kostadinka.zagric@email.com password = 8240
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Kostadinka', 'Žagrić', 'kostadinka.zagric@email.com', '$2b$12$Ow4vt1QuH.ZQBVcOksC8y.0v6sEPLfcvTs/8pAPOO65M39AVCl.je', 'true', 'true');

--email = milinko.drmoncic@email.com password = 6442
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Milinko', 'Drmončić', 'milinko.drmoncic@email.com', '$2b$12$QyDB.H17QL56NGFbezCtEuVXF0HeOiG/p/LRhc0wiNboPNBCqHSNu', 'true', 'true');

--email = ljubo.masalusic@email.com password = 8652
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Ljubo', 'Masalušić', 'ljubo.masalusic@email.com', '$2b$12$TN6aGY5d4fjaJBL2Z6pwFuh9JoMDunbXpPAtx4gwXwzpvtKRigXpS', 'true', 'true');

--email = blagica.radojcic@email.com password = 8348
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Blagica', 'Radojčić', 'blagica.radojcic@email.com', '$2b$12$pqA8mOJotBGp5Ha0bP/1UOAQwkZoUTotnVukkHmZjvY4dan.o.CsK', 'true', 'true');

--email = filip.markelic@email.com password = 5265
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Filip', 'Markelić', 'filip.markelic@email.com', '$2b$12$ftaRzmt8foTXgQukYGQozOAN7SIuv4qk6Ugo.g.jZc88.ea75.v9i', 'true', 'true');

--email = djurdjija.kucparic@email.com password = 4254
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Đurđija', 'Kučparić', 'djurdjija.kucparic@email.com', '$2b$12$mWew2Qskn2qNAj0NuDCtl.y1dR6SoGAbNCnul9bfLBNEFAbP02vZm', 'true', 'true');

--email = dobrila.ekmedzic@email.com password = 5379
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Dobrila', 'Ekmedžić', 'dobrila.ekmedzic@email.com', '$2b$12$RVbEoQmSBa/n8JHNZ2FsgeTwiZMAKoeMMtYsqOgMe4BjmTOVMXrJa', 'true', 'true');

--email = lazar.kotlajic@email.com password = 9642
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Lazar', 'Kotlajić', 'lazar.kotlajic@email.com', '$2b$12$WuWBW2hAqC7fLOttClp3x.DgU3QpsDWGEMW0bXnRdzhqxnWpRKgMS', 'true', 'true');

--email = stanimir.tajdic@email.com password = 2099
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Stanimir', 'Tajdić', 'stanimir.tajdic@email.com', '$2b$12$/PbeuhAic4jFyQLpKgwQn.vyICDleXRL3F65ziexTu6YFqZhU6Anm', 'true', 'true');

--email = negoslav.prolic@email.com password = 4947
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Negoslav', 'Prolić', 'negoslav.prolic@email.com', '$2b$12$w2xfnJ/3jSY4r/eFhZGNKOE1GHLa2gvC/QKCNSk4ZRoNtqFYC.FTu', 'true', 'true');

--email = ljubinka.jasic@email.com password = 1658
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Ljubinka', 'Jašić', 'ljubinka.jasic@email.com', '$2b$12$XYeSIlZCA5uPSo4jfarbVuI4HrhyODQ6IVgBxYLYhhvH62ACIR4AW', 'true', 'true');

--email = veroslava.pajdic@email.com password = 6375
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Veroslava', 'Pajdić', 'veroslava.pajdic@email.com', '$2b$12$5b1xFCTNQu8GgQ5SuYLVLevzh2iqWuGZ4LUFJ7WIP5wq/bG6AMfUW', 'true', 'true');

--email = simona.stjepic@email.com password = 6806
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Simona', 'Stjepić', 'simona.stjepic@email.com', '$2b$12$R9bN/Dmvt6laXvuYkyzXzO/Qme/BQwT.j3SXKTXpbegqapY6XDxma', 'true', 'true');

--email = lola.krezic@email.com password = 5946
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Lola', 'Krezić', 'lola.krezic@email.com', '$2b$12$O2EPatzQiU84fhO24Xw73uYtlYcQBMppuPZbuSoK7mW8rmTpGDzxy', 'true', 'true');

--email = jelena.sorajic@email.com password = 5782
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Jelena', 'Sorajić', 'jelena.sorajic@email.com', '$2b$12$92Qx/53kevsPAVnvW4lzC.zvSM69KmFiatjtWUmlh0KqHoWFGqkF2', 'true', 'true');

--email = mileta.jonikic@email.com password = 4494
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Mileta', 'Jonikić', 'mileta.jonikic@email.com', '$2b$12$r9y5tPVtrTugF8RDbbsv/OAyevh0/LqgaQkCQB2f2Ur33YUGz6N8W', 'true', 'true');

--email = dragisa.berdic@email.com password = 3182
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Dragiša', 'Berdić', 'dragisa.berdic@email.com', '$2b$12$fZzegW0YtsAqygWk4xc2oe/ghka88XKhkvJqnAE/RNEKk8EHYBGdS', 'true', 'true');

--email = cetko.gveric@email.com password = 5848
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Ćetko', 'Gverić', 'cetko.gveric@email.com', '$2b$12$iX5fMJGtsWiA/dbm21fmd.a9RoGlhSmu.ScgZADzaG1ePeY0OXUhu', 'true', 'true');

--email = mijat.mikaric@email.com password = 8038
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Mijat', 'Mikarić', 'mijat.mikaric@email.com', '$2b$12$dMZpBTxzWFuQJh223C3YgeDoBwLVKft9Vaeb5vo.KqUZpt364Z2RS', 'true', 'true');

--email = stojka.tmusic@email.com password = 1977
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Stojka', 'Tmušić', 'stojka.tmusic@email.com', '$2b$12$WM4fTHD8Sc7Q9JE.ZbCEyuGRrZMsVPUnzVHdgZUDZ.YWLg1ioQOni', 'true', 'true');

--email = veljko.manjencic@email.com password = 9588
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Veljko', 'Manjenčić', 'veljko.manjencic@email.com', '$2b$12$JDR0GkaHm.EBoaxwYCuQ1.JP2hIEJqijMo20W1MZa.R3.bO3G7asW', 'true', 'true');

--email = obradinka.guzvic@email.com password = 9810
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Obradinka', 'Gužvić', 'obradinka.guzvic@email.com', '$2b$12$DuADxY8jZrr4ywJHxoatJu9Xn3s9GAgXp6FWYYfb9Md/NPt3eTFa2', 'true', 'true');

--email = jelisije.novarlic@email.com password = 9514
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Jelisije', 'Novarlić', 'jelisije.novarlic@email.com', '$2b$12$Wi3WAJpCIHfXK/oHngfETOtSHXfC.HE8M1ffIdw1kmjIet5sTUgM6', 'true', 'true');

--email = kristivoje.tupajic@email.com password = 1112
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Kristivoje', 'Tupajić', 'kristivoje.tupajic@email.com', '$2b$12$ci8wsoLKcgn0OihwaBfGGO8DWfFLjuyxbMazGreVxjGMobw25uiVq', 'true', 'true');

--email = radivoje.nejkic@email.com password = 9634
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Radivoje', 'Nejkić', 'radivoje.nejkic@email.com', '$2b$12$KiAE3DFChP7fsnOBflRPyORdAobQtnN66BhdmC24jngoQzjPF4aq6', 'true', 'true');

--email = damjan.bronzic@email.com password = 9721
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Damjan', 'Bronzić', 'damjan.bronzic@email.com', '$2b$12$eo1G9iAUr3j5HgpPXsUtBeV9mKb7NYRYFJngvZAJWp9CvD/JXozTW', 'true', 'true');

--email = ratka.vucanic@email.com password = 8229
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Ratka', 'Vučanić', 'ratka.vucanic@email.com', '$2b$12$A8I7cwMhICYqwTN9frn7UO7DwFCSwdrq8gjmYr8AyE3D4qptGHmei', 'true', 'true');

--email = takosava.japundzic@email.com password = 9662
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Takosava', 'Japundžić', 'takosava.japundzic@email.com', '$2b$12$b1SBoqhJaI79xhZ02.1KeuKO.8KtUIebENmW3PiPWXtwqXtIGI1t6', 'true', 'true');

--email = novka.negucic@email.com password = 1494
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Novka', 'Negucić', 'novka.negucic@email.com', '$2b$12$x7HL2xZ.g4uw4.PQBpmmP.77QlUldTRs8sYR2v6mle1944OxkgBEu', 'true', 'true');

--email = teohar.simendic@email.com password = 7552
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Teohar', 'Simendić', 'teohar.simendic@email.com', '$2b$12$xEnx2jZ2KjDZVPiN4zQN9uecvadx7jnU/rG6iroLA9XDld6fOfd7S', 'true', 'true');

--email = sekula.pujic@email.com password = 2006
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Sekula', 'Pujić', 'sekula.pujic@email.com', '$2b$12$eXywkVCDLxmZ4/E2xT/toudXnirqAPNzUGrCCSlsHoI8jEGZHwzWC', 'true', 'true');

--email = sava.varjacic@email.com password = 4686
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Sava', 'Varjačić', 'sava.varjacic@email.com', '$2b$12$gkompa/9AAM5PFN1fj7XSeuem51e55gOeKwcP8VAD4P1q7jcUcBH2', 'true', 'true');

--email = filip.racic@email.com password = 6739
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Filip', 'Račić', 'filip.racic@email.com', '$2b$12$AhB9ezKedMXiK6ATahaDeOTDwvqnpLvVClhRhuvm8FTllHuNLCECO', 'true', 'true');

--email = dobrinka.klicaric@email.com password = 1741
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Dobrinka', 'Kličarić', 'dobrinka.klicaric@email.com', '$2b$12$eXJMP2EukRMRzQScFTn0QuL2W6veCOB4TI8PgcHKbOaComVUg.03O', 'true', 'true');

--email = novak.andjelic@email.com password = 8752
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Novak', 'Anđelić', 'novak.andjelic@email.com', '$2b$12$xAXpwVaFWRGMjtCkEra4yuWyprdgBiYukB1Lhu61IBHq8U7CRfeBu', 'true', 'true');

--email = vasilija.kodic@email.com password = 9149
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Vasilija', 'Kodić', 'vasilija.kodic@email.com', '$2b$12$qxO6hNMnZGGED5/esKvdeutp49Ow8x8lk62igGuoQ6xVip8FQzn6q', 'true', 'true');

--email = katica.sljapic@email.com password = 5861
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Katica', 'Šljapić', 'katica.sljapic@email.com', '$2b$12$Ym/WyTNq4WdpcdIHOY9RJeYMXLLGHDXwEK3Ee6K2ITUW3MsCx2Ff.', 'true', 'true');

--email = dragoslava.grubnic@email.com password = 7726
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Dragoslava', 'Grubnić', 'dragoslava.grubnic@email.com', '$2b$12$ev5sdRfy/FxF2c1lf6Z/Pu0GtbMuPbrs6/DIWrwI8Af0kHjcpRCcO', 'true', 'true');

--email = stamena.sesic@email.com password = 1445
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Stamena', 'Šešić', 'stamena.sesic@email.com', '$2b$12$xhCMH/87ckBxbUprtehuE.p41H7TeGlkiUfSbzXA65IvUqCjjXbaa', 'true', 'true');

--email = predrag.kujundzic@email.com password = 2665
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Predrag', 'Kujundžić', 'predrag.kujundzic@email.com', '$2b$12$aQup2PpdddA70tmNkSZ/SOGMa7WcHhUIc2blPD1z64Fp1bDBWyGae', 'true', 'true');

--email = zlatica.zambelic@email.com password = 8446
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Zlatica', 'Zambelić', 'zlatica.zambelic@email.com', '$2b$12$kx7tNxY7ktCBzWF379L76uNrNgSfbVir2lWlhJ/illkKM8/VlToze', 'true', 'true');

--email = radonja.sakic@email.com password = 7316
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Radonja', 'Šakić', 'radonja.sakic@email.com', '$2b$12$yL8Mt8QixFu1vTnfS.sNAeNZe9jAVi7BaqaZbVrYnAJvDf.RNZegm', 'true', 'true');

--email = sako.magdelinic@email.com password = 9419
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Šako', 'Magdelinić', 'sako.magdelinic@email.com', '$2b$12$H/fCCnAoYdpFg.psP5VhQumOhiPh2C9HJ9WDvKOR.rIGBb/hx2Ms.', 'true', 'true');

--email = stojko.kotarlic@email.com password = 1051
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Stojko', 'Kotarlić', 'stojko.kotarlic@email.com', '$2b$12$GdaBilE9L2mMoekmLMSHJeuPDA.gCmEWiBaZ6sMMs1xUI6AaUgRGK', 'true', 'true');

--email = djokica.krstekanic@email.com password = 1557
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Đokica', 'Krstekanić', 'djokica.krstekanic@email.com', '$2b$12$wz5XxvB7y8ChF/hJKDJhpOkCoOJ8O45rdZUKMl877l72YYMt813cW', 'true', 'true');

--email = zivka.jakonic@email.com password = 9602
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Živka', 'Jakonić', 'zivka.jakonic@email.com', '$2b$12$V6oZgEWch6xLupEjZCSSfe6f9N3eyguk0CKfJIYoVoGi1S8.iEni6', 'true', 'true');

--email = stanija.runjajic@email.com password = 7383
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Stanija', 'Runjajić', 'stanija.runjajic@email.com', '$2b$12$xsMEoZPkU/ULGVLrxol6a./ECqNJAvxTYwki3ynriNbcljE1jnoG.', 'true', 'true');

--email = stanija.sujic@email.com password = 4643
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Stanija', 'Šujić', 'stanija.sujic@email.com', '$2b$12$h4bttrdW.VXSaBDx05jLA.H57etnvwZp9OUq54piguIUUEsDsWRMS', 'true', 'true');

--email = tomka.mrkic@email.com password = 6477
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Tomka', 'Mrkić', 'tomka.mrkic@email.com', '$2b$12$NVkQbghCHIwuN5bEF05SdOBZL7yM9JnsCPiMSg84YC0w.IEufeNXS', 'true', 'true');

--email = toda.dmicic@email.com password = 3864
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Toda', 'Dmičić', 'toda.dmicic@email.com', '$2b$12$6487c26MM0ZH.Hr2BYiT1.XNpXAJMpVosNz7kL6YgjQfEiJ7EmO5C', 'true', 'true');

--email = grozdana.skrebic@email.com password = 8998
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Grozdana', 'Škrebić', 'grozdana.skrebic@email.com', '$2b$12$rpx09yuwprS5OlNnS7XKOewMbeoWL3dyG3kKLGNyimKbtlkI4IfuC', 'true', 'true');

--email = soka.najkic@email.com password = 1172
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Soka', 'Najkić', 'soka.najkic@email.com', '$2b$12$EhYyl.5v13RbHBgsDoStm.fSOw1BJA4wZcRZcGKOXOyTfmIsRWUx2', 'true', 'true');

--email = hranislav.malencic@email.com password = 2731
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Hranislav', 'Malenčić', 'hranislav.malencic@email.com', '$2b$12$aCjWj1xevQgo52pzS1WpX.kiHdq6aSsHOzmvYvXr3x2YO.G2s02hq', 'true', 'true');

--email = bojan.ckovric@email.com password = 2093
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Bojan', 'Čkovrić', 'bojan.ckovric@email.com', '$2b$12$P4PZ/rJN5Uy73/4LmkQPh.NgT56oFXusBe6zMwGntwdG3S3aTfpO2', 'true', 'true');

--email = milijan.bujandric@email.com password = 3385
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Milijan', 'Bujandrić', 'milijan.bujandric@email.com', '$2b$12$PuR677mx/qnPIb4oxjhgUeEg7lQum02NSlMnIa4z.i2XMbV48I/De', 'true', 'true');

--email = ristivoje.tufegdzic@email.com password = 6749
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Ristivoje', 'Tufegdžić', 'ristivoje.tufegdzic@email.com', '$2b$12$mlLVn0scJugiXreMW1RRG.IOb84rqhEnFdmvpEeRbt47wteRMs/hC', 'true', 'true');

--email = vidoje.djidic@email.com password = 9452
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Vidoje', 'Đidić', 'vidoje.djidic@email.com', '$2b$12$Q2Zvqs9s2.ayaXtgNnKRPuK/MJI4ljPeD75YUQ7gOidj5k8SPpfQC', 'true', 'true');

--email = ubavka.dzodic@email.com password = 5005
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Ubavka', 'Džodić', 'ubavka.dzodic@email.com', '$2b$12$ZUQYvz6wEftoTlYXk7dstu.KKWAwOUZN2c7s26uiIOTUHX8tWWY1C', 'true', 'true');

--email = ostoja.dugajlic@email.com password = 7195
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Ostoja', 'Dugajlić', 'ostoja.dugajlic@email.com', '$2b$12$d3dcxcq2C.AuL14xo4jNGeiL4GG.xmbOJqTGN/dI2Q15vh6zR.J0q', 'true', 'true');

--email = julijan.jaredic@email.com password = 4473
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Julijan', 'Jaredić', 'julijan.jaredic@email.com', '$2b$12$947FQd6KMWgwHr7Dsx94GuHWsfUGWIrRdXCSlyaGcuRFPMTwK/7Wi', 'true', 'true');

--email = sonja.kalabic@email.com password = 8859
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Sonja', 'Kalabić', 'sonja.kalabic@email.com', '$2b$12$a1L3gW4iv3Yci5YzuCqqLenT3.TJ.D5lgek3BJut6LqMU2WfVTF7a', 'true', 'true');

--email = milan.rajsic@email.com password = 5060
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Milan', 'Rajšić', 'milan.rajsic@email.com', '$2b$12$xrZOwjh2cI9BQH1sCvVl2.2N8Q1Cf4wG7IZSgwnzInq4n2WcQqsAC', 'true', 'true');

--email = saveta.krivic@email.com password = 6279
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Saveta', 'Krivić', 'saveta.krivic@email.com', '$2b$12$2Imnoh4DVj/7KpZKYW7CquPJGCI8I1kI2VaziAgRquA.vZr8yeWeO', 'true', 'true');

--email = ljubomirka.durkulic@email.com password = 6703
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Ljubomirka', 'Durkulić', 'ljubomirka.durkulic@email.com', '$2b$12$tx7nPx9wscpaH3beBLl8Ee8ZGUdRdbFg.1FEUfJXX6.Jn9yJf/Aei', 'true', 'true');

--email = ljupce.ugrincic@email.com password = 5845
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Ljupče', 'Ugrinčić', 'ljupce.ugrincic@email.com', '$2b$12$5JfblQgFCfq2xK9qxOiIu.lwMxtAKRGeSGkkCcuo1N4QZEwW0UwYi', 'true', 'true');

--email = veroljub.culafic@email.com password = 9219
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Veroljub', 'Ćulafić', 'veroljub.culafic@email.com', '$2b$12$jVfFjsCkjzPWn1lzcBZls.7bLPYVy2htiwleWUjn2f4kPzvsMGK1G', 'true', 'true');

--email = avram.ninic@email.com password = 2329
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Avram', 'Ninić', 'avram.ninic@email.com', '$2b$12$kWB5Zy0YTrVle81P.1rfAetL/JmkEKn.LeEhhOGL/wFsedgXMovTy', 'true', 'true');

--email = paun.brodalic@email.com password = 1677
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Paun', 'Brodalić', 'paun.brodalic@email.com', '$2b$12$Tikp.xMQi4uYqsy5MKUBw.f9R3n/8Yugi2zIWv/S/0.hH7CXfJJaC', 'true', 'true');

--email = cvetko.skobic@email.com password = 2367
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Cvetko', 'Škobić', 'cvetko.skobic@email.com', '$2b$12$mTFYba2xTYsgYgmm4mzvweDDDTdnJVaq8MEpByx9WXZA4kNk/VmUq', 'true', 'true');

--email = cvetomir.bendic@email.com password = 4287
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Cvetomir', 'Bendić', 'cvetomir.bendic@email.com', '$2b$12$ukwgUK6U9mv5iorofG/nt.0m7w/ntXP6ypPl5GEtp/JBodYIDp1im', 'true', 'true');

--email = tijana.dusanic@email.com password = 2356
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Tijana', 'Dušanić', 'tijana.dusanic@email.com', '$2b$12$/E.nSuNWf51JHEoyCkMpU.iFY2TTKmQSxBbs81HZt8GDlnmE4.DIK', 'true', 'true');

--email = hristina.curkic@email.com password = 2014
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Hristina', 'Curkić', 'hristina.curkic@email.com', '$2b$12$NjB7PpAs/wWQHlCbEVV69Ob3kxhSjPYUyt7OHf2EdTwEXKUj2LnHG', 'true', 'true');

--email = stojka.susulic@email.com password = 6146
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Stojka', 'Šušulić', 'stojka.susulic@email.com', '$2b$12$01gggBB.uWrqLALNYbbdQuc0U2XSheF3T4pZYYJ1ixhFf6s9xGgUi', 'true', 'true');

--email = spira.galcic@email.com password = 5760
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Spira', 'Galčić', 'spira.galcic@email.com', '$2b$12$wa8Jv85VSsCJC8eS62U28eymisNLDGCFV5YiX8/4vlbNaDRE6Nfl6', 'true', 'true');

--email = dragojla.bubic@email.com password = 3823
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Dragojla', 'Bubić', 'dragojla.bubic@email.com', '$2b$12$KdDrCZ/LVDJHFSOOwISBSO/AqQI3xu8FKon09eTLNKGKmvvQxaPYS', 'true', 'true');

--email = prodana.sabeljic@email.com password = 4942
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Prodana', 'Šabeljić', 'prodana.sabeljic@email.com', '$2b$12$mRP3EqYzZfu3bbhAoZ0..OoKjlnFE4RTkuWK3/Pz3NXhvXag/1d4O', 'true', 'true');

--email = vukosava.karaulic@email.com password = 7266
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Vukosava', 'Karaulić', 'vukosava.karaulic@email.com', '$2b$12$FySzZ00NnbQjZvDWdVKlI.hA/51eMou7.VTFdl5DiILS5FHm58u8S', 'true', 'true');

--email = stamena.pavcic@email.com password = 5974
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Stamena', 'Pavčić', 'stamena.pavcic@email.com', '$2b$12$0RiB.hLv5L2iT1wCUBiP8Oej7Kq97Fm827O.OtvoAQlVk.JyDbYsG', 'true', 'true');

--email = radinka.cokonic@email.com password = 6637
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Radinka', 'Čokonić', 'radinka.cokonic@email.com', '$2b$12$qcj3XHcmmknTMm7zVT42/.ggTVJNfKgfNxFgfBpq19W8gav9wx.62', 'true', 'true');

--email = predrag.sunkic@email.com password = 3231
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Predrag', 'Šunkić', 'predrag.sunkic@email.com', '$2b$12$WkiietHZCJ7tt/AQ17TMg./0QgFjwwsgz4KT0vNKYG6nCXBiQ6fHq', 'true', 'true');

--email = cana.veic@email.com password = 3564
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Cana', 'Veić', 'cana.veic@email.com', '$2b$12$rxm.gMZhQ2k43OSqQvFjk.POGRPC.M5M2AFRv44vtuTnOgirIukpu', 'true', 'true');

--email = lepomir.varezic@email.com password = 1854
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Lepomir', 'Varezić', 'lepomir.varezic@email.com', '$2b$12$8aqvGyq7PI4JX92KilBnqO4R2GKA.ii8HY8/rlJlFpIsvzfeKL62i', 'true', 'true');

--email = djordje.pupic@email.com password = 4091
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Đorđe', 'Pupić', 'djordje.pupic@email.com', '$2b$12$fpr.Pqx6wVxwyV42YRnAqudRONjrJFy6EEzKl.S20lQKt7xsGzNNi', 'true', 'true');

--email = caja.jenic@email.com password = 7885
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Caja', 'Jenić', 'caja.jenic@email.com', '$2b$12$VXxF0Cp3HwakfUhhz.J.F.I6oYHOjF8jr5gGuXBukg8J4Q2LUSyeu', 'true', 'true');

--email = sako.barnic@email.com password = 4872
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Šako', 'Barnić', 'sako.barnic@email.com', '$2b$12$vkA5b.V7GZ7bEuSA42xN.ueR7Uwf5MOPSHq8Am4gLluqeuRczZxyW', 'true', 'true');

--email = radivoje.pajkic@email.com password = 2787
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Radivoje', 'Pajkić', 'radivoje.pajkic@email.com', '$2b$12$Jnw1eQ7y2ZAeThzHjAtBx.nS88jdTeRUlCaX3XMTTXIzlL8mSowPq', 'true', 'true');

--email = pavle.pogrmic@email.com password = 6877
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Pavle', 'Pogrmić', 'pavle.pogrmic@email.com', '$2b$12$ennEhdhFbuF50PyBwPEUeeJsmbVgoLH7Y77J5s1vD3.A2P/OZPPhu', 'true', 'true');

--email = janovka.drmoncic@email.com password = 8266
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Janovka', 'Drmončić', 'janovka.drmoncic@email.com', '$2b$12$U76.lEdtlnwT/xUvL8NACOHEiUlBZtYvBDNx/FdyohbTru9FKdnoK', 'true', 'true');

--email = stojna.nastasic@email.com password = 8535
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Stojna', 'Nastasić', 'stojna.nastasic@email.com', '$2b$12$jpAxeGM82.8KSgy1Axned.Sm3lAms9HGWqlEBxUUHtboLhosZ2i9i', 'true', 'true');

--email = lucija.drmanic@email.com password = 7059
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Lucija', 'Drmanić', 'lucija.drmanic@email.com', '$2b$12$d8ullx8aaseeqM5JhJFASOyArn5N7RUjc3nI/e8QRYq1bHuXMRfLG', 'true', 'true');

--email = poljka.vujacic@email.com password = 3771
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Poljka', 'Vujačić', 'poljka.vujacic@email.com', '$2b$12$6ZmItEw/D9/bbLv9hy5.ne08YZQTS4BC2a1zTiQkxr1ALOcMsDf6.', 'true', 'true');

--email = djurdje.sobacic@email.com password = 8283
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Đurđe', 'Šobačić', 'djurdje.sobacic@email.com', '$2b$12$KxOxKoJQ556/jJNmk2gf0usrZmi9gOCwFw3CaTHamR0YcOUzkxBbe', 'true', 'true');

--email = drasko.pesic@email.com password = 4128
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Draško', 'Pešić', 'drasko.pesic@email.com', '$2b$12$3DoFiimc7p7D4W5hvu8JI.LXv8PoysZIFBaN6feu0T13vL9AuaEya', 'true', 'true');

--email = ljupce.nikolendzic@email.com password = 6519
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Ljupče', 'Nikolendžić', 'ljupce.nikolendzic@email.com', '$2b$12$sMxC4I0cl50sNkmkeh/jY.kXGJhkg.G5SHSK3jMegttThnWdPbjly', 'true', 'true');

--email = prodan.dendic@email.com password = 4680
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Prodan', 'Dendić', 'prodan.dendic@email.com', '$2b$12$d9yy/o.FW2q0FG9LYkinWOzprs1h2xtR0IAlBd7VOugkhX0KJSBue', 'true', 'true');

--email = aleksa.dragojic@email.com password = 7315
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Aleksa', 'Dragojić', 'aleksa.dragojic@email.com', '$2b$12$N4WfQDcSQqvwa0SzUaoNlOvpgMunesW//IZVdYLLQjgvSqh84L5.O', 'true', 'true');

--email = cvetanka.djinic@email.com password = 2785
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Cvetanka', 'Đinić', 'cvetanka.djinic@email.com', '$2b$12$Me1RnrZkMJzuGgYDVkqEK.9sFthaIOOL9/Y/.uU5hK8LB4ZlKOXY.', 'true', 'true');

--email = kosovka.mionic@email.com password = 5124
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Kosovka', 'Mionić', 'kosovka.mionic@email.com', '$2b$12$tmF4LWgV/DQRMY27f4Di/uZUBEd73ezfwXlGvfWEqAYUFzJn67KnK', 'true', 'true');

--email = dubravka.sosic@email.com password = 2413
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Dubravka', 'Šošić', 'dubravka.sosic@email.com', '$2b$12$jE8Aodofj1kf9fs.zjCRRO1qyRYGTEhm93cxE6tHboNtOhvw21pKS', 'true', 'true');

--email = stanojla.pjevic@email.com password = 7380
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Stanojla', 'Pjević', 'stanojla.pjevic@email.com', '$2b$12$QqRqRTjI3QeTo.APtxzVsOfEPzcbzN0X/6GdkAUdC68ja4DH2xl/.', 'true', 'true');

--email = vuk.topic@email.com password = 4046
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Vuk', 'Topić', 'vuk.topic@email.com', '$2b$12$NW8CaysX7QI/IBruo83UF.GBod1NLA655t/ZGbkSAmVfaYP38Aef6', 'true', 'true');

--email = dobroslavka.pavic@email.com password = 2337
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Dobroslavka', 'Pavić', 'dobroslavka.pavic@email.com', '$2b$12$JCnxFsemjBFJqs1ziHssIODSPffK.5c9Q.lvMo.SrzqckbyRg7dNO', 'true', 'true');

--email = ninko.mrkic@email.com password = 8928
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Ninko', 'Mrkić', 'ninko.mrkic@email.com', '$2b$12$xOr2rhhTp5S2V1DmFF9zteB91v2JrdL5qK9zfboKWo6QqcUH8MdxC', 'true', 'true');

--email = veroljub.jagajic@email.com password = 1347
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Veroljub', 'Jagajić', 'veroljub.jagajic@email.com', '$2b$12$1z3HsmRvsNCxDsYHSH4WEuAUGq.Ca2QlCuUIdQ9BJ1bWH8ztDnfdW', 'true', 'true');

--email = dragoslava.mustecic@email.com password = 1538
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Dragoslava', 'Mustecić', 'dragoslava.mustecic@email.com', '$2b$12$8Z9Ltaw0kCSbWXYrfqUiKeqi2ZM7hBsj12MG1vfZ951eQZxtIfZ.e', 'true', 'true');

--email = zlatko.cokonic@email.com password = 8876
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Zlatko', 'Čokonić', 'zlatko.cokonic@email.com', '$2b$12$PhErLAgrzoaxZG8bSkFNTuKct2xzIIgfgfqqggO0cCQ7YqvsIlWge', 'true', 'true');

--email = ceda.garotic@email.com password = 8797
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Čeda', 'Garotić', 'ceda.garotic@email.com', '$2b$12$GXpKWRO1rtWutddM9utd.urLdxHppOgqRSItYEp2QW.8MeXQ82EUS', 'true', 'true');

--email = ranka.gentic@email.com password = 8902
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Ranka', 'Gentić', 'ranka.gentic@email.com', '$2b$12$Fp0jCj1CRnJyX2qQrrpMv.Ayj3zIRk85QgNqbmqNqCyyp9JRKP5s2', 'true', 'true');

--email = ilinka.deretic@email.com password = 2284
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Ilinka', 'Deretić', 'ilinka.deretic@email.com', '$2b$12$DuWhzbaKV6KFxAdet8Vfnu2pvmTbBruYfGw7ssmECh7HyPyf3VLfu', 'true', 'true');

--email = caslav.kanjeric@email.com password = 6779
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Časlav', 'Kanjerić', 'caslav.kanjeric@email.com', '$2b$12$qGHhsSidh1JHZqwltTzPpOxWwXO6bLrLl8aYDd1At7NsVRDFoWWR6', 'true', 'true');

--email = zorana.doklestic@email.com password = 3526
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Zorana', 'Doklestić', 'zorana.doklestic@email.com', '$2b$12$R9CuW/O1r5xbvQkMizz3R.mOhU3s4gkzb0YPOwIRFs0sjD603pzpu', 'true', 'true');

--email = negovan.rekalic@email.com password = 9942
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Negovan', 'Rekalić', 'negovan.rekalic@email.com', '$2b$12$8vaCad9TT/qccjiHkq318eINdGiIAqNBzvOz6pCuw7VKGH0cW6o0i', 'true', 'true');

--email = pavlija.stankic@email.com password = 1427
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Pavlija', 'Stankić', 'pavlija.stankic@email.com', '$2b$12$JaODubDb/yTe8RIXZinaOerMOyfPzUYjjNJPk7MKASsJm1qZSBUxy', 'true', 'true');

--email = makrena.kostic@email.com password = 5559
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Makrena', 'Kostić', 'makrena.kostic@email.com', '$2b$12$eFQz1Xmdqub0KDiRXQzVqOD0sh4vHk3D27JpPfOuoRvyD25qp6W9S', 'true', 'true');

--email = filipa.kiselcic@email.com password = 4910
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Filipa', 'Kiselčić', 'filipa.kiselcic@email.com', '$2b$12$Lj.SR.gXcAexWSJGYVlFG.QK0HStdeos4e8q8AZjj5hR4YycN7A/S', 'true', 'true');

--email = kosta.trnic@email.com password = 5113
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Kosta', 'Trnić', 'kosta.trnic@email.com', '$2b$12$6FECr6oS6wmv5ZpdWnC3rOV3Bf5Dr.xp0Jf1BSMzc313FLzNqq8CW', 'true', 'true');

--email = margareta.ivantic@email.com password = 5744
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Margareta', 'Ivantić', 'margareta.ivantic@email.com', '$2b$12$B9YajdXLtFEIsqQMUl3FJuGZIo7V0uKhe6bGoIppzgQB4jYfRYxYm', 'true', 'true');

--email = ratomir.aligrudic@email.com password = 9047
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Ratomir', 'Aligrudić', 'ratomir.aligrudic@email.com', '$2b$12$.Ex2.OH1/Ulzw28nA34Xa.1.9A2XXa1LnlzctYjtLZruIzlhVpuTi', 'true', 'true');

--email = branislava.simic@email.com password = 5743
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Branislava', 'Simić', 'branislava.simic@email.com', '$2b$12$SumeUCjaCmDKhMdm9OwdAuWshItuUZN4csk8glZTpddwE6oc82776', 'true', 'true');

--email = ranko.raduljcic@email.com password = 5399
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Ranko', 'Raduljčić', 'ranko.raduljcic@email.com', '$2b$12$ZW15BIzzuINJV.bbA2A61u.RxTaKBegjGJMI4DtejUzTzNEOLxgUa', 'true', 'true');

--email = vidosava.celikic@email.com password = 3964
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Vidosava', 'Čelikić', 'vidosava.celikic@email.com', '$2b$12$3fdxVcSjDQ1zn90bDXaZUeTQaoYuMTplmIpkkae8t5eKwguHwNOe2', 'true', 'true');

--email = teodor.jelicic@email.com password = 9971
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Teodor', 'Jeličić', 'teodor.jelicic@email.com', '$2b$12$3Dl5CveL9NTKRh8TYPjU9u1jNk.hnCArVKR7lyhAfJpctwvnHjYxC', 'true', 'true');

--email = vladan.popcic@email.com password = 2297
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Vladan', 'Popčić', 'vladan.popcic@email.com', '$2b$12$wtkPW1Kam9yv16mkD2bTKebtDvRhf.2XBeAo5mCZbnOynAhg4vck6', 'true', 'true');

--email = filipinka.celic@email.com password = 6068
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Filipinka', 'Čelić', 'filipinka.celic@email.com', '$2b$12$lEAtyLrZd3PeNCt1hgJSGOSRjiLg5AmWpB2RWj6NUBirQ4o0hxCyG', 'true', 'true');

--email = cana.gajtanic@email.com password = 5436
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Cana', 'Gajtanić', 'cana.gajtanic@email.com', '$2b$12$fHzP2xicRmOCvsSoxTkuUeE9YGZIViwENpOBgR1rKNbnnC6CblJl6', 'true', 'true');

--email = selena.dimkic@email.com password = 7834
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Selena', 'Dimkić', 'selena.dimkic@email.com', '$2b$12$zdnreqsIls7tmESfdetcRuqhlmOruMJQdM93gEwTU24Y1JaIw.kgC', 'true', 'true');

--email = zlatoje.stanacic@email.com password = 9266
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Zlatoje', 'Stanačić', 'zlatoje.stanacic@email.com', '$2b$12$1Jl3tb/ngQleuc8gmlKqR.V6DlND3icyI5fWdRKa08EEnpyIFVCta', 'true', 'true');

--email = stojna.kekeric@email.com password = 6902
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Stojna', 'Kekerić', 'stojna.kekeric@email.com', '$2b$12$gTTk6xz8nx3HwdRvYRdYROnnWEiuEVj4GeloPVD86MHmE0WpyhdAS', 'true', 'true');

--email = jagos.kocic@email.com password = 2096
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Jagoš', 'Kočić', 'jagos.kocic@email.com', '$2b$12$82KwOItOw6wFWzov1oHKZesE4aJUSyWk7eEevRfDbrvz2Uevw8lTS', 'true', 'true');

--email = bogosav.kumrijic@email.com password = 4185
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Bogosav', 'Kumrijić', 'bogosav.kumrijic@email.com', '$2b$12$ngfg47WUspy9FXrc..KJXOviSuOFSDPsZA4c4CgzMns6r.JWuCdNy', 'true', 'true');

--email = zivoslavka.begenisic@email.com password = 4559
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Živoslavka', 'Begenišić', 'zivoslavka.begenisic@email.com', '$2b$12$Mdb9TuFHjYnhMbOywX2FbOH1jsal2AqCFNuburE3YkdJzyoLKDb9W', 'true', 'true');

--email = milena.markisic@email.com password = 5005
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Milena', 'Markišić', 'milena.markisic@email.com', '$2b$12$vD9KJ.pPXSgKS5lJc3nIheJLiU9gpgd0uy6Fska08svY677w1xXui', 'true', 'true');

--email = elizabeta.veic@email.com password = 5730
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Elizabeta', 'Veić', 'elizabeta.veic@email.com', '$2b$12$mgFCdnE0TbzfBe5Li1JIJOCEVbGR4JjtwwhG4Sh8RYf094zT3HLKS', 'true', 'true');

--email = cvetin.knezic@email.com password = 7639
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Cvetin', 'Knežić', 'cvetin.knezic@email.com', '$2b$12$R/56/i.2c/8umPLaT8VqfuwkwoiVSgXK0ATXdwyFa1ioPrEAnh5WS', 'true', 'true');

--email = egenija.ozimic@email.com password = 4755
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Egenija', 'Ozimić', 'egenija.ozimic@email.com', '$2b$12$rVsiXjKacaa.qWdIiroqV.ZzeJRtopokQ.26LABJOhTb5K4LLpj4u', 'true', 'true');

--email = mladen.trindic@email.com password = 2429
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Mladen', 'Trindić', 'mladen.trindic@email.com', '$2b$12$RI0WJFy2PP6JuvQUYVjgku8hnkpn.gwQg4Cr6gExSs03uh2kNrGQi', 'true', 'true');

--email = ugren.leposavic@email.com password = 6455
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Ugren', 'Leposavić', 'ugren.leposavic@email.com', '$2b$12$Tdicn.lp0nVv6LYoB4K21eLxG.Kg.PCa96NIzBdu./jT.mbUkmhXy', 'true', 'true');

--email = spasenija.ljocic@email.com password = 1840
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Spasenija', 'Ljočić', 'spasenija.ljocic@email.com', '$2b$12$AqSVIZ02uykCc8OPG5xZve7SMHDwa16KlYzyohWxvhRu217vouKHy', 'true', 'true');

--email = sima.pancic@email.com password = 9997
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Sima', 'Pančić', 'sima.pancic@email.com', '$2b$12$fWQxE6MLO90bTSfsupg6huiSwZtvSs.uhqrlkUwvAqc0967Ysz7zm', 'true', 'true');

--email = njegoslava.knjeginjic@email.com password = 7340
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Njegoslava', 'Knjeginjić', 'njegoslava.knjeginjic@email.com', '$2b$12$rwoSc0d2Wu30G1VjkqBea.gF3OuX2otf9sfZABJc.mtq0rwrl.5By', 'true', 'true');

--email = magdalena.protic@email.com password = 3632
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Magdalena', 'Protić', 'magdalena.protic@email.com', '$2b$12$r8Z/F2G8ss1K9nj.r1Z9hOzUUG3gia9Kj0dpqG67numRPsuwTJql6', 'true', 'true');

--email = buda.sazdanic@email.com password = 8895
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Buda', 'Sazdanić', 'buda.sazdanic@email.com', '$2b$12$PcHhRx/TVAU725SPbLiXu.1gWgL27NTNFEKZUWJGhjdW6wwhyWps6', 'true', 'true');

--email = mijat.ducic@email.com password = 6866
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Mijat', 'Dučić', 'mijat.ducic@email.com', '$2b$12$q7Exlf702Si5HhG7fzDqXOr/yQFXDqNH/nxc7L0o362..oU5PzRVm', 'true', 'true');

--email = vujadin.cocic@email.com password = 7430
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Vujadin', 'Čočić', 'vujadin.cocic@email.com', '$2b$12$nq85dnZV9cvaG4k910fi7.40h2yJyxcs0iQ/OrQF5H7dDps7zoZqW', 'true', 'true');

--email = zivota.bisic@email.com password = 1402
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Života', 'Bisić', 'zivota.bisic@email.com', '$2b$12$zMCMFkh9Soq/4PmlC3lACu2Ew5wg6bsAO3/5HTg5FrHKmu5X36ae6', 'true', 'true');

--email = kostadinka.nikolesic@email.com password = 3597
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Kostadinka', 'Nikolešić', 'kostadinka.nikolesic@email.com', '$2b$12$5O.BBSO6DNtbCEnqskSb0uRNtg1Ytswn.jPjPIn62BQsb8xXd2ASO', 'true', 'true');

--email = viktorija.dogandzic@email.com password = 3143
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Viktorija', 'Dogandžić', 'viktorija.dogandzic@email.com', '$2b$12$sAgzeC22dJFIQtcgLquvHujwnOfTmc.8DOKj7Qo3YW.7c.BR/kGIa', 'true', 'true');

--email = jasna.pendic@email.com password = 8876
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Jasna', 'Pendić', 'jasna.pendic@email.com', '$2b$12$2uq38IH2g0EIgkmov71fEuclmh9n4TjUH2Ev.cdpWULqvbnoVcBiG', 'true', 'true');

--email = vukadinka.nogulic@email.com password = 8899
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Vukadinka', 'Nogulić', 'vukadinka.nogulic@email.com', '$2b$12$WwkDJcj8KC1dMqDgOCJgt.Or358pBcRRSooDAqlBJZOR8jotDFUVe', 'true', 'true');

--email = teohar.krickic@email.com password = 1612
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Teohar', 'Kričkić', 'teohar.krickic@email.com', '$2b$12$Q9sFCcchH8qFwvli7QoG6u.Wz2hC3fdiM2ubJNzArGeLhHEgqmHWa', 'true', 'true');

--email = svetislava.stijepcic@email.com password = 7491
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Svetislava', 'Stijepčić', 'svetislava.stijepcic@email.com', '$2b$12$BSEhE0tnrgzKmy6bOyy95eYgX8WllFMchxAf3KXDJLTyo5Rg7FLie', 'true', 'true');

--email = milinko.mrakic@email.com password = 1604
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Milinko', 'Mrakić', 'milinko.mrakic@email.com', '$2b$12$rYU/PiMW.lkOXtMIkMD3oO25tanvZU8x4FF5HIbM.Rmi1OVLohBAi', 'true', 'true');

--email = aleksa.krestic@email.com password = 5926
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Aleksa', 'Krestić', 'aleksa.krestic@email.com', '$2b$12$T2ZdjVz/2KQvuQbsL7gzp.xvgBaAN5QQ4dm1nQ2Hlz5lOjlTKj.RC', 'true', 'true');

--email = radosav.krasavcic@email.com password = 1919
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Radosav', 'Krasavčić', 'radosav.krasavcic@email.com', '$2b$12$DUmiduJwYoVk5tA7xm38eeniMThwD4UL6SaWt3HwgKjFnxlaMg8/W', 'true', 'true');

--email = veljko.marusic@email.com password = 5438
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Veljko', 'Marušić', 'veljko.marusic@email.com', '$2b$12$rC/ZlqZe2FK3oFAW0HGBdODpHxfeBLstMi0WiIsrFXDoK8vPkcwWG', 'true', 'true');

--email = isailo.balandzic@email.com password = 1456
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Isailo', 'Balandžić', 'isailo.balandzic@email.com', '$2b$12$uFTqTi2NMAL6vGgk9kUMMuu2Gbs5.Im/lVyQqmPsdBvXy7S.Fr7eS', 'true', 'true');

--email = kuzman.djurisic@email.com password = 3982
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Kuzman', 'Đurišić', 'kuzman.djurisic@email.com', '$2b$12$TBuMuQfRqhEqiNjlWBRhdOWMb4A6btRz4yGSqjs76OX//03hFGxaW', 'true', 'true');

--email = gradimir.malencic@email.com password = 5476
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Gradimir', 'Malenčić', 'gradimir.malencic@email.com', '$2b$12$FkAGNTyuE.JAdLOREmW5BuIH2rKNrVTFrYRx7pDMMNQXNSzpn/vs6', 'true', 'true');

--email = filipa.zlatic@email.com password = 7461
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Filipa', 'Zlatić', 'filipa.zlatic@email.com', '$2b$12$QfybGlSCNzobTVLQcOdtZuXEnJ9PfmhWedyogbgys/lPIn08f6dcS', 'true', 'true');

--email = sima.percic@email.com password = 5332
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Sima', 'Perčić', 'sima.percic@email.com', '$2b$12$Kx2FMNqVQYvSngLb164pN.GwN0a8UozckPRm4.1KsL5l/xdi2X76O', 'true', 'true');

--email = nadezda.soknic@email.com password = 7638
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Nadežda', 'Soknić', 'nadezda.soknic@email.com', '$2b$12$yScCkUMIEKEeB54ApdByMOTjdAwUrbJxIjW/HblyC81gR.lpFFY3S', 'true', 'true');

--email = radinka.rajcetic@email.com password = 6251
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Radinka', 'Rajčetić', 'radinka.rajcetic@email.com', '$2b$12$Bpj5tNwfuwKQr3kY2J5/H.BbvEQ.7ILQGV4vt3YIOSW0PjEtI/lIe', 'true', 'true');

--email = rajko.nikolcic@email.com password = 8370
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Rajko', 'Nikolčić', 'rajko.nikolcic@email.com', '$2b$12$KriSJEhNYpu07efTyv60z.RpsPuCNJ8ZWFsuRq9NPpAx/JDtAH15W', 'true', 'true');

--email = rajica.karajcic@email.com password = 8664
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Rajica', 'Karajčić', 'rajica.karajcic@email.com', '$2b$12$o2YsNA4DACcRPR9t8Nb6sew2.iHdF1MDUYeTT.y4/8fJRenFwHWmi', 'true', 'true');

--email = slavenka.zimonjic@email.com password = 4346
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Slavenka', 'Zimonjić', 'slavenka.zimonjic@email.com', '$2b$12$OCvQUE9wwX2XrEg6kqw5FeAN1gfSVcHfTgpD/xpM8zA0D28Cs6Vie', 'true', 'true');

--email = fedor.derikonjic@email.com password = 2631
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Fedor', 'Derikonjić', 'fedor.derikonjic@email.com', '$2b$12$jFHbVL8X2Re5ygAv5Rcg9.cCvdFiN2bw0egZlU13fCRYEApoC1fly', 'true', 'true');

--email = sima.nincic@email.com password = 9705
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Sima', 'Ninčić', 'sima.nincic@email.com', '$2b$12$z/Y1POMokr6R.rITJKNMC.a5F3AVLSy8w50ogNmQS26C1uJ.NZzSm', 'true', 'true');

--email = stojka.krejic@email.com password = 2471
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Stojka', 'Krejić', 'stojka.krejic@email.com', '$2b$12$plDZRAOLE49TIMQ3TSHg6erqXrtvxlZs9TmCyFkTSdVTXXiW/Q3Ea', 'true', 'true');

--email = vojislava.abadzic@email.com password = 7670
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Vojislava', 'Abadžić', 'vojislava.abadzic@email.com', '$2b$12$YZSA0ST8n7VtSQN9VAMN4uCK2hmaJZQVOUCQa5ZFFzAuOJPo1tJS.', 'true', 'true');

--email = dragisa.mrkaic@email.com password = 7583
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Dragiša', 'Mrkaić', 'dragisa.mrkaic@email.com', '$2b$12$PZnk9m7/gTF60hGjtvtZoulCHTvlHimk9KFx/4tsvNWKO2Hky4cUO', 'true', 'true');

--email = andrijana.njezic@email.com password = 6647
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Andrijana', 'Nježić', 'andrijana.njezic@email.com', '$2b$12$7ULZjKoC3rk42bDsbmjZR.jH/mR13CPVK.IjwLk9mYhL2e2n2OU8a', 'true', 'true');

--email = sredoje.stevanetic@email.com password = 3762
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Sredoje', 'Stevanetić', 'sredoje.stevanetic@email.com', '$2b$12$76txaS8Bu34cX87TiHPbZuxl3CgmG5RLnfMNeBYpAYT6PhHYusf9G', 'true', 'true');

--email = petronije.petricic@email.com password = 3318
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Petronije', 'Petričić', 'petronije.petricic@email.com', '$2b$12$7.yJOSbATyWyNjRd09PhuOlkp7qRnu0Jrj.QVoleBwBuGf3mZIl9q', 'true', 'true');

--email = tesman.repasic@email.com password = 2724
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Tešman', 'Repašić', 'tesman.repasic@email.com', '$2b$12$E1s/RI1OgFZskVp8bPOVKOWtuP6DjH4BMhGGiJMWLc1rXcT2oZxOC', 'true', 'true');

--email = vlajko.nogic@email.com password = 3403
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Vlajko', 'Nogić', 'vlajko.nogic@email.com', '$2b$12$2.ZLa5O0VyQepSSr/7mqFOhtj3qC.m8IGfGBgCuplYH2hY43RPZKW', 'true', 'true');

--email = srdjan.icelic@email.com password = 5357
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Srđan', 'Ičelić', 'srdjan.icelic@email.com', '$2b$12$fUdsFXQC03eZacyGGGbutedKIT7yLuz8Ll7VA82OCtOw5n8uM1482', 'true', 'true');

--email = svetislava.tatisic@email.com password = 7919
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Svetislava', 'Tatišić', 'svetislava.tatisic@email.com', '$2b$12$ACC3Du2WSoIWtjoXFBmon.UZODoyqA9kI5JvFiWaD1Jw.wch5trX2', 'true', 'true');

--email = hranislavka.brkic@email.com password = 4806
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Hranislavka', 'Brkić', 'hranislavka.brkic@email.com', '$2b$12$bFhGnVxpzNKp/PIWN2QgEez2BFdMpvGiLT/WlPPY/SP9BiM5pFZj.', 'true', 'true');

--email = blaza.boscic@email.com password = 3429
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Blaža', 'Boščić', 'blaza.boscic@email.com', '$2b$12$3nCnvrGqxOi4ukr8t2MD0uT8/LXk4QDR3lqvuTg7zRdvP0Q06NnD.', 'true', 'true');

--email = mladen.baclic@email.com password = 7281
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Mladen', 'Bačlić', 'mladen.baclic@email.com', '$2b$12$rAJWnqggS0uu/ZBI7r.0tuekuZP0gQItRLUQelXgYIkU8WReG0zCy', 'true', 'true');

--email = vidak.sofijanic@email.com password = 9054
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Vidak', 'Sofijanić', 'vidak.sofijanic@email.com', '$2b$12$DrJvgSo2MoszpDNGsWM2aeyRdIOKONRraBhkGVqa1M0B.qhkEAJOC', 'true', 'true');

--email = dragomir.lupsic@email.com password = 3222
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Dragomir', 'Lupšić', 'dragomir.lupsic@email.com', '$2b$12$65MadjhEZZn3zUkYyzJLkeoDUusJgfzndlrNKB0nLztd5kTMSNFTS', 'true', 'true');

--email = sava.otic@email.com password = 3240
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Sava', 'Otić', 'sava.otic@email.com', '$2b$12$luuS8s2XMNZmqphLKVsHXeno2fqShgJq6JyBGBmde3TcBJanlw7oW', 'true', 'true');

--email = zivka.bakajlic@email.com password = 6766
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Živka', 'Bakajlić', 'zivka.bakajlic@email.com', '$2b$12$xXo2EWp1X5ETU/03Hm4d.eFyQDpvZxXQ8TpnpYKun1UBM.PauI7Ae', 'true', 'true');

--email = slavna.vacic@email.com password = 9977
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Slavna', 'Vacić', 'slavna.vacic@email.com', '$2b$12$5GR694RyMSWgY7In8FyXOOeDB.xXiwPS6LIXUkcaToBtgiOrcve4i', 'true', 'true');

--email = zivanka.pacaric@email.com password = 5240
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Živanka', 'Pačarić', 'zivanka.pacaric@email.com', '$2b$12$LkU9lGJcX5hFrfMJ646OTuzAze/Lu2upou/vo5B1q7O7QFAK1vLj2', 'true', 'true');

--email = nemanja.anikic@email.com password = 6242
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Nemanja', 'Anikić', 'nemanja.anikic@email.com', '$2b$12$nDNEw.0ETUKU1VQ70ccVBuYx1UNvOu/vhxmKgCSCHQskAPoI3EMC.', 'true', 'true');

--email = purisa.pajicic@email.com password = 6359
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Puriša', 'Pajičić', 'purisa.pajicic@email.com', '$2b$12$2SrxZ/1fNpTXmj3uUl82fu1qG/pF65p2lK5UJXNLfeRQGiigcbPce', 'true', 'true');

--email = stokan.jelenic@email.com password = 3494
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Stokan', 'Jelenić', 'stokan.jelenic@email.com', '$2b$12$.LVCnv98uFqJcz3AjXx32eS/NH7niaIWDtvVd.3HjBzSTGkDowhDi', 'true', 'true');

--email = prohor.galonjic@email.com password = 9177
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Prohor', 'Galonjić', 'prohor.galonjic@email.com', '$2b$12$t/1rgdjLTjXcsMI3yjsuWe6T4E/xK3U37lDhI/6Og3tYdH0xoAPcO', 'true', 'true');

--email = velimir.medancic@email.com password = 6392
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Velimir', 'Medančić', 'velimir.medancic@email.com', '$2b$12$ONeh266JaPMyHMT6ToDLY.0EYzKlGrwAYDJQ1O3miAEBEcDtyB1f6', 'true', 'true');

--email = mijalko.prodic@email.com password = 6040
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Mijalko', 'Prodić', 'mijalko.prodic@email.com', '$2b$12$Bk2L2RiSR5aOhz2ipUcY4.4qYoPzWNAeUWwgWz7FH25iNN6wHDZVC', 'true', 'true');

--email = stana.ravilic@email.com password = 2607
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Stana', 'Ravilić', 'stana.ravilic@email.com', '$2b$12$.iNY8y9mw2JOPKSWh6YNU./ZqEHsXMA27NmlGfBwYhukvWdcudsxS', 'true', 'true');

--email = zlatomirka.aladzic@email.com password = 7289
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Zlatomirka', 'Aladžić', 'zlatomirka.aladzic@email.com', '$2b$12$MwY.2SdDsPOktRwx.jnVa.49Fwe9z.0MveqEinzBUdDgklrTcUOoK', 'true', 'true');

--email = nedeljko.kolicic@email.com password = 5832
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Nedeljko', 'Količić', 'nedeljko.kolicic@email.com', '$2b$12$aKzve6u3aZYCsfm.g0857ehHGzkzLwDI8MyYEuxlGlsJAsQkzGQLe', 'true', 'true');

--email = stanko.pandzic@email.com password = 4863
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Stanko', 'Pandžić', 'stanko.pandzic@email.com', '$2b$12$bez08X32/D/CesGGnos8t.VtaNm6nfxjE2yzrprJc2vw24yL1mC1S', 'true', 'true');

--email = tomislav.videkanic@email.com password = 7834
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Tomislav', 'Videkanić', 'tomislav.videkanic@email.com', '$2b$12$Hmx5KMrbank6SNFUqxA6ZeDV5rBvu/viD4MDMGSxZWOje7Hsiv5xe', 'true', 'true');

--email = djurdjevka.zlovaric@email.com password = 2399
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Đurđevka', 'Zlovarić', 'djurdjevka.zlovaric@email.com', '$2b$12$hAaifKVQbTmIhlXGurcKWefvjICosF5704c5wAl90ePcUvqchg1nO', 'true', 'true');

--email = borislav.labotic@email.com password = 1295
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Borislav', 'Labotić', 'borislav.labotic@email.com', '$2b$12$bAh5fSSBalnoa39DbSRth.JxnoV4yxlO8flIup5NdpSj7tKdMQ7.y', 'true', 'true');

--email = tatomir.maglic@email.com password = 5915
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Tatomir', 'Maglić', 'tatomir.maglic@email.com', '$2b$12$Hl5P0vxrJ1fBHTp0iyk2Fu9Q4jIFrnjjLaMZx1fya8OsPoIhXV5du', 'true', 'true');

--email = despot.cohadzic@email.com password = 8846
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Despot', 'Čohadžić', 'despot.cohadzic@email.com', '$2b$12$Bf9KQYZnq0u7vgNWQK51RukMdItDR/ah6FIvIWJYxGgIEBFkLgJq.', 'true', 'true');

--email = jasminka.miloicic@email.com password = 1348
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Jasminka', 'Miloičić', 'jasminka.miloicic@email.com', '$2b$12$QrYLDKvJqH6dn2/105y5tOxtR5ZNQE/rNgAmimQrzotHnuMFmr3km', 'true', 'true');

--email = relja.egeric@email.com password = 5947
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Relja', 'Egerić', 'relja.egeric@email.com', '$2b$12$VNEy4pEtiwQSaN5DLkTML.L.5xnmRe2eSmkISqh9Y4tfsNVT0xHEC', 'true', 'true');

--email = trajanka.radukic@email.com password = 1001
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Trajanka', 'Radukić', 'trajanka.radukic@email.com', '$2b$12$NOMBDrWUTpAUOpKEEJUsgezXlSIhJ80am2H8Kv1l/ttFGaFc6THoi', 'true', 'true');

--email = radojlo.saponjic@email.com password = 1811
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Radojlo', 'Šaponjić', 'radojlo.saponjic@email.com', '$2b$12$coTJkfM.v80V.s6uDjHhK.pJTG5q.ciqVDAx8tTytWhDuCbWYg88S', 'true', 'true');

--email = lepoje.rendic@email.com password = 1909
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Lepoje', 'Rendić', 'lepoje.rendic@email.com', '$2b$12$SzTpVHn.9jzcVEl2Roir9O8MI47zYjpZ7iwlgFM3IU8zz.6DLwGbW', 'true', 'true');

--email = milun.hadzi@email.com password = 3214
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Milun', 'Hadži', 'milun.hadzi@email.com', '$2b$12$Bm8hqVeg9Dbrc9d3QmZJOe4g8CQ014II0OWPXY8S6XP/sfK5ngI1W', 'true', 'true');

--email = negomir.m@email.com password = 5313
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Negomir', 'M', 'negomir.m@email.com', '$2b$12$XjiNcA/SmsfLpw1tVMJsPONdUbKsB5MTQxcQxZJT4jmvo72YX1RC6', 'true', 'true');

--email = sako.karetic@email.com password = 7294
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Šako', 'Karetić', 'sako.karetic@email.com', '$2b$12$0LWo9i1SUZO3aI4p5J2isO3ErF/a91zZxeQPgNxCdMgg5pZ4zSbOC', 'true', 'true');

--email = dositej.labotic@email.com password = 9923
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Dositej', 'Labotić', 'dositej.labotic@email.com', '$2b$12$d4R4Ob5rdboVHq6XopBQO.L8fS/ISGahuzc8deu8Bhmdv6gUQD5.m', 'true', 'true');

--email = vojislav.ponjavic@email.com password = 6786
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Vojislav', 'Ponjavić', 'vojislav.ponjavic@email.com', '$2b$12$B2b4jtg3/DlL4HJYdRLcPOjcd2N/fSrA0VB4RiC.tVfKwjiW2.oSS', 'true', 'true');

--email = slavenka.drinic@email.com password = 4971
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Slavenka', 'Drinić', 'slavenka.drinic@email.com', '$2b$12$KVqQnfq9LjVgvRjH1VNn4eALNp70eYr688CDc4iLd63ckNVbwHQgS', 'true', 'true');

--email = ljupka.basaric@email.com password = 8680
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Ljupka', 'Basarić', 'ljupka.basaric@email.com', '$2b$12$wSN1qbw/J4RVrUKdMiJaKeAy6ZKiFF6e3g6yg443tx0JXjj/eArki', 'true', 'true');

--email = ratka.kusonic@email.com password = 2312
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Ratka', 'Kusonić', 'ratka.kusonic@email.com', '$2b$12$91fFjATrBm4RQ2JbudcLK.xXPcMm63BwjbgMexfNW0O5rluPzAsXm', 'true', 'true');

--email = bane.cokic@email.com password = 1544
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Bane', 'Čokić', 'bane.cokic@email.com', '$2b$12$0QzYdROGsotW1yEhqMF5NOcWJzCul2VGuimLZG/njLun42ajiDkla', 'true', 'true');

--email = trajko.luzaic@email.com password = 5868
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Trajko', 'Lužaić', 'trajko.luzaic@email.com', '$2b$12$UZS4OCucLGf0ebiUoARTYOJ72FkOqAycz8lfBt6vfwhrCIvLLiQ9e', 'true', 'true');

--email = negovan.naspalic@email.com password = 6531
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Negovan', 'Našpalić', 'negovan.naspalic@email.com', '$2b$12$5y/uAhLDNCwqe5vE.rWyz.kv6nqTSLBT9qDWonQqgdhhxpXhW9FXK', 'true', 'true');

--email = ana.dzadzic@email.com password = 3199
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Ana', 'Džadžić', 'ana.dzadzic@email.com', '$2b$12$BqhlOCC8G.aX/3iF262tLes.UhnHJvCWpo2x4LgirFh/A70W8vMfa', 'true', 'true');

--email = danojlo.usendic@email.com password = 8416
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Danojlo', 'Ušendić', 'danojlo.usendic@email.com', '$2b$12$fq.q4MgNG389Fd17lhsXMOEavZgkM7LZ0V6GrDb9J15gOg7BtBppS', 'true', 'true');

--email = bozidar.mazibradic@email.com password = 5076
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Božidar', 'Mažibradić', 'bozidar.mazibradic@email.com', '$2b$12$stqXVJ1jNPkCsQ2Ksa1Uru0WBfxCiGAABpKDDy5b7bCsRA1uRD0x6', 'true', 'true');

--email = blagica.kendrisic@email.com password = 8830
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Blagica', 'Kendrišić', 'blagica.kendrisic@email.com', '$2b$12$.u32nQdwu8euzSeMjCwi9O9/lhM8ZI0GQspnCCBtOEqC7TVdEAoEq', 'true', 'true');

--email = branislava.zipancic@email.com password = 8923
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Branislava', 'Zipančić', 'branislava.zipancic@email.com', '$2b$12$2w6DXGSpR57O1zQCJrAPfuuS6u0kTgDfYCYjRso1g0dEUD/x5F9k2', 'true', 'true');

--email = borka.mladzic@email.com password = 5565
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Borka', 'Mladžić', 'borka.mladzic@email.com', '$2b$12$Qn287DP/DLFVcZQFNTD8FOEA0fUgbvaZ9c1T15UOgBSpkk7xlpEse', 'true', 'true');

--email = milija.treskic@email.com password = 7368
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Milija', 'Treskić', 'milija.treskic@email.com', '$2b$12$TyfqO0upv/ovgpIhP2UfmucGXhxetHo7E9QG9jfljssUQc32pZj5O', 'true', 'true');

--email = sergije.vasikic@email.com password = 5071
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Sergije', 'Vasikić', 'sergije.vasikic@email.com', '$2b$12$dBDdERLav9NPmDUG1CkciuHOnHKy.bj2ZL5/UQAK98VVDw8z3gN2.', 'true', 'true');

--email = rastko.djelkapic@email.com password = 4293
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Rastko', 'Đelkapić', 'rastko.djelkapic@email.com', '$2b$12$k7FnwsoBDNo1Oi2ItFY4SuH5CR73PIAD4hn5hbXQ78ch/GkWXaKby', 'true', 'true');

--email = radisav.andrejic@email.com password = 2276
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Radisav', 'Andrejić', 'radisav.andrejic@email.com', '$2b$12$/owO.w12GAjq5bVqy1.1J.ecGR77kNaxxSW/.UbGX3TSGHCdXuXzy', 'true', 'true');

--email = jasna.bajic@email.com password = 9035
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Jasna', 'Bajić', 'jasna.bajic@email.com', '$2b$12$CoqLGguxI3VT8Bb.oG/TI.afRkkXtzJIFiMr7C0SdCZkZoskbvd0u', 'true', 'true');

--email = vukota.avalic@email.com password = 8049
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Vukota', 'Avalić', 'vukota.avalic@email.com', '$2b$12$ceSFaqESrqV8tDM2SRize.MOOoAFnLXzYOSNwVUZtHwL8uM3OFdEC', 'true', 'true');

--email = nada.cukanic@email.com password = 9054
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Nada', 'Cukanić', 'nada.cukanic@email.com', '$2b$12$2Jlz0T/kK5eDROnr/B4hFefqirPminCfj/15p2Ay/PIxRxCFUgsWS', 'true', 'true');

--email = igor.guberinic@email.com password = 6336
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Igor', 'Guberinić', 'igor.guberinic@email.com', '$2b$12$dbOHkCXpRUmpTnBfSFAGT.90MBD8CxH4BrcPEGMj/O8bFZA/hFCZy', 'true', 'true');

--email = kamenko.danojlic@email.com password = 1609
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Kamenko', 'Danojlić', 'kamenko.danojlic@email.com', '$2b$12$Hm5Z.x64nHlMcIT3kU9/0uAwkGHZJnZih4/XCi24dlGmzzU.x1Wru', 'true', 'true');

--email = cedomir.mrkaic@email.com password = 7545
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Čedomir', 'Mrkaić', 'cedomir.mrkaic@email.com', '$2b$12$ktI4tVv1PbMWgKaMDwBJ..Kf92O3MA7k/SsxKfcurKEcduMEoxF5S', 'true', 'true');

--email = vukosav.vrucinic@email.com password = 8700
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Vukosav', 'Vrućinić', 'vukosav.vrucinic@email.com', '$2b$12$SSvmOgZ2mu1iqYzeClvykuEDivCfEcvXPl94hsPELKW5n5qzNWqz2', 'true', 'true');

--email = branislava.tucic@email.com password = 4102
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Branislava', 'Tucić', 'branislava.tucic@email.com', '$2b$12$hj8JBgH.ffKEYZRqVOG8O.HOUcUSimjZ5dZEfPfs/nKVS70SG8WZ.', 'true', 'true');

--email = dusan.puseljic@email.com password = 8156
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Dušan', 'Pušeljić', 'dusan.puseljic@email.com', '$2b$12$6Q4cXPxUMp5fDEiJ2078auEObbJ4Ee9VL67PWum3fr89dWcugxkii', 'true', 'true');

--email = vukosav.korasic@email.com password = 2250
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Vukosav', 'Korasić', 'vukosav.korasic@email.com', '$2b$12$rIwO1KL/0c8FSSE5U0uTGem.pYrgsBIeIVBsA/EOMgsF/yKQEkSia', 'true', 'true');

--email = kristivoje.stijepcic@email.com password = 2911
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Kristivoje', 'Stijepčić', 'kristivoje.stijepcic@email.com', '$2b$12$eHrQE6gCcIi6chlXZlISE.JcOtZs54L5BPiCafp10rzqLW7lYXD42', 'true', 'true');

--email = ninko.skipic@email.com password = 9357
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Ninko', 'Škipić', 'ninko.skipic@email.com', '$2b$12$GojR9xHXvJFc9zaLpEQX.OkGVwnBny1djMyG/fTiY.tPwUsadJcxu', 'true', 'true');

--email = stojmen.stevanetic@email.com password = 8971
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Stojmen', 'Stevanetić', 'stojmen.stevanetic@email.com', '$2b$12$b7EwFET5Hx41MkH1q62TT.IV.ISTK6gZjsfcnMgDqBWwnE3Jcws9a', 'true', 'true');

--email = gabrijela.malobabic@email.com password = 3984
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Gabrijela', 'Malobabić', 'gabrijela.malobabic@email.com', '$2b$12$9eG4ekJIBmc6SqfnUzMxBuq/TEhw30KPmqZ9qgV/8Axu1x48BZjEm', 'true', 'true');

--email = radenko.perutic@email.com password = 1197
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Radenko', 'Perutić', 'radenko.perutic@email.com', '$2b$12$EHp486ASzsKgjaEDnE37neMwm1fCUFA4heBokjaauk2bvnJYx6Waa', 'true', 'true');

--email = cvetana.buzaretic@email.com password = 5197
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Cvetana', 'Buzaretić', 'cvetana.buzaretic@email.com', '$2b$12$nW7ow.iULq2sBhh9Z9nOSeDjXPYbK13a9JKOtNtxJSugU6fyKY3US', 'true', 'true');

--email = njegoje.kosarcic@email.com password = 1311
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Njegoje', 'Košarčić', 'njegoje.kosarcic@email.com', '$2b$12$qA5zGQUAqqJHiH/5mMFdfOr.r8nvjIfsRoH8x8KXjt0y6dVghxsCy', 'true', 'true');

--email = eva.slavnic@email.com password = 8184
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Eva', 'Slavnić', 'eva.slavnic@email.com', '$2b$12$YpBEsH/pVVk2t9IdzKwjCe3qsghB1ThUK123KepTaTHOI1Q6oDJbK', 'true', 'true');

--email = dejan.klipic@email.com password = 9348
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Dejan', 'Klipić', 'dejan.klipic@email.com', '$2b$12$5J9GUNUzBMOOO3Gjb1rX9ObykAZVuHNmcpF8HsoFTJCkWZdKgwYGe', 'true', 'true');

--email = cvijan.gerzic@email.com password = 6518
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Cvijan', 'Gerzić', 'cvijan.gerzic@email.com', '$2b$12$63OEUDNp0OJcu.mTQWyEq.Gc1//6q6lxzr48TZT99U1pT0hUv4z9m', 'true', 'true');

--email = cvetomir.bakic@email.com password = 6253
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Cvetomir', 'Bakić', 'cvetomir.bakic@email.com', '$2b$12$DPowoc7LrbIFg7cBYsUDBu8Qn0DLbujQYFcabo8vXxRuHfbcVBBIC', 'true', 'true');

--email = melenija.varaklic@email.com password = 1269
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Melenija', 'Varaklić', 'melenija.varaklic@email.com', '$2b$12$VAXllEzy3yRb55gNcwKlKevMe6CPvRrb/3sZX0spJ9LlNPYxtpCUq', 'true', 'true');

--email = ivan.avalic@email.com password = 6195
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Ivan', 'Avalić', 'ivan.avalic@email.com', '$2b$12$f1VhElHrc2U5UhWlyJpMzOVAuJFaM2hyrcgfHdJQxAcVep8G4AdLe', 'true', 'true');

--email = aran|el.surlic@email.com password = 2009
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Aran|el', 'Surlić', 'aran|el.surlic@email.com', '$2b$12$.eY8NE8Pqa45uERKekLrHey17bB.3pHsomXA/1s5SM384.6hYvO.i', 'true', 'true');

--email = kosta.stanisic@email.com password = 8036
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Kosta', 'Stanišić', 'kosta.stanisic@email.com', '$2b$12$gAuSVCQpncxsiz0pFAx/yOFzKNSWfZyk7BYi/Q6KZqjNC9GY.B.La', 'true', 'true');

--email = violeta.roskic@email.com password = 4876
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Violeta', 'Roskić', 'violeta.roskic@email.com', '$2b$12$JQ19mmbp38W5j5CshEWDmuxXMAwEGztOeCa.mRwx3iR.skkSx5yM2', 'true', 'true');

--email = sale.brodic@email.com password = 3978
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Šale', 'Brodić', 'sale.brodic@email.com', '$2b$12$7ffwlzoHK2vn2yAthd4bTuYdzMDOs37q0B6HlPco2DXC6RFrEZvDC', 'true', 'true');

--email = sofronije.kepic@email.com password = 4927
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Sofronije', 'Kepić', 'sofronije.kepic@email.com', '$2b$12$tUbIoH09dcem0CglPBTPP.oxmblPyrefcSTh450/HcEGWLuCVnDva', 'true', 'true');

--email = konstantin.backic@email.com password = 7346
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Konstantin', 'Backić', 'konstantin.backic@email.com', '$2b$12$SclVqaEInnlFFGUTv39nr.oBaa/VDbSQXuZYCmGkzI3wy/K41LKGa', 'true', 'true');

--email = gordana.andjelic@email.com password = 4858
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Gordana', 'Anđelić', 'gordana.andjelic@email.com', '$2b$12$ZZSKRHnzc0iQW1RcGfw.Z.G8vg8MhJAUVsVJB3NDW1WgKrJje4Na6', 'true', 'true');

--email = hristina.tepic@email.com password = 8643
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Hristina', 'Tepić', 'hristina.tepic@email.com', '$2b$12$xatUj6vLor36FgblJ734yeiyO2pBFw/WyB.YBZolq9xw7jrArhN9u', 'true', 'true');

--email = maksim.filic@email.com password = 6456
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Maksim', 'Filić', 'maksim.filic@email.com', '$2b$12$OazdquNWfYjYOafKrUi9HOqb0Ic.xzAKtBja3Lp1m7/fH0CTFjj4.', 'true', 'true');

--email = petko.cundric@email.com password = 9473
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Petko', 'Cundrić', 'petko.cundric@email.com', '$2b$12$Ba2AwuDY/eWTYl.8/W96MOgmlbTBNrNN.0tjPfmfd2CTRf/v2XxfS', 'true', 'true');

--email = mirosava.sopic@email.com password = 7458
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Mirosava', 'Sopić', 'mirosava.sopic@email.com', '$2b$12$bxQB7ntSodiJyiQXlwYxwujbcPxgHdaPQjV7iXpIAiCIH60BUw/T.', 'true', 'true');

--email = ninoslav.orlandic@email.com password = 7129
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Ninoslav', 'Orlandić', 'ninoslav.orlandic@email.com', '$2b$12$Y3bhL/dCOIiG5xS2.pQZ6OUrhxTXICyGc9kSOk9Gbr2OGtzT2DYI2', 'true', 'true');

--email = dragojlo.mihaldzic@email.com password = 2416
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Dragojlo', 'Mihaldžić', 'dragojlo.mihaldzic@email.com', '$2b$12$MgKxNK/m8EgS0vZGFXx3..yOTsnT4FYt1f2id0k9LF3TpXooznhju', 'true', 'true');

--email = zlatko.glibetic@email.com password = 6768
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Zlatko', 'Glibetić', 'zlatko.glibetic@email.com', '$2b$12$JD31L0P0UjAOabaF8ksVZeX5kbF3i6TfqegetxA7gMLnG6WkJyYui', 'true', 'true');

--email = dubravka.ljaljic@email.com password = 5836
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Dubravka', 'Ljaljić', 'dubravka.ljaljic@email.com', '$2b$12$M3Qk4qp6q.Q6MKBIqGMsre3.86d5HQpojo0MI8xFXtcD0QsucJOTS', 'true', 'true');

--email = srba.tufegdzic@email.com password = 8489
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Srba', 'Tufegdžić', 'srba.tufegdzic@email.com', '$2b$12$xWM8gWnSCfax90ivU0Vo7eJgghKUWRh.qopPhqFt.oV/ARrNf1XSK', 'true', 'true');

--email = vuksana.backulic@email.com password = 4738
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Vuksana', 'Bačkulić', 'vuksana.backulic@email.com', '$2b$12$4/bIzng.csEklAlCJcfBVuMFTZvxR/5dIb2e5i4Cv3pWjvWE60yfW', 'true', 'true');

--email = momcilo.duronic@email.com password = 1330
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Momcilo', 'Duronić', 'momcilo.duronic@email.com', '$2b$12$TtEOPSalC8l//Oj0tkW1Ru5vLGkC09BipqVaG4vYhTBVir0oNkPWi', 'true', 'true');

--email = cvetomir.borisic@email.com password = 3456
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Cvetomir', 'Borišić', 'cvetomir.borisic@email.com', '$2b$12$Q67KdfKTnavzCuV94XH8NeEtugwXxKqA9Rdd8328Pc0GVl6qk6C3a', 'true', 'true');

--email = gligorije.buzejic@email.com password = 8590
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Gligorije', 'Buzejić', 'gligorije.buzejic@email.com', '$2b$12$XjcOEzsskPOqZ5dOg3N0nOtTC5HYONRaDshAaHVGi9Z0nIDwwJkCO', 'true', 'true');

--email = laza.gobeljic@email.com password = 9010
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Laza', 'Gobeljić', 'laza.gobeljic@email.com', '$2b$12$Tb6TrkaOii96EPQUvcpIJe0S1CzV9dNbfBrVky893R31eJDPwROby', 'true', 'true');

--email = melentije.misulic@email.com password = 2849
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Melentije', 'Mišulić', 'melentije.misulic@email.com', '$2b$12$eZm8PM/vFleTGZUlf89eeu7DBFOVWz5lrLSXtvbfTbtsEwOfh2xKq', 'true', 'true');

--email = milka.sisic@email.com password = 2048
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Milka', 'Šišić', 'milka.sisic@email.com', '$2b$12$Pg3z2.sONNCQCt0RejSSFu80f4mZSMZcwG0RqxJwzmmcqigpubYwy', 'true', 'true');

--email = kasija.rnic@email.com password = 2546
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Kasija', 'Rnić', 'kasija.rnic@email.com', '$2b$12$t/FcWgEFWl4X/jB.KoO8Le5QTb.T/qfGdUNIe6uOOCEJMT1bYQ2zy', 'true', 'true');

--email = tamara.cedic@email.com password = 3077
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Tamara', 'Čedić', 'tamara.cedic@email.com', '$2b$12$kCTAV.zfOKmzlqdkaAl8E.UtUFt9jJmMNweeiY/YCYmpCMk2U093y', 'true', 'true');

--email = jelisaveta.todorcic@email.com password = 3932
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Jelisaveta', 'Todorčić', 'jelisaveta.todorcic@email.com', '$2b$12$RODzvxATTSexkAiGn67bd.zH5DN3E6QlEaJh9EZWLDaYCjWRHjILG', 'true', 'true');

--email = andja.budisic@email.com password = 9684
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Anđa', 'Budišić', 'andja.budisic@email.com', '$2b$12$FWkzuFg6nKoV5b3pUFcm/.wvGzcjlI1hedPOaDRK0ECIi3U0VY0uS', 'true', 'true');

--email = slavenko.sijakinjic@email.com password = 9116
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Slavenko', 'Šijakinjić', 'slavenko.sijakinjic@email.com', '$2b$12$.msLTm07iNFwu6kY8Yu5LeHX7O/N5lptNhOQLLYhA0ScWMoqFPy4C', 'true', 'true');

--email = glorija.prazic@email.com password = 7971
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Glorija', 'Pražić', 'glorija.prazic@email.com', '$2b$12$/IIZ9FcHxr10DPIdPKv28.V27gFznTfElhEnFsv7FYEHAKFKuBwP.', 'true', 'true');

--email = sreten.brocic@email.com password = 4618
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Sreten', 'Broćić', 'sreten.brocic@email.com', '$2b$12$F5v.6EHu5PbxeOh5JV/sM.4wckVKq7kcxy5AFidvMl8nWjnZTNKf2', 'true', 'true');

--email = novica.brodic@email.com password = 1709
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Novica', 'Brodić', 'novica.brodic@email.com', '$2b$12$QXEffUjg5xVNz4EjeyKpo.ZU0dUu.3HRyMsePmfdQIA.r7QXbrc7W', 'true', 'true');

--email = masinka.buduric@email.com password = 9581
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Mašinka', 'Budurić', 'masinka.buduric@email.com', '$2b$12$jrPQTHFGdYXTwoShDBIlfO9a42B3RwgX2WL7hsFDMAC8neLMiJl8O', 'true', 'true');

--email = filipinka.krstajic@email.com password = 4406
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Filipinka', 'Krstajić', 'filipinka.krstajic@email.com', '$2b$12$EU0buo1oxw5bS0hFF/5wdOmlgynKLy69SSvvqWpcnD0TE7ZKth0kq', 'true', 'true');

--email = grozdan.tojcic@email.com password = 2415
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Grozdan', 'Tojčić', 'grozdan.tojcic@email.com', '$2b$12$dAC5Z/IcEUItAWYnG09iLu.E.jQywvtAA3Ul7TLmAeGpKXv1KvX1C', 'true', 'true');

--email = gordana.milicic@email.com password = 5673
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Gordana', 'Miličić', 'gordana.milicic@email.com', '$2b$12$siJe5mCFHyu6pNhibR.KAOrPFlLPaTjvJ4d0pxkMVQXdbTuBwyr0y', 'true', 'true');

--email = pava.suletic@email.com password = 8802
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Pava', 'Šuletić', 'pava.suletic@email.com', '$2b$12$q6.O.HzU8dmYuFbgCnTPdOXB0ElkaO1sVgb6NiSKTgGz.kLC2Wn3G', 'true', 'true');

--email = ljubomirka.stejic@email.com password = 3917
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Ljubomirka', 'Stejić', 'ljubomirka.stejic@email.com', '$2b$12$rk8vJtuUbKYNjThdQZwI9eLdh2WUKVSnsEU8SROyq3U8RXyYquLBK', 'true', 'true');

--email = sima.djokic@email.com password = 7786
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Sima', 'Đokić', 'sima.djokic@email.com', '$2b$12$R07g7Zpl7.CVb6FdPdLTC.sOAlubGJ7LzGNWv6Ua3MsozXbMNconm', 'true', 'true');

--email = bratoljub.dzopalic@email.com password = 8520
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Bratoljub', 'Džopalić', 'bratoljub.dzopalic@email.com', '$2b$12$kYjFMbhGoBqM9TVlMWOoru3EqR0HdQCe8AAt6drq4YPExW4vg5j8e', 'true', 'true');

--email = tadija.katic@email.com password = 9994
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Tadija', 'Katić', 'tadija.katic@email.com', '$2b$12$VlUjq/c51GIwlDx./GGstes6ntIxaMDSnMPcrBWSqSdBR1jK8wpOi', 'true', 'true');

--email = zivomir.kujundzic@email.com password = 3324
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Živomir', 'Kujundžić', 'zivomir.kujundzic@email.com', '$2b$12$qmHp5gtP8sF7ZJsr4ueh0eXf1OHjTo2Rdj0xt4PVT96nvwwIbXHHu', 'true', 'true');

--email = ljuban.cokic@email.com password = 2745
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Ljuban', 'Čokić', 'ljuban.cokic@email.com', '$2b$12$1Slyf0JWt04Nxy2ZvCrbOee4Aoo010cSoqy6jEDCjTsOr/oqy7K5W', 'true', 'true');

--email = marinko.erdelic@email.com password = 1573
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Marinko', 'Erdelić', 'marinko.erdelic@email.com', '$2b$12$XPrvha57ds34Bz0ZTB4q1OOzzefbhXccZaMMNRJL8L4QmqEfKoDnS', 'true', 'true');

--email = filotej.radelic@email.com password = 7668
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Filotej', 'Radelić', 'filotej.radelic@email.com', '$2b$12$2wuRvsuefipsAV5kyokAR.P/nVATq8urwjKLXjKGXL9pT/d7eaNfK', 'true', 'true');

--email = dragoje.gorcic@email.com password = 6260
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Dragoje', 'Gorčić', 'dragoje.gorcic@email.com', '$2b$12$MEnE5fppXYA3nWfXhMfew.fuJfdiuxxcih9cAe6MDJcmHhZ55QrdW', 'true', 'true');

--email = gordana.vucelic@email.com password = 3269
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Gordana', 'Vučelić', 'gordana.vucelic@email.com', '$2b$12$Xv.Ux4i/XOWT3.1XGFOm5uB9yNUc8QxfI2SYXEWjdmTSxdZ.H0lrG', 'true', 'true');

--email = blagoje.kremonjic@email.com password = 8879
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Blagoje', 'Kremonjić', 'blagoje.kremonjic@email.com', '$2b$12$blYIeYGvU5v1fziBXde4bOEmlgXYEKP7MGs6GiYHaU0LevT14wXri', 'true', 'true');

--email = antonina.dorongic@email.com password = 9381
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Antonina', 'Dorongić', 'antonina.dorongic@email.com', '$2b$12$y08eUodBBrJ38H.yKbqfHOrJmFACuupmxjzuyyCkKvVT4ynoI7/4O', 'true', 'true');

--email = zivan.bjelicic@email.com password = 6142
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Živan', 'Bjeličić', 'zivan.bjelicic@email.com', '$2b$12$D/nJj.ZxNhhQNDKDhRh46OEHtQ1GXdC29UKtMWii0ja09bUovSq3u', 'true', 'true');

--email = lale.jesretic@email.com password = 5562
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Lale', 'Jesretić', 'lale.jesretic@email.com', '$2b$12$.wAzhf8YNGAztNQbDytIe.cG492Wc.4.8UQUJmsGR4uqSCyxaFFzO', 'true', 'true');

--email = mirko.pobulic@email.com password = 5472
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Mirko', 'Pobulić', 'mirko.pobulic@email.com', '$2b$12$FajmL1kjSkbAUW0vt8pmoeYxEbWtMMdSM.Vh6rFGsXnxi1l95WAN2', 'true', 'true');

--email = zivorad.vuicic@email.com password = 4123
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Živorad', 'Vuičić', 'zivorad.vuicic@email.com', '$2b$12$avljGqlC/U2o6RKcXvZoz.dNb0wcaAqhQrexxjGFt1wNp8jkcvKpu', 'true', 'true');

--email = cvetin.rakitic@email.com password = 4981
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Cvetin', 'Rakitić', 'cvetin.rakitic@email.com', '$2b$12$wm2FECUEVQpqVkF6w6O1ZOyRvmJmC9jdxRnZ4B4Xf4GHJ5GIOdeya', 'true', 'true');

--email = kadivka.cvrkotic@email.com password = 7221
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Kadivka', 'Cvrkotić', 'kadivka.cvrkotic@email.com', '$2b$12$o0mRbGhr.GFJWrg4qHSNh.f8Ny/DlbFTP8JJnP/rCZLPWSgFAw2ge', 'true', 'true');

--email = milija.gruzic@email.com password = 9442
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Milija', 'Gružić', 'milija.gruzic@email.com', '$2b$12$UrCc7BlePipelScrvy1VL.9etD7JXnqCNNRYUOE9xbW5XUt.J5vgm', 'true', 'true');

--email = vera.nikoletic@email.com password = 7364
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Vera', 'Nikoletić', 'vera.nikoletic@email.com', '$2b$12$y6XOitzUYBwyEM/dfEtmzeDXcuUh0aaDPS9bu2DBR2QFGGbbbWHIO', 'true', 'true');

--email = tugomir.tomicic@email.com password = 3014
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Tugomir', 'Tomičić', 'tugomir.tomicic@email.com', '$2b$12$Jxfmkyvw4uXulmKHaCoAfuYb62LRDn8VZ4O.u3OMFbT/he4xVFiAS', 'true', 'true');

--email = blaginja.bojcic@email.com password = 8795
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Blaginja', 'Bojčić', 'blaginja.bojcic@email.com', '$2b$12$EiMpBUpIzWN39Yd8ZFRZfunuqM0QslU9yNBS787uDzgLbOpCxqNGu', 'true', 'true');

--email = rastko.sindjelic@email.com password = 9141
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Rastko', 'Sinđelić', 'rastko.sindjelic@email.com', '$2b$12$CUwS9SG1KjsiA2hDX3N3fONaArlFa2E7rX7WIBdCEfL44P1HdnEGu', 'true', 'true');

--email = sako.mektic@email.com password = 3616
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Šako', 'Mektić', 'sako.mektic@email.com', '$2b$12$.fubQoRCcBEL5m.HPnSy5u7SPZ4Z/AalBwIlDh3OxCW2QQm0pqZsG', 'true', 'true');

--email = zlatoje.raljic@email.com password = 1844
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Zlatoje', 'Raljić', 'zlatoje.raljic@email.com', '$2b$12$FsxLna9Vu4wHU37QV.gdYezfHcGucQ.jxwzZx3aZh0ti2UUZeg6Fq', 'true', 'true');

--email = petar.bresic@email.com password = 7494
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Petar', 'Brešić', 'petar.bresic@email.com', '$2b$12$sI3QGsybpf45n4XAfMe1Pu/6J8aL07T81SI..QEvGs.doOvHqR/HW', 'true', 'true');

--email = negoslav.sporic@email.com password = 9523
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Negoslav', 'Sporić', 'negoslav.sporic@email.com', '$2b$12$edkY2.1VY08xw5QLfSdPR.V5TGQqfNfJv8CSmq/hwcjRIjwyYYvKi', 'true', 'true');

--email = petronije.karadzic@email.com password = 1797
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Petronije', 'Karadžić', 'petronije.karadzic@email.com', '$2b$12$Y7scFX945vGVH26sNaKYJORrmh9Z6hhIoUzQ2b1T3DgeMtO9EY3Z.', 'true', 'true');

--email = sibin.zebic@email.com password = 4382
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Sibin', 'Zebić', 'sibin.zebic@email.com', '$2b$12$WOlSqutoLIRUkCPp8ojlVOGwajgerg/8NO4/m2FWVRfofdgjvejIq', 'true', 'true');

--email = radoslav.skoric@email.com password = 6704
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Radoslav', 'Škorić', 'radoslav.skoric@email.com', '$2b$12$anLLvqA8F3bErPTwMAIlhuprl8VBUbFAZOYuOgv4tqqYxFJ.vQ4mO', 'true', 'true');

--email = dobrila.colanic@email.com password = 5936
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Dobrila', 'Čolanić', 'dobrila.colanic@email.com', '$2b$12$DLXnMg/6gxWCFAKPMX8T3Oc9HDZL532smzrcurX6KbmAf0nGAK7hu', 'true', 'true');

--email = ratko.buljigic@email.com password = 4857
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Ratko', 'Buljigić', 'ratko.buljigic@email.com', '$2b$12$YUJa/I7aWSigRPyjLexdN.oVB8WznN9/YxmMSF1q7V70ROKH8ZHnC', 'true', 'true');

--email = zivan.mandaric@email.com password = 7580
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Živan', 'Mandarić', 'zivan.mandaric@email.com', '$2b$12$B1DfzlrePeDi6kHcWnk4rOjXJMBQJeHAJM6MnC9lS.syXE8gl4SF.', 'true', 'true');

--email = ivona.tepic@email.com password = 5511
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Ivona', 'Tepić', 'ivona.tepic@email.com', '$2b$12$J9WEdcTMTVeFoQRvwnRClORBKuNF4v/L6pMVT9WGBNkgb75YYpttS', 'true', 'true');

--email = kosana.baltic@email.com password = 6288
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Kosana', 'Baltić', 'kosana.baltic@email.com', '$2b$12$NnY89HXkc4/AddxhFr.XAePpUKqYyg2witIo1zBbIImrKHY9mpLcG', 'true', 'true');

--email = milija.janjusic@email.com password = 9824
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Milija', 'Janjušić', 'milija.janjusic@email.com', '$2b$12$45HyuO7jtcpCTpJ9xLh18O0D/Hs3Fz9KjvWZTbAN/Wt2cxR0xFHtG', 'true', 'true');

--email = djuradj.vlasonjic@email.com password = 1367
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Đurađ', 'Vlasonjić', 'djuradj.vlasonjic@email.com', '$2b$12$pWRNXvyHuUU59D4HcuS4AOJNyFVBCDuGhB5KqOUHBfT8RcsIukWi.', 'true', 'true');

--email = zlatko.brdaric@email.com password = 1297
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Zlatko', 'Brdarić', 'zlatko.brdaric@email.com', '$2b$12$n0jsG3plW5sssFJqEvn7a.VoM0VfFF.WGNg3q1Ev/GGDnd0ik/pmy', 'true', 'true');

--email = trajan.kragic@email.com password = 8273
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Trajan', 'Kragić', 'trajan.kragic@email.com', '$2b$12$ybF02w2Riz5wIhLdE0KbAujKRJ.5FxxEOc2xFHBUcRoPvUPC1R6Mm', 'true', 'true');

--email = sanja.mirkic@email.com password = 8058
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Sanja', 'Mirkić', 'sanja.mirkic@email.com', '$2b$12$ADmbudOvfrww1ZSIK7ea..g79J1ZAVJU23VlxMHqZLUUVwjkNfIBC', 'true', 'true');

--email = srbislav.aloric@email.com password = 3241
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Srbislav', 'Alorić', 'srbislav.aloric@email.com', '$2b$12$YNslExJiQqhfowRqsMq4mey.5tzklY3PUEyElj8UEdvq4g9vN58d6', 'true', 'true');

--email = aleksandar.rajicic@email.com password = 8547
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Aleksandar', 'Rajičić', 'aleksandar.rajicic@email.com', '$2b$12$C7nbbsno54eU26k5KUXtkeDfzhpvQJhfH9E.ja2F5L.DVbABczkmq', 'true', 'true');

--email = bozidarka.pelagic@email.com password = 9955
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Božidarka', 'Pelagić', 'bozidarka.pelagic@email.com', '$2b$12$7V9SaPMOYqb0LLPepJ7BgeNWiIrPoVcoQCkZySQQ9pEIuSRKr4kGq', 'true', 'true');

--email = djordje.kurucic@email.com password = 8898
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Đorđe', 'Kurucić', 'djordje.kurucic@email.com', '$2b$12$4ZFL5cW.ZMLzYG/mhHoXFeaukIS7XHFbo8.nJgxHyWiDC61UqhvUy', 'true', 'true');

--email = djurdjija.petronic@email.com password = 5774
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Đurđija', 'Petronić', 'djurdjija.petronic@email.com', '$2b$12$rFXCCrTg5QmuRubkp.sFdehwWCQuYyi/ZC8.6DLlps4KVCUv2mhWu', 'true', 'true');

--email = simeuna.milusic@email.com password = 6973
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Simeuna', 'Milušić', 'simeuna.milusic@email.com', '$2b$12$aRU0vHnCsi9hzYN1N1eCa.RFcj0U.kKw3mpBHY66NzfmRHEPboMVW', 'true', 'true');

--email = njegosava.cajic@email.com password = 2011
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Njegosava', 'Cajić', 'njegosava.cajic@email.com', '$2b$12$g04.IeWm1IoEyAhU.zoc0uCJanKU3UT4lIl0zf3BfV8BxaRPSQZLu', 'true', 'true');

--email = vitomir.salinic@email.com password = 4176
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Vitomir', 'Šalinić', 'vitomir.salinic@email.com', '$2b$12$u2gWcv6SGWVBFhuqFJe3oOEAQ/9TlliDf10BLuqoLt2jtEFOnlmk6', 'true', 'true');

--email = trivun.dornic@email.com password = 4739
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Trivun', 'Dornić', 'trivun.dornic@email.com', '$2b$12$s/9kyqCzvkbeM1SBgjlEuehqL2RHMQ/.X03.YzbzdYPW9FsA7OzxC', 'true', 'true');

--email = radan.bunardzic@email.com password = 6393
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Radan', 'Bunardžić', 'radan.bunardzic@email.com', '$2b$12$GzzKhdXveEsA4.hO.Vjcm.vktZvx6xGkqRtdKX/oCeQMgz.3WBl0S', 'true', 'true');

--email = zivkica.borotic@email.com password = 4016
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Živkica', 'Borotić', 'zivkica.borotic@email.com', '$2b$12$ZhXPRVPgCbKd6rYGvR8I2OxAUn8AtlZKTV8/4EpbPSVVgDGjP.73a', 'true', 'true');

--email = zoran.vanusic@email.com password = 1204
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Zoran', 'Vanušić', 'zoran.vanusic@email.com', '$2b$12$mcEn/1ietXyhzH3R53.DFOR.Wlll0oCJnv/yaI8Dknr07CsHoueKa', 'true', 'true');

--email = mladomir.kovacic@email.com password = 1930
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Mladomir', 'Kovačić', 'mladomir.kovacic@email.com', '$2b$12$0cRoFKaHo1pzxe/NicJhrOGR0ZfksYogLdyNKeHYGLCEJik/3x3pq', 'true', 'true');

--email = ratislav.gajtanic@email.com password = 7359
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Ratislav', 'Gajtanić', 'ratislav.gajtanic@email.com', '$2b$12$gxVV5CDMBrDrGG.XRgXZj.oZtFNue/xTfNsvs92octnblvd.nbTB2', 'true', 'true');

--email = mirjana.peric@email.com password = 1416
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Mirjana', 'Perić', 'mirjana.peric@email.com', '$2b$12$KEZwX5pFp.ih9MwD7/Oy/OYmOZylKsOVteN4/ltJy9kvp12Cb6BMO', 'true', 'true');

--email = caslavka.plavljanic@email.com password = 1268
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Časlavka', 'Plavljanić', 'caslavka.plavljanic@email.com', '$2b$12$W4nVsc7ETVMZNg0tE4VLwOEMZQKR78ctJTfLogHeDnAAz5uxmmjEi', 'true', 'true');

--email = sandra.jelusic@email.com password = 5033
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Sandra', 'Jelušić', 'sandra.jelusic@email.com', '$2b$12$16DVcUYUCMdtJCktztoEk.gOI2oY8CZ5o1DJF8pMF.7z3tE9ktckW', 'true', 'true');

--email = dragojlo.nakaradic@email.com password = 2409
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Dragojlo', 'Nakaradić', 'dragojlo.nakaradic@email.com', '$2b$12$5xKuykQ6KeXoPl2Gv9Qs/.9t7F0G/6eCAu.Xr3fKaYiUOEdZnMp8e', 'true', 'true');

--email = ljubivoje.rajicic@email.com password = 1136
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Ljubivoje', 'Rajičić', 'ljubivoje.rajicic@email.com', '$2b$12$JFxiRLxEEYoNOpWfgpnMber1c4Kowq2TqUxRqy0ILg2uPRfwod.P6', 'true', 'true');

--email = vasilija.divnic@email.com password = 1866
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Vasilija', 'Divnić', 'vasilija.divnic@email.com', '$2b$12$Itx6vVYUx0B4OKKUyDuEROhOJ56Pld4aCiZb7mwAvacG4RJ0GzUSC', 'true', 'true');

--email = ranisav.vladic@email.com password = 3875
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Ranisav', 'Vladić', 'ranisav.vladic@email.com', '$2b$12$FozX7iHqt5aYC97NeRzPNeWtHIoTx1.6XDwm0redpLqWOGSC4RzKK', 'true', 'true');

--email = jasmina.culjic@email.com password = 5239
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Jasmina', 'Čuljić', 'jasmina.culjic@email.com', '$2b$12$zZTivGAbsClwD7eufOSxO.dNsVuuaDy8HBZXnaP10sBttEX9WZlse', 'true', 'true');

--email = julka.placic@email.com password = 2538
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Julka', 'Plačić', 'julka.placic@email.com', '$2b$12$E0HjLMZUQpg2K.0laJgilu8CJXcGojRcn65sZMNsqtPCEg9rOiBqm', 'true', 'true');

--email = doroteja.dancejic@email.com password = 6740
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Doroteja', 'Dančejić', 'doroteja.dancejic@email.com', '$2b$12$AOq2pk9Srm9VsAe5GVaEPu4GjLHECUA9SCpuLh/SVElWl00.R5yYm', 'true', 'true');

--email = mitra.perucic@email.com password = 2783
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Mitra', 'Perucić', 'mitra.perucic@email.com', '$2b$12$1oydtao6FHFQha6KU/BqZO8KKcELS78ydaor.qxCTUlKC7W92xueO', 'true', 'true');

--email = marko.karaicic@email.com password = 2630
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Marko', 'Karaičić', 'marko.karaicic@email.com', '$2b$12$UUaVN1Xl1abXJSmZmQ.iM.aKePeMnFAALfxRXUf1tuzNKnp/UO/BK', 'true', 'true');

--email = gradisa.setencic@email.com password = 9459
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Gradiša', 'Setenčić', 'gradisa.setencic@email.com', '$2b$12$Qf8xhS.MPFcnGlBYhHoyJ.1yHvZmuBpsurlLaSQt9tRoQiYO1BtOS', 'true', 'true');

--email = budimir.burkic@email.com password = 3133
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Budimir', 'Burkić', 'budimir.burkic@email.com', '$2b$12$hNkQjUVY82HgBNZ6G3bl5.oYWPSjatzbr7UJZSDFPU9AvmBXt5usW', 'true', 'true');

--email = kosta.obackic@email.com password = 6721
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Kosta', 'Obačkić', 'kosta.obackic@email.com', '$2b$12$RnH2Oyq45UBXL8JnHlDq..aG662PUiRlzyaEy3MqW6uUQiMSokF6a', 'true', 'true');

--email = sojka.nuzdic@email.com password = 4800
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Sojka', 'Nuždić', 'sojka.nuzdic@email.com', '$2b$12$Ll3AL8ZCG5LIbe9dr99qteRGzR8cL15W8KaGpZJuXDHg0L9hROGBe', 'true', 'true');

--email = krsmanija.djoric@email.com password = 5275
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Krsmanija', 'Đorić', 'krsmanija.djoric@email.com', '$2b$12$yb2Ws1L8RCa8YDRlk2E0YeMxvd6a9gjzihVanrGpqQG1H1sZXhiDC', 'true', 'true');

--email = dusan.damjanic@email.com password = 6017
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Dušan', 'Damjanić', 'dusan.damjanic@email.com', '$2b$12$NHRssAG1SNSNO499P/LIN.t.xZO9EjYANbiLFe46ikV7lM8auxYBW', 'true', 'true');

--email = teofan.vinokic@email.com password = 9517
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Teofan', 'Vinokić', 'teofan.vinokic@email.com', '$2b$12$9tbOubzXV.oV0BZg7ANiuOJh9Thivurt4B2qxnQPVXURD37jMLiIK', 'true', 'true');

--email = bogdan.ceranic@email.com password = 1768
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Bogdan', 'Ceranić', 'bogdan.ceranic@email.com', '$2b$12$IwyJcrnsEKdueA/HAhwmBOrMyWuQjDr5iQm5mTZxYJu6b4ym9xIHK', 'true', 'true');

--email = razumenka.cecaric@email.com password = 7248
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Razumenka', 'Čečarić', 'razumenka.cecaric@email.com', '$2b$12$7tv9cOd3tuALoKVmteraE.ccFqO8Ok1jPa27Hfc2cq/Ghz1gezabG', 'true', 'true');

--email = blagoje.verkic@email.com password = 3912
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Blagoje', 'Verkić', 'blagoje.verkic@email.com', '$2b$12$iepz.JRrzmqRIEBVeHO7FekZEf8bkH5Wmc0fEySMxbv2rh1qTuSZi', 'true', 'true');

--email = purisa.rogosic@email.com password = 8568
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Puriša', 'Rogošić', 'purisa.rogosic@email.com', '$2b$12$TyeaSzTfB3c3VhKvbsa3Tej9Mdj/UpJ2Cj6Lp6wFEw3f133L8Xkky', 'true', 'true');

--email = fotije.klajic@email.com password = 1992
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Fotije', 'Klajić', 'fotije.klajic@email.com', '$2b$12$m85qkI.t8woRVknyA/0paugQwewmUfqif3WK9InuAl63ripfKb.Je', 'true', 'true');

--email = stevanija.kruscic@email.com password = 9520
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Stevanija', 'Kruščić', 'stevanija.kruscic@email.com', '$2b$12$tHQtDXPEDLxTbDenv9ccnehCdvE7fMrG3V08jKCCogmhuMSullzR6', 'true', 'true');

--email = mladen.mirjanic@email.com password = 7291
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Mladen', 'Mirjanić', 'mladen.mirjanic@email.com', '$2b$12$wV5CJXvuLgWRaRb0ZEJxSuJsB2Y.iASFiLeBgJP8FjlILe212Juja', 'true', 'true');

--email = lela.suleic@email.com password = 1129
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Lela', 'Šuleić', 'lela.suleic@email.com', '$2b$12$7LNvduEFwqitsDWk5AtRBe/nMy9GOqLQnzZ7V.jKyIYi.y0En8lWK', 'true', 'true');

--email = ninoslava.toncic@email.com password = 6928
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Ninoslava', 'Tončić', 'ninoslava.toncic@email.com', '$2b$12$P5yNpe14MoCVNLlELpVL0OAlzS/IAadoXClS0wlvqP24JD4FlOsta', 'true', 'true');

--email = vera.garcic@email.com password = 7470
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Vera', 'Garčić', 'vera.garcic@email.com', '$2b$12$8CNe15txfLciFEc.htKRyebwXuDI1oFkQ4TGlBWXlM/31VjNSyu2K', 'true', 'true');

--email = nina.simanic@email.com password = 5516
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Nina', 'Simanić', 'nina.simanic@email.com', '$2b$12$gAtIRmvZ1g0gAWWxaHr9i.OD1bKI0Blv.GI4ScnBAmColG0GZMMkC', 'true', 'true');

--email = branislava.salatic@email.com password = 8409
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Branislava', 'Salatić', 'branislava.salatic@email.com', '$2b$12$bU.IXSGltsDV8NNLuhmajusb2uLVn757f/vMVA3oWogT0kmQcumGO', 'true', 'true');

--email = dalibor.dubackic@email.com password = 5005
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Dalibor', 'Dubačkić', 'dalibor.dubackic@email.com', '$2b$12$256xb3C8eo9xV/fa.29Y7.MX/xXFi4//OM0EXUdFOVWMZdk/BR7fG', 'true', 'true');

--email = caka.djusic@email.com password = 4799
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Caka', 'Đusić', 'caka.djusic@email.com', '$2b$12$.r2yT2wuyeDphSWX4JIMxO2Dfz6AVJ07PVKetlF6JqRwA/gQYweYO', 'true', 'true');

--email = fedor.punisic@email.com password = 5462
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Fedor', 'Punišić', 'fedor.punisic@email.com', '$2b$12$nUUc8YvW1/SiPgYTuD/aueRjzKZLnknrhjnut30DkYN3nxYDCFVPm', 'true', 'true');

--email = elizabeta.glibic@email.com password = 1588
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Elizabeta', 'Glibić', 'elizabeta.glibic@email.com', '$2b$12$J/YwPOnMX/ZVqXDifwOX0.3fLUXa7HaV2TmSo6N1CCwcl.pj1U5Iy', 'true', 'true');

--email = zivanko.adzic@email.com password = 4489
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Živanko', 'Adžić', 'zivanko.adzic@email.com', '$2b$12$myf1/3RBcfgeYUtrxFS2GujFomJoS0UrloeHyi1ddLtxF65WwrQ7C', 'true', 'true');

--email = njegomir.kuveljic@email.com password = 9076
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Njegomir', 'Kuveljić', 'njegomir.kuveljic@email.com', '$2b$12$o2UNgetYxJsrQ2g5thKNC.HfxhjSGHkEqA.j/JQiXt.vwVQ7dAHD6', 'true', 'true');

--email = njegus.brekic@email.com password = 7940
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Njeguš', 'Brekić', 'njegus.brekic@email.com', '$2b$12$trsKsSFoOejgV2vtnXzPnuLETICGjUmvyXEdKoEA/UsqP9cs2G3yq', 'true', 'true');

--email = drgorad.radekic@email.com password = 4311
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Drgorad', 'Radekić', 'drgorad.radekic@email.com', '$2b$12$wT57Kzp7saG2g0oYlgj2gO/4e5zevnO3HUltrvUuG/mxwKPP9m5WO', 'true', 'true');

--email = angelina.dragonjic@email.com password = 2810
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Angelina', 'Dragonjić', 'angelina.dragonjic@email.com', '$2b$12$2sGR96hVSsAbHawn/.zGbu0GXl.qcQuSHD2q2uVXe.SX737l4jY2a', 'true', 'true');

--email = srdjan.lazendic@email.com password = 6808
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Srđan', 'Lazendić', 'srdjan.lazendic@email.com', '$2b$12$ZVIEMTN.C4iL3DtK2BbUm.nUKea7U8hfpgi5rT1nWT3fExcq60TO2', 'true', 'true');

--email = novica.sibalic@email.com password = 9404
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Novica', 'Šibalić', 'novica.sibalic@email.com', '$2b$12$C7ACEqImo0JgSA7CBn0fP.untyIjGbtELgkg.joOIJDBDOocfXdVq', 'true', 'true');

--email = radojica.erletic@email.com password = 4096
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Radojica', 'Erletić', 'radojica.erletic@email.com', '$2b$12$GHsACb9eROA/78LUrYZqseGYk89O.PXpZnH0iK73e9SrVSEF52HqC', 'true', 'true');

--email = radonja.sandic@email.com password = 8758
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Radonja', 'Sandić', 'radonja.sandic@email.com', '$2b$12$o1zbHt/VCtogAnkp9Dek8eGMGap4y03OH3bg8x8.eYIi7joQjGnl6', 'true', 'true');

--email = milun.celic@email.com password = 1307
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Milun', 'Ćelić', 'milun.celic@email.com', '$2b$12$uzDPtiSRuBbFVGNWcFt0Me1I9itNZCrIEv9pAkl3Bet5aMHSuvo6y', 'true', 'true');

--email = doroteja.mikulic@email.com password = 1423
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Doroteja', 'Mikulić', 'doroteja.mikulic@email.com', '$2b$12$JBi.ksRLtz8iSiQSpS0btuNH7zUH4udjQZ0dxcEEJ7jrgx9xPSM/G', 'true', 'true');

--email = cvijo.planinicic@email.com password = 2080
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Cvijo', 'Planiničić', 'cvijo.planinicic@email.com', '$2b$12$a6Vzl/8rQ0lpUNfmiVAD/eCnM94D9yr1yRMBHJSPiaPVygaPtFaSW', 'true', 'true');

--email = radovan.dikic@email.com password = 3999
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Radovan', 'Dikić', 'radovan.dikic@email.com', '$2b$12$z6gLUycuet.aNVOPjWXcI.IQdc6iPin3rwJrTUjoe1UXT.wR5hG82', 'true', 'true');

--email = drgorad.budisic@email.com password = 5310
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Drgorad', 'Budišić', 'drgorad.budisic@email.com', '$2b$12$mbM3bvXTHSoKNlvkt7w55uskQLPPXLchAsCAouFEI3hu/tJTUgVre', 'true', 'true');

--email = mira.bilibajkic@email.com password = 5233
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Mira', 'Bilibajkić', 'mira.bilibajkic@email.com', '$2b$12$PjkAm9skYdUi1FM3gK0XFuY5rWMvLB7HmudHRiDKIFOp9mYpnC7aW', 'true', 'true');

--email = slavica.dzugurdic@email.com password = 9378
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Slavica', 'Džugurdić', 'slavica.dzugurdic@email.com', '$2b$12$ptDsZOpChOnGAIfHTnoOyepp9rmp01YMB4XmovjrivyvumO0.jp3m', 'true', 'true');

--email = ilija.greblic@email.com password = 3626
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Ilija', 'Greblić', 'ilija.greblic@email.com', '$2b$12$mm.O4ktLOFPaLQZKjxvus.3Qh4Q.M2lm.rXp6YdqYc4QpkK2NLJzO', 'true', 'true');

--email = nesko.epifanic@email.com password = 1452
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Neško', 'Epifanić', 'nesko.epifanic@email.com', '$2b$12$y8ibwqFAy34JyEzCFjaRDORbSmaVGg7cWsgmneeYmrxuFh.JGTGgi', 'true', 'true');

--email = slaven.tomecic@email.com password = 7086
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Slaven', 'Tomecić', 'slaven.tomecic@email.com', '$2b$12$6xBYiWqCZuAbhb2.aixYVeVZNeQoPQzXYClZA14jHQYBTUp1XKQCm', 'true', 'true');

--email = srdjan.vavic@email.com password = 7533
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Srđan', 'Vavić', 'srdjan.vavic@email.com', '$2b$12$ZmFb0v1jNTRU8EH1ikSDfODNVuQwPT9FPR.kwCzI.a/j3cf2Foh72', 'true', 'true');

--email = slavenko.drenovcic@email.com password = 8058
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Slavenko', 'Drenovčić', 'slavenko.drenovcic@email.com', '$2b$12$tmwzfKXmywxWLMD0mlwEwuWskD34n.XDAIogFZT7bG4qEau1KV.RG', 'true', 'true');

--email = radojka.janicic@email.com password = 1679
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Radojka', 'Janičić', 'radojka.janicic@email.com', '$2b$12$4CWo3uZuCEadQepjkWrfue3B/z7BZ5k.fBUP8qFgQp0gGjnRlO/Wm', 'true', 'true');

--email = katica.kolicic@email.com password = 6213
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Katica', 'Kolicić', 'katica.kolicic@email.com', '$2b$12$RVCJCHZCXzh7n8UJr1oUeOQfP7TbNlxGesG9j42BpeqZlNA5zP9E2', 'true', 'true');

--email = milanko.gajtanic@email.com password = 4227
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Milanko', 'Gajtanić', 'milanko.gajtanic@email.com', '$2b$12$Izd3A7HgRWAM0XD8/QZIr.5Gs6h2cxqWjmOSPPtjdwUKIPwoUCbn6', 'true', 'true');

--email = ljeposava.ruskic@email.com password = 7929
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Ljeposava', 'Ruškić', 'ljeposava.ruskic@email.com', '$2b$12$F//IUaOfzYEvwz2gp5VkA.2AfvG.8aNM1Euf4w1kSQv.Z1tmHOQkm', 'true', 'true');

--email = mladomir.podinic@email.com password = 9747
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Mladomir', 'Podinić', 'mladomir.podinic@email.com', '$2b$12$MvHvQoFsT7zJ3yeVdIaOfulqA1KQ/65V82mpoZ8BGCEW480NpJXDu', 'true', 'true');

--email = milesa.buckic@email.com password = 8559
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Milesa', 'Buckić', 'milesa.buckic@email.com', '$2b$12$bl26QqGc/PVLAgb6TfUxRO2pbsmZVQnMTwa7.WYkMWA3TxqaLGlgi', 'true', 'true');

--email = nada.vincic@email.com password = 4356
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Nada', 'Vinčić', 'nada.vincic@email.com', '$2b$12$d6u42GO/Lr5Ga97OPnAy8Oz1Ifo2YSSCMQzitIR9kTSUwgApKPKV6', 'true', 'true');

--email = punisa.ursikic@email.com password = 2556
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Puniša', 'Uršikić', 'punisa.ursikic@email.com', '$2b$12$cFPoiaOhUGmRsxdR71/as.ItlRVdogE4mc9acx7khrADvJ0eAijjG', 'true', 'true');

--email = ljubomir.lezaic@email.com password = 7845
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Ljubomir', 'Ležaić', 'ljubomir.lezaic@email.com', '$2b$12$31Y1Ttrqg0IPBZD65cVgVOalS21ekslqrbPwNkv0a7hx4Qf53fESm', 'true', 'true');

--email = jugoslav.begenisic@email.com password = 1384
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Jugoslav', 'Begenišić', 'jugoslav.begenisic@email.com', '$2b$12$hC3mhMDxiBvl9odVq7p4BugY4sGJ00NjBf662YWLWz3/BghkLnN3a', 'true', 'true');

--email = sajka.ruzojcic@email.com password = 4984
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Sajka', 'Ružojčić', 'sajka.ruzojcic@email.com', '$2b$12$2Or728IKUUCBjyFzu0uMDuENrNphGQzS7ASANexD.lNVQgrEKGLou', 'true', 'true');

--email = isak.cuknic@email.com password = 6220
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Isak', 'Čuknić', 'isak.cuknic@email.com', '$2b$12$t5Yns7yQIdEv4Xx/4utyE.hFD62Wm1NWRxutxhM8kUhtYEQ8dmU2K', 'true', 'true');

--email = gvozden.civisic@email.com password = 1207
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Gvozden', 'Civišić', 'gvozden.civisic@email.com', '$2b$12$K5VjyUBL4xmw4gb1POm/I.u8ys9f2jZa/buaZC5ElGqXDVHP7wpAS', 'true', 'true');

--email = damjanka.milojkic@email.com password = 2901
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Damjanka', 'Milojkić', 'damjanka.milojkic@email.com', '$2b$12$6Gb9/faTxrrPzUTGqzsO7uHDeuZND.xKiWAteFPsx6/WIIndXpX4q', 'true', 'true');

--email = zlatibor.kukulicic@email.com password = 1651
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Zlatibor', 'Kukuličić', 'zlatibor.kukulicic@email.com', '$2b$12$loPzfCZZor1iEIm8lYbwfuVxMH/YYpijuLCymtZLcmxYToHG2nQjq', 'true', 'true');

--email = mojsilo.babic@email.com password = 9693
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Mojsilo', 'Babić', 'mojsilo.babic@email.com', '$2b$12$tGwYskUZCvJA0DdwCY5MHusc7BFy2A3WsbDmycPQiWVHu47KBqTW6', 'true', 'true');

--email = gradisa.milotic@email.com password = 7154
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Gradiša', 'Milotić', 'gradisa.milotic@email.com', '$2b$12$KJuAuKyk3Fy7..zxDvTtMe2yaA6a5mWnkNS5KmbXWhCoKvEBxQdMq', 'true', 'true');

--email = lela.gocic@email.com password = 1462
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Lela', 'Gocić', 'lela.gocic@email.com', '$2b$12$U0M4zPMFMt4UZkLASQSWXu9tsjgdThF68FsStGHxzZq6ho7ou..Ju', 'true', 'true');

--email = vukadin.gladic@email.com password = 8202
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Vukadin', 'Gladić', 'vukadin.gladic@email.com', '$2b$12$r4BacB9rCJs11Yox2Ku9j.wcRXjMVW2BP1QcUOTF5M9whtnj6gdIi', 'true', 'true');

--email = sara.zinajic@email.com password = 2785
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Sara', 'Zinajić', 'sara.zinajic@email.com', '$2b$12$ZlI6VYF2jOxaDX7GNhdA1OogS4KvkFhsxwjajYsf1Mbk2WauTMvuu', 'true', 'true');

--email = milisav.odavic@email.com password = 5758
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Milisav', 'Odavić', 'milisav.odavic@email.com', '$2b$12$z04voro1kwD4AobYswNCfOGZLBPljwTxYuYvSm/qdb4WvdUKnG7qq', 'true', 'true');

--email = jadranka.desancic@email.com password = 2770
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Jadranka', 'Desančić', 'jadranka.desancic@email.com', '$2b$12$yQctkvC6LFrA1NGrAeeUXui/wyKnvQ7nVWQMv/OcnkV8BfBnG38uO', 'true', 'true');

--email = pantelija.smakic@email.com password = 4361
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Pantelija', 'Šmakić', 'pantelija.smakic@email.com', '$2b$12$lSbPErs0RnwUr5Zc0u.jAeuodbyBbbO.FbGjupm/dYIqXaoWBGuLC', 'true', 'true');

--email = velinka.grastic@email.com password = 1787
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Velinka', 'Grastić', 'velinka.grastic@email.com', '$2b$12$xklItSuI2kdfYkDkwxhOCeYMam7DYd3tEzdtwngUXHIXrXXuwFaaW', 'true', 'true');

--email = angelina.rosogic@email.com password = 3746
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Angelina', 'Rošogić', 'angelina.rosogic@email.com', '$2b$12$BOUDmkRJ9RoxwEHFmRId1e6lyMyFpjp6g4DapSEpWUyp07kpSi5QK', 'true', 'true');

--email = isidora.obric@email.com password = 7224
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Isidora', 'Obrić', 'isidora.obric@email.com', '$2b$12$lOxwKrqP8G.n.EdJNBevW.oNh.d2bf8Q7hyMuA/A1UTgFwwJkjgOe', 'true', 'true');

--email = olga.demonjic@email.com password = 1099
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Olga', 'Demonjić', 'olga.demonjic@email.com', '$2b$12$D7SPHfK7Ipk/aDS9pcM3bec08zl/iVGbQq/6e8SThvHlsqXgFy/m2', 'true', 'true');

--email = radmila.bugaric@email.com password = 3670
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Radmila', 'Bugarić', 'radmila.bugaric@email.com', '$2b$12$IaRMIJOXAQQPcV6ZMCyW6OgrNlDVarGEJHzy9qQnY.bNryeawykWG', 'true', 'true');

--email = arsenije.debelnogic@email.com password = 7791
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Arsenije', 'Debelnogić', 'arsenije.debelnogic@email.com', '$2b$12$jFFJTaHcNuBhagqmVx4xZuh2azSO365FcdXzHADfuPnviT6MoMSR6', 'true', 'true');

--email = milija.nevenic@email.com password = 3308
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Milija', 'Nevenić', 'milija.nevenic@email.com', '$2b$12$kGwOeDvb70hqhCjgVFF2VeeAHnxTdjUS30MLAXtb/0G7OpyuPTk0S', 'true', 'true');

--email = bozidar.anojcic@email.com password = 4723
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Božidar', 'Anojčić', 'bozidar.anojcic@email.com', '$2b$12$IbiwA9vV5B1XpIpwIGQP6.84Y5I8JWrM2sygki4jl04MSyyyA8DQC', 'true', 'true');

--email = simona.zelic@email.com password = 1293
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Simona', 'Zelić', 'simona.zelic@email.com', '$2b$12$e2wZH5QalGOI0a6/iJn09.rsv/wrB1j0Dug.hQj.RlxnWOBMjvF26', 'true', 'true');

--email = slavko.konculic@email.com password = 9560
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Slavko', 'Konculić', 'slavko.konculic@email.com', '$2b$12$fYUiP0CbbpoWdh7NwwuG/OqGAFsjTNt9mOnTq3A7HW.zpnPrF3VDC', 'true', 'true');

--email = tatjana.pecic@email.com password = 7207
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Tatjana', 'Pecić', 'tatjana.pecic@email.com', '$2b$12$tJLeoj9LAMyYa4AF80Rt8O/LARgaTedKHWMaEtRtNn0Awx2LSHkRW', 'true', 'true');

--email = roksanda.trlajic@email.com password = 1987
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Roksanda', 'Trlajić', 'roksanda.trlajic@email.com', '$2b$12$gvhNkt8lTZwzm2LBJENV2Od5/hhcS7cCb3UTG0VUUOkhZu045JiEu', 'true', 'true');

--email = oliver.galic@email.com password = 1608
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Oliver', 'Galić', 'oliver.galic@email.com', '$2b$12$22krU0FtVNU.OF8fi6V3/OQn4SKkOxTXYvb77WYVsUMZw4L09HZOK', 'true', 'true');

--email = ana.gagic@email.com password = 6240
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Ana', 'Gagić', 'ana.gagic@email.com', '$2b$12$k7AViTWLIMDzklmeqKgvKu5XXXPO/h2CwTbVE1iVRX7wU4sIrFu4G', 'true', 'true');

--email = milojko.aljancic@email.com password = 7985
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Milojko', 'Aljančić', 'milojko.aljancic@email.com', '$2b$12$BPG0wgilQ4h9IfaHWlRFtuSeFCwDYkSoN730Cd8KymSDV/SCFgBbO', 'true', 'true');

--email = stanisa.vuletic@email.com password = 2774
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Staniša', 'Vuletić', 'stanisa.vuletic@email.com', '$2b$12$sm6/A5xCYGTIFejZ36Xmv.xLMMrBohjtK0Gamv.BP8sbSTF0vNFfe', 'true', 'true');

--email = radule.grumic@email.com password = 3001
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Radule', 'Grumić', 'radule.grumic@email.com', '$2b$12$Yu6tAZVMpbxkjQvGXHsTbucqu1GXIkTktHRxb.H1cLnCRtfYqpxcq', 'true', 'true');

--email = zorislava.ilincic@email.com password = 8985
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Zorislava', 'Ilinčić', 'zorislava.ilincic@email.com', '$2b$12$21KA9s9MgsEmHcOhS12XNuKpkErT1/3hO/3YN4nr1AAz.KnXthjYO', 'true', 'true');

--email = suzana.pesukic@email.com password = 1957
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Suzana', 'Pešukić', 'suzana.pesukic@email.com', '$2b$12$rPr6IhAVS5DV2VWT5VPGbeIxjQoxBbxhAd/ysE/kbrGX2EMw0cHA.', 'true', 'true');

--email = hranislava.pesic@email.com password = 6113
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Hranislava', 'Pešić', 'hranislava.pesic@email.com', '$2b$12$X119ynGOTTW9GWAAdfqr3.IelD1ltTjZiqFN2LOsvYE.v.IdXO07.', 'true', 'true');

--email = hristina.krmpotic@email.com password = 2056
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Hristina', 'Krmpotić', 'hristina.krmpotic@email.com', '$2b$12$pcYaEnyx/d9fRWllveR9guDfZFXBinBAUk7QoOORoUTwC5ysOgPR.', 'true', 'true');

--email = ljubomirka.lemajic@email.com password = 9030
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Ljubomirka', 'Lemajić', 'ljubomirka.lemajic@email.com', '$2b$12$UFzwb70SDWE8mG/4IMGEiez2lSlaBdPQPGGjn5k1cujXQnxksr6cG', 'true', 'true');

--email = aleksandra.kizic@email.com password = 7364
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Aleksandra', 'Kizić', 'aleksandra.kizic@email.com', '$2b$12$pyrz0/RCWqJPCwShj9A3TuuOWgZkFYEuUE8SsJTSGDiv5QutRa8I.', 'true', 'true');

--email = ilinka.nikotic@email.com password = 1211
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Ilinka', 'Nikotić', 'ilinka.nikotic@email.com', '$2b$12$93BcsSUC2XeqBeQ8CBNPJu0Wq.3FwyOpXnVUEDZBcPBJFlE1wHZnC', 'true', 'true');

--email = mira.paligoric@email.com password = 6718
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Mira', 'Paligorić', 'mira.paligoric@email.com', '$2b$12$pg8BOp3MQnzF8nECBUC8k.jbiW5cnUQEJgalddN/HJMOva1TNiLBO', 'true', 'true');

--email = verica.kusljic@email.com password = 5482
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Verica', 'Kušljić', 'verica.kusljic@email.com', '$2b$12$NJXbhHpwLCHIQG55hmOo/OPwadR/TG1kBH5YDnX/K9/cH1DSTiyCG', 'true', 'true');

--email = katarina.trucic@email.com password = 5629
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Katarina', 'Trucić', 'katarina.trucic@email.com', '$2b$12$akQRZiZPjDVHDWUvB/K6aebkoZnevZYN.1vWGofTj.ZWuxYy8K0C2', 'true', 'true');

--email = borko.glusic@email.com password = 2270
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Borko', 'Glušić', 'borko.glusic@email.com', '$2b$12$IIThYkloTbFFqkw6MXfp5eHU/oWWBitxsfDQg6/vsyBH/M2gCHR9C', 'true', 'true');

--email = andjelija.vasikic@email.com password = 1742
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Anđelija', 'Vasikić', 'andjelija.vasikic@email.com', '$2b$12$4syBoUbhRb.JD.buRWYdY.dX/4lvY8dd4gjE0THbpXNfF.1obq2tK', 'true', 'true');

--email = aleksandar.tesinic@email.com password = 3744
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Aleksandar', 'Tešinić', 'aleksandar.tesinic@email.com', '$2b$12$3pTwyx85//GtX0POkkCBDerPWRkqbdSE7fRMWgmyuOmeHpYcUreIm', 'true', 'true');

--email = stanko.cmolic@email.com password = 4579
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Stanko', 'Cmolić', 'stanko.cmolic@email.com', '$2b$12$9191eg9ApgcoP/g5VkoHeu6iu9w0q6AUTcg9doNvGl8HCYp3lC4SK', 'true', 'true');

--email = cvetko.sisic@email.com password = 6057
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Cvetko', 'Šišić', 'cvetko.sisic@email.com', '$2b$12$deMEj/rebTo1ox0v1tVTRObDDegy367vCD08Xn.BHHMo2Iay0QyPy', 'true', 'true');

--email = djuradj.rancic@email.com password = 8731
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Đurađ', 'Rančić', 'djuradj.rancic@email.com', '$2b$12$tDPDQIV8jHWKto3wln5/2eo3YCNjvKSwe7JT28RGm8J86uJxd6VTC', 'true', 'true');

--email = jevrem.conjagic@email.com password = 3559
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Jevrem', 'Čonjagić', 'jevrem.conjagic@email.com', '$2b$12$IgAZjhjFzLi.Dt9ZtjDAiOFO7M2avksS.h.DqtELCDy34R6osMe9O', 'true', 'true');

--email = djurdje.kljunic@email.com password = 5270
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Đurđe', 'Kljunić', 'djurdje.kljunic@email.com', '$2b$12$rowYC3lTwCwvZRaJMk.Uf.Q5R6nFWg4XEBa2ZM3iSIabi7pqpP05e', 'true', 'true');

--email = zivka.spurnic@email.com password = 5385
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Živka', 'Spurnić', 'zivka.spurnic@email.com', '$2b$12$JqWTgRTdJmS6MZCPAQuJPOGFAzaqRQq985hEJhHNqxlHMuSiOrAW.', 'true', 'true');

--email = stokan.cedic@email.com password = 6936
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Stokan', 'Čedić', 'stokan.cedic@email.com', '$2b$12$RRnC0xTHlGwMtbYRCRuZ5uTDvj2byB6TrjXbyxWXZ8nCGqP9Ly1L.', 'true', 'true');

--email = djukan.skokic@email.com password = 2622
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Đukan', 'Skokić', 'djukan.skokic@email.com', '$2b$12$Wa7enKH3V7F1Y2SkD64O6.no46geVtWynrR2PHK5pAH5CKn3kFVaK', 'true', 'true');

--email = bratoljub.romic@email.com password = 5665
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Bratoljub', 'Romić', 'bratoljub.romic@email.com', '$2b$12$m2JbG4Sqr1378Lyx3BulW.DkpQwdg08PFPDHNcEdSZCHj7BmqcDHq', 'true', 'true');

--email = kojadin.prsendic@email.com password = 3051
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Kojadin', 'Pršendić', 'kojadin.prsendic@email.com', '$2b$12$KuG00walHBIGey.Ky5W2buSBOR566RuniezGSdbpkGa9kVMzzISf.', 'true', 'true');

--email = radosav.andic@email.com password = 7288
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Radosav', 'Andić', 'radosav.andic@email.com', '$2b$12$FjXGLJQ7EpHv.Hl5BvdYw.vHfUbL0x7PM0Q3h7leAgi.PSNHMeXde', 'true', 'true');

--email = jagoda.zrakic@email.com password = 9523
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Jagoda', 'Zrakić', 'jagoda.zrakic@email.com', '$2b$12$o1hcV7n0CrdkAjVDG89hieiSKaeuIKzRGCyWh7f9lk6ccTNBXN8tW', 'true', 'true');

--email = kuzman.dumnic@email.com password = 8529
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Kuzman', 'Dumnić', 'kuzman.dumnic@email.com', '$2b$12$8kksRItcwR4Wg/i4gO0sIu./QX3713bgDJxEJBnx.dvP2ItO4k/dW', 'true', 'true');

--email = mosa.kremonjic@email.com password = 7807
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Moša', 'Kremonjić', 'mosa.kremonjic@email.com', '$2b$12$XnS88c/vqS.VyjQn93OozO7cijmhy/R/VlK3Y.5nGYr6vfjpG73NW', 'true', 'true');

--email = dobrinka.kuljic@email.com password = 2135
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Dobrinka', 'Kuljić', 'dobrinka.kuljic@email.com', '$2b$12$eMjPnzKxdzsY7bvYe4MRJuS7zsp62QBNthzA2Mmiqg524Yj5G1jvS', 'true', 'true');

--email = irena.neducic@email.com password = 7709
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Irena', 'Nedučić', 'irena.neducic@email.com', '$2b$12$612LUvoy25nKZyHbdahuzeS3zaOYjzFX6W8tCpY92njdl9YC.orzG', 'true', 'true');

--email = julijana.kojanic@email.com password = 4351
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Julijana', 'Kojanić', 'julijana.kojanic@email.com', '$2b$12$mDJ2wzDtdh9X4vL9pDLO5O95b9itQvgwbYwLBWxHSgf9xvZoPYMQW', 'true', 'true');

--email = filipa.buric@email.com password = 7472
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Filipa', 'Burić', 'filipa.buric@email.com', '$2b$12$tY2ZYKmJi63dHfGMl7rHsOf6jSiTjpdjqRkvqckIdtbe.vxcMcIKe', 'true', 'true');

--email = spomenka.momic@email.com password = 9883
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Spomenka', 'Momić', 'spomenka.momic@email.com', '$2b$12$Ug/Auj5I73wpCNUaeOAZvu7nei8hRAMGcSNPYE1fL82.SF9DrCsui', 'true', 'true');

--email = stanko.gusic@email.com password = 4167
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Stanko', 'Gušić', 'stanko.gusic@email.com', '$2b$12$YoBCDD75G6cLkCHyfH17OOEr3VYvvu/s3RsgC6lDSKqNcI1BaYfc.', 'true', 'true');

--email = vladislav.vladusic@email.com password = 6589
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Vladislav', 'Vladušić', 'vladislav.vladusic@email.com', '$2b$12$dcKnVV8sof5Lv/1tH0Hux.xLuviOA.M3Wvik8WaxL64p0J7VzXdJm', 'true', 'true');

--email = zavisa.lukendic@email.com password = 9852
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Zaviša', 'Lukendić', 'zavisa.lukendic@email.com', '$2b$12$Vagroby9DnFL5RdSGWh5Xe1KWxt.mFosn2rDfLWaVnNxTLj/hqPnS', 'true', 'true');

--email = poleksija.trucic@email.com password = 4406
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Poleksija', 'Trucić', 'poleksija.trucic@email.com', '$2b$12$voSqa5h7UxzjaULgqZSiGuS9Os/91Bz9nOfrLDkq39vxl1biP8xIK', 'true', 'true');

--email = ljubisa.kolacaric@email.com password = 9160
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Ljubiša', 'Kolačarić', 'ljubisa.kolacaric@email.com', '$2b$12$waDBU4GQurcTkJsRk12GZ.CeIQ4DQot3IqQMNlYGNM0dC2gISoqzW', 'true', 'true');

--email = teodora.bulutic@email.com password = 1469
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Teodora', 'Bulutić', 'teodora.bulutic@email.com', '$2b$12$tHHxUdFDBc8TTjM03UbS7eHi.4ByaDLLaUecOjYuCZ8QY1HhJwJHG', 'true', 'true');

--email = njegoslav.jonicic@email.com password = 2695
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Njegoslav', 'Joničić', 'njegoslav.jonicic@email.com', '$2b$12$Se1bPLlUMd9Cw72PV3Z.b.TpvzmaCzCzUxZva0zPIwFRqvcOlTYou', 'true', 'true');

--email = momir.rupic@email.com password = 7576
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Momir', 'Rupić', 'momir.rupic@email.com', '$2b$12$p2dbciZL0WIOOB9CM77gwuH.J89wrTlCyd6zrOBfjuhu9JbEuhmge', 'true', 'true');

--email = steva.trifunjagic@email.com password = 4875
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Steva', 'Trifunjagić', 'steva.trifunjagic@email.com', '$2b$12$w8WUrpY/WLZ7vjwkAIoXDOiH7.5hgDbFb9d4R.J2JyBU1WFEhLxB6', 'true', 'true');

--email = radosav.zigic@email.com password = 4113
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Radosav', 'Žigić', 'radosav.zigic@email.com', '$2b$12$n6w1Am1E7TupViPuo9y1teWOwC/14.26qIjhpypv2AwxWs2CSFyqC', 'true', 'true');

--email = laza.androbic@email.com password = 7219
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Laza', 'Androbić', 'laza.androbic@email.com', '$2b$12$gD/osbP.eqFOenfPJ6kbEO.axzk.zkTsEYmH8/aEE2IMzO5nYPX82', 'true', 'true');

--email = vujka.stijacic@email.com password = 5535
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Vujka', 'Stijačić', 'vujka.stijacic@email.com', '$2b$12$YSPka9VKKV2q/Tuirc00aOUcwWOmA9hpB3IiI3On3zXcZBXgeeH1K', 'true', 'true');

--email = andjelko.umetic@email.com password = 2097
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Anđelko', 'Umetić', 'andjelko.umetic@email.com', '$2b$12$OxwY0.HhBY1/jDeuz2nwYuRrQIQF64Srmogj1Q0csKzRcBLei6dSi', 'true', 'true');

--email = saveta.spakic@email.com password = 5876
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Saveta', 'Spakić', 'saveta.spakic@email.com', '$2b$12$cDL3SrGR9jj05pHjmFlWv.Hsp887sdr1ABbaE76CFvX9G1oGJ.kFy', 'true', 'true');

--email = viktor.rancic@email.com password = 6887
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Viktor', 'Rančić', 'viktor.rancic@email.com', '$2b$12$YqWqppFjdLj5ibFCuBk2ruSomfQDdQgOgZdI9yICrCX4dGieUis3O', 'true', 'true');

--email = janovka.epifanic@email.com password = 6577
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Janovka', 'Epifanić', 'janovka.epifanic@email.com', '$2b$12$lY4Ue9vZeUZQagDu9hNZG.qZQa8n8bbgfJpM3IR2VEL50Et6UKW96', 'true', 'true');

--email = mojsilo.vladusic@email.com password = 1025
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Mojsilo', 'Vladušić', 'mojsilo.vladusic@email.com', '$2b$12$PX4y0nlsmj3Hyi5KxBHirO6AHVkatpacBV1LxBkLstNiKMDvurL3.', 'true', 'true');

--email = stojmen.krazic@email.com password = 4539
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Stojmen', 'Kražić', 'stojmen.krazic@email.com', '$2b$12$tQhUAKdl/kYWC7i0iaghzunArkfUalux/rNgv0JQanwjEg73IizKq', 'true', 'true');

--email = gavra.kovljenic@email.com password = 3214
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Gavra', 'Kovljenić', 'gavra.kovljenic@email.com', '$2b$12$49MpwHrHgPX3MXNwqsbmMu9TmILclNXN3LWcqjEG2Dd6ibha9yUoq', 'true', 'true');

--email = vasilije.lambulic@email.com password = 5653
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Vasilije', 'Lambulić', 'vasilije.lambulic@email.com', '$2b$12$IXgmw5vlZyee8t1xwdBK/OKn16gmudyA5aQ73T3H5KGnjcB9hhb.i', 'true', 'true');

--email = dusan.miklejic@email.com password = 5060
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Dušan', 'Miklejić', 'dusan.miklejic@email.com', '$2b$12$4kxFLhn.03Fc8pUIgcznNu/cQXiWqHeru0NsFqs6ggs8dhYfJjrLK', 'true', 'true');

--email = tomanija.krtinic@email.com password = 8234
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Tomanija', 'Krtinić', 'tomanija.krtinic@email.com', '$2b$12$CJtb9GlTd9rmaqFXuDPBNuZiz2fQL9WKl7Uf7qnNRI6cjn2YESQqG', 'true', 'true');

--email = miroslav.cavic@email.com password = 9009
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Miroslav', 'Čavić', 'miroslav.cavic@email.com', '$2b$12$WAxMdjOJ3SZQ4MIfuf7YduDVN3wii4Gj6usy398ueFaCDzR1CPK6K', 'true', 'true');

--email = tijana.cusic@email.com password = 4209
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Tijana', 'Ćušić', 'tijana.cusic@email.com', '$2b$12$gvNDcBw6vgZg5AtcxeOvYue9ZuTSHpqvieUYJnma8kQzaV4W68u3y', 'true', 'true');

--email = vujadin.dzonkic@email.com password = 7677
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Vujadin', 'Džonkić', 'vujadin.dzonkic@email.com', '$2b$12$QVbJzCezfxEPG8jgeQGrc.XrMfDF3SziqVQ.zTOVtrp85cbKvO3yy', 'true', 'true');

--email = stevanija.mesulic@email.com password = 4278
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Stevanija', 'Mesulić', 'stevanija.mesulic@email.com', '$2b$12$neH40wlRBS4FmPmoM.KtZOfkxdffEZYONYnJIPC3mfO5dcLpnyTqW', 'true', 'true');

--email = zlatomir.belancic@email.com password = 7456
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Zlatomir', 'Belančić', 'zlatomir.belancic@email.com', '$2b$12$KgCu64iJWhV48xNhSgNhGuwaCsJ6LR7lsAdP3..bw0iN8LC.wJuw6', 'true', 'true');

--email = petko.kenic@email.com password = 5190
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Petko', 'Kenić', 'petko.kenic@email.com', '$2b$12$CxNrNfz6Ynyaoayw5/RD2eGU.SIbYZeRCfZESbiNE8Zf7vzpRGSti', 'true', 'true');

--email = njegomir.percic@email.com password = 8105
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Njegomir', 'Perčić', 'njegomir.percic@email.com', '$2b$12$67BKKYHO99Gr8.Anx2WTuef4wH9ZL5kcqoA3W1DyTAiTAUL9wk3s6', 'true', 'true');

--email = kleopatra.anicic@email.com password = 2764
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Kleopatra', 'Aničić', 'kleopatra.anicic@email.com', '$2b$12$SGGdG67C5vGEZJI9VbzbYOaj/O2UTGnu1bM.q3aeem6Pkgao14NdC', 'true', 'true');

--email = ninoslava.skrnjic@email.com password = 5977
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Ninoslava', 'Škrnjić', 'ninoslava.skrnjic@email.com', '$2b$12$Cck8MvHoMwlze0pKWzUioeZDcThraI5XZljTEP8CGuAyhW868S6Du', 'true', 'true');

--email = jasna.milekic@email.com password = 3660
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Jasna', 'Milekić', 'jasna.milekic@email.com', '$2b$12$J.em26fHIPluN39mfqlO9uT.ICuaKqUtpRYwqJOdF6Rkvsopfb966', 'true', 'true');

--email = cana.copic@email.com password = 7935
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Ćana', 'Ćopić', 'cana.copic@email.com', '$2b$12$on1G1FZIk9vUcwU2KJKY6Ob0Y9Q1yZZEbFDavY9SVK6jOfm95C7zy', 'true', 'true');

--email = milorad.dubljanic@email.com password = 1186
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Milorad', 'Dubljanić', 'milorad.dubljanic@email.com', '$2b$12$zrY/2zxmMCr0vxZqJrcvWORhPkCcMYiSOm/DLiBJ/Z5eAc65dURHa', 'true', 'true');

--email = stanka.barajic@email.com password = 2926
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Stanka', 'Barajić', 'stanka.barajic@email.com', '$2b$12$p1y13Fs0tx63LQkv4SDvSuBXmSBh8Czf9pNzn6EBOUgSn.eNinycu', 'true', 'true');

--email = vuksana.rakitic@email.com password = 2326
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Vuksana', 'Rakitić', 'vuksana.rakitic@email.com', '$2b$12$flgvOn9iorD90FptVz42T.2s0L211Xzb0tBH/0KqnPSByFbfpvwTq', 'true', 'true');

--email = veliborka.stamencic@email.com password = 9615
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Veliborka', 'Stamenčić', 'veliborka.stamencic@email.com', '$2b$12$NuFw/vo5BWqyfNF3Q7uFa.5cJEvKF28C8NimrEtE3Kz2xAnT4Rdf2', 'true', 'true');

--email = sima.cupic@email.com password = 2681
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Sima', 'Čupić', 'sima.cupic@email.com', '$2b$12$LhYQgu0ZwwXX86LGXZOL3eJt.7bPGOlDmqF.HBg.wXbTHbXTuV7R2', 'true', 'true');

--email = mateja.vasilic@email.com password = 4969
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Mateja', 'Vasilić', 'mateja.vasilic@email.com', '$2b$12$QSf1Yx3ICTFgohDlkCjMpuFVgaM4b8BYCNFgGm52UWZ6u9DPIwQV.', 'true', 'true');

--email = gavra.ardalic@email.com password = 1156
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Gavra', 'Ardalić', 'gavra.ardalic@email.com', '$2b$12$P2upnQT0aUgniQcNMbG.N.qtAnGXZwF5akbo9k7pxvfjOPCQJGrAW', 'true', 'true');

--email = prvoslav.skundric@email.com password = 8002
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Prvoslav', 'Škundrić', 'prvoslav.skundric@email.com', '$2b$12$rDnEXK.0eVUufEgavDJboeG6V5piiAKP6TqVMhQrzit7sKP8RqdMe', 'true', 'true');

--email = toma.borjanic@email.com password = 8277
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Toma', 'Borjanić', 'toma.borjanic@email.com', '$2b$12$z4AWlqmMvQGpaw7WigYo3u3.aqIRlusRe2CLANFOTcKYFkot86CpK', 'true', 'true');

--email = tina.simisic@email.com password = 9310
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Tina', 'Simišić', 'tina.simisic@email.com', '$2b$12$Fb/jw0CGyLXgNZCGEs2a4eWolwdKRlAB9dcZLibVkhujZfHUbP73a', 'true', 'true');

--email = gvozden.ljubisic@email.com password = 5554
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Gvozden', 'Ljubišić', 'gvozden.ljubisic@email.com', '$2b$12$VVReufxrQWhRdCpLeDL6feQC2MLKCbua9CNL49GEDnEIXQExZh78q', 'true', 'true');

--email = vladan.brezancic@email.com password = 7682
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Vladan', 'Brežančić', 'vladan.brezancic@email.com', '$2b$12$f1wQsAaCfnxD71NYRWmvQOpe8ol7kHAaxidKQ6O5MEdVXV55bQu6G', 'true', 'true');

--email = cira.pasic@email.com password = 9717
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Ćira', 'Pašić', 'cira.pasic@email.com', '$2b$12$seZpKNCGK/rKmsn2pKG3COgph/guiG9HV8Lxha6e1ropwJ65IsR5.', 'true', 'true');

--email = mira.mitulikic@email.com password = 7791
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Mira', 'Mitulikić', 'mira.mitulikic@email.com', '$2b$12$O355OK8UgmRgyikG0.rlOe3eo6MRa65X4cR1zlr/3s1tnTRPN3K0a', 'true', 'true');

--email = blaginja.cojbasic@email.com password = 7580
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Blaginja', 'Ćojbašić', 'blaginja.cojbasic@email.com', '$2b$12$MG8CWPJq7U.mYl5piXFfNetUZ3RwOF4Oke4VYa.STTPHldlTzoUhO', 'true', 'true');

--email = njegomir.podric@email.com password = 5597
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Njegomir', 'Podrić', 'njegomir.podric@email.com', '$2b$12$PrpRv/LdiM13IN2HSa0h9u5Ldzw8XH9PzNiuIhnEIFhsgEVf6Zdwy', 'true', 'true');

--email = dragan.kujundzic@email.com password = 3164
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Dragan', 'Kujundžić', 'dragan.kujundzic@email.com', '$2b$12$rGvTdcHzoFdlADFOlHywzefpt55d0IhIvn/aEWF9LRlQURcVdnqiK', 'true', 'true');

--email = sibinka.buzaretic@email.com password = 4416
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Sibinka', 'Buzaretić', 'sibinka.buzaretic@email.com', '$2b$12$EWz9s1T54SmmmwaBpao6UOOuFmlNNtzcxjsj23ZJl/0m5y71W3gfS', 'true', 'true');

--email = miladin.ilic@email.com password = 3930
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Miladin', 'Ilić', 'miladin.ilic@email.com', '$2b$12$edX86XLumfgKrvMGpe7YcufXlkHo8odrr/qBqtiuwRZpkZfhM3VSi', 'true', 'true');

--email = marko.ruzic@email.com password = 6913
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Marko', 'Ružić', 'marko.ruzic@email.com', '$2b$12$SigesZolcQgaRGIEv2u8VOaxMLSccKkxG107MdB5hoVi4fsEu5E3e', 'true', 'true');

--email = ranisav.malic@email.com password = 4991
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Ranisav', 'Malić', 'ranisav.malic@email.com', '$2b$12$87CNomMilBCNqaGwwh0T9u1nwzKcMGxMEbs6tE2cvBGu17Ddh4P8y', 'true', 'true');

--email = sava.slavkic@email.com password = 5491
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Sava', 'Slavkić', 'sava.slavkic@email.com', '$2b$12$HOFaa/pd9aPGeZ89WZ/1P..EAFao5dP8a09Ls4mw81OFIhX3uwSRG', 'true', 'true');

--email = teodora.kruskonjic@email.com password = 1164
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Teodora', 'Kruškonjić', 'teodora.kruskonjic@email.com', '$2b$12$068.QGaFRgGUkEVon5s3G.RatPmQGERU6wuxwv.tV58Rwaqd5kHEi', 'true', 'true');

--email = drago.sogonic@email.com password = 7843
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Drago', 'Sogonić', 'drago.sogonic@email.com', '$2b$12$t.udkFrOdZvk1pKfiMvwTOjSmaQRWqkcjnNA16FPxWfDtE3WIPLva', 'true', 'true');

--email = radan.pesic@email.com password = 1728
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Radan', 'Pešić', 'radan.pesic@email.com', '$2b$12$dUWQsU5d7HpVDMsHbD6ddevnnUfKR0m6qoPjGGZBiTNM8QT.r399O', 'true', 'true');

--email = sako.vucetic@email.com password = 2980
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Šako', 'Vučetić', 'sako.vucetic@email.com', '$2b$12$9NXdSJSHbl4QJkyV9Hxrwe2vqZhL6p9Hzz6sib.oPMmPzy2ksN7sy', 'true', 'true');

--email = ivona.sovtic@email.com password = 1231
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Ivona', 'Sovtić', 'ivona.sovtic@email.com', '$2b$12$o1.WCBZ75r9BRc78Ps6xjePWxs1/EKUuSoCn2CT6fgr4iFakv1x2u', 'true', 'true');

--email = njegoje.milosavic@email.com password = 3281
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Njegoje', 'Milosavić', 'njegoje.milosavic@email.com', '$2b$12$7//CtsnCCBj3Dsi0DAW7buCNu9bc.6LvAXEDQPt3egPbUxINQ30g2', 'true', 'true');

--email = vojislava.scekic@email.com password = 1378
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Vojislava', 'Šćekić', 'vojislava.scekic@email.com', '$2b$12$pivVphJs5Rz.bn8K9eHzwuJ8ZTIlYewtEviznHsaiJnV.3JFBjisy', 'true', 'true');

--email = ljuba.maljuric@email.com password = 9706
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Ljuba', 'Maljurić', 'ljuba.maljuric@email.com', '$2b$12$AaXee/YzIhoxkx/nCBh07Og7TvYdq.s//kZyiuZOGdQooWaqUGrZ2', 'true', 'true');

--email = alimpije.stankulic@email.com password = 1903
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Alimpije', 'Stankulić', 'alimpije.stankulic@email.com', '$2b$12$6Nwy90BPUv2qoZbkT0CrA.GfASDP/ohaoaXsCbJZE5heZJPFprHFO', 'true', 'true');

--email = melentije.barbucic@email.com password = 4492
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Melentije', 'Barbucić', 'melentije.barbucic@email.com', '$2b$12$ks88L.PeN7OPL3FKRLT2Re7JLQ5sPr/Hl0XEhlaE1uQAATRyzpdU6', 'true', 'true');

--email = drasko.cebic@email.com password = 1859
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Draško', 'Ćebić', 'drasko.cebic@email.com', '$2b$12$6IRdfLBEj.uNWmQX64CYfO0N7bxDFtAY7AMUCDs.cG0PIOiPFJ4Rm', 'true', 'true');

--email = tada.marunic@email.com password = 2434
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Tada', 'Marunić', 'tada.marunic@email.com', '$2b$12$3qfngL/uFVYfBUq1rqKhqOjIqukuhB7wxI/gWe8dbWUV/mvHGyYLm', 'true', 'true');

--email = toplica.anokic@email.com password = 5351
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Toplica', 'Anokić', 'toplica.anokic@email.com', '$2b$12$XZyHl/vo7abwGb/kQ1vQlOVtDVI6LKjJ.zdsyopwZDYz/eSHnAQvi', 'true', 'true');

--email = negosava.vulpic@email.com password = 9231
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Negosava', 'Vulpić', 'negosava.vulpic@email.com', '$2b$12$dgvqsrx9VsVkSPRmWfRsXOL5UiTXpcFKqmY/VUzITlL2US2wp8.pK', 'true', 'true');

--email = avram.dzombic@email.com password = 8957
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Avram', 'Džombić', 'avram.dzombic@email.com', '$2b$12$gDgUMIDNoDzvLRFzjFOcH./8UDYNsKEvnNITufoBrod1K4oOqfXLW', 'true', 'true');

--email = marijan.saveljic@email.com password = 7831
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Marijan', 'Saveljić', 'marijan.saveljic@email.com', '$2b$12$HiDTi/MhH.o.7aSK.BAPYO/uCt4ZDFYlwua7Wp0g.AP29kyApPpFi', 'true', 'true');

--email = vladan.kukric@email.com password = 6102
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Vladan', 'Kukrić', 'vladan.kukric@email.com', '$2b$12$7i2Z1/.MsCeR3ILam.J/Uu5p6RpYv2ABDLmEfeuYTOm59K3/FWW0q', 'true', 'true');

--email = milja.panincic@email.com password = 6431
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Milja', 'Paninčić', 'milja.panincic@email.com', '$2b$12$MprCDdTVXPhkfKfEs4xRfe39gQsrjpP5d0XkGquKz9ojRgubviZ3e', 'true', 'true');

--email = tamara.stelkic@email.com password = 2104
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Tamara', 'Stelkić', 'tamara.stelkic@email.com', '$2b$12$acCEzrhagzAzwEkeSYGFR.K.19a3hrgx1NXXTvcBqv/OunBnAnMA.', 'true', 'true');

--email = milentije.kraincanic@email.com password = 6826
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Milentije', 'Krainčanić', 'milentije.kraincanic@email.com', '$2b$12$AhXYSB6O57D0ct6rs8hvj.kUTgCHSntIfSjYnvixEzmdd4VRDZnb2', 'true', 'true');

--email = andjelka.zivotic@email.com password = 9963
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Anđelka', 'Životić', 'andjelka.zivotic@email.com', '$2b$12$Lbm0pGoZ80KvIk281W4f3OeIMKIaEvjbnowa.zwHqWOMSQ8a5zQQq', 'true', 'true');

--email = makrena.bozic@email.com password = 9446
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Makrena', 'Božić', 'makrena.bozic@email.com', '$2b$12$.46LVZJqPbi2Dl65z1rooOx06rNXyhRc/W5WyYG3HoXrYSuD5Udci', 'true', 'true');

--email = vukadin.kurucic@email.com password = 8649
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Vukadin', 'Kurucić', 'vukadin.kurucic@email.com', '$2b$12$0CHS7kugpH9ipy932cvVP.R0ijNOl519Q.YZ0ePrK36IFnBRqmsvu', 'true', 'true');

--email = blagoje.perucic@email.com password = 7581
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Blagoje', 'Perucić', 'blagoje.perucic@email.com', '$2b$12$0AhUT0uuW6NguJnBK3.Q6.XlYUWMfxhbYQnoo9R6a3/cdxeZw6mEi', 'true', 'true');

--email = ivan.rajic@email.com password = 9360
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Ivan', 'Rajić', 'ivan.rajic@email.com', '$2b$12$hmx2tw.Jo8kY8hQjPR5zTe3inGgfaLPinrNVLdpEQ/1uT6THtDS/.', 'true', 'true');

--email = drgorad.veselic@email.com password = 5814
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Drgorad', 'Veselić', 'drgorad.veselic@email.com', '$2b$12$bf4GyF..5YmvQGdgzMF/de3NS2lnFnS9Q/16W1mizJ0dukZz0b8z2', 'true', 'true');

--email = petar.ruzojcic@email.com password = 4578
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Petar', 'Ružojčić', 'petar.ruzojcic@email.com', '$2b$12$lYOiDhUhXiVUW5Yv05QcSO.rtCtrEvnm8/BYMouXsQ0prmnvX/T1q', 'true', 'true');

--email = viktorija.granulic@email.com password = 3204
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Viktorija', 'Granulić', 'viktorija.granulic@email.com', '$2b$12$8uq0K0FpM1Ix8Ouy9FPsXu07TKYIc/X9m4qJPz7QbLAq8f7LCH7La', 'true', 'true');

--email = milivoj.samardzic@email.com password = 5550
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Milivoj', 'Samardžić', 'milivoj.samardzic@email.com', '$2b$12$ivcZ.ek4ggkw.2PuI74ViOEQSUjO6C5.iQJlRdbx8pn3Zyd2Vgy4u', 'true', 'true');

--email = zoran.pevalic@email.com password = 4097
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Zoran', 'Pevalić', 'zoran.pevalic@email.com', '$2b$12$herlLc9igIy5pny3MZiix.iMs/fuS1mCGD/xNzpxuIvxhgIydpCee', 'true', 'true');

--email = vukoje.lupikic@email.com password = 3120
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Vukoje', 'Lupikić', 'vukoje.lupikic@email.com', '$2b$12$LRQjwEiWcBzWkVjPm6nBNOiQ7b8leIC2sKB9pA.cKgZVYRSeGb4AC', 'true', 'true');

--email = zorana.borikic@email.com password = 2939
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Zorana', 'Borikić', 'zorana.borikic@email.com', '$2b$12$.6C56s6XKUwTXKoEih3rXeK474uvs1DiCBQrG0jnrI0Bmm/Chdb2y', 'true', 'true');

--email = kostadinka.kentric@email.com password = 5273
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Kostadinka', 'Kentrić', 'kostadinka.kentric@email.com', '$2b$12$EXjetvxqx90dKWd03rP8ouD9iU6W8/epM5SAR9ih1dpnrtQxICkr2', 'true', 'true');

--email = jelka.brndusic@email.com password = 5068
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Jelka', 'Brndušić', 'jelka.brndusic@email.com', '$2b$12$SuYKBcMthnw5Bt78Fkmo7eyR3gV55oZ9DtC7g2v8/366CJy7HrTsO', 'true', 'true');

--email = ljuba.kanuric@email.com password = 9385
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Ljuba', 'Kanurić', 'ljuba.kanuric@email.com', '$2b$12$huwxvPUHHQ1n3JyS4zM1jusm9mC4T4jXqRu/FnLUBePLDIrZGaqei', 'true', 'true');

--email = simeon.bokic@email.com password = 1331
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Simeon', 'Bokić', 'simeon.bokic@email.com', '$2b$12$TAfyFyUGLnv2Y7Hl2KR9cOs0Gtn2HMO1esmZS0wTiZnqjjwZmZ/lm', 'true', 'true');

--email = selena.runic@email.com password = 2987
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Selena', 'Runić', 'selena.runic@email.com', '$2b$12$06JmOA0seoONJT5cFDqJ9.ZL4S/h3knxk/T2S1V1qNEjhFTaKT7wy', 'true', 'true');

--email = zivoratka.budnic@email.com password = 3048
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Živoratka', 'Budnić', 'zivoratka.budnic@email.com', '$2b$12$OKqRJ.qdcfFYLBtB8P/5y.iWQXToqGCzblsYg75VYXxLVd.w42ULC', 'true', 'true');

--email = stamenija.obackic@email.com password = 1473
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Stamenija', 'Obačkić', 'stamenija.obackic@email.com', '$2b$12$KO0MCw2MSbfPmAigFAt4gudW3Ab.rpS1O8y9iWHazWF0rc1fjwMjy', 'true', 'true');

--email = tatjana.pancic@email.com password = 6676
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Tatjana', 'Pančić', 'tatjana.pancic@email.com', '$2b$12$0BGiA1TxPkc.BZT3Uh9Ov.6GHa7xihU44MrTcBsUABe3cyguoAK8y', 'true', 'true');

--email = njegovan.dolinic@email.com password = 9155
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Njegovan', 'Dolinić', 'njegovan.dolinic@email.com', '$2b$12$meezmJ6RmisyMc1k0P7HDucKPrXW2GYx0d0PfIuPcNxalC7UIlqbC', 'true', 'true');

--email = konstantin.razumenic@email.com password = 9041
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Konstantin', 'Razumenić', 'konstantin.razumenic@email.com', '$2b$12$p4D42EMW5ahLZuNP5u9Vcu9VUFzHLDbfW7u5zCQURBEwo5Qq/je2C', 'true', 'true');

--email = zarko.cupic@email.com password = 1416
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Žarko', 'Ćupić', 'zarko.cupic@email.com', '$2b$12$lMt/ChCpE8ksfazavrrpn.FfmSltP/z86ikHnEAxYJWewWmBACXT6', 'true', 'true');

--email = stepan.vucendic@email.com password = 8383
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Stepan', 'Vučendić', 'stepan.vucendic@email.com', '$2b$12$7LZntfjQcSQdkUh4b.fcJuzNSoAJa8Cn8Ln389TYFe73tSr9Mt3Uy', 'true', 'true');

--email = jasna.parausic@email.com password = 4168
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Jasna', 'Paraušić', 'jasna.parausic@email.com', '$2b$12$KI7AkXJ3kyZoSeJ7BkQO7euLjQsIyHkPPYOUcnhJKK2yOKaGrlXZ.', 'true', 'true');

--email = zivoslava.vucenic@email.com password = 5410
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Živoslava', 'Vučenić', 'zivoslava.vucenic@email.com', '$2b$12$iT55BjjfWL4nru1bLoRXZeFgYbySvdOLOUYz/7QADU6MIZyUiYFI2', 'true', 'true');

--email = julka.kenjic@email.com password = 6742
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Julka', 'Kenjić', 'julka.kenjic@email.com', '$2b$12$kWT2xo3zepyWoquhxM48Ze5415VF9cDlQ0PiS0wzkZklNgZPhlTSW', 'true', 'true');

--email = vera.saratlic@email.com password = 1985
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Vera', 'Saratlić', 'vera.saratlic@email.com', '$2b$12$6h9ij7NKcQPbbFLrc0RAqOggJtYoLGvn6xJPNtgN2NiWxXwApVvWy', 'true', 'true');

--email = jugoslav.dokic@email.com password = 4874
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Jugoslav', 'Dokić', 'jugoslav.dokic@email.com', '$2b$12$IHghLKUPdVGuf6h833zYdud9znOCni4uhigDK36jEVjTM.tbde8pu', 'true', 'true');

--email = sonja.paravinic@email.com password = 4788
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Sonja', 'Paravinić', 'sonja.paravinic@email.com', '$2b$12$u3EfoN/Cl8oZ62RhljxigOK5rU1MlJgpHRR.zaLYH3fqXKg28HMSm', 'true', 'true');

--email = tatjana.sevic@email.com password = 5011
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Tatjana', 'Šević', 'tatjana.sevic@email.com', '$2b$12$C1mpVHW96ix.7QRrnjwuYu0Bat4OPuzLNDz90hBm3wAAl4D03XJMq', 'true', 'true');

--email = branislava.bubic@email.com password = 9172
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Branislava', 'Bubić', 'branislava.bubic@email.com', '$2b$12$/BK0KnCVuVpI8Uey7E14Lui.GW1Hd9eTXR35w23WL6CAz.sz0QDxq', 'true', 'true');

--email = vujadinka.luburic@email.com password = 6478
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Vujadinka', 'Luburić', 'vujadinka.luburic@email.com', '$2b$12$xFhAOeYUpxMFvC4lfEYQYekapXV7jZNn3GJBq.5NA3Q0a/4hiXmHW', 'true', 'true');

--email = tihomir.disic@email.com password = 3314
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Tihomir', 'Disić', 'tihomir.disic@email.com', '$2b$12$422J7cUsTYu43FvJ59E2oO3QNs76LUuR1QT553XKl1O2GbRplNsQS', 'true', 'true');

--email = ana.batizic@email.com password = 2969
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Ana', 'Batizić', 'ana.batizic@email.com', '$2b$12$zhp5DSusPbo.xa9opoTgvOgz45mSCKPB2xVRaIAGbEELwu61nujWO', 'true', 'true');

--email = grozdana.micic@email.com password = 5364
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Grozdana', 'Micić', 'grozdana.micic@email.com', '$2b$12$dcQmWKQoNWvGH5Qs6d8nPO0TMajTE3L1iWJwkE5dRt.lrMBKoGH4y', 'true', 'true');

--email = julija.koljensic@email.com password = 2067
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Julija', 'Koljenšić', 'julija.koljensic@email.com', '$2b$12$Akclwma9HTipoFqfSI55u.Z21.pS8nMSyl6O9ajm3qNTzktYRSYu.', 'true', 'true');

--email = kleopatra.slavic@email.com password = 5252
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Kleopatra', 'Slavić', 'kleopatra.slavic@email.com', '$2b$12$9std/kRxe2Ni2qUMMS/QsO/CFxOZNU16hc46QaQYKnizjKQMatPUK', 'true', 'true');

--email = marjan.krdzalic@email.com password = 5964
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Marjan', 'Krdžalić', 'marjan.krdzalic@email.com', '$2b$12$a76eSUDenZ/9dMerbBbT6uiDFNLAsWwiS0Gvbz.vYfJeTuSmmsR06', 'true', 'true');

--email = uros.celebic@email.com password = 8390
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Uroš', 'Čelebić', 'uros.celebic@email.com', '$2b$12$6HwxFtpefR1FAEATGaMBqufDtpYHrytUEo6Oy/xu.PlTBcPdnriU6', 'true', 'true');

--email = prohor.palalic@email.com password = 7771
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Prohor', 'Palalić', 'prohor.palalic@email.com', '$2b$12$96MWG4bHlHkLyXEg0gX1wO1uuV5LEHy7URBfr4ROXQIjTZKhUXRi6', 'true', 'true');

--email = roksanda.cergic@email.com password = 3748
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Roksanda', 'Čergić', 'roksanda.cergic@email.com', '$2b$12$n3mcKeKDN6AeHCE1MAaIYuAxb05ofelIbKtLLTqRSqqBaB0oMMCeC', 'true', 'true');

--email = svetislav.denkic@email.com password = 2829
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Svetislav', 'Denkić', 'svetislav.denkic@email.com', '$2b$12$fz.rGZq3ci7WK.9zGfqke.WWRmJ9mxhrViutt/fHt.RVrCGm4KC.a', 'true', 'true');

--email = zivan.buljigic@email.com password = 1671
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Živan', 'Buljigić', 'zivan.buljigic@email.com', '$2b$12$n6WHhUF61MlZXrf8PaZNMOssRlnNz.tTnvFp5qUX/Dt6TooXK3pEq', 'true', 'true');

--email = djulijana.petronic@email.com password = 3684
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Đulijana', 'Petronić', 'djulijana.petronic@email.com', '$2b$12$M5LeVS3AlhZNo22WbeSlh.OSwW4xSmLukh1t0xX0IYLFvM1iiibG6', 'true', 'true');

--email = sibin.kovincic@email.com password = 7083
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Sibin', 'Kovinčić', 'sibin.kovincic@email.com', '$2b$12$Amlp.skTbNoJj0OHM6sK0.6oG06aHj2iAb0A/G0FiUm7CAb11Goe6', 'true', 'true');

--email = stamenija.krkic@email.com password = 4056
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Stamenija', 'Krkić', 'stamenija.krkic@email.com', '$2b$12$xJqzJxXbljk2B6aga2jD.eGLh1wZFDnp5CJQlFPUoSu6gv97LUdrq', 'true', 'true');

--email = milan.krnjeusic@email.com password = 7849
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Milan', 'Krnjeušić', 'milan.krnjeusic@email.com', '$2b$12$EJsXOkRE0nqLfhWhBzG1OOipakDR0lVmqo4oXkJgONitQeNp7Qrji', 'true', 'true');

--email = manojlo.milosavic@email.com password = 3509
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Manojlo', 'Milosavić', 'manojlo.milosavic@email.com', '$2b$12$6mLxAnOsnJQ.3GlgppcnQuy0A7FniE65YcwhpsPk.sx8.XLFLJWKW', 'true', 'true');

--email = hristivoj.kragic@email.com password = 5148
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Hristivoj', 'Kragić', 'hristivoj.kragic@email.com', '$2b$12$m0q9G3hARAHDVStg0CKQPeBYs7SKD.eKLRd3Vbv3r3c2AzUOiE.R.', 'true', 'true');

--email = spasoje.vrackic@email.com password = 1518
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Spasoje', 'Vračkić', 'spasoje.vrackic@email.com', '$2b$12$aIPVbLYkQm2n2AVi4q982Oq/3Tqm9BA54h6ROnVNMCI1mtlauTaBK', 'true', 'true');

--email = slavisa.borongic@email.com password = 6770
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Slaviša', 'Borongić', 'slavisa.borongic@email.com', '$2b$12$SqbO0OJOvltdLmY3iAV.NuJ59lJZQfvtjGFqcs01o5wseWRMTM4J.', 'true', 'true');

--email = avram.krivacic@email.com password = 4151
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Avram', 'Krivačić', 'avram.krivacic@email.com', '$2b$12$oNC6YL6KbsleuHUpaL/EQuZB898ilQl.wGFc8ZA5cAdKOkafpByS6', 'true', 'true');

--email = stanija.puretic@email.com password = 9515
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Stanija', 'Puretić', 'stanija.puretic@email.com', '$2b$12$CLuwCvBOQnIWNzPXW3l1Aegi2RiiWT0Bzq2t9HqUHLG3xQDSgUz1O', 'true', 'true');

--email = ozarija.gloginjic@email.com password = 3918
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Ozarija', 'Gloginjić', 'ozarija.gloginjic@email.com', '$2b$12$PJ9xsj.I9aS.PBKuvsPrBeZwyOy51r96as6aAcARNQqfk66Mmkele', 'true', 'true');

--email = njegus.veselicic@email.com password = 4493
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Njeguš', 'Veseličić', 'njegus.veselicic@email.com', '$2b$12$56GWN4TZqyAPe.4zxuzn0O3Y8PHkqMf4h5XqZmaS8m44VHt4y6b6G', 'true', 'true');

--email = elizabeta.arsic@email.com password = 9293
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Elizabeta', 'Arsić', 'elizabeta.arsic@email.com', '$2b$12$5hSuKskBhY7tLSmXk26DDuRIYNVOuTjTSGqvWoWvyL6Oex/6pvkoq', 'true', 'true');

--email = ljubica.tufikic@email.com password = 2331
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Ljubica', 'Tufikić', 'ljubica.tufikic@email.com', '$2b$12$r.v159Rpwh6yoKmNrr/bnOs41MrqOolwdh/2mtK0Bs2K61DqO20Hu', 'true', 'true');

--email = vukota.zaradic@email.com password = 6736
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Vukota', 'Zaradić', 'vukota.zaradic@email.com', '$2b$12$sD.YoRAhgm3tFxA/8Gk6P.ti/.KLbAek33Kn3PQIQ8fpY8/561HZq', 'true', 'true');

--email = tanja.tabandzelic@email.com password = 6283
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Tanja', 'Tabandželić', 'tanja.tabandzelic@email.com', '$2b$12$HqxUeKCJEWehL2Jlo9jrcu/GE03teW9j.tEgqaTU71f7OV0c0W286', 'true', 'true');

--email = drgorad.andic@email.com password = 2031
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Drgorad', 'Andić', 'drgorad.andic@email.com', '$2b$12$WSGfi4lhE2CC9MHIRvdXGu1g7ZKh7hXAFFKaQMk5Sp8/5VZslmDDO', 'true', 'true');

--email = grigorije.ivekic@email.com password = 4300
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Grigorije', 'Ivekić', 'grigorije.ivekic@email.com', '$2b$12$gCSmDjPo8DcvewP6/M6MeeqOLocxMPTr4lUD/8JV0dR1lKHFO4Fu2', 'true', 'true');

--email = stojmen.bresic@email.com password = 5141
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Stojmen', 'Brešić', 'stojmen.bresic@email.com', '$2b$12$eQmtLSzqMaxc2T1IQI4XGegG43QiO4bWlRTx81Da03rhHgzSQnJZu', 'true', 'true');

--email = lara.trenkic@email.com password = 8029
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Lara', 'Trenkić', 'lara.trenkic@email.com', '$2b$12$0xs8mZ.G0.WBre7G1lj2k.UY7HghM5YiZ8mm/UM387VpMG8QTP0iG', 'true', 'true');

--email = zlatoje.vlasinic@email.com password = 5864
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Zlatoje', 'Vlasinić', 'zlatoje.vlasinic@email.com', '$2b$12$0WOygLdw9OZsznNgYJiXy.lsq59ctKm2Jne/B2gfOAK8jS6zE2gPO', 'true', 'true');

--email = branislava.dokic@email.com password = 6966
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Branislava', 'Dokić', 'branislava.dokic@email.com', '$2b$12$ZR3hbnG5xPVBcGvH6XU.FeEHa7g8DMzqyE.mrWsXtqbAynY.36Bn6', 'true', 'true');

--email = jagos.lekic@email.com password = 3178
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Jagoš', 'Lekić', 'jagos.lekic@email.com', '$2b$12$ER79MwyzrUk7jWOVsSo8Su7oaLTI5Xf7dNEPRitfEHReEjOioMxoi', 'true', 'true');

--email = simeon.nemanjic@email.com password = 2853
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Simeon', 'Nemanjić', 'simeon.nemanjic@email.com', '$2b$12$JzVBX1KwbxQBLOLc/xlJA.fiXiSVbvj5EzWJ0mEIKFdP8tuwdVPMW', 'true', 'true');

--email = randjel.drakic@email.com password = 7311
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Ranđel', 'Drakić', 'randjel.drakic@email.com', '$2b$12$DS16ikgnk2pdlnJw/4nHCuAe6Yy8Lq.IQaMC59HstUv7baxJxNoMm', 'true', 'true');

--email = djoka.simikic@email.com password = 8114
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Đoka', 'Simikić', 'djoka.simikic@email.com', '$2b$12$NWGfT3L8CWCxgVp.q5UBrOWeelEjvzCKEf7RfXMwisdsSVuyy8l3S', 'true', 'true');

--email = tomislav.licinic@email.com password = 5907
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Tomislav', 'Ličinić', 'tomislav.licinic@email.com', '$2b$12$63TtyXJiMBR3FKlbPkCBC.TEJIGQCEzO10UuOOHXB1kky/2IdeFKm', 'true', 'true');

--email = todora.adjancic@email.com password = 2975
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Todora', 'Ađančić', 'todora.adjancic@email.com', '$2b$12$tgXzz6zHSqrKBRZX5QjuW.cIn5eJxHVFCg22lWvMQLa2WTscC2Y7u', 'true', 'true');

--email = petar.cvetic@email.com password = 7184
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Petar', 'Cvetić', 'petar.cvetic@email.com', '$2b$12$LslhrR5i9SYfJB2Fkd78b.PLyyFWtB5l6kB4kNo9upJTEpBCQLrLS', 'true', 'true');

--email = novica.grubetic@email.com password = 5067
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Novica', 'Grubetić', 'novica.grubetic@email.com', '$2b$12$L.f/JMMMgK3aSdXGLpMKMehLKKf2GRNQA7vKQ0x/t0mf7tpLq9sNy', 'true', 'true');

--email = feodor.despic@email.com password = 2516
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Feodor', 'Despić', 'feodor.despic@email.com', '$2b$12$wkNPrQeLrO1vXRtLuYRvF.KyUKsYell0V8UWrIQwKHsKwCOjFec9q', 'true', 'true');

--email = divna.romandic@email.com password = 5526
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Divna', 'Romandić', 'divna.romandic@email.com', '$2b$12$kkRLislXjxGFIH6nSXj0Su6a7LFi9GFq9YN7gid6QnXXnYqO2yh9a', 'true', 'true');

--email = rumenka.vracaric@email.com password = 2591
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Rumenka', 'Vračarić', 'rumenka.vracaric@email.com', '$2b$12$oz78y/zb1vSbxOy/BnQXHObFjKRA30au8FvNkT5G4QloxvSRhhZ.G', 'true', 'true');

--email = bosko.milisic@email.com password = 1471
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Boško', 'Milišić', 'bosko.milisic@email.com', '$2b$12$OVs.4CIGXbDHkgziof50YufiTplzmUGf0Ap.Bjf7IzVX8JQoL0nD2', 'true', 'true');

--email = vladimir.senic@email.com password = 6992
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Vladimir', 'Senić', 'vladimir.senic@email.com', '$2b$12$14HHyPetav7k3/cswni8ze6B38XNhg2/IZ/4hPQfvMGj5CwU/2rSW', 'true', 'true');

--email = dobrila.djurasic@email.com password = 8266
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Dobrila', 'Đurašić', 'dobrila.djurasic@email.com', '$2b$12$88ba6XjlqaiJDuANQKoQjeeMRtxHhxtmQO/O8hhjC.aIXSwmsEGeq', 'true', 'true');

--email = bojan.pesic@email.com password = 6699
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Bojan', 'Pešić', 'bojan.pesic@email.com', '$2b$12$mYy0YKU6MqmBzmbwrb0a9O90nganXmfIFYkA13clvR5QWGa5.VYBC', 'true', 'true');

--email = vidak.protic@email.com password = 2886
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Vidak', 'Protić', 'vidak.protic@email.com', '$2b$12$Se2FBnd8Y2j276bSB2uKleFZFe2aZbnhzH7wrUgg/uMyc1vvWsVaq', 'true', 'true');

--email = stamenko.vrndic@email.com password = 8225
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Stamenko', 'Vrndić', 'stamenko.vrndic@email.com', '$2b$12$i6sDLh86ZFvuig3X1hJZSOK8XdmTlX7C/tGAF/jG038DU776moU8S', 'true', 'true');

--email = djordje.jonkic@email.com password = 9050
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Đorđe', 'Jonkić', 'djordje.jonkic@email.com', '$2b$12$slZ.KLvrqi/A5n8rtNgLCeg99Y1qhPhi0v/wY1cgUewBAlld/AtOS', 'true', 'true');

--email = dusica.stakusic@email.com password = 8454
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Dušica', 'Stakušić', 'dusica.stakusic@email.com', '$2b$12$hFuvgg.K5e4n3hRnIF/Hl.M5n1zs3x/Kl3HprE1jQHfX/wr4Vn4iW', 'true', 'true');

--email = eva.djeric@email.com password = 8416
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Eva', 'Đerić', 'eva.djeric@email.com', '$2b$12$KKCH3wR0OwhCUJ/pqS2DUe7hN6SJU3QEi78CI/oL6i4HCQGuVGxku', 'true', 'true');

--email = slavka.savelic@email.com password = 7903
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Slavka', 'Savelić', 'slavka.savelic@email.com', '$2b$12$ghWMN5URlLEHLgCh1uHRk.tEiBK2aSLFRkfqOmRq6C1SvUh4AxUf6', 'true', 'true');

--email = dositej.strigic@email.com password = 5382
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Dositej', 'Strigić', 'dositej.strigic@email.com', '$2b$12$KYxZ8jTxE7MjJOKf44yyzOfRcblILSRzxh6t7pwgQcDSVWM5ZLfjm', 'true', 'true');

--email = zeljko.arsic@email.com password = 8220
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Željko', 'Arsić', 'zeljko.arsic@email.com', '$2b$12$Jc4xkbUoeI7yLj2u3ouYP.CiaaWhogj1AbYKHkAFO8ftIbgpdz14G', 'true', 'true');

--email = nina.kreconic@email.com password = 6915
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Nina', 'Kreconić', 'nina.kreconic@email.com', '$2b$12$wkCPVOlKlcH1sHLD3lKw5u7cZgvQNBoKugpvAUBmdfUwD76K.DOIi', 'true', 'true');

--email = bojana.parivodic@email.com password = 4662
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Bojana', 'Parivodić', 'bojana.parivodic@email.com', '$2b$12$..tRO.looeYLbkzZ/No3ge6L9XyTnqoG4KlCtI4g2vEQJP4vMoy4.', 'true', 'true');

--email = veronika.markeljic@email.com password = 1241
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Veronika', 'Markeljić', 'veronika.markeljic@email.com', '$2b$12$jJfywkWGHI5HDbXqobsi6eIJTTvt70OF7UgpeEIisMDg/GfgGb8QW', 'true', 'true');

--email = ignjat.gnjatic@email.com password = 3842
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Ignjat', 'Gnjatić', 'ignjat.gnjatic@email.com', '$2b$12$P7xLW6ApMvhC8Rckrf2nSO40XnXPR9j1nVYf3ex1mhKkwmKsb/dYK', 'true', 'true');

--email = isailo.gogic@email.com password = 5563
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Isailo', 'Gogić', 'isailo.gogic@email.com', '$2b$12$sWT/IJU8h1aGGOor8fzY1O/tMxGjgzBPGODsvtMXKAKgOL.VwUqH6', 'true', 'true');

--email = gojko.skuletic@email.com password = 1624
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Gojko', 'Škuletić', 'gojko.skuletic@email.com', '$2b$12$p/o2sw0Cfjmd8vAzbGBQpOPNHPDAMC368d4bejsTBvA6lflDjysgi', 'true', 'true');

--email = vukoje.derikravic@email.com password = 5074
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Vukoje', 'Derikravić', 'vukoje.derikravic@email.com', '$2b$12$Pwv9Ze6krMcIBC5B2Cf5delTUHjrw0TczwvusFdkB9z0a/CV6tfi.', 'true', 'true');

--email = djurica.sitnicic@email.com password = 4722
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Đurica', 'Sitničić', 'djurica.sitnicic@email.com', '$2b$12$nN6qCttHxTN0ylzZtulDj.rllTwn649dzRo/Lcp.JLdQE4k8T2fva', 'true', 'true');

--email = doroteja.carnic@email.com password = 8934
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Doroteja', 'Čarnić', 'doroteja.carnic@email.com', '$2b$12$wgx3.Z0YGIQjrSVb/2ngwuy5mEwau5iTz.dNcLg.MfCfvCoofZ63.', 'true', 'true');

--email = obradin.ivanic@email.com password = 5057
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Obradin', 'Ivanić', 'obradin.ivanic@email.com', '$2b$12$GY8XVKC8n31dY..7ZbEM5ufI2mH8T1c72P.NVe7w8UpwXcdUzCp8a', 'true', 'true');

--email = simonida.turudic@email.com password = 8494
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Simonida', 'Turudić', 'simonida.turudic@email.com', '$2b$12$W96WMq3psmp1W/Bue9Hkyu3GnLqrQ1RjjWRByG4N3tzg3oCBlLSiq', 'true', 'true');

--email = stojan.statkic@email.com password = 6655
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Stojan', 'Štatkić', 'stojan.statkic@email.com', '$2b$12$BUyjbSt9ynDoOHKHBLy5yOxG3bjsYDG1p6Vxi7EMkCyObw7i/ilWO', 'true', 'true');

--email = jelka.jojic@email.com password = 6255
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Jelka', 'Jojić', 'jelka.jojic@email.com', '$2b$12$nlCqckrAvQ6YsJ2G2Gb67eaJVcE3L../zUEIO/DG0pNUD4Z8YbmVq', 'true', 'true');

--email = radonja.cobeljic@email.com password = 1964
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Radonja', 'Čobeljić', 'radonja.cobeljic@email.com', '$2b$12$JBuEEq3VDl2UrT8QYt34puRvlG0FbwmPEOT37GMy0SNn3ZYvRPkNC', 'true', 'true');

--email = pajka.ivicic@email.com password = 8984
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Pajka', 'Ivičić', 'pajka.ivicic@email.com', '$2b$12$BJRQa9m8V8yFW3Lnmxn9i.3ooGau8McL/HQPve08lp6feGXx4ZOuO', 'true', 'true');

--email = hranislav.zuvic@email.com password = 1017
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Hranislav', 'Zuvić', 'hranislav.zuvic@email.com', '$2b$12$CsOhpP/JCTgRMae1EVQpDOwjfx4vhOEJGG0HVpgqmFnYAXzVaB706', 'true', 'true');

--email = georgije.sljivic@email.com password = 5201
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Georgije', 'Šljivić', 'georgije.sljivic@email.com', '$2b$12$X8Q87TUMtagqJR3GhreVjOKpIr3/gDsD4WHYDR01uCKyUsQTH.h/a', 'true', 'true');

--email = kosana.lakusic@email.com password = 4344
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Kosana', 'Lakušić', 'kosana.lakusic@email.com', '$2b$12$2dZHi3/Z2zJWoLX7VMio0OfVjThkZtMEbLw3qARTVaCyVg1.ZSNW.', 'true', 'true');

--email = ninoslav.moracic@email.com password = 5568
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Ninoslav', 'Moračić', 'ninoslav.moracic@email.com', '$2b$12$uQ3Pqo8FwA9L87TOxVRBbOA6Ew7e.ACQOXci1OEaiSFjS1PQWvdPu', 'true', 'true');

--email = njegos.dzadzic@email.com password = 5752
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Njegoš', 'Džadžić', 'njegos.dzadzic@email.com', '$2b$12$24UI/jb9h1wQY3B4Endqn.Dz036uYVBLGBMknOm6M1WmkIcv3zkpC', 'true', 'true');

--email = leposava.veic@email.com password = 1142
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Leposava', 'Veić', 'leposava.veic@email.com', '$2b$12$uWmIQhI0RoAMyy3x9aW1HO1XGCNCdxPENG6ALjunHQGxl3ePX93i6', 'true', 'true');

--email = mijat.vladetic@email.com password = 4559
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Mijat', 'Vladetić', 'mijat.vladetic@email.com', '$2b$12$lhH/2TC1oyXe.YFUZZ4yhuctEx4AiCh/iA17a55QJk7T2Zp9M5tte', 'true', 'true');

--email = maksim.ivucic@email.com password = 1676
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Maksim', 'Ivucić', 'maksim.ivucic@email.com', '$2b$12$3M0XKfBAaD6jsR7a2b4Pu.DxaoWKACDAB2yvBmVqAn7mDKLQar4GG', 'true', 'true');

--email = mijalko.gvoic@email.com password = 1868
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Mijalko', 'Gvoić', 'mijalko.gvoic@email.com', '$2b$12$P6Tu6oRV7yOlP.nGpuye6unZ6Lw58cg/J/iYPjrSGG.ZYMX5oSmna', 'true', 'true');

--email = sisko.buljugic@email.com password = 2872
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Šiško', 'Buljugić', 'sisko.buljugic@email.com', '$2b$12$3qSmE2PzIc.Tly0U33XdU.ylovLimcsaKonDJxildLZKHuhrzZ9N2', 'true', 'true');

--email = hristivoj.jovkic@email.com password = 3700
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Hristivoj', 'Jovkić', 'hristivoj.jovkic@email.com', '$2b$12$gSLpEAK8xgNU95mOu9sFluW3G.cg1xelwzVwHMDIwmMsgr4nuLOrO', 'true', 'true');

--email = katica.slavnic@email.com password = 4848
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Katica', 'Slavnić', 'katica.slavnic@email.com', '$2b$12$2X8L333C9KtUY557jnUK7eUlBD0bANNyZojVXLh6AiuPdicv77Q8K', 'true', 'true');

--email = damjanka.cobelic@email.com password = 9369
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Damjanka', 'Čobelić', 'damjanka.cobelic@email.com', '$2b$12$I5Es4lCRgB.ArwZ0xTuCd.VIrhQ7KW/1QhisBwQBoI3m5wJQ.BB9m', 'true', 'true');

--email = krsmanija.butric@email.com password = 8906
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Krsmanija', 'Butrić', 'krsmanija.butric@email.com', '$2b$12$SL/P/panmrFAXc2YWHUeWuB9CTTpviPYeR9ZrlKa52DDRgkEogow2', 'true', 'true');

--email = vladan.letic@email.com password = 7412
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Vladan', 'Letić', 'vladan.letic@email.com', '$2b$12$c9suWkO.Oq4/IDHAeyGSb.mbG1.//s6PT8Ov.vKP2nti.uOwrVnrW', 'true', 'true');

--email = danilo.kezic@email.com password = 6462
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Danilo', 'Kežić', 'danilo.kezic@email.com', '$2b$12$X3TvVonCv1szyG92NDz5i.U7Ue1PLBWBRhq7BnptcvfdwCX0we7IO', 'true', 'true');

--email = zivanka.biljic@email.com password = 9404
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Živanka', 'Biljić', 'zivanka.biljic@email.com', '$2b$12$uGfNugbsjef./mJW3C3CzuLbka/9JqXAMMk66c21i/23ZQOtIwW2K', 'true', 'true');

--email = milos.talpesic@email.com password = 4481
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Miloš', 'Talpešić', 'milos.talpesic@email.com', '$2b$12$R8UM4GMpa/eBscvlN5C05eeH/pLWyiImY2lMiImxqMsbFoPeBTjuu', 'true', 'true');

--email = mirosava.piljikic@email.com password = 2830
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Mirosava', 'Piljikić', 'mirosava.piljikic@email.com', '$2b$12$KbdI63fDsSX2Ix9BEgzJy.Z6G.pTidIDRyIuVMN2R8h0hV4Pe8uY6', 'true', 'true');

--email = stamenko.skrbic@email.com password = 7888
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Stamenko', 'Škrbić', 'stamenko.skrbic@email.com', '$2b$12$E2p3zAxBlTq56OR1hqVe7elQ08UZUAmexjbyXnlDG0XCyZ/AJNPuG', 'true', 'true');

--email = prohor.poleksic@email.com password = 9028
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Prohor', 'Poleksić', 'prohor.poleksic@email.com', '$2b$12$15MpAdl92qiHRTFWQOXCmuyXOBAvqJeiLqZLWelq1ZLGyRA5Wjjbm', 'true', 'true');

--email = tijana.vasikic@email.com password = 3772
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Tijana', 'Vasikić', 'tijana.vasikic@email.com', '$2b$12$L5/1umMOz3ECSjQuDIt24uOIXP65ws/D8fTArC1I/b6gyCkTBn54.', 'true', 'true');

--email = tadija.cuturic@email.com password = 4336
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Tadija', 'Čuturić', 'tadija.cuturic@email.com', '$2b$12$lJhTyk/HKaOVAT42pjN0w.ltmO7EA4xOCIfSxO.ZTcfFI9gP68T1y', 'true', 'true');

--email = zlatomir.joketic@email.com password = 9622
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Zlatomir', 'Joketić', 'zlatomir.joketic@email.com', '$2b$12$FZ06.QBZsAh3Nb5muqDfMOsaCiejww8MTwQKMwG5aysAejCk8PIIO', 'true', 'true');

--email = radoslava.dzikic@email.com password = 4377
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Radoslava', 'Džikić', 'radoslava.dzikic@email.com', '$2b$12$BZtvGgMdbEergoUI14mdQu7LnvgiaR1T7TnL3Gpi/.eK2D0mu1LWS', 'true', 'true');

--email = miroslava.komnenic@email.com password = 5048
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Miroslava', 'Komnenić', 'miroslava.komnenic@email.com', '$2b$12$ErRN/FTfHmDuqgtORZF72OlFk9zd0cVrt8x/VzKm4BE1q34tvExIS', 'true', 'true');

--email = dusana.ponjausic@email.com password = 8992
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Dušana', 'Ponjaušić', 'dusana.ponjausic@email.com', '$2b$12$EZ8X0rqo6HCrdEoz/5gg/eY/WRx2tAVFwwmnl41n.tvbEHtOtVxX6', 'true', 'true');

--email = smilja.gadzic@email.com password = 7214
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Smilja', 'Gadžić', 'smilja.gadzic@email.com', '$2b$12$FSxcsuUB9m5sF75kZByMEuiZt9Fllfie5DGukzUlus8NKgeHdD1VW', 'true', 'true');

--email = ratislav.ljevnaic@email.com password = 2647
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Ratislav', 'Ljevnaić', 'ratislav.ljevnaic@email.com', '$2b$12$27Aqt/3fS7rz5Oj.lKZAuegLaXoGIv/jhXBsHD84V0I08UZZ6IWru', 'true', 'true');

--email = nevenka.pikic@email.com password = 8623
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Nevenka', 'Pikić', 'nevenka.pikic@email.com', '$2b$12$tvr0L7DHYnH1uzmn6SYO0eK3kAKqrJng3L0RKoFGPcSHBz3x61wv6', 'true', 'true');

--email = vukadin.buzaretic@email.com password = 4307
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Vukadin', 'Buzaretić', 'vukadin.buzaretic@email.com', '$2b$12$BTbwGt0p2A0FErOg7Habj.OGVTHduAIhGO0uEYEA9q.GfW.u.6r26', 'true', 'true');

--email = zaga.dunic@email.com password = 2460
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Zaga', 'Dunić', 'zaga.dunic@email.com', '$2b$12$zSyHA8ycvhcs/Dm5zmwTbeATme/R9OR3Eh15cTExRMH.eV4VQVVNG', 'true', 'true');

--email = djulijana.miljesic@email.com password = 2262
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Đulijana', 'Milješić', 'djulijana.miljesic@email.com', '$2b$12$nEYZL.sW3gDiis0PSVywbesD9dmUsEb5seyoeVdMbf35685CQuejy', 'true', 'true');

--email = varvara.mazic@email.com password = 1650
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Varvara', 'Mažić', 'varvara.mazic@email.com', '$2b$12$.AxHrsvot3Hc68x7fo.opuriJm897woduGLVQcdTw1D2LuWel.m7a', 'true', 'true');

--email = milutin.bumbic@email.com password = 1959
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Milutin', 'Bumbić', 'milutin.bumbic@email.com', '$2b$12$7zd2.ZY0q9CjCoz7aBrC0.Vf1fbmrETiIc/tBN7PdKQFzbJpo4k5q', 'true', 'true');

--email = desanka.jerotic@email.com password = 3540
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Desanka', 'Jerotić', 'desanka.jerotic@email.com', '$2b$12$hiRjwmhhE.ePS9B7mIN61uTIWgG5zcxbHUdOs189G0H4u79PCMS5a', 'true', 'true');

--email = marinko.jelic@email.com password = 4452
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Marinko', 'Jelić', 'marinko.jelic@email.com', '$2b$12$bEG8g0AGSQGMXOVS4R5Fs.0troEoleJt8QzXzLFauK2l1vMdh/Fni', 'true', 'true');

--email = ratibor.dudic@email.com password = 7354
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Ratibor', 'Dudić', 'ratibor.dudic@email.com', '$2b$12$HwH1Lo3MVZ0anyx7usLgvemcthC0JjpY.uWYS6Cl9XEie/bx8RqqW', 'true', 'true');

--email = vukan.kapetinic@email.com password = 7751
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Vukan', 'Kapetinić', 'vukan.kapetinic@email.com', '$2b$12$fcTh0DotPX1KOBC4EA/Dqu71tCREC4avt.VfSwsYCo.F/E91OG84q', 'true', 'true');

--email = kuzman.jelisavcic@email.com password = 5379
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Kuzman', 'Jelisavčić', 'kuzman.jelisavcic@email.com', '$2b$12$ShagU3kR6s4ZNVVxPZwPJuDvnJCFZGI2pm.VM01.kmazzzVLby9sa', 'true', 'true');

--email = dragoslava.bosiljcic@email.com password = 3007
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Dragoslava', 'Bosiljčić', 'dragoslava.bosiljcic@email.com', '$2b$12$jAxwE2k3RgatErXvJk4xhO/ik1GijRkQvmLXIDTyL3OZ0zdnSaYHW', 'true', 'true');

--email = dunja.mutavdzic@email.com password = 8004
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Dunja', 'Mutavdžić', 'dunja.mutavdzic@email.com', '$2b$12$VJcgfZB8v8I.lCIw8bLC9uhoMAgdw00MLyKlrp3E36aijlCyDED6e', 'true', 'true');

--email = dusan.skendzic@email.com password = 9118
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Dušan', 'Skendžić', 'dusan.skendzic@email.com', '$2b$12$SL9/Jbb2RjOZ6RJyv6gJoeqbpyjBx/GXgHXQ27rliaTJymLA4Jmzq', 'true', 'true');

--email = mileta.gerginic@email.com password = 4264
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Mileta', 'Gerginić', 'mileta.gerginic@email.com', '$2b$12$OHH4iqgmSu5.ade2.kQrzOPtCUnwu5GqWWdKPkGTPak7XXY7XhupW', 'true', 'true');

--email = mosa.gajtanic@email.com password = 1924
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Moša', 'Gajtanić', 'mosa.gajtanic@email.com', '$2b$12$559thjxvvm9xgKpvslaGVefzPKnoMsXYsQUuKned98OGqAkG7/Dzy', 'true', 'true');

--email = milojka.karaklic@email.com password = 2014
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Milojka', 'Karaklić', 'milojka.karaklic@email.com', '$2b$12$MfOIKSeFn.Fxm6EphUQSx.MI4cuGow4EBpVOumkW.yykk54b4pUXa', 'true', 'true');

--email = kosana.vujetic@email.com password = 9400
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Kosana', 'Vujetić', 'kosana.vujetic@email.com', '$2b$12$brFwy7AD6jFVwy8jgy1AaebFC5nMJzfrbsoKgcAiDs3QIlpTzWIiW', 'true', 'true');

--email = ljubinko.mandic@email.com password = 7340
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Ljubinko', 'Mandić', 'ljubinko.mandic@email.com', '$2b$12$16F49vxcHQrUe8uCU3FznuXsmlts7OlZf5HNh1F.s3GVAJ6jhykty', 'true', 'true');

--email = dobroslavka.klevernic@email.com password = 8213
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Dobroslavka', 'Klevernić', 'dobroslavka.klevernic@email.com', '$2b$12$PgboR46ZD2Hateof4oob6ulYtUXdM4pKvICSF5Oyl.YCuN08h8pkC', 'true', 'true');

--email = jevta.glamocic@email.com password = 1707
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Jevta', 'Glamočić', 'jevta.glamocic@email.com', '$2b$12$idAgzC9CIb7XQaSceFfye.2BoLXY6LgazO2tFZn/RDoDuy7LFsjEa', 'true', 'true');

--email = momir.savurdic@email.com password = 7398
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Momir', 'Savurdić', 'momir.savurdic@email.com', '$2b$12$8prHxqAyHjR3mT3WdBIYz.jehhkdHvbwqlHrtp78p6U7Invwkgf6u', 'true', 'true');

--email = spira.mrkaic@email.com password = 7687
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Spira', 'Mrkaić', 'spira.mrkaic@email.com', '$2b$12$JvxdjzAFGhTlpp/eVrWCiu5r6g7/sHbQo3zfIB4Q5XhREhMreOS86', 'true', 'true');

--email = aca.najdic@email.com password = 2070
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Aca', 'Najdić', 'aca.najdic@email.com', '$2b$12$ZR0mY43QWu7wXuuIGmQEGeAClf4p1nzSLQkB8eBDFsRC6ZGlvYfR.', 'true', 'true');

--email = cedomirka.pudaric@email.com password = 9215
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Čedomirka', 'Pudarić', 'cedomirka.pudaric@email.com', '$2b$12$R6t59RIHwJzJir7IcXcg3OtzzZModeXQgGBb4JYaBONiOEN4w/oPS', 'true', 'true');

--email = andja.miljanic@email.com password = 2994
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Anđa', 'Miljanić', 'andja.miljanic@email.com', '$2b$12$yGNlxIrnEJ.QrYocVzQKkunfzFnO/tu57F8FkeAcmIdKvRA1KEBjC', 'true', 'true');

--email = irena.brasic@email.com password = 6448
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Irena', 'Brašić', 'irena.brasic@email.com', '$2b$12$H5nw0b.BfBSmOH0uhwd8ruMcV6zxc3ZHFr0/5Lbozon3S4C9IfMqG', 'true', 'true');

--email = vukadin.kavalic@email.com password = 7444
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Vukadin', 'Kavalić', 'vukadin.kavalic@email.com', '$2b$12$0zxe6Ehi90LWuKwiRjFPIe4UJcdmEQKAHaoW7m4RGhI8Woj5Qw1u6', 'true', 'true');

--email = zivka.railic@email.com password = 8887
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Živka', 'Railić', 'zivka.railic@email.com', '$2b$12$K45HS7RE1q/HDczI90U1QO6snv7lvbFYFFXnOIqGdOZmOS1A8srRK', 'true', 'true');

--email = obradinka.roglic@email.com password = 8483
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Obradinka', 'Roglić', 'obradinka.roglic@email.com', '$2b$12$NvYc22qFDQIXTGQgcSxCnOKKRIMsjaRSJuZRzDfk4h0xPsxCZW59S', 'true', 'true');

--email = nevenka.trific@email.com password = 2131
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Nevenka', 'Trifić', 'nevenka.trific@email.com', '$2b$12$NTZGr4kxf0fIjh6ykjUtle.GFBt3MCJdrhQhK0v/n74q8K2KE7qHK', 'true', 'true');

--email = djuradj.belobabic@email.com password = 6649
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Đurađ', 'Belobabić', 'djuradj.belobabic@email.com', '$2b$12$SwZgrFV/DZ5VHeFj4JzCR..UZr17PV55H5Hsug4eZ3Y.C9EGOItee', 'true', 'true');

--email = kojadin.bulajic@email.com password = 6953
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Kojadin', 'Bulajić', 'kojadin.bulajic@email.com', '$2b$12$jOJtJ8I7QUdznJe/31ie.uWmf2R3CY4GA4rhkXHg0dDO5vHNK84Je', 'true', 'true');

--email = mateja.ratic@email.com password = 1941
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Mateja', 'Ratić', 'mateja.ratic@email.com', '$2b$12$DL4qkH6BXHnFjahBcumWQ.mg1i5iYQ4HWHtKmAXZJpkbsTdvcalZK', 'true', 'true');

--email = zdravka.trifunjagic@email.com password = 3405
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Zdravka', 'Trifunjagić', 'zdravka.trifunjagic@email.com', '$2b$12$QkU5o3TLsVel0l/2SThhTuNsrgXxtrguJCAvcCoQl6XfA.BP/qRAO', 'true', 'true');

--email = marinko.epifanic@email.com password = 8193
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Marinko', 'Epifanić', 'marinko.epifanic@email.com', '$2b$12$Jc60Bs3tQ.io9PDIICXcc..aQuMQr41ppcLF2WgstTmurA.pLxmry', 'true', 'true');

--email = vukosav.jevdosic@email.com password = 8037
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Vukosav', 'Jevdosić', 'vukosav.jevdosic@email.com', '$2b$12$IDTNi9raTGHa8eX.waAsV.Al3Cd8NdbKf9eHG2Y5ypVU75I5dwqHy', 'true', 'true');

--email = obrenija.rogulic@email.com password = 4310
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Obrenija', 'Rogulić', 'obrenija.rogulic@email.com', '$2b$12$.7RAo9.ueFOzqZQwIRUFLOBKl9XvgYmGNqwsa3IWiuUw51/hlCG7C', 'true', 'true');

--email = stanislav.przic@email.com password = 5166
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Stanislav', 'Pržić', 'stanislav.przic@email.com', '$2b$12$GMFippZ21SQbm/C5ivD07.ZVL3EtSxITN3K1dMSNi2GkETZWyEPne', 'true', 'true');

--email = djokica.brodalic@email.com password = 5817
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Đokica', 'Brodalić', 'djokica.brodalic@email.com', '$2b$12$2PNriMnfzIH6KoTOnTco2ehKCRbVB1bSsLGoU4s5IXQQlwknvzj0u', 'true', 'true');

--email = petar.senic@email.com password = 9379
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Petar', 'Senić', 'petar.senic@email.com', '$2b$12$Ad4Be26uvB8yQPWQ7F2csOhlG.eqmr49uCmAIWAxDMPRpY7G9cy7m', 'true', 'true');

--email = aco.vlasonjic@email.com password = 3371
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Aco', 'Vlasonjić', 'aco.vlasonjic@email.com', '$2b$12$PYXo1Qqe26yLyEbZLAGeeernXwRiM8T1AwyfG6FiKicnzxYOmLlOa', 'true', 'true');

--email = slavenko.sevarlic@email.com password = 5577
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Slavenko', 'Ševarlić', 'slavenko.sevarlic@email.com', '$2b$12$Eb.GffqdnaT6nGo1ymXCWuZZVMmb.PSYxobN7XizAJrkHPTZPaFte', 'true', 'true');

--email = stana.jerkic@email.com password = 3885
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Stana', 'Jerkić', 'stana.jerkic@email.com', '$2b$12$yVVWVjFO3Y.8EMm2AIpMDuCykO1LAgzwTlHFtes2HV6R74qaC.EJi', 'true', 'true');

--email = luka.radotic@email.com password = 1009
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Luka', 'Radotić', 'luka.radotic@email.com', '$2b$12$zDQyXikzAHhqyfPw76vwHu1IoKgXLYxcCpjDI/XBFAt9q6J5Xusqq', 'true', 'true');

--email = vekoslav.puskic@email.com password = 4548
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Vekoslav', 'Puškić', 'vekoslav.puskic@email.com', '$2b$12$GcwV7Mur5o/bSHtrTILOOOrtU0RlhPZKYvooVe9JAz479TVODzJk2', 'true', 'true');

--email = visnja.gojgic@email.com password = 8220
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Višnja', 'Gojgić', 'visnja.gojgic@email.com', '$2b$12$pgOnXAsPWI/TsiUHT0dsvOTNMBhLkwzwcFGCn63JWj4aAJHbPKG8m', 'true', 'true');

--email = ljubomir.baletic@email.com password = 2986
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Ljubomir', 'Baletić', 'ljubomir.baletic@email.com', '$2b$12$lbhBPl1g.7gCfGMdEe5bPOfGBLJUXEGH6uXmU..6L7YL7YcrbQari', 'true', 'true');

--email = novko.gruzic@email.com password = 8059
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Novko', 'Gružić', 'novko.gruzic@email.com', '$2b$12$3jOKec5pkEc1O1x3kI041O./O.aFegBbHnjmVIU9Y2W5n2sCXfBwu', 'true', 'true');

--email = radivojka.radojicic@email.com password = 5271
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Radivojka', 'Radojičić', 'radivojka.radojicic@email.com', '$2b$12$elQgCiC/DMBRxeHFSETYe.WGQKcmi8Tdp.GOxoq4MaiZcxpwKuqte', 'true', 'true');

--email = stamenko.stancic@email.com password = 2577
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Stamenko', 'Stančić', 'stamenko.stancic@email.com', '$2b$12$sPFOgriDaHbyH1ITQ2waE.1MMTVMrfzFngFIJndGc4hSsZz1iUYau', 'true', 'true');

--email = ljeposava.plavsic@email.com password = 1586
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Ljeposava', 'Plavšić', 'ljeposava.plavsic@email.com', '$2b$12$uXo64JgdYaJdUSZD1YAJ8OAcqn25uVT7J4O3vBQmyFnUUUrNHD5OS', 'true', 'true');

--email = hristina.cvisic@email.com password = 3732
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Hristina', 'Cvišić', 'hristina.cvisic@email.com', '$2b$12$AuBRcWF6fQLoF/bUsCG1TeiQVbivT/vu7hvc2z6.LEMO5YjSGv/WK', 'true', 'true');

--email = hristivoje.vujanic@email.com password = 1960
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Hristivoje', 'Vujanić', 'hristivoje.vujanic@email.com', '$2b$12$UpNoVnvIg9Lv4DDY7NWM9ulutot85UIh5c4qrZdI0ydM3a4KFRjr6', 'true', 'true');

--email = ljubomirka.dinic@email.com password = 3947
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Ljubomirka', 'Dinić', 'ljubomirka.dinic@email.com', '$2b$12$WaAM26hY/Rmipey0MI5dj.xBSPOuJwnYPuj2imlVTVPw1kGF9IUJ2', 'true', 'true');

--email = mirosava.aljetic@email.com password = 2596
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Mirosava', 'Aljetić', 'mirosava.aljetic@email.com', '$2b$12$E2OPvz5QGgdNzLDTzyDwGOZFPZ9lsn9mw8f/qg9h20CogtvElJdJC', 'true', 'true');

--email = ljubomirka.sljivic@email.com password = 4582
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Ljubomirka', 'Šljivić', 'ljubomirka.sljivic@email.com', '$2b$12$yrljSfMgCF/r0BmyTBFp1uBWGgGmJlYaEJepG4uDIYhDOGWb/VqG2', 'true', 'true');

--email = ratka.kompalic@email.com password = 9942
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Ratka', 'Kompalić', 'ratka.kompalic@email.com', '$2b$12$YZ.zVAazMcHzKgJ8Lzo6DOCLix1L7mYhhMvJomWIdNhZcZzfw7nTO', 'true', 'true');

--email = melentije.selinkic@email.com password = 2427
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Melentije', 'Selinkić', 'melentije.selinkic@email.com', '$2b$12$EMQCJ8CQbU8F/PaeIawh0e2S6ecHdU7XEwsEKxf3BqrTeOK.CNIgq', 'true', 'true');

--email = kristina.vasiljkic@email.com password = 2628
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Kristina', 'Vasiljkić', 'kristina.vasiljkic@email.com', '$2b$12$TyYtHOT3JvXmwiKFVkVSiO/LUfu45fm3MPp4MaK0q4NxXFOuM3nnu', 'true', 'true');

--email = trifun.pelkic@email.com password = 6475
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Trifun', 'Pelkić', 'trifun.pelkic@email.com', '$2b$12$dlP76v7gY9r5M7kFZ5.2B.n78AcJ2hUibTjBpIWeG5kEUhWfGubIi', 'true', 'true');

--email = atanasije.maretic@email.com password = 5407
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Atanasije', 'Maretić', 'atanasije.maretic@email.com', '$2b$12$G92sw5V.96ysBrD7nts0h.phRavo.zOMd/tmRHOiAbbBvW2iPytva', 'true', 'true');

--email = jovana.budimkic@email.com password = 9715
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Jovana', 'Budimkić', 'jovana.budimkic@email.com', '$2b$12$IattK4mm9HyNLQgLxiQ9n.XEuZpZ3xs9re5lHrF0cQsWsxQTMMgV2', 'true', 'true');

--email = petruska.pletikosic@email.com password = 3303
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Petruška', 'Pletikosić', 'petruska.pletikosic@email.com', '$2b$12$ijAp7Lk8mjaY6nDbOOelp.EnNvyLAq7p3PcNQ.q2ZRdByQNx2J7vW', 'true', 'true');

--email = vojislav.gvoic@email.com password = 7179
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Vojislav', 'Gvoić', 'vojislav.gvoic@email.com', '$2b$12$/OxptzW/hHoViGTIik6j6OkaD9wd3RZuiNPcKaujkGljHcPoLFFw6', 'true', 'true');

--email = dubravka.bujandric@email.com password = 2590
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Dubravka', 'Bujandrić', 'dubravka.bujandric@email.com', '$2b$12$GxI2aC7BrjehOa5mW6f1VOXB8J5/Gy2LcWVgo33XTYn3/SQt4sfFm', 'true', 'true');

--email = vasilije.bandic@email.com password = 3786
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Vasilije', 'Bandić', 'vasilije.bandic@email.com', '$2b$12$YyYsCSC2Vjx7bUoRdbb7heWWdhoxL4VUbEnZ0s818MiMwwMM.daAK', 'true', 'true');

--email = mirko.klajic@email.com password = 6933
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Mirko', 'Klajić', 'mirko.klajic@email.com', '$2b$12$hfQslUMBmYOxIQy.Ug3v4eMmss9Ka0rq6bQhQQeR4RuDwzrZnXxK6', 'true', 'true');

--email = srboljub.nevenic@email.com password = 4083
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Srboljub', 'Nevenić', 'srboljub.nevenic@email.com', '$2b$12$1.9385H6HfBLs4PWIAaq4.FTX5TrjN5lkl76Drha9h7QgKXDj4WFe', 'true', 'true');

--email = zivomir.buncic@email.com password = 6113
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Živomir', 'Bunčić', 'zivomir.buncic@email.com', '$2b$12$cFtys6EzFbHI3X.MkzlU4uVTerCgGGEe4wjLJUrQnKeAHNFLm9eaq', 'true', 'true');

--email = filip.brbaklic@email.com password = 4866
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Filip', 'Brbaklić', 'filip.brbaklic@email.com', '$2b$12$IzEMpJ/hLq97ewJf1jE7E.T4sw1Z2fmtpDkjz6fX7FzhP57c48aUC', 'true', 'true');

--email = josif.bukovcic@email.com password = 7299
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Josif', 'Bukovčić', 'josif.bukovcic@email.com', '$2b$12$8FGpspZl5EwiV3RX8GhhN.bCCE9d7tiYkSw7eFLyu.eiJ/8Ej2v.a', 'true', 'true');

--email = magdalena.pavlicic@email.com password = 1966
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Magdalena', 'Pavličić', 'magdalena.pavlicic@email.com', '$2b$12$yTJCxzfNpijC57.Er/DJ/eNKNg/iVeJ0wvFYLIlGMNQ2YXaL.oTxe', 'true', 'true');

--email = zivota.vujisic@email.com password = 5745
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Života', 'Vujisić', 'zivota.vujisic@email.com', '$2b$12$rhPZ69bYyDPgEyX.2l/EkOmo8GvWk7fpOqsr0Cs1Qw4lJNPPk4rw6', 'true', 'true');

--email = stanika.boncic@email.com password = 1456
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Stanika', 'Bončić', 'stanika.boncic@email.com', '$2b$12$ZfTt4yV4/sN1/2jz4yCq9uq5Np5ShKJGOlRmqJMc4.zIHrjf1TJJe', 'true', 'true');

--email = milenija.vlaskalic@email.com password = 4063
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Milenija', 'Vlaškalić', 'milenija.vlaskalic@email.com', '$2b$12$mMsKV09v3m3H1L3rE2flTe2u6kW9iSr.FFoD/nZKX.3oLXGzvL5h6', 'true', 'true');

--email = cirilo.pisaric@email.com password = 6332
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Ćirilo', 'Pisarić', 'cirilo.pisaric@email.com', '$2b$12$BKBipm654XkVwUKVx.dC..So3hKPifr/ra/zk8C24xSZozxMogVRm', 'true', 'true');

--email = djura.bijelonic@email.com password = 4864
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Đura', 'Bijelonić', 'djura.bijelonic@email.com', '$2b$12$alUZJzh2N3.0dEhEiQlMXuq1iFgkm/qXQSySuRz9psbsGvHABwpYe', 'true', 'true');

--email = cvijo.ivucic@email.com password = 7841
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Cvijo', 'Ivucić', 'cvijo.ivucic@email.com', '$2b$12$XA9Ts0KMhrN.NIl018T3SeuaficVJipGU7RKl0TdTf2c74LEHZX2q', 'true', 'true');

--email = djurdjevka.krasnic@email.com password = 4917
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Đurđevka', 'Krasnić', 'djurdjevka.krasnic@email.com', '$2b$12$PiVfFqaBkhTZlpcFFGRlbO4IXSZvFbTnRsiygypGpMe1l.Bd3MhvG', 'true', 'true');

--email = andjelko.leposavic@email.com password = 8516
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Anđelko', 'Leposavić', 'andjelko.leposavic@email.com', '$2b$12$0sK5QyoKFVCAY0C3JlPnxucziE8DafqLrAum1fSC6s9F08cKsAsNa', 'true', 'true');

--email = cvetana.jokisic@email.com password = 9249
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Cvetana', 'Jokišić', 'cvetana.jokisic@email.com', '$2b$12$7kCCcZvKKC/t.Es1sC9wO.KrnWMNmlK.lDNyYbTFOgNHIq/.si7uu', 'true', 'true');

--email = fotije.bojanic@email.com password = 7002
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Fotije', 'Bojanić', 'fotije.bojanic@email.com', '$2b$12$zbvqjLDvSo6qJ9qYGOz0u.JI12T/UYbsqo4U1UB1BpomTZCy/ed8e', 'true', 'true');

--email = stojiljko.trokic@email.com password = 5214
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Stojiljko', 'Trokić', 'stojiljko.trokic@email.com', '$2b$12$v8HWMLL6Xykm/1FGak1I0eGKMS.wB7p9nI0fdPK/iCJzxyl6o52RW', 'true', 'true');

--email = olga.veljic@email.com password = 9823
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Olga', 'Veljić', 'olga.veljic@email.com', '$2b$12$xDFnNTegJzfyE/269xFor.wyUW3Trxr8Me6RWtXFoxrJ3COc67fee', 'true', 'true');

--email = milena.nekic@email.com password = 8779
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Milena', 'Nekić', 'milena.nekic@email.com', '$2b$12$5bJ52ki4aFRltTen/sTcc.FlpQ6aHtaz3/Sjm/BTLhIbSwUZ4Uf8O', 'true', 'true');

--email = zivko.slovic@email.com password = 1651
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Živko', 'Slović', 'zivko.slovic@email.com', '$2b$12$fhHwW4OXvsZeSaqxMIBkqu/uV0nozUTCwTR3vVoKq8ThKpr//Dz5S', 'true', 'true');

--email = sin|elija.radancic@email.com password = 3306
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Sin|elija', 'Radančić', 'sin|elija.radancic@email.com', '$2b$12$KX79Db9nCqfEDfv5ArHSEurIyVrSvYXjue/lfEgsJ9XtBJxd6l3ea', 'true', 'true');

--email = slavoljub.pasic@email.com password = 5803
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Slavoljub', 'Pašić', 'slavoljub.pasic@email.com', '$2b$12$evv0v0/rc2MeuFhTGU5Hp.UZGe6/i5cbiCJocnDPQvJS8cKUVJdIK', 'true', 'true');

--email = ratko.pribisic@email.com password = 6421
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Ratko', 'Pribišić', 'ratko.pribisic@email.com', '$2b$12$Dy/.A3gndR45yK21jkLuruNIIBfoSWihOrgXcAuNNXFsI.q4gi9Y6', 'true', 'true');

--email = ninko.zelalic@email.com password = 7702
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Ninko', 'Želalić', 'ninko.zelalic@email.com', '$2b$12$tmCS/wFaeCAfLgTQPImRCePNZID.BNGhNkMtWhyq.oFV.i8.IHqoO', 'true', 'true');

--email = bane.puletic@email.com password = 6554
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Bane', 'Puletić', 'bane.puletic@email.com', '$2b$12$ZBjo9NTvlGgMDWkzR6qjzeeqgkjzctdbxB8zmrflCyKSRbPgxlJq.', 'true', 'true');

--email = margareta.bikic@email.com password = 8206
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Margareta', 'Bikić', 'margareta.bikic@email.com', '$2b$12$saL9ifpboI1qyNzSFL.jLe3mr5aYrvtVqIAthMSREaywzYcdDEBsG', 'true', 'true');

--email = gojko.jesic@email.com password = 6686
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Gojko', 'Ješić', 'gojko.jesic@email.com', '$2b$12$dRArIkBt7U/PrX4EXNYTiOzFZuBrMAMsbURxkpICYC0SSlor0nX2i', 'true', 'true');

--email = vladeta.puresic@email.com password = 7091
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Vladeta', 'Purešić', 'vladeta.puresic@email.com', '$2b$12$mqIfaxwz/5.9CuJse3KZWeQuo1TPnVYuP3PNAg/FEN1/npn0n8rzi', 'true', 'true');

--email = ilija.dugalic@email.com password = 3096
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Ilija', 'Dugalić', 'ilija.dugalic@email.com', '$2b$12$cJWdGK7o75KRWm0R7jENEetMz2A7iCu2AuqSlJGG1yeNSZY.lejee', 'true', 'true');

--email = ivko.perkic@email.com password = 8443
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Ivko', 'Perkić', 'ivko.perkic@email.com', '$2b$12$7QLDFNtri6.6dMN1mx/h7eInRJJZVMCUuHu4PiUFdrhdJLm6m98/G', 'true', 'true');

--email = aleksa.moretic@email.com password = 5606
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Aleksa', 'Moretić', 'aleksa.moretic@email.com', '$2b$12$foJnrRDEMxsqRydzZgWbPuTvf8/Xv8e0rFjowAlDsI/6GLQ.gXX9O', 'true', 'true');

--email = miroslav.jokic@email.com password = 3760
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Miroslav', 'Jokić', 'miroslav.jokic@email.com', '$2b$12$CfDdmDCJkYvF2bqKazeg2uHcA93AFs/CzWUcuuByYSPUgps4vZEyC', 'true', 'true');

--email = trifun.kizic@email.com password = 8254
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Trifun', 'Kizić', 'trifun.kizic@email.com', '$2b$12$iC.zmKNDV2AdW3vlJ31H/uaDOXCIPZXR.vYKHO.Mo3mYQqGxa7hfi', 'true', 'true');

--email = djoka.kendrisic@email.com password = 6072
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Đoka', 'Kendrišić', 'djoka.kendrisic@email.com', '$2b$12$doAuTr21KhYFI/8zLNmMOOUAL6Yv6jW2lGyRX/0Lx2LvI2a/2LjXC', 'true', 'true');

--email = branka.plocic@email.com password = 2932
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Branka', 'Pločić', 'branka.plocic@email.com', '$2b$12$0CH0LYxZjZo6IBHKafXA4u4bJ1svHeKucKN/DHN.gTYaUdt7A4aR6', 'true', 'true');

--email = borka.janicic@email.com password = 6108
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Borka', 'Janičić', 'borka.janicic@email.com', '$2b$12$2Yxvuy2FRBFTNZMheGZyQOPYynlJLwGCv1VBBPZywJXe4Df.9S1my', 'true', 'true');

--email = svetislav.dornic@email.com password = 8229
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Svetislav', 'Dornić', 'svetislav.dornic@email.com', '$2b$12$VFlUvE/E27AWomgmKPuBzu104uUw2/mbzqMfA9x/Afn6r5WseMACu', 'true', 'true');

--email = mirko.dajic@email.com password = 2650
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Mirko', 'Dajić', 'mirko.dajic@email.com', '$2b$12$N.v.1muqG577PheywZnTbOEtIDp7xRuOiqjp5I3n6fYZZfhQWdb1W', 'true', 'true');

--email = njegovan.vizulic@email.com password = 7196
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Njegovan', 'Vizulić', 'njegovan.vizulic@email.com', '$2b$12$q9XUSyhpsCb.EhNKSSvgy.dKZyP6AqxD6ZhlUj8nqSc889IiyenLK', 'true', 'true');

--email = ljilja.tontic@email.com password = 8022
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Ljilja', 'Tontić', 'ljilja.tontic@email.com', '$2b$12$esHnfQTPPRctLA73j1i0zupROu.D9.wgYxpTJVTiGFccX5qZWivVC', 'true', 'true');

--email = zvonka.doklestic@email.com password = 5135
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Zvonka', 'Doklestić', 'zvonka.doklestic@email.com', '$2b$12$nzj.3bt78Svq9cLJUBSSP.Fex6YfFYcHtxkscx22bI5ffGop4wRhS', 'true', 'true');

--email = filipa.roksic@email.com password = 5118
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Filipa', 'Roksić', 'filipa.roksic@email.com', '$2b$12$te/.YQ4wNtpPLsUU6RcedeGy5FbSL08XvD98uasq.z9jzIWJbBwUS', 'true', 'true');

--email = nesko.kujundzic@email.com password = 9638
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Neško', 'Kujundžić', 'nesko.kujundzic@email.com', '$2b$12$6FMHbFcAav.tEikEjaZ65uAYyri6kVJxk5kRm4pRw1ngtQtbMWWaO', 'true', 'true');

--email = ranisav.glamocic@email.com password = 6364
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Ranisav', 'Glamočić', 'ranisav.glamocic@email.com', '$2b$12$s4yeDJMDXqwu9rrSaJrxQuLhkMHk7EXmJf4Q16ByfD83wxe1W.Dqi', 'true', 'true');

--email = jasminka.bakajlic@email.com password = 7764
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Jasminka', 'Bakajlić', 'jasminka.bakajlic@email.com', '$2b$12$upi6JfZ01NoBjT4AadkNB.rTJAuZYzyfssjGNsr/0v6po7crGywIS', 'true', 'true');

--email = ljuba.doknic@email.com password = 4816
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Ljuba', 'Doknić', 'ljuba.doknic@email.com', '$2b$12$zw/jvRWFmbLcZ.XAvLUJfO33oKbYU2zZVSdsYXdrDlIZRLECx9vdy', 'true', 'true');

--email = ranka.mrksic@email.com password = 1597
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Ranka', 'Mrkšić', 'ranka.mrksic@email.com', '$2b$12$OEIrHccEMqIysSL3pUM4Fub5BXmhM8emkAn/zTmgnit7IJJzLgSRe', 'true', 'true');

--email = vukoje.kozic@email.com password = 3106
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Vukoje', 'Kozić', 'vukoje.kozic@email.com', '$2b$12$VkSxQrb.hiUJC7ol8I4Wxea8JK/pMQjRG4HYNOszUgg51VtVJlCFG', 'true', 'true');

--email = verica.spasenic@email.com password = 6884
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Verica', 'Spasenić', 'verica.spasenic@email.com', '$2b$12$wnALQJr9d3Zc5AfSqjgj2.hvgcwvxeXRCuFuiYqjGhVrnsNvzEQm2', 'true', 'true');

--email = radoje.zarkic@email.com password = 2290
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Radoje', 'Žarkić', 'radoje.zarkic@email.com', '$2b$12$anepxN0M0PoGQoHcWxrPweAeE4dBWDXwG3zAx6FUf5YSjJrYjzAHO', 'true', 'true');

--email = vukan.ciglic@email.com password = 9841
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Vukan', 'Ciglić', 'vukan.ciglic@email.com', '$2b$12$AIlE12NlJfAEgWBayVNf4eZ49y77rZkLKlYJs6TvQlO23vuWZvzQG', 'true', 'true');

--email = feodor.slovic@email.com password = 5059
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Feodor', 'Slović', 'feodor.slovic@email.com', '$2b$12$vGfr.g9zOoWj7lAo/NNs1eXUUkr3tOZ.4IibrAQ418iFOtxx5ED/e', 'true', 'true');

--email = radule.turajlic@email.com password = 1044
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Radule', 'Turajlić', 'radule.turajlic@email.com', '$2b$12$7fkY44v0OzUam1KH6u7ePOcdCM16sA3zu5GOkSdrgB2EbIs5mQ1si', 'true', 'true');

--email = gruja.biberdzic@email.com password = 4393
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Gruja', 'Biberdžić', 'gruja.biberdzic@email.com', '$2b$12$Q4YxbeXig6vv5/2qm8KB3.r5FkCUu4RLXZMNXe0ypOfc7c6akH2u6', 'true', 'true');

--email = aleksandar.kekic@email.com password = 6045
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Aleksandar', 'Kekić', 'aleksandar.kekic@email.com', '$2b$12$nDcgAaEyHovgOPMGEOvvxeq6tDoB8zogS2/dCMGyVsJ8WPhCcSGWi', 'true', 'true');

--email = mladen.romanic@email.com password = 3812
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Mladen', 'Romanić', 'mladen.romanic@email.com', '$2b$12$YKwweLNOXD438m3faSbrlewAOzjla5Wmay8gUXfZeL0AaEnOKBpSW', 'true', 'true');

--email = gordana.stegnjaic@email.com password = 4281
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Gordana', 'Stegnjaić', 'gordana.stegnjaic@email.com', '$2b$12$4g7K/XtqHx9safs9aOP71.ZMJNpH1mGKGMXR3cRIz9jjeXXtblEKe', 'true', 'true');

--email = lola.dimic@email.com password = 7585
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Lola', 'Dimić', 'lola.dimic@email.com', '$2b$12$gsmiRIzHup26vSmB/1tY9eq9EUZ8xqhERuLPoW/4YNrpOVCi5gGxq', 'true', 'true');

--email = rastko.poznic@email.com password = 3697
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Rastko', 'Poznić', 'rastko.poznic@email.com', '$2b$12$sqyYPDtvfAQhALy2ihmqvuyVIE02lm9PhrpXFiAAG28CDlgGXdg9y', 'true', 'true');

--email = toplica.djurnic@email.com password = 8413
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Toplica', 'Đurnić', 'toplica.djurnic@email.com', '$2b$12$pOD5vfEBiDUxTnVqgiDCF.9z2QxGb6vRBX.S9jXryhGpk8B6HU0Dq', 'true', 'true');

--email = zlatoje.kvekic@email.com password = 6848
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Zlatoje', 'Kvekić', 'zlatoje.kvekic@email.com', '$2b$12$hI4KqEaqKSsy6d4bjEU9ieOF9Gsr2dUHDynaZQ7YDkBk9vNQl.HrO', 'true', 'true');

--email = sretoje.skrkic@email.com password = 9643
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Sretoje', 'Škrkić', 'sretoje.skrkic@email.com', '$2b$12$C5lqwh1cImtcE5naR8ARBO6SPscZHiVchp48Qtqvziad6VTrJpouy', 'true', 'true');

--email = ljubisa.boricic@email.com password = 6687
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Ljubiša', 'Boricić', 'ljubisa.boricic@email.com', '$2b$12$xMsMf1VRGK1C7gJGknUmuu8QkUGNr28PEeulZvSGvw.YP1OodItFG', 'true', 'true');

--email = djuradj.sporic@email.com password = 9026
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Đurađ', 'Sporić', 'djuradj.sporic@email.com', '$2b$12$MsNP1V.TEaPCifROKyYUEegOGdemtFIl3OPdOJsAg1EKsNrnqIpKe', 'true', 'true');

--email = djurdja.zalicic@email.com password = 6317
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Đurđa', 'Žaličić', 'djurdja.zalicic@email.com', '$2b$12$/mBGEgzMNDeDHjN9bzPXV.2SVYL6dOzzF6lMkJ9F5i3RsMabuhure', 'true', 'true');

--email = ilija.amidzic@email.com password = 7087
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Ilija', 'Amidžić', 'ilija.amidzic@email.com', '$2b$12$PB14f.w.h7yPZwlpWQVtX.H1UluUadcwQtoqT7MWIYdBC22wcscbq', 'true', 'true');

--email = dobrasin.desic@email.com password = 3972
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Dobrašin', 'Dešić', 'dobrasin.desic@email.com', '$2b$12$0ZJkvSyqaOJnfzytTuAUfOoG08m6Opa/A8mXMm3JTdz5a8XhpDLoK', 'true', 'true');

--email = maksim.sobajic@email.com password = 4015
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Maksim', 'Šobajić', 'maksim.sobajic@email.com', '$2b$12$iMBVsKGjrVklzknpwUjq7eFQF515gSgpC6dNpi3edOePZCzI5iGIi', 'true', 'true');

--email = milutin.surudzic@email.com password = 3475
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Milutin', 'Surudžić', 'milutin.surudzic@email.com', '$2b$12$M0r4VhuQOiFTwIKqTn2OgeEhhSdrHm278wSyrmBuZJq/koaOT0uqi', 'true', 'true');

--email = saveta.minic@email.com password = 5017
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Saveta', 'Minić', 'saveta.minic@email.com', '$2b$12$IWok0vI1CScsuqHEIcuLf.xVdFHotSLdq4xOTnpPwz/N2Q7/KTJr.', 'true', 'true');

--email = todor.likic@email.com password = 6436
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Todor', 'Likić', 'todor.likic@email.com', '$2b$12$Ic6mbjhsXG/FWUu8A6cg9etwXk0DOY/wJ0h4CyIVkinNCtKRqasbG', 'true', 'true');

--email = olja.nenadic@email.com password = 8960
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Olja', 'Nenadić', 'olja.nenadic@email.com', '$2b$12$27W2prwVRg9GLDgOrcNHVercqTBIpZd7PFQozvDDZQNWS2FE7F/n2', 'true', 'true');

--email = borko.studic@email.com password = 2752
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Borko', 'Studić', 'borko.studic@email.com', '$2b$12$hOrJYtmTMIjNukUHhb1PvugUm/qyyZqNZA7R.wIlbszq59UlZdDiy', 'true', 'true');

--email = tatomir.kitonjic@email.com password = 4486
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Tatomir', 'Kitonjić', 'tatomir.kitonjic@email.com', '$2b$12$IYxgQ3/vVFC9oxqLTyNZCeHVsyI3A2kbNZlzF.j2gjOKCqVqYdyv.', 'true', 'true');

--email = kleopatra.radotic@email.com password = 2797
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Kleopatra', 'Radotić', 'kleopatra.radotic@email.com', '$2b$12$5eAaWcAIyM2q6FvTveAedOyLhDyKEiUERte6rJeH3EtmAHK2RmzbK', 'true', 'true');

--email = prvoslava.gasic@email.com password = 3657
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Prvoslava', 'Gašić', 'prvoslava.gasic@email.com', '$2b$12$GE7yZsVspLZR.zSsUurKHe2k8KbvdxILDwKSoo46as3b9i5fFdsIq', 'true', 'true');

--email = ranka.maudic@email.com password = 9710
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Ranka', 'Maudić', 'ranka.maudic@email.com', '$2b$12$1zpyiknSCke31iK/OIdeIuopsUDmTdeAlFm2UeNjrsikiFP6EH1ku', 'true', 'true');

--email = dragana.djuketic@email.com password = 5752
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Dragana', 'Đuketić', 'dragana.djuketic@email.com', '$2b$12$xvMnooUOq8HFMJL0JHzrHek8JI5lwzfpKWOWAL5TPnP0KUsHsRMLC', 'true', 'true');

--email = melenija.cilerdzic@email.com password = 6446
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Melenija', 'Ćilerdžić', 'melenija.cilerdzic@email.com', '$2b$12$CzSqJPaPF3XLdYVCqCK2Sek87JUBB75Ni4c6zW7twClhVfulCao.K', 'true', 'true');

--email = dragan.grcinic@email.com password = 9085
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Dragan', 'Grcinić', 'dragan.grcinic@email.com', '$2b$12$.jJ1DQSzChQxlpo4LnbmFel.OrN6rawpAX44O86kl.IVcATonJAam', 'true', 'true');

--email = blaza.ivetic@email.com password = 2478
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Blaža', 'Ivetić', 'blaza.ivetic@email.com', '$2b$12$T660o8N4cUYxkAmC8HcpHOGzA5D5sbzniI5NhJUUlcPwV81BbDC9m', 'true', 'true');

--email = dejan.cukanic@email.com password = 1014
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Dejan', 'Cukanić', 'dejan.cukanic@email.com', '$2b$12$o0.Nj7xuSImjsX3jerlGdOdCxUoEdushKGMRpRP5dpBGSgmx0ighq', 'true', 'true');

--email = tasko.dlacic@email.com password = 7320
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Taško', 'Dlačić', 'tasko.dlacic@email.com', '$2b$12$hwLdgl/jtWuacZ1gfQ4LPemk5cokYDHVrDLKMA50ac.v7mDZvUvhC', 'true', 'true');

--email = radoje.skrkic@email.com password = 6069
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Radoje', 'Škrkić', 'radoje.skrkic@email.com', '$2b$12$LuY1lv1IBgOOM285GQu9lOH0Xb419WrVuRBoNLWkEOerc1T/CM/me', 'true', 'true');

--email = vuksan.zjalic@email.com password = 5678
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Vuksan', 'Zjalić', 'vuksan.zjalic@email.com', '$2b$12$XsOc1sYs2A2K3m0ozMagTe9d1paivt1qVbMRfZk.7n6G004mCLMcC', 'true', 'true');

--email = sajka.strkic@email.com password = 4226
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Sajka', 'Štrkić', 'sajka.strkic@email.com', '$2b$12$Wj3Zyd0Jy4oItebBdz163uocx7N3IhTyhaKqurPffMIGi0hG1wkIS', 'true', 'true');

--email = hranislav.abdulic@email.com password = 9596
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Hranislav', 'Abdulić', 'hranislav.abdulic@email.com', '$2b$12$3OzSmx4FXjTsV2EAAjpZduX9veWr9lCJ3.q7Uy1JctgFhsdiavVEW', 'true', 'true');

--email = djura.bastaic@email.com password = 4229
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Đura', 'Bastaić', 'djura.bastaic@email.com', '$2b$12$TWmarYYSy2HWHHoF1.aWxODMInfR57S2rh52j7KQmikrgwx6L3sly', 'true', 'true');

--email = jeremije.stetic@email.com password = 5617
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Jeremije', 'Štetić', 'jeremije.stetic@email.com', '$2b$12$1ORNt98VyfFqlswD/So2JONeYH4YyYO34287u7l/7E4Y1Zl0fjM7a', 'true', 'true');

--email = zivkica.mazalic@email.com password = 7793
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Živkica', 'Mazalić', 'zivkica.mazalic@email.com', '$2b$12$QI8570dDrZ2XUNcPJnbxeuEiYpWpUQbUICeevTLyRTDVmK90bscU.', 'true', 'true');

--email = obren.zivankic@email.com password = 7741
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Obren', 'Živankić', 'obren.zivankic@email.com', '$2b$12$sHvil4B.U9dsmKDJsd5SNOdsuMzZGl/YNZKMUl/ti3KeL4J4uOBKm', 'true', 'true');

--email = teofan.veric@email.com password = 8082
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Teofan', 'Verić', 'teofan.veric@email.com', '$2b$12$1iJGCh.36FAg.wWHQVHVZu.1iw48.CM/1iO7l/d057RolUwR/iizy', 'true', 'true');

--email = ranko.grbatinic@email.com password = 1238
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Ranko', 'Grbatinić', 'ranko.grbatinic@email.com', '$2b$12$9pDrROdSBAuRcd6xal.u.uegIel3K3EOFHPjYq3NaXFRV/Kbfi9li', 'true', 'true');

--email = cveta.malukic@email.com password = 7635
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Cveta', 'Malukić', 'cveta.malukic@email.com', '$2b$12$JSJiwdnGhEwy4elrZQOB3.Gk0kZDkXhWAP16bchGGX3eqxWRohhyy', 'true', 'true');

--email = ostoja.spurnic@email.com password = 3377
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Ostoja', 'Spurnić', 'ostoja.spurnic@email.com', '$2b$12$ZWVhqZSJvw93IZgVof2n0O8TjRn3LSbVTQY5.EKj7vGsWUzrRMfyi', 'true', 'true');

--email = djuradj.jungic@email.com password = 4562
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Đurađ', 'Jungić', 'djuradj.jungic@email.com', '$2b$12$BUVk41FL5YUubJUZYoVLS.x//AedJwUOXH4ldPgqfJ2dHZwpc6a.i', 'true', 'true');

--email = vukosava.misirlic@email.com password = 4689
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Vukosava', 'Misirlić', 'vukosava.misirlic@email.com', '$2b$12$Vw5qGZbHtJeFAP745zXTF.ZIQ4YREh2/1yUV5bKRajI8.Q1D.xvSK', 'true', 'true');

--email = ruza.askrabic@email.com password = 5958
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Ruža', 'Aškrabić', 'ruza.askrabic@email.com', '$2b$12$TZ17srG4xVCB.Olgbz2eOeeZMIqLz6p2Jpbh1tqMtOP9r/YxOidRu', 'true', 'true');

--email = ugljesa.kalentic@email.com password = 2292
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Uglješa', 'Kalentić', 'ugljesa.kalentic@email.com', '$2b$12$pPOdUIrVCBIuMF5QbP9a7eIY.iq649/8afiRWLZDh2yDD65nxOoY2', 'true', 'true');

--email = cirka.zatezic@email.com password = 5176
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Ćirka', 'Zatežić', 'cirka.zatezic@email.com', '$2b$12$V9AqweJ0b.2CRxyQmBa/su//flaYnuvtQXxAUAH4oNSiGSU6Gx0xe', 'true', 'true');

--email = vojislava.trencic@email.com password = 2902
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Vojislava', 'Trenčić', 'vojislava.trencic@email.com', '$2b$12$7r8gblZ2J2rVrm8x2HYaH.rWvAShZf527VyfhYEClzluVU9G/DrN6', 'true', 'true');

--email = milijana.nuzdic@email.com password = 4113
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Milijana', 'Nuždić', 'milijana.nuzdic@email.com', '$2b$12$7ccxyEl.MSZ2XVd97NWPm.u7RueuJ0MJBjeqYd/F/9Fv69jmmxcZ.', 'true', 'true');

--email = petronije.petricic@email.com password = 6764
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Petronije', 'Petričić', 'petronije.petricic@email.com', '$2b$12$Kc.J5srmr2xPn8TIWAgrN.tUcjl0SNDnIEVq7L9NYO/OwynA1yRDW', 'true', 'true');

--email = jasminka.jancic@email.com password = 6753
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Jasminka', 'Jančić', 'jasminka.jancic@email.com', '$2b$12$jVMoWD/9notKmmKg3u4gs.fJWv/JX85a86V/26WsgkbpOTMSFfviO', 'true', 'true');

--email = drgorad.kovincic@email.com password = 9651
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Drgorad', 'Kovinčić', 'drgorad.kovincic@email.com', '$2b$12$mgO.2RLaxR4GSSugDmVNEOnJ3N7A2xnuM6lu/aM5A9iZftlNF.hQS', 'true', 'true');

--email = pavle.budimic@email.com password = 5136
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Pavle', 'Budimić', 'pavle.budimic@email.com', '$2b$12$PZQQwQ4qmYtlMsByvzw63um5WbTAyy7rCf7JEl/xCPToTRBa5xXx.', 'true', 'true');

--email = strajin.kisic@email.com password = 9821
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Strajin', 'Kisić', 'strajin.kisic@email.com', '$2b$12$TJv1TR0TlUgi7ZkBBBvkC.q/mDReM0jXOGWa54LHWutCXMp.KAI5a', 'true', 'true');

--email = ignjatije.dumeljic@email.com password = 6901
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Ignjatije', 'Dumeljić', 'ignjatije.dumeljic@email.com', '$2b$12$iV9H405Eccs6fb.oKYcTGuAJuZcyqfaot8BhY6is8AzcUW1HDHDIq', 'true', 'true');

--email = glorija.bosiorcic@email.com password = 2269
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Glorija', 'Bosiorčić', 'glorija.bosiorcic@email.com', '$2b$12$Yxg8nKlEwzAFgfn7ZY2/c.f.ef.nX5xHcWO.f6J60RVzWsZsBld5W', 'true', 'true');

--email = kuzman.tosic@email.com password = 3785
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Kuzman', 'Tošić', 'kuzman.tosic@email.com', '$2b$12$1aMqApEGKTgUQQ7YoTm2H.aFqES/fZpYU2J6nGM8QDdJ.FVSFbyKK', 'true', 'true');

--email = ljubisa.cendic@email.com password = 5956
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Ljubiša', 'Ćendić', 'ljubisa.cendic@email.com', '$2b$12$cAKux./JDqRx5N9h9/ldQeuTQrtA7riQsxlT52nnwqwetPfwiH..6', 'true', 'true');

--email = koviljka.bojicic@email.com password = 2759
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Koviljka', 'Bojičić', 'koviljka.bojicic@email.com', '$2b$12$I.QUZBSsgkplGjvmi0HuNucBnKwDuwdhTSZMnt43BAMd7FAKtxA6m', 'true', 'true');

--email = bojana.vavic@email.com password = 2751
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Bojana', 'Vavić', 'bojana.vavic@email.com', '$2b$12$s3gKuFtqhixckeXTw/cGn.1DBCqRE7hFe96IK5aGPxWlysgVUZHJu', 'true', 'true');

--email = viseslav.dostanic@email.com password = 1320
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Višeslav', 'Dostanić', 'viseslav.dostanic@email.com', '$2b$12$a1TNlZHmJzJXgxONdYxXI.puP7sx19NpuWifpogpO0/XVxgMBGf16', 'true', 'true');

--email = podgorka.cmolic@email.com password = 9701
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Podgorka', 'Cmolić', 'podgorka.cmolic@email.com', '$2b$12$GF0SMDwVWNQJ9sr7cGcnOOCW0Pf0IPte3DPHceObckFzvOn6xdFEy', 'true', 'true');

--email = radomirka.ljubibratic@email.com password = 8664
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Radomirka', 'Ljubibratić', 'radomirka.ljubibratic@email.com', '$2b$12$PPgx8ggYHAtPbBxsHUK7VuBJdfy97CMzf7bZ8LHUtszdB0E.A9YVC', 'true', 'true');

--email = persa.dzinic@email.com password = 4722
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Persa', 'Džinić', 'persa.dzinic@email.com', '$2b$12$U23nWrg2Obo4eCmE5QhSb.HSgfE7nSWpNsyLyBa3YNO7yByQUnYMe', 'true', 'true');

--email = slavoljub.stanusic@email.com password = 4401
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Slavoljub', 'Stanušić', 'slavoljub.stanusic@email.com', '$2b$12$vMDTELrgyHIxmG8Qs9kPc.EFk58uJTxYke67zqj3JHey8nU5lXlrW', 'true', 'true');

--email = julija.mandusic@email.com password = 2338
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Julija', 'Mandušić', 'julija.mandusic@email.com', '$2b$12$dyqyrOzMSuIchWnLSiKNMuXPIOVpoqs4tSqSJKXj85gG55ilAbHNm', 'true', 'true');

--email = viseslava.golemic@email.com password = 1583
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Višeslava', 'Golemić', 'viseslava.golemic@email.com', '$2b$12$X7oIOozqDd6yPgDznyxIx.p.1vOPt.i3qNWtrE9ODSZwDDG2v1V8e', 'true', 'true');

--email = bosiljka.pavicic@email.com password = 3774
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Bosiljka', 'Pavičić', 'bosiljka.pavicic@email.com', '$2b$12$IqtUISAvDhwLLlNtTKmy8uGdy1M4AUIfKlKepp67uGJCSTmQfSfMe', 'true', 'true');

--email = djurica.rosandic@email.com password = 3765
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Đurica', 'Rosandić', 'djurica.rosandic@email.com', '$2b$12$sBqQQQX7ck6CxVdOcwYifOG/P2.CQczZB0ROYV7ft1F9BAT.F.Br2', 'true', 'true');

--email = ivana.sunderic@email.com password = 5224
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Ivana', 'Šunderić', 'ivana.sunderic@email.com', '$2b$12$MMnQbGGmWd3HdzvT98SCA.D4bJMZkgnwiCMjlRlBHKlDcDpUmWHQ2', 'true', 'true');

--email = toma.maricic@email.com password = 3152
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Toma', 'Maričić', 'toma.maricic@email.com', '$2b$12$.j3penPubaYcINfvGTqBM.VejYC/Sz13q7xMlcZNPnN5bT.yPCTqa', 'true', 'true');

--email = stamenko.radikic@email.com password = 3785
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Stamenko', 'Radikić', 'stamenko.radikic@email.com', '$2b$12$T3v2IvVf9GTpdFBkwxzTNu.ZjZHHQ4YXcqWSh4J71SXeTO5LOl5Vi', 'true', 'true');

--email = toma.krnjic@email.com password = 7167
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Toma', 'Krnjić', 'toma.krnjic@email.com', '$2b$12$8JwPPumbK2duM0jOF4uA1uS.psAoVegNCuuzp7fgUpK1dYQfNIZtu', 'true', 'true');

--email = lepoje.bunardzic@email.com password = 5830
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Lepoje', 'Bunardžić', 'lepoje.bunardzic@email.com', '$2b$12$Jrru0FfDdTVO5rFffp8FF.Z3FfjI507lGJkHQg/G0d2h8HdAnMU2S', 'true', 'true');

--email = latinka.gobeljic@email.com password = 1983
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Latinka', 'Gobeljić', 'latinka.gobeljic@email.com', '$2b$12$3zdXFXpyPGoUA3V1GswWIuyGQs2xRHMnHE9AF24b3TVpxytBh7Mx2', 'true', 'true');

--email = caslav.pacaric@email.com password = 7011
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Časlav', 'Pačarić', 'caslav.pacaric@email.com', '$2b$12$cMNKu6px6J4AwQ6mIRNRDOe5GZ7HBaUlaktrNhqfu3EQCOieYaHLm', 'true', 'true');

--email = anastasija.kotlajic@email.com password = 5340
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Anastasija', 'Kotlajić', 'anastasija.kotlajic@email.com', '$2b$12$EqlBp59vl1o6cVbqbH/t0u5hJjL7jrXRcHi2HEL.xKyAgi1KW7lnG', 'true', 'true');

--email = darinka.batinic@email.com password = 2399
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Darinka', 'Batinić', 'darinka.batinic@email.com', '$2b$12$6BPpBUBqi8X4zjViasYAL.gsnl9L1iJ6pPphBwac9nbVKdXbk1FAu', 'true', 'true');

--email = bane.nejkic@email.com password = 3139
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Bane', 'Nejkić', 'bane.nejkic@email.com', '$2b$12$11nJPaz2EEURAPSbDq0kbufBLIK0grXvFmCaw9lQwzCgO7LpKMbxG', 'true', 'true');

--email = ozren.despinic@email.com password = 2010
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Ozren', 'Despinić', 'ozren.despinic@email.com', '$2b$12$JqRf.JjDqWsmV5YOI.5q5udPYFH1vsahrUtTmzlv3FAR57Llivdfq', 'true', 'true');

--email = hranislavka.biscic@email.com password = 8060
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Hranislavka', 'Biščić', 'hranislavka.biscic@email.com', '$2b$12$LWd41.8kDoWkJqt6JxkZLeV3jigu8ttBwRSZquUenj31eAPYXUCUa', 'true', 'true');

--email = zivana.karaulic@email.com password = 2702
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Živana', 'Karaulić', 'zivana.karaulic@email.com', '$2b$12$npHoUXeQJTjopXvHJDCW5ebI5xzuxbv/B7HfCgkYUf3GuKJYMB4cq', 'true', 'true');

--email = dragojlo.cotric@email.com password = 1802
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Dragojlo', 'Čotrić', 'dragojlo.cotric@email.com', '$2b$12$SU002pJQT0oUyGjx6uTrReARwIjX0QliKyWrsT7mCSHC/8rS11i/C', 'true', 'true');

--email = zlatica.grbonosic@email.com password = 4344
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Zlatica', 'Grbonošić', 'zlatica.grbonosic@email.com', '$2b$12$Zygv34OpxHUscqNy3fMTNeQT8AhYA.0VH.JpLosmS7C8grIrljiUm', 'true', 'true');

--email = jadranka.nikolendzic@email.com password = 4373
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Jadranka', 'Nikolendžić', 'jadranka.nikolendzic@email.com', '$2b$12$MhlD4/gbpWtmlDsvlY.GN.wL78FM1QI5JJS0VGdcyauiutFjaF4/m', 'true', 'true');

--email = budimir.potrebic@email.com password = 8840
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Budimir', 'Potrebić', 'budimir.potrebic@email.com', '$2b$12$VOWjgdc8iIKKgMFGvnOyBuS4rAtRsJ7XurICy/I8BY6kPP72kCM7i', 'true', 'true');

--email = radojka.grgic@email.com password = 5928
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Radojka', 'Grgić', 'radojka.grgic@email.com', '$2b$12$tp8KJFt1o6Fs.mNgHk7fGexVqHvLRlAklazZQtoD/2tPfh1kb9x4u', 'true', 'true');

--email = dubravka.pilindavic@email.com password = 9007
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Dubravka', 'Pilindavić', 'dubravka.pilindavic@email.com', '$2b$12$Zbx0EwF8zo770YdFIJD75eVRdgskT8O1FEpqb22BX05LQPkyrxvIe', 'true', 'true');

--email = grujica.pribisic@email.com password = 4128
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Grujica', 'Pribišić', 'grujica.pribisic@email.com', '$2b$12$QrXOHyC8S1kbp1n5EsnGB.Sz82J4LCafU6SQbq0YrRQtFNmCN/eZe', 'true', 'true');

--email = radovan.glavinic@email.com password = 8511
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Radovan', 'Glavinić', 'radovan.glavinic@email.com', '$2b$12$YMCkBChuBWWfBu8B0h.MveMW4MYuQrh9vnP7y6.xTalZ8q1IUMmpi', 'true', 'true');

--email = ratiborka.uveric@email.com password = 5517
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Ratiborka', 'Uverić', 'ratiborka.uveric@email.com', '$2b$12$0XKrABmeMXXLutkhumaXfuEmeCt1MH22NTdu2gp1VaDIc1M.9UJ.m', 'true', 'true');

--email = david.milojicic@email.com password = 2253
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'David', 'Milojičić', 'david.milojicic@email.com', '$2b$12$jW5n2J6Xr.Bvv1D0IegKmOUaHe0Kxy0fZP0/taqZShRxN4lt9MZeq', 'true', 'true');

--email = strajin.vrekic@email.com password = 2922
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Strajin', 'Vrekić', 'strajin.vrekic@email.com', '$2b$12$nBMjyqojBfVBJ7sRmdCl9ujj8ZDaeDUehYBkaB8WFoV0YbhF0jG92', 'true', 'true');

--email = dragisa.mrdic@email.com password = 3890
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Dragiša', 'Mrdić', 'dragisa.mrdic@email.com', '$2b$12$LVFt7W03LjhYlRu1UAPIgeL0QYe/PhF1Lj3rA0EMbfV11pCsY9pEO', 'true', 'true');

--email = bratislava.ilkic@email.com password = 6564
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Bratislava', 'Ilkić', 'bratislava.ilkic@email.com', '$2b$12$oAjBR/cilISYj5mcs48hgeuXZ.Gujfo6Z1nr5oRfm1qrrjJ2wAHzO', 'true', 'true');

--email = zlatoslav.gavrisic@email.com password = 7442
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Zlatoslav', 'Gavrišić', 'zlatoslav.gavrisic@email.com', '$2b$12$yW49tBuoFmcd6EYiRVnMD.Me/HLW4nYsSFh6mGs.Yseif9Bh.Ca7i', 'true', 'true');

--email = lola.ugljesic@email.com password = 5023
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Lola', 'Uglješić', 'lola.ugljesic@email.com', '$2b$12$WeB4LnWUx.b.8hGU0QRI8OmraLPlt2yulDNjkG86WFkwDwMZuWJ0a', 'true', 'true');

--email = sale.lezaic@email.com password = 8479
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Šale', 'Ležaić', 'sale.lezaic@email.com', '$2b$12$tyvR3Q9SWnINzTbrmDnALu.B.7vS7eO9unWh7KUJuzoriEDoRkIrq', 'true', 'true');

--email = dobrosav.vergic@email.com password = 4504
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Dobrosav', 'Vergić', 'dobrosav.vergic@email.com', '$2b$12$khLjgT.74kuu2ziA2X.zs.o0qKpJh.ejqq4odeuDGS713pmMJ1pvG', 'true', 'true');

--email = djurica.kljakic@email.com password = 4492
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Đurica', 'Kljakić', 'djurica.kljakic@email.com', '$2b$12$zz7ilLnyj.VhrWq1yECB8.Jl37/xdmykq9pQy8hBxA4bIKqL2D46K', 'true', 'true');

--email = cana.zjajic@email.com password = 5029
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Ćana', 'Zjajić', 'cana.zjajic@email.com', '$2b$12$VwRFEkh.y832qDQCd17FBuA82ZKDgVlsObgbTdBd0oIiGl9/I5y.S', 'true', 'true');

--email = ceda.presic@email.com password = 2143
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Čeda', 'Prešić', 'ceda.presic@email.com', '$2b$12$qNZsLpHR31IcpUp7N21uGeUwxZICZEwrb2TVOGjPSdsz0oKFOCPNy', 'true', 'true');

--email = zlatomirka.bradaric@email.com password = 3426
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Zlatomirka', 'Bradarić', 'zlatomirka.bradaric@email.com', '$2b$12$p31rl6578W8TbUixaov7NeFEmcvUMPFFKFFoISvDiVTwYSED7wnwq', 'true', 'true');

--email = margareta.simisic@email.com password = 3133
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Margareta', 'Simišić', 'margareta.simisic@email.com', '$2b$12$6tTkgqILhV5D0kzoNNBzXuKUYUXUfWzCkgPBwfxIM0ZBqx.LBNg3a', 'true', 'true');

--email = ekatarina.kenjic@email.com password = 1316
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Ekatarina', 'Kenjić', 'ekatarina.kenjic@email.com', '$2b$12$Y0DMHBRgvcL.EZR4lhuGCuxfGwLM/VcKkrmDfZVQr7nXxtFkoZhbW', 'true', 'true');

--email = ozrenka.ljubicic@email.com password = 7180
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Ozrenka', 'Ljubičić', 'ozrenka.ljubicic@email.com', '$2b$12$iUHRvzosykuWLUXIHSmOn.Y.ATfIMct/PasWZJ5WYklii2ou.9T4K', 'true', 'true');

--email = djurdjija.milesic@email.com password = 9694
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Đurđija', 'Milešić', 'djurdjija.milesic@email.com', '$2b$12$lmybNGUKFGGHNx8bxVGnmuFe0dEjmIrD/b12zfOMj2mQ8RHNRvga2', 'true', 'true');

--email = ratomir.stegnjaic@email.com password = 8503
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Ratomir', 'Stegnjaić', 'ratomir.stegnjaic@email.com', '$2b$12$Ab40FWLHYCMRFx.F4sDB..Z177jam2Uz2tpgZJpXKaIyteGXNaX5W', 'true', 'true');

--email = adam.vincic@email.com password = 5701
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Adam', 'Vinčić', 'adam.vincic@email.com', '$2b$12$NPdvaA8u5QLXpZMdGYh8v.i4e3qLP/UJYyNu9guTntOpckUTGXkyO', 'true', 'true');

--email = vuksana.gruzanic@email.com password = 6082
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Vuksana', 'Gružanić', 'vuksana.gruzanic@email.com', '$2b$12$XOzEWHpdpaNZ/tnElTromu1AnwpG0daUD.PUIVY.cGNeLxAxDZUN.', 'true', 'true');

--email = dobrasin.momic@email.com password = 3405
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Dobrašin', 'Momić', 'dobrasin.momic@email.com', '$2b$12$vzVGCkrFPnod5qbpYa.sQufKmhxymC.vfaH7uOYy/.jl3ALZs5hti', 'true', 'true');

--email = gradimir.nicetic@email.com password = 2419
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Gradimir', 'Nićetić', 'gradimir.nicetic@email.com', '$2b$12$dbhtb.fs/E.JDpHemP01lewhJGcv3KOz0GCeazW7HBUnk02507x1.', 'true', 'true');

--email = cane.miliksic@email.com password = 2966
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Cane', 'Milikšić', 'cane.miliksic@email.com', '$2b$12$0sw55c.a2xvE0k1PDLe4g.iFa.06o7eez749rADFIePJVIEt4U0b.', 'true', 'true');

--email = miloje.suljagic@email.com password = 3631
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Miloje', 'Šuljagić', 'miloje.suljagic@email.com', '$2b$12$/Y9hhxPhRscteh1pSgVPHeHAz2X0TSI31BmLDAcG2Fj0c05T1OBR2', 'true', 'true');

--email = sima.graic@email.com password = 4516
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Sima', 'Graić', 'sima.graic@email.com', '$2b$12$dfVp.g6RB7qJmwv/TNXHZOOaDqhIt65y3kpnbPtDs/ObbgyvGQ4Ry', 'true', 'true');

--email = milutin.borovinic@email.com password = 8552
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Milutin', 'Borovinić', 'milutin.borovinic@email.com', '$2b$12$zviZT9jYENnh9HevJOvurOdE7Ule3P6umA60nNNo5CM20H7aENpfu', 'true', 'true');

--email = georgije.karaklajic@email.com password = 1583
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Georgije', 'Karaklajić', 'georgije.karaklajic@email.com', '$2b$12$qtCAOlzqB2qmIqrIbcVQVOwmWJkm6hjp0XH/UrEOKtIpzSagXYrwm', 'true', 'true');

--email = vlajko.cuknic@email.com password = 9389
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Vlajko', 'Čuknić', 'vlajko.cuknic@email.com', '$2b$12$Lt90fv.BxgjLlnnRtq8TU.GMm8UO52qsqBAu7DQLcrBUcUV4bVH6S', 'true', 'true');

--email = marija.disic@email.com password = 9308
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Marija', 'Disić', 'marija.disic@email.com', '$2b$12$kOhiCWNcJ6uPPCXK0soPI.eWLV1IHm4GEYfm9p8VM2uWo/RIDhgnG', 'true', 'true');

--email = fema.velenderic@email.com password = 8210
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Fema', 'Velenderić', 'fema.velenderic@email.com', '$2b$12$Vr7SfltCzQI3FrmZp3GxDuXo3SeY.guHlkIdnVXzrgt0eHSzGk9n2', 'true', 'true');

--email = gradisa.cusic@email.com password = 4430
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Gradiša', 'Ćušić', 'gradisa.cusic@email.com', '$2b$12$Lc2fXmZkgY.BiOmIlx3Ikuc2pFCxVv90jf7VgK/yxBc6uXVzAMNTG', 'true', 'true');

--email = budimir.divicic@email.com password = 1873
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Budimir', 'Divičić', 'budimir.divicic@email.com', '$2b$12$bBiZymbJKHRQwHBPrQ5hieIuvMDVZj9GVuj1UU17jM8g2LGbsGbXO', 'true', 'true');

--email = gradimirka.stosic@email.com password = 7095
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Gradimirka', 'Stošić', 'gradimirka.stosic@email.com', '$2b$12$AwbCQzfvWKFPdJ/gaIwhaukqumhV0eXOqy9//B0uh1d0QXrT3EfeW', 'true', 'true');

--email = djuro.gostic@email.com password = 8233
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Đuro', 'Gostić', 'djuro.gostic@email.com', '$2b$12$3MutWBusykoDMo8VtqQ4U.EjkAaZtiZUaNrDcyE7Dvp5DRjai0s5q', 'true', 'true');

--email = jefimija.kebeljic@email.com password = 6827
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Jefimija', 'Kebeljić', 'jefimija.kebeljic@email.com', '$2b$12$ZgR1oQ5uOFuCMJKDQCrsJO0VDKsLW9PlZw4kwqi12SWvvBjGz5Piy', 'true', 'true');

--email = gabrijela.rendic@email.com password = 7656
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Gabrijela', 'Rendić', 'gabrijela.rendic@email.com', '$2b$12$5ArjyP5uaeQkMjlSMlzFhOsutLDD8sFVnomEk4GUwwnoAJsOf3PuG', 'true', 'true');

--email = andrijana.gocic@email.com password = 5954
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Andrijana', 'Gocić', 'andrijana.gocic@email.com', '$2b$12$neb.QryKi5KgzlIeVrDdxebzIhU6Qsj7YKibLsBs/EPX1chkco6la', 'true', 'true');

--email = atanasije.cuturic@email.com password = 1283
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Atanasije', 'Čuturić', 'atanasije.cuturic@email.com', '$2b$12$QqHivIdZZbg4P1ymQ9iUde4IpD9eUxiQjMdZoZDkmXqck.1ClVFzC', 'true', 'true');

--email = tugomir.duskic@email.com password = 9169
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Tugomir', 'Duškić', 'tugomir.duskic@email.com', '$2b$12$PwdNwj8xKBjL3F9Gd1gvk.JMbHVhmQC0GKThNrbxp2WPk4m9Is3Wq', 'true', 'true');

--email = nedeljko.radelic@email.com password = 7840
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Nedeljko', 'Radelić', 'nedeljko.radelic@email.com', '$2b$12$H3vMPplFtdiNGXtxWCFeOOVXQkXetAl6S0TZ9EIdq7OgRkN8PTpvS', 'true', 'true');

--email = filipa.buduric@email.com password = 8832
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Filipa', 'Budurić', 'filipa.buduric@email.com', '$2b$12$5Ldt0sm5u4EidBMzxNfts.Xk6lV5qH6/X.qPue.xjEf95..0vxSVK', 'true', 'true');

--email = rumenka.svilkic@email.com password = 8233
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Rumenka', 'Svilkić', 'rumenka.svilkic@email.com', '$2b$12$dht5R9WIlpdfz6e0wik2juVme.B2fc8wpQF1VZL5FXtyA3GwxR2Ii', 'true', 'true');

--email = antonije.sjenicic@email.com password = 3733
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Antonije', 'Sjeničić', 'antonije.sjenicic@email.com', '$2b$12$LI7TgIxzXSEFGvY3FJr14eEQM4dwE/vtVwTfeSPTHLelBax5STN1.', 'true', 'true');

--email = jelka.tulendic@email.com password = 9221
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Jelka', 'Tulendić', 'jelka.tulendic@email.com', '$2b$12$7NtttdmjPrvOMybSFm3KwuIQxgELV4m8VsnmfokJvbwnXwPv7MsAS', 'true', 'true');

--email = ljubomirka.krkeljic@email.com password = 2496
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Ljubomirka', 'Krkeljić', 'ljubomirka.krkeljic@email.com', '$2b$12$AfGMOsqRjftcAkFKJknzkeaRkNiyetEziiBDv58FjDfAt9mQC/dWu', 'true', 'true');

--email = soka.bekic@email.com password = 9166
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Soka', 'Bekić', 'soka.bekic@email.com', '$2b$12$Yjw6DNr2m86T9LP7cQ5UCu.TTLGIJ1LrKoRbvTooL9CLXjqGs61L2', 'true', 'true');

--email = djurdje.kimcetic@email.com password = 8773
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Đurđe', 'Kimčetić', 'djurdje.kimcetic@email.com', '$2b$12$vo7ZM0mgl5Uj9mZJ9pz.iuNRAncBzBLoNEEQaagAyv5AMG9E/VJEa', 'true', 'true');

--email = vojislava.vidacic@email.com password = 9794
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Vojislava', 'Vidačić', 'vojislava.vidacic@email.com', '$2b$12$74p3f4dAdvQUm2ny5Z7r/epjoXjh8wXJNPb6gSKqt9uAt5YGTWQHW', 'true', 'true');

--email = milanko.slavkic@email.com password = 9726
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Milanko', 'Slavkić', 'milanko.slavkic@email.com', '$2b$12$jmFfrTmZMArswSeCAkbiA.1k6Vt2a.qDzDjh5XR5DbL899xOo3MTq', 'true', 'true');

--email = oliver.lubinic@email.com password = 8934
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Oliver', 'Lubinić', 'oliver.lubinic@email.com', '$2b$12$Dy5tGV80pCaHzGVqUM/W1ue71og/sWvmoXt1NIjbwC69qUZCWaBbe', 'true', 'true');

--email = mijalko.stasic@email.com password = 8688
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Mijalko', 'Stašić', 'mijalko.stasic@email.com', '$2b$12$FVuqWfgUNgB26yEyn6xUNOj7ATbCcxQ2yopv4RF4Cfg35M06YWa96', 'true', 'true');

--email = jugomir.grasic@email.com password = 4896
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Jugomir', 'Grašić', 'jugomir.grasic@email.com', '$2b$12$fN66GX8fX57zr9uz/YMg9u9Xh2rNZ0d0S8QqTxia8ycUQmidFqRKu', 'true', 'true');

--email = petrija.ugresic@email.com password = 1302
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Petrija', 'Ugrešić', 'petrija.ugresic@email.com', '$2b$12$1hohzDMrOc3seD6tNKDflOmp5beTeN3xU2PYX.K7KpFIfvNqpWUnS', 'true', 'true');

--email = svetoje.jaredic@email.com password = 3591
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Svetoje', 'Jaredić', 'svetoje.jaredic@email.com', '$2b$12$yEmfh3dWOXsCoLAxt4CelegA8CMy06zLQNtF4j1DCDCV3g1VWVfyO', 'true', 'true');

--email = vujka.hadzi@email.com password = 4209
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Vujka', 'Hadži', 'vujka.hadzi@email.com', '$2b$12$TyOh9x3mS2DJpg6gYtuUtukYzSzXqsMRPE.tbRJQjdXHIusEgjNsm', 'true', 'true');

--email = ljiljana.prokopic@email.com password = 7557
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Ljiljana', 'Prokopić', 'ljiljana.prokopic@email.com', '$2b$12$KrpmBIj4OLHyfGFbWpwk7uLZ7gpQXsz7O4G28aOPL/ZLN5GzqijVK', 'true', 'true');

--email = mladomir.djikic@email.com password = 2796
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Mladomir', 'Đikić', 'mladomir.djikic@email.com', '$2b$12$rkRv4FcVAZ.gpGMYUqJGuOp7XRVyeH2BYkEqSHlivIRT.LbcRF2bu', 'true', 'true');

--email = milanko.bendic@email.com password = 9177
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Milanko', 'Bendić', 'milanko.bendic@email.com', '$2b$12$FO3rU0DEz9Zvv4HzkLh2E.ZDvhsSFJ79rijEU.ZhuFd9dZSaYhJZC', 'true', 'true');

--email = ninoslav.mratic@email.com password = 5360
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Ninoslav', 'Mratić', 'ninoslav.mratic@email.com', '$2b$12$yLMkRO0gBfrW23YUcdHNoeAo0jsyIvvHIK6nFke712ZKgww6uA586', 'true', 'true');

--email = njegosav.lepetic@email.com password = 9324
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Njegosav', 'Lepetić', 'njegosav.lepetic@email.com', '$2b$12$sTx6vGeR0itaNgQQAaSuAeli1p/x3soW3JInYOxwho1aRSge/85o2', 'true', 'true');

--email = takosava.beslic@email.com password = 6776
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Takosava', 'Bešlić', 'takosava.beslic@email.com', '$2b$12$JfbsZGWDkUuy8zs.reo4AeRJKtwg7C4YmjER/bqcLDMaaxvQB3PVe', 'true', 'true');

--email = ljilja.prodanic@email.com password = 1077
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Ljilja', 'Prodanić', 'ljilja.prodanic@email.com', '$2b$12$nMkCzUiCjjsOaUBp8MvX8.4jyhkFXv6kw6ocqj1RtAOnyKoJK8Iqa', 'true', 'true');

--email = milinko.dejanic@email.com password = 2393
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Milinko', 'Dejanić', 'milinko.dejanic@email.com', '$2b$12$fvjy49o5Lqhw0gUQgHf.WuAZ7adc6NXqssTPTfsi/WZ7jKyP6bSsa', 'true', 'true');

--email = bogdana.maslovaric@email.com password = 3982
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Bogdana', 'Maslovarić', 'bogdana.maslovaric@email.com', '$2b$12$5AwKKGpHezv3Uh4uHWhyJuZqM5HMI/lOt0y6DaPml8pSUMqCBlQqu', 'true', 'true');

--email = andrijana.vorkapic@email.com password = 9141
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Andrijana', 'Vorkapić', 'andrijana.vorkapic@email.com', '$2b$12$YdmRSKWc2fG1xbCaguyMr.KeeQVXSXUneRUWqMKdABmdMV1YaMxee', 'true', 'true');

--email = slavenka.vajic@email.com password = 4885
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Slavenka', 'Vajić', 'slavenka.vajic@email.com', '$2b$12$lmNeRupipIJLJQsJ6dm9he/cBhMAl0Df9vFxA/1jkkejoaNjp0VxO', 'true', 'true');

--email = stamenija.bumbic@email.com password = 2641
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Stamenija', 'Bumbić', 'stamenija.bumbic@email.com', '$2b$12$rVzqWC1ga9AUlacSN11LbO0AlYxeHUGCfnoD5TFCab6cdlTBwVxpq', 'true', 'true');

--email = naum.vucetic@email.com password = 3175
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Naum', 'Vučetić', 'naum.vucetic@email.com', '$2b$12$0N5zfJThWFFQvxr2tiYS.exc1XXS3PaN127H2XS4GvNck27iLi/MO', 'true', 'true');

--email = zorana.zuric@email.com password = 6266
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Zorana', 'Žurić', 'zorana.zuric@email.com', '$2b$12$7vy8/WiNnz2Alt1TbJa8Uu/Mc2jBWM.1CkXTWYCrCd9Vl8Itg63A2', 'true', 'true');

--email = srdjan.zivcic@email.com password = 9801
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Srđan', 'Živčić', 'srdjan.zivcic@email.com', '$2b$12$YGucUjTYhFxnx/Sw3x/GZOgzb2l0gNkLexzOVsKF6Gq9fDhE29eo6', 'true', 'true');

--email = cvijetin.malbasic@email.com password = 1453
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Cvijetin', 'Malbašić', 'cvijetin.malbasic@email.com', '$2b$12$mkwFz8SEFwZ4ypHooDfHneFKA.NSfaFwKKvcjljE7OmlPiQ1AJCeW', 'true', 'true');

--email = vitomir.kalajdzic@email.com password = 2436
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Vitomir', 'Kalajdžić', 'vitomir.kalajdzic@email.com', '$2b$12$3OyEWE8YZI09wfeoVwHnGey0xp/1aPnyoNP4obC26TDeqrhsrw0CC', 'true', 'true');

--email = mileva.jaredic@email.com password = 5230
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Mileva', 'Jaredić', 'mileva.jaredic@email.com', '$2b$12$IbHgwkqkP0.5Lh/2wLliKet1BhBmn1skjZO8gNYXeZOYdtJOO3Z.G', 'true', 'true');

--email = ruzica.fotiric@email.com password = 3358
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Ružica', 'Fotirić', 'ruzica.fotiric@email.com', '$2b$12$H.XCVmSfCghnP1OuxKwUguUKm4q3rlkwdWW6GoG3begz71q8D2/ae', 'true', 'true');

--email = aleksa.abdulic@email.com password = 4081
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Aleksa', 'Abdulić', 'aleksa.abdulic@email.com', '$2b$12$m68QkloanfuoaZ/5UQ4cFOvYwZ62jym6ddSY5645bhL09u2sgprO.', 'true', 'true');

--email = agnija.sperlic@email.com password = 4485
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Agnija', 'Sperlić', 'agnija.sperlic@email.com', '$2b$12$C1x815N5R3cMX8MLVlA0A.759yBnhyuU.Ai9NbNf1FsazzlUtS/wa', 'true', 'true');

--email = vladislav.sulejic@email.com password = 1928
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Vladislav', 'Šulejić', 'vladislav.sulejic@email.com', '$2b$12$qEKcqrvzeDzsSp7HDK.aXeZORTDUWzAP/7ZCfB/dSsUGLgvvvZXj2', 'true', 'true');

--email = zivoratka.grastic@email.com password = 9239
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Živoratka', 'Grastić', 'zivoratka.grastic@email.com', '$2b$12$5lQZhR.ASWhEJwXkgzbKYuJRM7imr8pkVPtH8A/Qq3j7HgZ/9bWh.', 'true', 'true');

--email = milivoj.dulikravic@email.com password = 4383
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Milivoj', 'Dulikravić', 'milivoj.dulikravic@email.com', '$2b$12$DsIiJepn6MoyVbXw771zVeyJOwhGe.E0ZrstHoGGq.4ePUQYEDA/G', 'true', 'true');

--email = zivadin.dzunic@email.com password = 7469
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Živadin', 'Džunić', 'zivadin.dzunic@email.com', '$2b$12$L.Mb9kGYiuvnayOyY4hXLOmkisYWw.ykUjOp1xeLnOQBiosvOrUti', 'true', 'true');

--email = dragoljub.zjalic@email.com password = 3440
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Dragoljub', 'Zjalić', 'dragoljub.zjalic@email.com', '$2b$12$85cjgflnrWVePdh./rs6zutOaCnRIKonAshbFMpEumVlPpLVYsLjO', 'true', 'true');

--email = jovanka.grandic@email.com password = 9270
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Jovanka', 'Grandić', 'jovanka.grandic@email.com', '$2b$12$BxE4cee1FwXQKpUS1Y7wLuZDK0v6N7Ju0UOyE1U9hzpst810.51VS', 'true', 'true');

--email = tomislav.ranisavic@email.com password = 3871
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Tomislav', 'Ranisavić', 'tomislav.ranisavic@email.com', '$2b$12$MKtZ92CYOObUEXN.p7j4OO1Gc3HSxa5QG4sCzpIFSQBNt6ZiZdM5W', 'true', 'true');

--email = tina.todosic@email.com password = 1974
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Tina', 'Todosić', 'tina.todosic@email.com', '$2b$12$oYKS1m6Nyh0dIdNUgYNMLOrG6ynso16OiMPfWMI7um06gBb/SRY5.', 'true', 'true');

--email = emil.lukajic@email.com password = 6206
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Emil', 'Lukajić', 'emil.lukajic@email.com', '$2b$12$z.8LPqrR2Ax0b.zaX/wAGuWT3vGMEB0M5kGCmKYH9vtQ8CiORGuuK', 'true', 'true');

--email = svetomir.vrinic@email.com password = 4939
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Svetomir', 'Vrinić', 'svetomir.vrinic@email.com', '$2b$12$D2LdMM309k9t/0oaCCQiCOQ0GBQ03LFU0oQHlzZgorgDqbbf/FmT6', 'true', 'true');

--email = bratoljub.filic@email.com password = 2574
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Bratoljub', 'Filić', 'bratoljub.filic@email.com', '$2b$12$P75OhYYyaP3/bJFqt1Vzuu2bsO3d.GFuOWf04I3qmK8t73RZelyBS', 'true', 'true');

--email = konstantin.sekulic@email.com password = 5884
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Konstantin', 'Sekulić', 'konstantin.sekulic@email.com', '$2b$12$CZjeD8kHf5X0r9sycODBleUd9FSrbHKiRb522Qx8AnRPotsUBcst.', 'true', 'true');

--email = vladislav.lekanic@email.com password = 4035
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Vladislav', 'Lekanić', 'vladislav.lekanic@email.com', '$2b$12$surYP6q5ztFsdmXt88PVweCOmzDuePEOXhpLgJ4WS2MZKBZev1e9q', 'true', 'true');

--email = ljuba.suletic@email.com password = 6938
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Ljuba', 'Šuletić', 'ljuba.suletic@email.com', '$2b$12$M5ES/DxTatYt1JTdSc/2KestHRrN.aLX60Y7addx9Or12DmvDZHJq', 'true', 'true');

--email = radenka.dobric@email.com password = 6469
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Radenka', 'Dobrić', 'radenka.dobric@email.com', '$2b$12$NnAqZktlrQF3zTlwrqn9xe9n0DFYYAEg3OETzqYiqevBJUnXJIoJy', 'true', 'true');

--email = ljilja.punisic@email.com password = 9017
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Ljilja', 'Punišić', 'ljilja.punisic@email.com', '$2b$12$LrbCIN1.mvMTqO/7XRUT2uRetbt8Md4V/krsddYaPpJKnA9Sx/HWm', 'true', 'true');

--email = nada.nagradic@email.com password = 1819
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Nada', 'Nagradić', 'nada.nagradic@email.com', '$2b$12$NNk9BwG7gXhzjzYEpwg6puPSQw9FSIev8qMvfEj4NmNeHQFx52hh.', 'true', 'true');

--email = alimpije.negucic@email.com password = 9003
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Alimpije', 'Negucić', 'alimpije.negucic@email.com', '$2b$12$j7AojA/X9nRpA5lxZQNWPOhyATbQ1oDqkLDnc3ENlauQ4qgszBl2O', 'true', 'true');

--email = zora.kovandzic@email.com password = 6800
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Zora', 'Kovandžić', 'zora.kovandzic@email.com', '$2b$12$D96wqMRpLULxHbun9UGu7.oXbR//rtSs9Qkj9f.ZYfPJ.0kli/uyy', 'true', 'true');

--email = dragoljub.draskic@email.com password = 5464
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Dragoljub', 'Draškić', 'dragoljub.draskic@email.com', '$2b$12$yeV50esSkZInu0vYVSZDWuvLU2sS0uNL7LD9VyyT00.Qv6.xOTePC', 'true', 'true');

--email = kamenko.spurnic@email.com password = 2278
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Kamenko', 'Spurnić', 'kamenko.spurnic@email.com', '$2b$12$ND.yV5fo.16Ub3icsw1t3u/44VgJHBe1Wk40idKZ390pHffmdliS6', 'true', 'true');

--email = ivo.jakovetic@email.com password = 4392
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Ivo', 'Jakovetić', 'ivo.jakovetic@email.com', '$2b$12$0uU4W8VF0Rn0QN7KNw./0./NPCdDXeUp7rTDmYtCH2ZBL639m5zdW', 'true', 'true');

--email = kristina.vranic@email.com password = 7793
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Kristina', 'Vranić', 'kristina.vranic@email.com', '$2b$12$zBwUTBc9bdNjhkkFL.hsjeVum8Nl5B4HRA4Ok4qbY8imRdW5LiQga', 'true', 'true');

--email = smiljana.djujic@email.com password = 7913
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Smiljana', 'Đujić', 'smiljana.djujic@email.com', '$2b$12$sr0UMwqd2HBpdevCFzzL5.JVYA3AS1.ni7qTRPasSqAnTkkDGkKXa', 'true', 'true');

--email = ninoslava.rudonjic@email.com password = 2992
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Ninoslava', 'Rudonjić', 'ninoslava.rudonjic@email.com', '$2b$12$1CfXsL5C.e3d.D8HM2wRQOC5o.0Grvd8a3r4SGpiWVzgm1pv0xxDC', 'true', 'true');

--email = feodor.lopicic@email.com password = 2790
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Feodor', 'Lopičić', 'feodor.lopicic@email.com', '$2b$12$p84F9./hGnj2aMnFmqCZPOek96LEyznsk/Ppt3cPWgwYtEg.8bl/i', 'true', 'true');

--email = djurdja.dulikravic@email.com password = 2303
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Đurđa', 'Dulikravić', 'djurdja.dulikravic@email.com', '$2b$12$3KSA18O/YNpoyHjvxV746e03d3BtaDDY8B2.K2m.adeG6m/VzQE7O', 'true', 'true');

--email = zeljka.galamic@email.com password = 5706
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Željka', 'Galamić', 'zeljka.galamic@email.com', '$2b$12$oUeMyvji4HQ0kJNNH9up3ebl8PZcPSIZadxGTeWg4R52tpOZsQ/jC', 'true', 'true');

--email = vera.budisic@email.com password = 7168
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Vera', 'Budišić', 'vera.budisic@email.com', '$2b$12$QYehFo78qBLG9vctHT.MWOpnQteo/Fhw5Sp70xoTBdzjqQFVP3JMm', 'true', 'true');

--email = veroslava.trncic@email.com password = 3337
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Veroslava', 'Trnčić', 'veroslava.trncic@email.com', '$2b$12$HDOBBHrKrrye/b.Kq5YrfO53yuwaEoNdYBGMVdFNT/Zmhcgd78llC', 'true', 'true');

--email = stanica.tarabic@email.com password = 5427
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Stanica', 'Tarabić', 'stanica.tarabic@email.com', '$2b$12$G.QzISWYvPnSGZoE1SF9J.ALhau/Da9/MUcA/k7IQP2.RPGV.KRA2', 'true', 'true');

--email = andjelko.vladetic@email.com password = 1185
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Anđelko', 'Vladetić', 'andjelko.vladetic@email.com', '$2b$12$.s6J9S6FX5a57WlSY3VSNOaiwEPeClB9/90oQOAjer19S07hDuSpq', 'true', 'true');

--email = stanislava.lazetic@email.com password = 2190
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Stanislava', 'Lazetić', 'stanislava.lazetic@email.com', '$2b$12$uGfiTyobJETctD1ODLKs9estW.g9ua/IztWZvJszYJqh57SN1j1QK', 'true', 'true');

--email = david.alincic@email.com password = 6466
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'David', 'Alinčić', 'david.alincic@email.com', '$2b$12$x5eKepdVwa15Gjk53FjVmO5TcWFw2LSaHiB4SogY.OXAzWMkCTMmi', 'true', 'true');

--email = peran.barnic@email.com password = 7447
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Peran', 'Barnić', 'peran.barnic@email.com', '$2b$12$kN/Jyh7rt05pG6Itcwwu8u57hiCDfxm5wL1omxC0zEbwvscp5Z7Pa', 'true', 'true');

--email = pelagija.milajic@email.com password = 1686
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Pelagija', 'Milajić', 'pelagija.milajic@email.com', '$2b$12$fqY788glskmGdscyJa8rmuoIMRpGPvTY23LaI5q.krejap5RcB/0e', 'true', 'true');

--email = bratislav.koljajic@email.com password = 4824
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Bratislav', 'Koljajić', 'bratislav.koljajic@email.com', '$2b$12$xt9DpxPiYvv4CejzHVb/iewa7UMYpL4I0zYyh0eAkXOxYYIvvkwoS', 'true', 'true');

--email = trivun.prisic@email.com password = 9133
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Trivun', 'Prišić', 'trivun.prisic@email.com', '$2b$12$HueLL2vYDPOEVke3v6G3wuRbJl9Zd3tOUXFP7cuivQCaNThp3AdqS', 'true', 'true');

--email = zivorad.oraovcic@email.com password = 3952
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Živorad', 'Oraovčić', 'zivorad.oraovcic@email.com', '$2b$12$e84tpqn5eQedEJw31fYKQeu7eLizDNpCtKOTTnnIvv.I2MsGIeOdu', 'true', 'true');

--email = krunoslava.urzikic@email.com password = 8975
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Krunoslava', 'Urzikić', 'krunoslava.urzikic@email.com', '$2b$12$PzfuKE41e6I2hJZKj/HcUegFqPtmTKZ5kKIqIFtrS36eNmzwHsPoa', 'true', 'true');

--email = zivorad.vorgic@email.com password = 8839
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Živorad', 'Vorgić', 'zivorad.vorgic@email.com', '$2b$12$D/MlfJniSUqbE3fA60R/t.hYppXgFVifRT0UvFI2jcb8CkRF7bZXa', 'true', 'true');

--email = nada.savkic@email.com password = 8183
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Nada', 'Savkić', 'nada.savkic@email.com', '$2b$12$FUlZExbe.6ttTYz3.Z5Nn.kROMMFhwRX3XgHoes701HIr.Vth1BPW', 'true', 'true');

--email = gorica.adzic@email.com password = 2401
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Gorica', 'Adžić', 'gorica.adzic@email.com', '$2b$12$DZlbQ6to0LxcKD6INhtaWOQsUke5.LBq58nPcldktkcdQ1Ln66hAq', 'true', 'true');

--email = goran.cirjanic@email.com password = 7577
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Goran', 'Ćirjanić', 'goran.cirjanic@email.com', '$2b$12$dJsbZOEyth0hgfxR81x3FeE2NMZgiXif2T8.1VuGCu4PD.W92IkbO', 'true', 'true');

--email = una.lalic@email.com password = 6002
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Una', 'Lalić', 'una.lalic@email.com', '$2b$12$SrKW.noMpnLsOajl.KRAIeRU4o8wxZtju678P8Goslco9lN64eMwy', 'true', 'true');

--email = cedomirka.mosic@email.com password = 8224
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Čedomirka', 'Mošić', 'cedomirka.mosic@email.com', '$2b$12$FV744pNVtANZ2kt3cwvLh.I6Ty6.tFKkDZX0pXsidY1AWMmmnXAxy', 'true', 'true');

--email = rodoljub.mutibaric@email.com password = 5273
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Rodoljub', 'Mutibarić', 'rodoljub.mutibaric@email.com', '$2b$12$kVohJvS4Ov5LSRJbrcZKhOx7I4yLN0GtzZiRlEB3yHHI8ubnRMrXy', 'true', 'true');

--email = andrijana.pejdic@email.com password = 8140
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Andrijana', 'Pejdić', 'andrijana.pejdic@email.com', '$2b$12$NiICjHG1boIiCcDvXo/fNu79.VBKghFybh2/miAcXa21Bdj343DVq', 'true', 'true');

--email = stanojla.kekic@email.com password = 3320
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Stanojla', 'Kekić', 'stanojla.kekic@email.com', '$2b$12$hJSNKywQrv5oZm4EsTmVzuujFY1p.PxA/xbGJ9eogjC4xIWs.Msmm', 'true', 'true');

--email = darinka.ramic@email.com password = 2938
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Darinka', 'Ramić', 'darinka.ramic@email.com', '$2b$12$zPjQhFNIO8hSerD082gG/.C1MjDk0OxXRDJYlPQA0jvwbl3FSxPba', 'true', 'true');

--email = tanasko.sokcic@email.com password = 9458
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Tanasko', 'Šokčić', 'tanasko.sokcic@email.com', '$2b$12$KWQgxqBbKfwRUFb6i0FeRe.FXjA.x1//hnTyFjM.sLsYtvs8g3JA2', 'true', 'true');

--email = novko.mrkic@email.com password = 1169
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Novko', 'Mrkić', 'novko.mrkic@email.com', '$2b$12$3uyrgkPunEzs6QLR4xWPCuopij0r0lqs9he/akFZEpQVDk2CpgV9y', 'true', 'true');

--email = perka.pesukic@email.com password = 7746
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Perka', 'Pešukić', 'perka.pesukic@email.com', '$2b$12$atnmei0h8nBzIhkfIFmSaOl2ZGKimN.MQZb0ByHbtyWyTQC/iejSO', 'true', 'true');

--email = kornelije.kujacic@email.com password = 2021
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Kornelije', 'Kujačić', 'kornelije.kujacic@email.com', '$2b$12$ngENKEufkzWPaHUnACDnjeyMZpj2I9.Kt2zXv.eHbQxNgHt1zlYnO', 'true', 'true');

--email = dejan.trucic@email.com password = 3330
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Dejan', 'Trucić', 'dejan.trucic@email.com', '$2b$12$jOF94C9gT7ZsjQWc5vbns.9RbSqouPjp6kYLbTezGv1xfcotE.6aS', 'true', 'true');

--email = julija.krasic@email.com password = 5476
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Julija', 'Krasić', 'julija.krasic@email.com', '$2b$12$4/HRx6o4jg3c81vJALqV5Onhsf0yfKfv4NHxn3KZCP73Fmqm.2iR2', 'true', 'true');

--email = sibin.sunderic@email.com password = 2266
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Sibin', 'Šunderić', 'sibin.sunderic@email.com', '$2b$12$OO.20qoZwtpX2dVRfx0eA.2Ww.gQt.7C2uU3CKbFfUGK8L4Wpjszq', 'true', 'true');

--email = olja.dancejic@email.com password = 9029
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Olja', 'Dančejić', 'olja.dancejic@email.com', '$2b$12$sHyuXqscJ91Ad5Cj4hrNH.cr7I5eKFuntcUQWMFMo3cpPCbdQSxX2', 'true', 'true');

--email = gojko.tesendic@email.com password = 5586
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Gojko', 'Tešendić', 'gojko.tesendic@email.com', '$2b$12$CM7Qbj9khRmMPYgvUP8XBeRF0u1gzzYlbYw02IPzMtdlKy2tIFzLa', 'true', 'true');

--email = simonida.terentic@email.com password = 7033
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Simonida', 'Terentić', 'simonida.terentic@email.com', '$2b$12$7jC9K0c030Y/dV3GXS3GqOY8EM1PwRZCaRctYE/uuBlZqn1VOqOHO', 'true', 'true');

--email = veroljub.lakusic@email.com password = 7737
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Veroljub', 'Lakušić', 'veroljub.lakusic@email.com', '$2b$12$g8gSNTAIP9Yi0gl127xGWOKxWT0nyzr77GeCzKn3Lj8so2LdyFtla', 'true', 'true');

--email = ubavka.djuzic@email.com password = 6668
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Ubavka', 'Đuzić', 'ubavka.djuzic@email.com', '$2b$12$0.7/lKjj/TY.8BQ3LolNLOaSIgG9L9rW5fAYigkRDad83nV6qp6Om', 'true', 'true');

--email = stanislav.peulic@email.com password = 5093
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Stanislav', 'Peulić', 'stanislav.peulic@email.com', '$2b$12$5npd5LeAMjyb9aRwiV7rB.o/b0gtu/3t43kWSOos/bC9snugUeBYK', 'true', 'true');

--email = takosava.misnic@email.com password = 9736
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Takosava', 'Mišnić', 'takosava.misnic@email.com', '$2b$12$RckIMPhyJJ72hyIAFa7MSO/RsxoMKv3JXpUo4ZtXThjgVPRej3.N2', 'true', 'true');

--email = julijana.kunic@email.com password = 1368
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Julijana', 'Kunić', 'julijana.kunic@email.com', '$2b$12$LSdcfEZbd.EiXiNMqU1JZeGvqF4VfLqJ1EaBhcNRngO966FpU8noe', 'true', 'true');

--email = slavna.truskic@email.com password = 1724
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Slavna', 'Truškić', 'slavna.truskic@email.com', '$2b$12$2VKRb0S32BNq2A8vOZYGW.5M0bRC8v8hDMJIRD64svRUm4NO.H3wq', 'true', 'true');

--email = grozdana.pauskic@email.com password = 5344
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Grozdana', 'Pauškić', 'grozdana.pauskic@email.com', '$2b$12$7Nn8x9dZ1LJgDEH0QxljVe75IHFw6u7ehbHIbdoTCWDlAurXgZl6C', 'true', 'true');

--email = ivko.tadic@email.com password = 7207
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Ivko', 'Tadić', 'ivko.tadic@email.com', '$2b$12$AVsGlHomdJ0t7PJsCjR4xeXi0L10Zd06Ab5ckncAMm1xcVUeAfacS', 'true', 'true');

--email = stana.papulic@email.com password = 9634
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Stana', 'Papulić', 'stana.papulic@email.com', '$2b$12$nRk1JVjGr0uDxKYUoK7CTeNS9Xj/CmYX5ri2NXu1LoAw/Ru4Fer.e', 'true', 'true');

--email = vladislav.zmiric@email.com password = 9868
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Vladislav', 'Žmirić', 'vladislav.zmiric@email.com', '$2b$12$yxi3xd8YIlsvEpIvJV1C.uFf..YzkT24ekqt4nAiQybIJUQj8QBGy', 'true', 'true');

--email = dragoslava.vezilic@email.com password = 4271
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Dragoslava', 'Vezilić', 'dragoslava.vezilic@email.com', '$2b$12$EgLui4Z8cqG6HcpqXi4jUe0tvJy22FnQO29AqNQl3qiu/d3e.bVtW', 'true', 'true');

--email = sima.dodic@email.com password = 1112
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Sima', 'Dodić', 'sima.dodic@email.com', '$2b$12$HmxD2/X4u8L3kNub1HC3ZOzfsjRII4J7bS2LoqFAY0A.Sit8/GV1y', 'true', 'true');

--email = una.zarkic@email.com password = 5609
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Una', 'Žarkić', 'una.zarkic@email.com', '$2b$12$A9.TJ0lVZDfLAqGIqpyLWexYGSGoRjdvu76ci.C7Cuu7kOrdDTlvy', 'true', 'true');

--email = kruna.krivic@email.com password = 6129
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Kruna', 'Krivić', 'kruna.krivic@email.com', '$2b$12$geXqY4s2KyNOK.A//8Vu3.HU74tUVSE2YSeatpWgHPB47hELer2Va', 'true', 'true');

--email = antonina.sagic@email.com password = 1285
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Antonina', 'Šagić', 'antonina.sagic@email.com', '$2b$12$/DENjDQqDTJmKhU29cBpFe5LWWs1Er8iW25.NlGzPBwygZLR8AFGK', 'true', 'true');

--email = vujadin.kulic@email.com password = 9826
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Vujadin', 'Kulić', 'vujadin.kulic@email.com', '$2b$12$Vj5W2Jh8T4Jl1UsufiUW0eJKeb3xO91X3iQN8oS1jFV3M44h5NTxi', 'true', 'true');

--email = vesna.zvekic@email.com password = 4774
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Vesna', 'Zvekić', 'vesna.zvekic@email.com', '$2b$12$K3U1L5ptxRkIuCxbiTylCesfMqEBu4GqFJOBmn.M390SgLXjrizu2', 'true', 'true');

--email = zlata.matejic@email.com password = 4779
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Zlata', 'Matejić', 'zlata.matejic@email.com', '$2b$12$I1ft1r8tlKhAho/SjBjTwOrfpsEqcS8pSVtq/ny4BPdEqKOZdC/XK', 'true', 'true');

--email = divna.desic@email.com password = 2127
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Divna', 'Dešić', 'divna.desic@email.com', '$2b$12$7BchI6EkpDFmSGfpClZAxuOogb/YJyF6S2LbTjSjb8Qe4zS5iLnfK', 'true', 'true');

--email = strahinja.ljubisic@email.com password = 8844
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Strahinja', 'Ljubišić', 'strahinja.ljubisic@email.com', '$2b$12$bYAE4IhheF19QigEQxiHyOsZwPpW9vMzrlBWhR7y/CdX2i0ti0pUy', 'true', 'true');

--email = arsenije.besarabic@email.com password = 8994
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Arsenije', 'Besarabić', 'arsenije.besarabic@email.com', '$2b$12$jFpQsu3Xvc/wOygXFWmCcOLXJ/nY64rkLogPa4t8jz/GjYM5M5n7S', 'true', 'true');

--email = ilija.trucic@email.com password = 1813
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Ilija', 'Trucić', 'ilija.trucic@email.com', '$2b$12$/NtF2v6GMR0ZjRv0B62O.OIegGgSkxkJpNKw96NMqKT6LDjvyR/nq', 'true', 'true');

--email = zlatoslav.stamencic@email.com password = 5310
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Zlatoslav', 'Stamenčić', 'zlatoslav.stamencic@email.com', '$2b$12$LUtLCxKlGrHKX4Sdj90BMeOdPtDBeYXt2DoyokxQPciip8zS8.R5y', 'true', 'true');

--email = djoka.luketic@email.com password = 3635
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Đoka', 'Luketić', 'djoka.luketic@email.com', '$2b$12$/1t1gE1UyQQp7uVyl.SPaOFrUe2aohLF581KgKYptoEq0GGOO4bZW', 'true', 'true');

--email = veroljub.civisic@email.com password = 4711
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Veroljub', 'Civišić', 'veroljub.civisic@email.com', '$2b$12$hPMRPKePKFQG9ld6NcqnUuWAO9rNBE5YiI0fNokn.fSxBqxjdckXW', 'true', 'true');

--email = njegoje.citic@email.com password = 2366
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Njegoje', 'Ćitić', 'njegoje.citic@email.com', '$2b$12$cCm1vhtkVB0eG5gM139siOppQUoNj50FKXqeYaD0hUiPNgU9c1WcO', 'true', 'true');

--email = nikola.bogicic@email.com password = 8902
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Nikola', 'Bogičić', 'nikola.bogicic@email.com', '$2b$12$FKU0zTqy5rQuy.hwMdyF5eARm8xrkWemQWU0C8yozqvJCmDmTvCp.', 'true', 'true');

--email = zorka.stojnic@email.com password = 4261
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Zorka', 'Stojnić', 'zorka.stojnic@email.com', '$2b$12$fJJWjacxJG2vGRGqzmc17.sKU0g8wRc3dSkmOz79vlCXUE9Fz4ASS', 'true', 'true');

--email = djurdjina.sobacic@email.com password = 1881
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Đurđina', 'Šobačić', 'djurdjina.sobacic@email.com', '$2b$12$MpiTNIIZRUEoqLea0PZnBuJjUt9dxFhQe70qoqEBoW.qpZ9snJo6y', 'true', 'true');

--email = makrena.miseljic@email.com password = 2089
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Makrena', 'Mišeljić', 'makrena.miseljic@email.com', '$2b$12$nlPoDztPCDErdo9owH.suOHeb1PTvpdZK0249oplAJq5dfrtbh07m', 'true', 'true');

--email = ana.platanic@email.com password = 3184
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Ana', 'Platanić', 'ana.platanic@email.com', '$2b$12$ZS7djF0bfgcbausg70CZUeU7REbE0b.7SBy/RDQiUF/69QG3zluOa', 'true', 'true');

--email = aksentije.strigic@email.com password = 3096
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Aksentije', 'Strigić', 'aksentije.strigic@email.com', '$2b$12$1/FE2vnvrcaDEIkRXoFh5u0oYQjnGgiDAz92za6978cCuTchPOAlO', 'true', 'true');

--email = djurdjija.batinic@email.com password = 2385
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Đurđija', 'Batinić', 'djurdjija.batinic@email.com', '$2b$12$ztu62JGKW2JIAJeY71/tQ.8GDBoaPM.UNMK7My5SskVhhM6CHxuMm', 'true', 'true');

--email = prodan.narandzic@email.com password = 6889
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Prodan', 'Narandžić', 'prodan.narandzic@email.com', '$2b$12$IWLGrsPOGVgtCFYi0NS2KeMJG676D43zcwpENglqupGf0sAIoX4XS', 'true', 'true');

--email = makarije.ridjosic@email.com password = 3219
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Makarije', 'Riđošić', 'makarije.ridjosic@email.com', '$2b$12$489YpwoiHldk.QAQCQbiyeUPUUhTvWrRQtkjXapm63U8CDB1a9FlK', 'true', 'true');

--email = irena.kocic@email.com password = 2621
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Irena', 'Kocić', 'irena.kocic@email.com', '$2b$12$SpcUoLZeGAuKxioZHCQ9z.mhHOTt803csmUF8ob4hL0rLJ83xdPHW', 'true', 'true');

--email = momcilo.babic@email.com password = 7211
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Momcilo', 'Babić', 'momcilo.babic@email.com', '$2b$12$hPGe7QNaOxJzHA3TWq0SBO/k58PLpryTDjc2okxxbdkXTcykg1v.W', 'true', 'true');

--email = naum.djurendic@email.com password = 8268
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Naum', 'Đurendić', 'naum.djurendic@email.com', '$2b$12$gIfyoHpNOI5n8LLRkP4vF.PE3vk.sOFRI6Li9ENBzNTTmgVMAj8E2', 'true', 'true');

--email = vladimir.gerzic@email.com password = 8658
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Vladimir', 'Gerzić', 'vladimir.gerzic@email.com', '$2b$12$sewD3.ZgEf0huVUZaEW1EOL32MeECusJ/dT40ep.jv28k.EjUKlX6', 'true', 'true');

--email = cvetana.prisic@email.com password = 6687
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Cvetana', 'Prišić', 'cvetana.prisic@email.com', '$2b$12$zirMIkFuVTJt95mgI8o9hePO6ivhQTRii3uUgV.eWbsck/WgqFcBa', 'true', 'true');

--email = jasna.pericic@email.com password = 1533
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Jasna', 'Pericić', 'jasna.pericic@email.com', '$2b$12$XUyNzUlSL9q.2UXQj3sonulospgcigj1Tz5GRTlY7vtaCNE3VZJEi', 'true', 'true');

--email = sreten.bakic@email.com password = 4188
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Sreten', 'Bakić', 'sreten.bakic@email.com', '$2b$12$.g42qvMe2PIHu2jzuGvR9uGEz8BuFpqZt2E43ldpvpZnXtIFt0RLq', 'true', 'true');

--email = darko.poskuricic@email.com password = 1873
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Darko', 'Poskuričić', 'darko.poskuricic@email.com', '$2b$12$wxVpHBlsC2VzlkEoTGTdE.W9N3kPTG2VC5jDpQKM/VYOPgaVCnqx6', 'true', 'true');

--email = stanka.demonjic@email.com password = 9530
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Stanka', 'Demonjić', 'stanka.demonjic@email.com', '$2b$12$OcHpu8r5H0qnqyZMQIbaqea8lyrzTlwtiG2/mi6uaAMpqokjh8PwS', 'true', 'true');

--email = njegus.panic@email.com password = 2628
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Njeguš', 'Panić', 'njegus.panic@email.com', '$2b$12$rydP0FewJ2ma8.IQ.z/53eu7kXci/JvXNTHwXEUnnSqFJTE.TSB1a', 'true', 'true');

--email = lucija.dincic@email.com password = 7506
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Lucija', 'Dinčić', 'lucija.dincic@email.com', '$2b$12$yAXzKYX7vfwxEe6Nh7g13O1ukGQFKRmi8.EfHkGU3QbRe2RChJ2Zq', 'true', 'true');

--email = borislav.dragisic@email.com password = 9362
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Borislav', 'Dragišić', 'borislav.dragisic@email.com', '$2b$12$prJCVxl09f.UB/9CRCUlxu3ixAKwJxZOqrPD/otFwC5zMufVg1z9G', 'true', 'true');

--email = cviko.durkulic@email.com password = 1546
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Cviko', 'Durkulić', 'cviko.durkulic@email.com', '$2b$12$AtdVTmGHLXk.ksYkavetlO732wcY0h08D4uDWncpSz2YE8i/AAGfC', 'true', 'true');

--email = sisko.dragoljic@email.com password = 8643
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Šiško', 'Dragoljić', 'sisko.dragoljic@email.com', '$2b$12$kA9FGet33QnDMdZR1qJd..DPWMq9L2OsniSrquUpacwGmbU/rusb2', 'true', 'true');

--email = velimir.matic@email.com password = 1874
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Velimir', 'Matić', 'velimir.matic@email.com', '$2b$12$sJoz.vm7UK.hxYDPpHt7YeMA.i70SKv2Wn3eDSOT8fm7v6B/ywaC2', 'true', 'true');

--email = ivan.stepandic@email.com password = 7574
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Ivan', 'Stepandić', 'ivan.stepandic@email.com', '$2b$12$/9hpw15lplinpfuXLnOVyuFsh/Bpk3YfbHgQVe9yXdKBzXwlKZBw2', 'true', 'true');

--email = canka.florikic@email.com password = 3193
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Ćanka', 'Florikić', 'canka.florikic@email.com', '$2b$12$M/BwAuM71WbyheHUl3kPuenVassrJ34eFSs4Vx1Htaje0wJpfkD1K', 'true', 'true');

--email = olgica.dorontic@email.com password = 5271
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Olgica', 'Dorontić', 'olgica.dorontic@email.com', '$2b$12$pQorsaYu/D6FRZVvRd0J1.l2OAEED.7MoabLK2xTKsvpLhHCTv4G.', 'true', 'true');

--email = dusica.sofronic@email.com password = 2706
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Dušica', 'Sofronić', 'dusica.sofronic@email.com', '$2b$12$o3fI3Q0lJ/UbhAYxadPCneldzXXBVmhvnG8mYeLaojWOrpdo8Pdpi', 'true', 'true');

--email = kostadin.bavrlic@email.com password = 3981
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Kostadin', 'Bavrlić', 'kostadin.bavrlic@email.com', '$2b$12$aL3i13aqnwR6yeA21FB8y.gxykm295vs2SZLSo.6sMFjCcjIE6Com', 'true', 'true');

--email = prodana.bisenic@email.com password = 1468
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Prodana', 'Bisenić', 'prodana.bisenic@email.com', '$2b$12$4nqPjnROomwVl29Ni3euXuL8x27EhEawsu0lQ.uO1aJHE0cS12zb6', 'true', 'true');

--email = lola.ludajic@email.com password = 7401
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Lola', 'Ludajić', 'lola.ludajic@email.com', '$2b$12$ub.aMT6PHu7hBZm.1VcOeuq2YsSMjpdl/JaPU/7u/HDzWhGJ8QPy.', 'true', 'true');

--email = isidor.misirkic@email.com password = 4543
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Isidor', 'Misirkić', 'isidor.misirkic@email.com', '$2b$12$aRlUiBiBah6lybHgdJ.hFeevEMFHuqQHRpMKxXH60rwWRiIViioUS', 'true', 'true');

--email = sofija.bruic@email.com password = 1195
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Sofija', 'Bruić', 'sofija.bruic@email.com', '$2b$12$oxlNi4sM28XMMzrUrzuzqOOOP2VoMB3QTTD10th50SBuSsb/2Y6gG', 'true', 'true');

--email = jovanka.rakic@email.com password = 6446
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Jovanka', 'Rakić', 'jovanka.rakic@email.com', '$2b$12$lT6Q9oSCyVLC05oF2FNiGevU13RNo.t.qTny6tpqWZnAun5q3pK/u', 'true', 'true');

--email = velislav.camdzic@email.com password = 5643
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Velislav', 'Čamdžić', 'velislav.camdzic@email.com', '$2b$12$NawHZDpnPZwtXI0m4.uxA.Lz/b3uQO7YIO17KVlSO2S/9kyGAXTfi', 'true', 'true');

--email = danojlo.lajsic@email.com password = 3690
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Danojlo', 'Lajšić', 'danojlo.lajsic@email.com', '$2b$12$7S4cS92HhHwEJ1O5fuhSFOmH4K/SzHNzJZ9jxNh3/TSKiZP/V92GW', 'true', 'true');

--email = tina.kitanic@email.com password = 9998
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Tina', 'Kitanić', 'tina.kitanic@email.com', '$2b$12$TrBBs90DWEHAUNO5zzxDGepKjlofTnHO6EKx9YguUIefSFlHBcc1m', 'true', 'true');

--email = negosava.kravic@email.com password = 6404
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Negosava', 'Kravić', 'negosava.kravic@email.com', '$2b$12$yea8U8G43yjYegJTH35GhuEpwGFlUXeizwwJgaQ/ECROKrBzO6BPW', 'true', 'true');

--email = radojla.hadzi@email.com password = 9893
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Radojla', 'Hadži', 'radojla.hadzi@email.com', '$2b$12$O.y8.0c/4dYBVAwbw4qKCuKiI6DhdYXKbBLrOlZabIn9jmicFERzG', 'true', 'true');

--email = slavica.kruskonjic@email.com password = 2340
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Slavica', 'Kruškonjić', 'slavica.kruskonjic@email.com', '$2b$12$eqOxeiz77ZrK1qsytEZNFuna5ObBnNBvhITlXQfzmuWSAOZ18LNom', 'true', 'true');

--email = josif.puzic@email.com password = 8698
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Josif', 'Puzić', 'josif.puzic@email.com', '$2b$12$wv5OIXUARRzY1miTyLQAIeYDm/BHBqVpmkVAmi146fsbrnWPZ2EkW', 'true', 'true');

--email = danojlo.jaksic@email.com password = 6327
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Danojlo', 'Jakšić', 'danojlo.jaksic@email.com', '$2b$12$9t8SzONjiPxZF01yueTA0enB9at5odoVnBncL9dhFSrf65mu5KVrG', 'true', 'true');

--email = budislav.bogic@email.com password = 1291
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Budislav', 'Bogić', 'budislav.bogic@email.com', '$2b$12$Tf7GOlXfeDOmachheIPHVeqaoFmdH8DCyYlYkCGvK6ICTvjpXWERO', 'true', 'true');

--email = stamenko.krezic@email.com password = 3909
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Stamenko', 'Krezić', 'stamenko.krezic@email.com', '$2b$12$WlJoouiYv0xVEWezV/vPxeR/tHIPdAnEyBZLZdoIQVCx/la/XEFA.', 'true', 'true');

--email = jelka.ranic@email.com password = 2361
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Jelka', 'Ranić', 'jelka.ranic@email.com', '$2b$12$TLfaKGcVDEbybS9FbGtldOlDIWIGCcanuS.KbFlbno7HCd82a.9iC', 'true', 'true');

--email = zivodarka.bugaric@email.com password = 5807
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Živodarka', 'Bugarić', 'zivodarka.bugaric@email.com', '$2b$12$9f4beaVcIGVm8UMZheMZfu9zZ0juWVlpXHsPUQW7kSH8ii91DD37q', 'true', 'true');

--email = ugren.vrzic@email.com password = 4826
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Ugren', 'Vrzić', 'ugren.vrzic@email.com', '$2b$12$Ca8//eWbdpLuxO45dFbUB.p2gT/oTKUx/S6cPxBqh7d8Gqhvp5nwW', 'true', 'true');

--email = emilija.curulic@email.com password = 7137
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Emilija', 'Ćurulić', 'emilija.curulic@email.com', '$2b$12$MRdyi0LDgBIQL8fcMquCM.1c5o1jaj1Sm2UM36r/a7XMJ3uZeB2Rm', 'true', 'true');

--email = njegoslav.doganjic@email.com password = 9657
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Njegoslav', 'Doganjić', 'njegoslav.doganjic@email.com', '$2b$12$KDSmDf2MVWGAOCLsog.j5utWEQeFzgCALH7rFi7sEkM.abJKPgJZS', 'true', 'true');

--email = cira.vujic@email.com password = 3408
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Ćira', 'Vujić', 'cira.vujic@email.com', '$2b$12$sh6w0eA04hnUMfXVILZ4xOH2aFlI0AsK74/PaJBoBGuEFxv6cgo9i', 'true', 'true');

--email = magdalena.sendric@email.com password = 7148
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Magdalena', 'Sendrić', 'magdalena.sendric@email.com', '$2b$12$drPtZz8i91tWr8Aj8KFivO6nDyRgwhDpoMJ25.dUMXrxfunOxrOru', 'true', 'true');

--email = ugljesa.gligoric@email.com password = 7425
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Uglješa', 'Gligorić', 'ugljesa.gligoric@email.com', '$2b$12$56iBoGWJeCyoWhkb/5aBzeYiQt3DprbJglAbxVUTfHzqaeEXdXPse', 'true', 'true');

--email = perunika.uveric@email.com password = 4752
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Perunika', 'Uverić', 'perunika.uveric@email.com', '$2b$12$jqVDiCVR4m37Abx/noWHyOjUpYBHJz3gz14YHIQ0/iIgYKpwnLLmm', 'true', 'true');

--email = radojica.buduric@email.com password = 9588
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Radojica', 'Budurić', 'radojica.buduric@email.com', '$2b$12$KR0tQnSDz84nW.HCzByMOOsWjEH7C4n9F01hoRrBLcT2UezBlFkF.', 'true', 'true');

--email = djuradj.brbaklic@email.com password = 1226
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Đurađ', 'Brbaklić', 'djuradj.brbaklic@email.com', '$2b$12$UuPrqnsfSbcCFV3TUEV37.eo9do0eovUneSz5ua83H9Dy8x.o0Nwi', 'true', 'true');

--email = todor.rajcetic@email.com password = 7904
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Todor', 'Rajčetić', 'todor.rajcetic@email.com', '$2b$12$OXJ2gxQ88o4/yAnz0Bjeyeiec8LyEJn.l.Y24OA1QTbXd0mZWvgqG', 'true', 'true');

--email = ljuba.bolic@email.com password = 8999
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Ljuba', 'Bolić', 'ljuba.bolic@email.com', '$2b$12$dNNUT1A5kni3uZ3Y2ABuRuxh4RFLNXaqNRhNUli9jlXUVXDi3af1u', 'true', 'true');

--email = ignjatije.samardzic@email.com password = 3389
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Ignjatije', 'Samardžić', 'ignjatije.samardzic@email.com', '$2b$12$1XTUzKpnpL/avdrIwwqXouxCgXjFlsqfRadUyBVYm99VvdFJ3iseO', 'true', 'true');

--email = obrenija.kandic@email.com password = 6440
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Obrenija', 'Kandić', 'obrenija.kandic@email.com', '$2b$12$5qW8/z97h378yQyfe4lCN..ZzI5KF8JL5xDW.vUdnbsBK2ofUnQby', 'true', 'true');

--email = divna.lalic@email.com password = 5190
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Divna', 'Lalić', 'divna.lalic@email.com', '$2b$12$mkRGGoKg5CrFhvKnwhHJjeVKJAnWXHVALOdNw/m8kAVXRc9oZd8HK', 'true', 'true');

--email = srbislav.neoricic@email.com password = 1546
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Srbislav', 'Neoričić', 'srbislav.neoricic@email.com', '$2b$12$xpLxi02dYdm.kSWmHBILw.BlHGOmkClRfVd48mWwGPLJbif5rhI6C', 'true', 'true');

--email = nikolija.nakaradic@email.com password = 9411
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Nikolija', 'Nakaradić', 'nikolija.nakaradic@email.com', '$2b$12$3/WNJ9OEP8kGPkBu4aElkex/beDnZ0ZmKb.LsXSJ.8cLf3ZHCm2NK', 'true', 'true');

--email = konstantin.mracic@email.com password = 1824
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Konstantin', 'Mračić', 'konstantin.mracic@email.com', '$2b$12$Pf8rUQxwjxFAf/HOBLs.BO8HqQI0CZXnnAC/KDsy4mYW.U3GVuS7K', 'true', 'true');

--email = jugoslav.gajetic@email.com password = 6720
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Jugoslav', 'Gajetić', 'jugoslav.gajetic@email.com', '$2b$12$XEziXcsnrWcOdjYpTinwt.kYeIOGSF2UE7jnDJw1WspRtChVgrTse', 'true', 'true');

--email = momir.jedoksic@email.com password = 4520
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Momir', 'Jedoksić', 'momir.jedoksic@email.com', '$2b$12$TIr0R4PojIUoiWpwn.aA4Od13nk0XmArnvd2V.UCRvxlgtN83fOOW', 'true', 'true');

--email = obrad.andrijanic@email.com password = 5885
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Obrad', 'Andrijanić', 'obrad.andrijanic@email.com', '$2b$12$2HmDg5F8xzIv/bDJ.wo5aet2ASxbDIt8p31QOC/51x/BPum10VME6', 'true', 'true');

--email = leontijr.prokopic@email.com password = 7838
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Leontijr', 'Prokopić', 'leontijr.prokopic@email.com', '$2b$12$mJusZuEPSWX2ioBT53IDm.Vzfae.pFw0yykHbK2BqcgcmreRa6i3y', 'true', 'true');

--email = vlastimir.gruzic@email.com password = 9010
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Vlastimir', 'Gružić', 'vlastimir.gruzic@email.com', '$2b$12$knzyVdyXmYFjuHiR5RRDkeSe/V0E1J0i1oslXoACtOg9a2dPiTBW.', 'true', 'true');

--email = stojiljko.goranic@email.com password = 8058
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Stojiljko', 'Goranić', 'stojiljko.goranic@email.com', '$2b$12$5PwouTD46VshR0zPk7Zm0upkW4VivM4D8wuRM.RJMdFkVyUc6SPy6', 'true', 'true');

--email = slavna.pelagic@email.com password = 1299
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Slavna', 'Pelagić', 'slavna.pelagic@email.com', '$2b$12$6/RlUgksbjkz2Kb08qLPgOT5EteihHXrQ7Qz0VmL2NcwV7WSX1Tie', 'true', 'true');

--email = krsta.sakic@email.com password = 3708
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Krsta', 'Sakić', 'krsta.sakic@email.com', '$2b$12$oAMeavIrw.ZepebyPosw.uD2SgKNJkyoNMZ/J1D5EYXlrZpj7XM12', 'true', 'true');

--email = sanja.jankucic@email.com password = 6036
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Sanja', 'Jankucić', 'sanja.jankucic@email.com', '$2b$12$65uVU8wUWfPslaLnJ3JKdezDoEERYsCUn1NWlnr6vPHMBL3frc6Y.', 'true', 'true');

--email = jasmina.mickic@email.com password = 8846
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Jasmina', 'Mickić', 'jasmina.mickic@email.com', '$2b$12$DXFTvEa17YCnUb3mINRBIOBLTwuql1As4sfczrUyOPwabIBymc6Gi', 'true', 'true');

--email = tesman.kosaric@email.com password = 7578
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Tešman', 'Košarić', 'tesman.kosaric@email.com', '$2b$12$BXx778ag7h5yhC5dfx1rmevwjsWRXJ7InxMmkCcKEOpNwPW4EVMTe', 'true', 'true');

--email = dragoslava.paleksic@email.com password = 3407
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Dragoslava', 'Paleksić', 'dragoslava.paleksic@email.com', '$2b$12$As1rcGSyHXLv8Wz9CmvQGeHyhTfyfNv8BhuHAK7H5oQAxrGIkA7gK', 'true', 'true');

--email = milijana.santric@email.com password = 7038
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Milijana', 'Šantrić', 'milijana.santric@email.com', '$2b$12$VaeYQj4keS4UT2CZr5OuCOuSUjtQ72xsjUrVUJcAjTe.TCJTBHMR2', 'true', 'true');

--email = sako.savcic@email.com password = 1763
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Šako', 'Savčić', 'sako.savcic@email.com', '$2b$12$w81xJNd0SRSjcX6669qEVOsf.jIn/aNefgwFpxqHpiRAHxnNNUOiG', 'true', 'true');

--email = blaza.momic@email.com password = 9524
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Blaža', 'Momić', 'blaza.momic@email.com', '$2b$12$4T7ObUBxgSE/A55HdjO7YuBaW6Xb7GcWB..eWo8kI9TNEdRN/UmEi', 'true', 'true');

--email = cane.dostanic@email.com password = 8256
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Cane', 'Dostanić', 'cane.dostanic@email.com', '$2b$12$76iHzRWHnmYMZiQJL2s7Yup0sFHEYbb.Mxy9GeREdRkntwh08Hu5W', 'true', 'true');

--email = jasminka.pavic@email.com password = 7782
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Jasminka', 'Pavić', 'jasminka.pavic@email.com', '$2b$12$fcRHoe1ZQRPYsEQefIUUQOXgeWK4VnJrQIYJcN6novb..Q3cJkbaK', 'true', 'true');

--email = kirilo.savelic@email.com password = 6181
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Kirilo', 'Šavelić', 'kirilo.savelic@email.com', '$2b$12$HH6kQkcGeC4V.Q7yP1qEHOIUotz6YTVZWLsK8eFBedHnTm64VkcFu', 'true', 'true');

--email = stevanija.ticic@email.com password = 8450
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Stevanija', 'Tičić', 'stevanija.ticic@email.com', '$2b$12$t7KB6Xe05WvxVJRppX/.KeA8lul3F973vIi1Cy0uTWlxWt15WNmlm', 'true', 'true');

--email = sin|elija.gordanic@email.com password = 6176
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Sin|elija', 'Gordanić', 'sin|elija.gordanic@email.com', '$2b$12$Y.V/NXOcVeEIAFJ69U9FIeEFckIXAYFqdp9Y4rEnLGPsi3.9qmX7C', 'true', 'true');

--email = stamenko.stefic@email.com password = 1004
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Stamenko', 'Stefić', 'stamenko.stefic@email.com', '$2b$12$Ww/687OIDRWXW1rvI.K5muYZGRXvDaQdMrxWg/G2LvV1PX/rCpBKu', 'true', 'true');

--email = dobrilo.baclic@email.com password = 4682
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Dobrilo', 'Bačlić', 'dobrilo.baclic@email.com', '$2b$12$8YTL/m4fb3RAOUIX//mEj.YECtJTq5PBo5CrvMrQZFCAP8mPG5jWC', 'true', 'true');

--email = suzana.krasnic@email.com password = 6057
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Suzana', 'Krasnić', 'suzana.krasnic@email.com', '$2b$12$k.zICH7H5FzNB0K54NQXiOXpfujF3PkWf/FYt9U4ljMU7h/H38YKu', 'true', 'true');

--email = radenka.surucic@email.com password = 9105
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Radenka', 'Suručić', 'radenka.surucic@email.com', '$2b$12$sZJsxiggbrBOczdtK4a6peRhdmSJWWY4CGyN0eCCVgRdTT79C0Uh.', 'true', 'true');

--email = radisa.andjic@email.com password = 1807
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Radiša', 'Anđić', 'radisa.andjic@email.com', '$2b$12$oLq6S72wwNblqg0rnMH04.w6cY25KDDgZls4Xo08GkHaeIHNoYW6W', 'true', 'true');

--email = lidija.stanetic@email.com password = 5133
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Lidija', 'Stanetić', 'lidija.stanetic@email.com', '$2b$12$UCyWsZNa9bt.DOIE0HGKMe2K6LEt4M3D4kJE6jDlvekauHd6edhUG', 'true', 'true');

--email = veroljub.radoicic@email.com password = 8633
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Veroljub', 'Radoičić', 'veroljub.radoicic@email.com', '$2b$12$Qh7sRUQxbExYE1DZP22hXOzgJfEScJ.KAT1RAMD588l84StyBGNsC', 'true', 'true');

--email = rumenka.sarancic@email.com password = 7275
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Rumenka', 'Šarančić', 'rumenka.sarancic@email.com', '$2b$12$Qa/Z598NtrENdhhcg/eQ8eM9U94Fam4ctZRQz.efxtUYrDm2U1loK', 'true', 'true');

--email = cvetko.cocic@email.com password = 8525
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Cvetko', 'Čočić', 'cvetko.cocic@email.com', '$2b$12$HBN5xcOGnUs8wwHqAgX9LOhRCA2t0S95pYAQrcf0dLmHjgg0vDhA.', 'true', 'true');

--email = stanojlo.srnic@email.com password = 3093
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Stanojlo', 'Srnić', 'stanojlo.srnic@email.com', '$2b$12$1E9t/9HouEss4lJwFhTHJ.ibbcUdM6G3PXwfDsAgbRBn46iWswoRm', 'true', 'true');

--email = stojna.miljanic@email.com password = 9707
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Stojna', 'Miljanić', 'stojna.miljanic@email.com', '$2b$12$bE8Vj/T/yHYXkVxPe978DOvrnXn6yDbEpNkNNh.BSO6NWo9Hcd8gi', 'true', 'true');

--email = nastasija.apelic@email.com password = 9393
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Nastasija', 'Apelić', 'nastasija.apelic@email.com', '$2b$12$mwZB4PJj7zOTOFazXFmDKumD0o75szTF87110E3kYLO5fWSMGD2Wa', 'true', 'true');

--email = stepan.sarancic@email.com password = 1562
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Stepan', 'Šarančić', 'stepan.sarancic@email.com', '$2b$12$yqECjsZKtPFZdqpodMX2nuqUpAxIYb/A1eNsxN0Nk1MHecla9EXU.', 'true', 'true');

--email = negovan.juric@email.com password = 4678
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Negovan', 'Jurić', 'negovan.juric@email.com', '$2b$12$vjm3vqJgJ8d1ii4dLwrX/uaig9OCtnM.9gXPWEvpoFWZ67CL3eoOy', 'true', 'true');

--email = ubavka.cizmic@email.com password = 2021
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Ubavka', 'Čizmić', 'ubavka.cizmic@email.com', '$2b$12$X9j4YlHxvmdfqxZEwljDreEXAmug9VFyXyrhtaahfefbw2XHLppli', 'true', 'true');

--email = zivoslava.jeknic@email.com password = 8856
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Živoslava', 'Jeknić', 'zivoslava.jeknic@email.com', '$2b$12$qP2nI1eUfSJnCbiwvDhB9uP4m9EeUxjM4y5oAkX8R68vtEtevFW/e', 'true', 'true');

--email = blagomir.piljikic@email.com password = 3425
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Blagomir', 'Piljikić', 'blagomir.piljikic@email.com', '$2b$12$oJSp0RX9Hldx9aJ7fa7qY.TldLXuezSEJfRTOu6VTnP82Vlmp.iUa', 'true', 'true');

--email = sretenka.glavcic@email.com password = 7953
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Sretenka', 'Glavčić', 'sretenka.glavcic@email.com', '$2b$12$bJkos0ItmMwlLsLZiUmG6OkA71vbQJWwdJ9mjKuFMQ8LK4VPw.Mqy', 'true', 'true');

--email = milun.sargic@email.com password = 3226
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Milun', 'Šargić', 'milun.sargic@email.com', '$2b$12$9yFtN3e12pDxIPqPPRZOse4fqQwM15TNz75J.JRK5ojMRbyybCRlK', 'true', 'true');

--email = drasko.pacaric@email.com password = 3781
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Draško', 'Pačarić', 'drasko.pacaric@email.com', '$2b$12$2Dobe1/cOkX4aR/R7x4VWODlmJfjF42rayVj68BdnrUbs81X89xUm', 'true', 'true');

--email = vujadin.takic@email.com password = 7527
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Vujadin', 'Takić', 'vujadin.takic@email.com', '$2b$12$whbSUsS4LaYMV0HVu1a64.O5SmwupZEUU0leCfvPI0S8LDe.ySNQ.', 'true', 'true');

--email = danojlo.karlicic@email.com password = 1012
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Danojlo', 'Karličić', 'danojlo.karlicic@email.com', '$2b$12$pCkdina7mjlH9lNazu1RTuUriIPnI47YqtiHLJvlk9SzSWQwjvvcS', 'true', 'true');

--email = tamara.mostic@email.com password = 4523
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Tamara', 'Mostić', 'tamara.mostic@email.com', '$2b$12$rJU2yzYJRT49TCOM66oMUe4wyilvFVntB1nD135xE5jDyMVvStwg.', 'true', 'true');

--email = hristivoje.mladzic@email.com password = 9846
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Hristivoje', 'Mladžić', 'hristivoje.mladzic@email.com', '$2b$12$B9Wiqsxh/m2luQ3vB8Idq.RdDXRKiSjZfAznQqAS8M0wiAN986Jg2', 'true', 'true');

--email = varvara.jovankic@email.com password = 8404
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Varvara', 'Jovankić', 'varvara.jovankic@email.com', '$2b$12$RsQsHi69llwzH9jdNsFjjejE3jYaTzjThfNbSocQpuIfSZOAT/ame', 'true', 'true');

--email = kosta.sundic@email.com password = 9572
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Kosta', 'Šundić', 'kosta.sundic@email.com', '$2b$12$PrDGwTlQyitOW96R8ELpUen0NLmbxA7nBqLd/TNNIG2VFOZM1oSfG', 'true', 'true');

--email = bogomir.demic@email.com password = 6103
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Bogomir', 'Demić', 'bogomir.demic@email.com', '$2b$12$plETt/gbtuIoows5zoirGudYQl7UVJ7rwQ6HMSJoTkm9GVDJew6GS', 'true', 'true');

--email = ignjatije.buncic@email.com password = 1234
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Ignjatije', 'Bunčić', 'ignjatije.buncic@email.com', '$2b$12$R84BqJCPXTRdMnfFi0umfuI88.2ANkbHX4KeVoF/R8uz31YTeNk9G', 'true', 'true');

--email = dobrila.cebic@email.com password = 2226
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Dobrila', 'Ćebić', 'dobrila.cebic@email.com', '$2b$12$0xW7WOrYGszHF1x7xSLgHuUa20QqOvMoucRh/wsRA5ZMLRmPHhALe', 'true', 'true');

--email = milentije.jovandic@email.com password = 7590
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Milentije', 'Jovandić', 'milentije.jovandic@email.com', '$2b$12$2j4.IVKUDgm1dbK3E/j5ducawCDjvk4qWwEJnXhplDvx5LWu0U/BO', 'true', 'true');

--email = srpko.supic@email.com password = 3769
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Srpko', 'Šupić', 'srpko.supic@email.com', '$2b$12$z9pUN4AluPXMHyf32y9ajeRzI2X5oMcrr4//XL9H8Etf68OU1g4gi', 'true', 'true');

--email = milija.curlic@email.com password = 9480
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Milija', 'Ćurlić', 'milija.curlic@email.com', '$2b$12$C2IPExHiEXOHDNH7TF7So.1maRT44XKnd44xghUDG1gSpraiH2IAm', 'true', 'true');

--email = tasko.nogic@email.com password = 5981
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Taško', 'Nogić', 'tasko.nogic@email.com', '$2b$12$5WzW02V0JPI5V8QK8C66FODd9F/S4K8BbO5Yk.BrmtZKoJuis5KCK', 'true', 'true');

--email = kosara.paravinic@email.com password = 3093
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Kosara', 'Paravinić', 'kosara.paravinic@email.com', '$2b$12$bGUj/HURYp7/.lzttiZdaupTYSyER1ZgKV/Iy9BoGeyt0xjuc74BS', 'true', 'true');

--email = david.bradonjic@email.com password = 8305
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'David', 'Bradonjić', 'david.bradonjic@email.com', '$2b$12$AGaCqdqfrJszGtOM6ocqHOIHNNuK1t2qjcoyHqiNpAyd9DqTkjUlu', 'true', 'true');

--email = stamenija.rapaic@email.com password = 7849
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Stamenija', 'Rapaić', 'stamenija.rapaic@email.com', '$2b$12$QnEXrhn/XGULd8jtsfN1ne2jIbCy1KqseAdxMZv.AtluUzrm49hEy', 'true', 'true');

--email = dositej.bavrlic@email.com password = 9188
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Dositej', 'Bavrlić', 'dositej.bavrlic@email.com', '$2b$12$854TaNa1pqE46haayB7F8eIyyaL3IYl1va6N4eNIt2cgeSd4XUBjy', 'true', 'true');

--email = miroslava.ploskic@email.com password = 3482
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Miroslava', 'Ploskić', 'miroslava.ploskic@email.com', '$2b$12$uM/avTECBHAOTFCC0MFw7OzqioBLkeqoCV/l3r.bzfF6yA/pkXrkW', 'true', 'true');

--email = jelika.stambolic@email.com password = 2015
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Jelika', 'Stambolić', 'jelika.stambolic@email.com', '$2b$12$PHFoM/FTSRfIdEAgJaUuBuGtjSg9E7LxQ5LGmwtkyGXJ58AGPe/VS', 'true', 'true');

--email = kirilo.zeravcic@email.com password = 5854
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Kirilo', 'Žeravčić', 'kirilo.zeravcic@email.com', '$2b$12$KjaeO6NSQO7CfDQ/Eg8KBu4Cwb4AIRlFb.e2oftgVmnzGdFrFkPb.', 'true', 'true');

--email = milka.vladusic@email.com password = 4120
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Milka', 'Vladušić', 'milka.vladusic@email.com', '$2b$12$9baOJlG8t.5MZ0QQzwptG.OFYDYZawle9x4w/fvnFLJTCZUGg.9.W', 'true', 'true');

--email = spasenija.mikulic@email.com password = 8544
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Spasenija', 'Mikulić', 'spasenija.mikulic@email.com', '$2b$12$mpNMi1LXElBZFclKSZaLseR3VZ0INAoz34fqS.kU4l3/xHQ7.WHu2', 'true', 'true');

--email = vlastimir.zlataric@email.com password = 8118
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Vlastimir', 'Zlatarić', 'vlastimir.zlataric@email.com', '$2b$12$uXfFl76bnsvI2WvepB/B7usbzuwesp9/DzviSt8Wwx3QSslqcUYQu', 'true', 'true');

--email = svetlana.plasic@email.com password = 6210
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Svetlana', 'Plašić', 'svetlana.plasic@email.com', '$2b$12$ZW2QHbXT97aLjvuQG28DrOpEDD9CRdGxyOErBE9zJvaWuNINM/hre', 'true', 'true');

--email = violeta.platanic@email.com password = 7379
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Violeta', 'Platanić', 'violeta.platanic@email.com', '$2b$12$sRAUXAilaXYnfOhts9F0oOyENA/F.sJU2cP7UQ6opPJcNyOhRjNbG', 'true', 'true');

--email = radenka.bastajic@email.com password = 4596
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Radenka', 'Bastajić', 'radenka.bastajic@email.com', '$2b$12$jU3InoLYIGzYoDRyCwq6tOXC.fLvPxGlnSeKx2xiTIf7LhfpC9oxm', 'true', 'true');

--email = takosava.marcic@email.com password = 8889
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Takosava', 'Marčić', 'takosava.marcic@email.com', '$2b$12$aazdQy3KIVLSYNMmJ6fpHOCrWfa/MarUkALBtGrly75ap5mhR3pZy', 'true', 'true');

--email = novica.sevic@email.com password = 4863
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Novica', 'Šević', 'novica.sevic@email.com', '$2b$12$7GjLCZ69HOzetPRQVJN9Duplu.Wt5flrUr1DdaPdI9.rEzlsiePN6', 'true', 'true');

--email = nevenka.brancic@email.com password = 3524
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Nevenka', 'Brančić', 'nevenka.brancic@email.com', '$2b$12$vm9kdjsmOwrjACQ4sv5h/.VoCeJSPRJasmgYB/bE1W0nV/z27yZCe', 'true', 'true');

--email = milija.simeunic@email.com password = 4538
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Milija', 'Simeunić', 'milija.simeunic@email.com', '$2b$12$Vn0dVgo7C9Zcez3OULwOG.eI2OaHcvEm//o8jY4UPZTlGHuuEHAvq', 'true', 'true');

--email = zvezdana.gambelic@email.com password = 3037
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Zvezdana', 'Gambelić', 'zvezdana.gambelic@email.com', '$2b$12$j1Tpo3.7cgkrzDh4/YQTn.OyAJvtv.R3mD2/JSC4odV6c8kp4KCFW', 'true', 'true');

--email = radomirka.simic@email.com password = 5918
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Radomirka', 'Simić', 'radomirka.simic@email.com', '$2b$12$I/uU1tlodNnoVYSBm32D0e/wNesFAcAOCJHzlePozbdYySFrONj/W', 'true', 'true');

--email = velinka.kraljacic@email.com password = 8695
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Velinka', 'Kraljačić', 'velinka.kraljacic@email.com', '$2b$12$vkEszCbfMYnIebBXNehwu.5H74uYycI3mzeU4wGsOGRUXNBsWgZmO', 'true', 'true');

--email = miladin.sijacic@email.com password = 3355
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Miladin', 'Šijačić', 'miladin.sijacic@email.com', '$2b$12$rvYyJ4vQtHUSYaxCznCOauFSkYGrXvywZHHUe3vP86zKEBCwl8evS', 'true', 'true');

--email = ivica.brukic@email.com password = 6913
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Ivica', 'Brukić', 'ivica.brukic@email.com', '$2b$12$1D5xj765cqoNIRpLJo/OrOCW8Q36jjb/r8quUD8djHRmNVfxaj7e2', 'true', 'true');

--email = ekatarina.mijalcic@email.com password = 1152
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Ekatarina', 'Mijalčić', 'ekatarina.mijalcic@email.com', '$2b$12$IacfFZQiVGeRGKFtdIiLNeWGQt9/jVjZAhY4tH53cluR.cgcuujEy', 'true', 'true');

--email = milorad.klevernic@email.com password = 2882
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Milorad', 'Klevernić', 'milorad.klevernic@email.com', '$2b$12$N9Oq7.tVN2LALNDS0Ym6m.NKX6vkGPGkWUOe/8jx3aA6xHQ/4Gh.m', 'true', 'true');

--email = pauna.vulezic@email.com password = 1836
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Pauna', 'Vulezić', 'pauna.vulezic@email.com', '$2b$12$.l.LQ2BMwqNrWv.Hk4ZPb.XPFfEMiaHXBqBnQyPCaguZ36CxFAzFC', 'true', 'true');

--email = borivoje.vojicic@email.com password = 4501
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Borivoje', 'Vojičić', 'borivoje.vojicic@email.com', '$2b$12$4YEYBsuHnBozBLPnX.tKEuZW6pign1e.Ytx99I78rPPgOuwXRNaom', 'true', 'true');

--email = hariton.bozic@email.com password = 2714
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Hariton', 'Božić', 'hariton.bozic@email.com', '$2b$12$nxPlcrmM5fIl4Nazg74yAeeKP5iENW6MeIfdGotj/T1L0PPdk/3Fy', 'true', 'true');

--email = borivoje.jesic@email.com password = 7114
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Borivoje', 'Ješić', 'borivoje.jesic@email.com', '$2b$12$qUlZ.DiY8AClumH9cqzN2e7WsIo33JgOP8FeZPGt1wTL8Rl/XSD2a', 'true', 'true');

--email = hariton.milinic@email.com password = 3466
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Hariton', 'Milinić', 'hariton.milinic@email.com', '$2b$12$AD0LYnKJKCIAd.ZulCrKKuxoYPtS922RL2dBJIdeKFNDfzxiBcu.G', 'true', 'true');

--email = novko.mosic@email.com password = 4686
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Novko', 'Mosić', 'novko.mosic@email.com', '$2b$12$n1c6UVD1Yv7COkqG8qfwy.gO/cMBYSGliPC71cUkMYyF1ZjlRCHxy', 'true', 'true');

--email = hranislavka.mancic@email.com password = 1670
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Hranislavka', 'Mančić', 'hranislavka.mancic@email.com', '$2b$12$d0IIp4leeHxO5MiohbYIOe6awmyGKsRsyIuwhaiT89vB5rlzsHkoi', 'true', 'true');

--email = sonja.mitranic@email.com password = 2211
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Sonja', 'Mitranić', 'sonja.mitranic@email.com', '$2b$12$1Rr2HvcONNO12h.TIxxk8eAh8sbKROBeLNqJzsdQ7XeoYnGDrn84e', 'true', 'true');

--email = gorica.nejkic@email.com password = 6775
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Gorica', 'Nejkić', 'gorica.nejkic@email.com', '$2b$12$zmCwUAezRyeHkMITMogOXOz3FjtuSZ0VVKs8d.53aaw/VGGgC5LmG', 'true', 'true');

--email = srpko.stevic@email.com password = 6915
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Srpko', 'Stević', 'srpko.stevic@email.com', '$2b$12$QhtudZsrk9QagOHuHxcv1eIDnoGoC4kobIWKM3I5W/crY1/5QN.Ae', 'true', 'true');

--email = milentije.dimitric@email.com password = 5114
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Milentije', 'Dimitrić', 'milentije.dimitric@email.com', '$2b$12$wP/pi5iHfdLk0eni9pvsie0wJGIHucQ5XWCbL/rhtAjsaoU3RbmIa', 'true', 'true');

--email = radojla.rakezic@email.com password = 3704
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Radojla', 'Rakezić', 'radojla.rakezic@email.com', '$2b$12$Z0Uhz8/OqEBmEqY3NqP1W.lPCtkBhor6bfaYBNYx55Nzo7AWbXVg6', 'true', 'true');

--email = caka.drangic@email.com password = 8124
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Caka', 'Drangić', 'caka.drangic@email.com', '$2b$12$r6S5genH/NMDqFkTJUJcguB65VNiwkEyceY5JcHTsFeRAkAbzUAKC', 'true', 'true');

--email = vasilija.milovankic@email.com password = 1989
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Vasilija', 'Milovankić', 'vasilija.milovankic@email.com', '$2b$12$iTo93qolbRYrlRF40a.R2eIgx5Bt9RQA6HgctVr5pmhhQsncRhVai', 'true', 'true');

--email = sonja.buzaretic@email.com password = 4667
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Sonja', 'Buzaretić', 'sonja.buzaretic@email.com', '$2b$12$5h/iBRbZO3o7VVZOKlVDteuPT2edlHpFP5szRC2h1yNj9UPm6cPqq', 'true', 'true');

--email = sotir.ilkic@email.com password = 5916
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Sotir', 'Ilkić', 'sotir.ilkic@email.com', '$2b$12$.yq8zifp38c.L6bxj8YzXOQIyLxKP65odgpoHTslQDqwyGEvYSS5O', 'true', 'true');

--email = momir.nejkic@email.com password = 6592
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Momir', 'Nejkić', 'momir.nejkic@email.com', '$2b$12$26RdGlT1l3bvyVl4lJ0OTuMljiojlGn0OUywX/xXKV8THWVEky3P.', 'true', 'true');

--email = njegomir.djikic@email.com password = 7802
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Njegomir', 'Đikić', 'njegomir.djikic@email.com', '$2b$12$C7I5qF1JcGxNsCVtKPEzEOjAYeTxbmAc/S5lK4ekRIR4rJ6T0i3QG', 'true', 'true');

--email = tosa.bodrozic@email.com password = 3914
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Toša', 'Bodrožić', 'tosa.bodrozic@email.com', '$2b$12$R3aWiegxoU1EbNS7/o1tfuirm4esDD04a24BZFc0I5Q1dlMU7NQVO', 'true', 'true');

--email = tiosav.krmpotic@email.com password = 8353
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Tiosav', 'Krmpotić', 'tiosav.krmpotic@email.com', '$2b$12$lzpnwvMta2BSMJsBJLCNyuXQFNn918LPukMWqE8mdRs.LTX09Jo16', 'true', 'true');

--email = jerotije.krivacic@email.com password = 3579
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Jerotije', 'Krivačić', 'jerotije.krivacic@email.com', '$2b$12$nucqVSlwMDOMwTKsGMfk9u.AmGMXbicX6noodVRZh7nQ6lkVjUk/e', 'true', 'true');

--email = sibinka.subotic@email.com password = 8429
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Sibinka', 'Subotić', 'sibinka.subotic@email.com', '$2b$12$E5p/uyTHiaQUeikMci5/YOmbILbUmXWZwNB/G4Vniki5g46rPNUMi', 'true', 'true');

--email = strahinja.stoicic@email.com password = 7762
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Strahinja', 'Stoičić', 'strahinja.stoicic@email.com', '$2b$12$iFjZ2HNpYVExBAvUWt2jA.kayI06p25i760OqNaYf.K45QwjCj2Rq', 'true', 'true');

--email = teodosije.bocokic@email.com password = 7650
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Teodosije', 'Bocokić', 'teodosije.bocokic@email.com', '$2b$12$nawyHWNfnCcF6nFt8fQC7.TMRhKqLwNwNdV45VTWbncPoIcqcpH0m', 'true', 'true');

--email = fanija.kapesic@email.com password = 9274
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Fanija', 'Kapešić', 'fanija.kapesic@email.com', '$2b$12$WkUXMLMysTz.QuaR1i30ceOyisV.JD5TaJKDwmO/tiwe0V7hyYAhu', 'true', 'true');

--email = tatjana.ankucic@email.com password = 9735
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Tatjana', 'Ankucić', 'tatjana.ankucic@email.com', '$2b$12$spa/5tFzEHt2Ux8.z81z4ewzYpgc4s3pOuBda.b4ZFeSbYf/.BoGe', 'true', 'true');

--email = radoljub.sevic@email.com password = 5295
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Radoljub', 'Šević', 'radoljub.sevic@email.com', '$2b$12$p5EpH3By8v0CPdbP1zcU2uyBrFi0jjEbq5sA9YdOcTR8NTWX1IATK', 'true', 'true');

--email = hranislav.mitic@email.com password = 4615
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Hranislav', 'Mitić', 'hranislav.mitic@email.com', '$2b$12$QEaLOl5a6jzn8Lh9UIqAduXeSTmXiXx3d9llKPrihw7Qq.vMukbYe', 'true', 'true');

--email = dragana.rabadzic@email.com password = 3467
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Dragana', 'Rabadžić', 'dragana.rabadzic@email.com', '$2b$12$w9fTmYowlvt0iLQoXLLuU.MuweeLmrUpMgjSVgWwAcS.fCgKRs.sG', 'true', 'true');

--email = radivoje.rakitic@email.com password = 6571
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Radivoje', 'Rakitić', 'radivoje.rakitic@email.com', '$2b$12$u1aVjljkjDTp4RKmbkVBVucUp2ZPvWyfTi3nbINxVkROzmZycCPeS', 'true', 'true');

--email = jelka.sopic@email.com password = 3762
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Jelka', 'Sopić', 'jelka.sopic@email.com', '$2b$12$.CNihremgwa1xl8mAlUt.uF2q94PKnAO5YYNMwQwNlrDxpI7NNQbe', 'true', 'true');

--email = petra.vasalic@email.com password = 7833
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Petra', 'Vašalić', 'petra.vasalic@email.com', '$2b$12$yOrX9ofwHwObVlpZ8sqhrOKhwuSDju9EEio26K38MdGBOAj0qccoK', 'true', 'true');

--email = drgorad.pavicic@email.com password = 6223
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Drgorad', 'Pavičić', 'drgorad.pavicic@email.com', '$2b$12$PAHL.nb2CSo9fuW6AMxC0ufvBt1dsWzBiYeamGXPSzRfFspIb9QG6', 'true', 'true');

--email = leonora.macic@email.com password = 6830
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Leonora', 'Mačić', 'leonora.macic@email.com', '$2b$12$YpiMS8ikO9bruxU158Z/iuzWkU6Lc7EHUWJ.Ysh3GhU0zqzMb2rRW', 'true', 'true');

--email = drazo.dzelebdzic@email.com password = 6601
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Dražo', 'Dželebdžić', 'drazo.dzelebdzic@email.com', '$2b$12$xw8qsKNlnZebikela5yTFOmf.KXgU3IHiZoenFD4zkdK15Bc/o/yK', 'true', 'true');

--email = vlastimirka.drincic@email.com password = 8880
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Vlastimirka', 'Drinčić', 'vlastimirka.drincic@email.com', '$2b$12$rJDYt9rVjck2HsONiVa92.Zp1gtTag8q7/l75xiul5WjUtSf2erym', 'true', 'true');

--email = desanka.kosaric@email.com password = 4858
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Desanka', 'Košarić', 'desanka.kosaric@email.com', '$2b$12$dDzuVL.Nb65rsD1gm09qLORoLLsEKJ7e0GBvmviILyEaL1KviIdYO', 'true', 'true');

--email = vasilija.levnaic@email.com password = 2480
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Vasilija', 'Levnaić', 'vasilija.levnaic@email.com', '$2b$12$5nTBkBWQFC8u4j8ZkDGxwONQyjqVYAW7x.g2Gj7B5z3aPVdFA8BAa', 'true', 'true');

--email = teofan.guberinic@email.com password = 3716
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Teofan', 'Guberinić', 'teofan.guberinic@email.com', '$2b$12$NWu0BH4JEk1epDFdaeUrleaozjwvZB9riTgkIFRNJe2OXo9vMOtfG', 'true', 'true');

--email = milanko.erdelic@email.com password = 1191
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Milanko', 'Erdelić', 'milanko.erdelic@email.com', '$2b$12$WfAgiBTn.vNBo0fuUpbCu.LfV4j3wolkpO5ApJBoSJ3lypSE7prLy', 'true', 'true');

--email = roksanda.kulezic@email.com password = 6892
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Roksanda', 'Kulezić', 'roksanda.kulezic@email.com', '$2b$12$KlkrQOT37R42I2IxAS3V3u0LserEQ9SgQf0C4NOLAMBLdM48srjzC', 'true', 'true');

--email = fanija.videkanjic@email.com password = 6440
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Fanija', 'Videkanjić', 'fanija.videkanjic@email.com', '$2b$12$wyWKkHHW/pvgntvlqmmJ2e0oo1Lc6i2exbrPGmFqoMkMUjZcUdJXC', 'true', 'true');

--email = leonida.bradonjic@email.com password = 7674
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Leonida', 'Bradonjić', 'leonida.bradonjic@email.com', '$2b$12$.QYBxzF5VM.U7m6LmwydcOGaKWHn/HhfvTKnFD1S/Pmc8Bb5tJzBe', 'true', 'true');

--email = tomislav.sorgic@email.com password = 7761
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Tomislav', 'Šorgić', 'tomislav.sorgic@email.com', '$2b$12$9s5fuRI5z7N3zZDn8iMwjeEISWXCZseQKIOnOHlwx31XYhyce5HQS', 'true', 'true');

--email = julka.ljaljic@email.com password = 5292
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Julka', 'Ljaljić', 'julka.ljaljic@email.com', '$2b$12$6YGqVAvm0jS.yoYTJ/9rbeRkrKLPADL2XpCudDev9DhVjf3ggzVYq', 'true', 'true');

--email = stevka.zikic@email.com password = 9915
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Stevka', 'Žikić', 'stevka.zikic@email.com', '$2b$12$PduJo5P6V7YNE5QC2Z1.IOUIfIc2/5nbp0v4KF2iMx0q/5v.6vRbS', 'true', 'true');

--email = radoslava.anicic@email.com password = 6917
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Radoslava', 'Aničić', 'radoslava.anicic@email.com', '$2b$12$hXRrieOCuWQse6/2yAl3WuUCTEeAAUIETgCYLuKht7/ylxrZQpN2y', 'true', 'true');

--email = cuba.biljic@email.com password = 6695
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Ćuba', 'Biljić', 'cuba.biljic@email.com', '$2b$12$JkC1FxzcE5LW9wKI4SdVgu3/xzbLoCPgfEVzAvxCkBa7vajfKYQWa', 'true', 'true');

--email = suzana.gavranic@email.com password = 3622
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Suzana', 'Gavranić', 'suzana.gavranic@email.com', '$2b$12$HSPmeP7uiBO7BaYodoRliOffAzvs0MSrTmmieJcBK9biBGirNEzFq', 'true', 'true');

--email = petronije.guconic@email.com password = 5597
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Petronije', 'Guconić', 'petronije.guconic@email.com', '$2b$12$S7etHINqkswTIu9HP9gzmuyKGOiefRBC87Xj7m/xbBkOhr1VTVCRi', 'true', 'true');

--email = bratislav.doklestic@email.com password = 5920
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Bratislav', 'Doklestić', 'bratislav.doklestic@email.com', '$2b$12$AboZnqWNjTL5XqYkNbOX1.BRHyLkcxN3R9QK3xp7RY3C3rdbbIwIG', 'true', 'true');

--email = anka.zoricic@email.com password = 1047
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Anka', 'Zoričić', 'anka.zoricic@email.com', '$2b$12$IH10R7oiFDXVvi3QMAMDS.nOBdn6xon6QD8odguFPQxorjXJPA5j.', 'true', 'true');

--email = janovka.tomincic@email.com password = 4630
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Janovka', 'Tominčić', 'janovka.tomincic@email.com', '$2b$12$aMOgAdpm/RVEIR9PckF7jOKPu9soqkLhOUl3hg3UFCT7s2sO9MsQy', 'true', 'true');

--email = njegosav.scekic@email.com password = 3295
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Njegosav', 'Šćekić', 'njegosav.scekic@email.com', '$2b$12$BI5CCfvwu6rq5TW2LrpFuOCqarojw03waijsyZ8rzBUKSoA/gwdNW', 'true', 'true');

--email = ruza.bakajlic@email.com password = 1984
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Ruža', 'Bakajlić', 'ruza.bakajlic@email.com', '$2b$12$UjZHNNhvov.CWsTd758t6uhAnQHiy04BudyK7EOP4qsYhRDAaj4Qu', 'true', 'true');

--email = drazo.mirotic@email.com password = 1600
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Dražo', 'Mirotić', 'drazo.mirotic@email.com', '$2b$12$8KEkMD1PQYOXMp3w47eEk.CGUkW1cSORilr8YaS5.LiMDaI7lBoR6', 'true', 'true');

--email = milica.tulencic@email.com password = 9519
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Milica', 'Tulenčić', 'milica.tulencic@email.com', '$2b$12$WBMvRktdFdJABy5b2W2gVunQG0Go3/f9jxitrLd3d/3dW1w9q41qK', 'true', 'true');

--email = kirilo.grandic@email.com password = 2399
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Kirilo', 'Grandić', 'kirilo.grandic@email.com', '$2b$12$5gIo1Bu1SNjKUxocMl7R6u2w.2cw2szDLgt4ieYhyovhmu6Mu0hS.', 'true', 'true');

--email = viseslava.erkic@email.com password = 7413
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Višeslava', 'Erkić', 'viseslava.erkic@email.com', '$2b$12$1HL6Z.ukcDVZT4Y2bgkp1O072KCl/fz2SMHf4J1hdJKpoyd24h8d6', 'true', 'true');

--email = negoslav.uvalic@email.com password = 7250
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Negoslav', 'Uvalić', 'negoslav.uvalic@email.com', '$2b$12$Iw8I56VhKJITK6wWe2EAAu8S6cxjE5TDPASFiBKtKKEJWU3x7GoeG', 'true', 'true');

--email = stanojlo.alavantic@email.com password = 7727
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Stanojlo', 'Alavantić', 'stanojlo.alavantic@email.com', '$2b$12$WTAAQtlijUbThmQY3wf9SOS/s98LPmK1ZC4zubil0MtM0Mr5n.zIq', 'true', 'true');

--email = vladeta.stavric@email.com password = 2091
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Vladeta', 'Stavrić', 'vladeta.stavric@email.com', '$2b$12$MvkYSBY6gHbXcwEq4zDR.eus1lWixK6DyiPg6O1WcFy1j.pOtPS/m', 'true', 'true');

--email = stanojlo.kosoric@email.com password = 1818
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Stanojlo', 'Kosorić', 'stanojlo.kosoric@email.com', '$2b$12$IMJRKPowjG3lYhgL2IReeuBT0qdwMX/avzFznQM5k0lxSk7pPgzVC', 'true', 'true');

--email = aksentije.bodic@email.com password = 6371
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Aksentije', 'Bodić', 'aksentije.bodic@email.com', '$2b$12$XkTbtiXZnD8iGV4NrOjffO47LOQLlwPTYYax9Y6BOxtnfAhMZCOLK', 'true', 'true');

--email = dragomir.pantic@email.com password = 6244
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Dragomir', 'Pantić', 'dragomir.pantic@email.com', '$2b$12$MTKVY6lDmJVpmh5.Titstey2lx0W7vBTddBbfCVjps1J5YSTfhKcy', 'true', 'true');

--email = sofija.ljuskic@email.com password = 2269
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Sofija', 'Ljuškić', 'sofija.ljuskic@email.com', '$2b$12$uiD6JvMrN8gTADbVzHinXezce5VA134EoSBbSffgG7NwJ58Yq2yie', 'true', 'true');

--email = kristivoje.deronjic@email.com password = 4242
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Kristivoje', 'Deronjić', 'kristivoje.deronjic@email.com', '$2b$12$9mKCNU6r2l.jvhRNk1kBseTVQ4.UeZJlpJxVYIOuUa214EFWc0CSy', 'true', 'true');

--email = stanko.keckic@email.com password = 2149
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Stanko', 'Kečkić', 'stanko.keckic@email.com', '$2b$12$JQphID9fR3AmtNUfU9uXWe5Bm/sdEslFIJHsTrhr/XjFX1wC8yrV.', 'true', 'true');

--email = danica.talic@email.com password = 7400
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Danica', 'Talić', 'danica.talic@email.com', '$2b$12$XJDwWKF6HT1rkrB80z9QyOlE4FfNFQX9.9sC4n6oYRVcdJ.nrOB9e', 'true', 'true');

--email = drgorad.djenisic@email.com password = 1956
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Drgorad', 'Đenisić', 'drgorad.djenisic@email.com', '$2b$12$KyC39Lnp/5KgmIf3j3jnYeB2zjh0SxjEpfe4BlEbUvPWmUEl3YGsO', 'true', 'true');

--email = djurica.dubljanic@email.com password = 1550
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Đurica', 'Dubljanić', 'djurica.dubljanic@email.com', '$2b$12$Bj1Grj8JBrNHsAKKjDg7Puy4.TY.7KYsbbMzCNcjm84g0cEjqUFg6', 'true', 'true');

--email = kirilo.dzadzic@email.com password = 1513
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Kirilo', 'Džadžić', 'kirilo.dzadzic@email.com', '$2b$12$zusbRhYKLvAaLr/8eQwPge/WRndZCP75T81dySA3Ys47TJN3RgRum', 'true', 'true');

--email = vojislav.kursumdzic@email.com password = 8191
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Vojislav', 'Kuršumdžić', 'vojislav.kursumdzic@email.com', '$2b$12$/lpakpg4qAyi3eRa0gUhFOyQ7nA5WH21Qll6CR.hapqKE27Td9I6C', 'true', 'true');

--email = hranislav.bavrlic@email.com password = 8497
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Hranislav', 'Bavrlić', 'hranislav.bavrlic@email.com', '$2b$12$/q8tO.ys8Zh7fSd6sBiJ/ur3ASJtCIVUu/.fTND7n8lAvKvZwfBz2', 'true', 'true');

--email = ratimir.avalic@email.com password = 5456
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Ratimir', 'Avalić', 'ratimir.avalic@email.com', '$2b$12$2KvIR.R1OB6631cJnw1tqObt2CuLHQ4JuPSjtd5VvmrG/73CxnVEa', 'true', 'true');

--email = jeremije.jelkic@email.com password = 6847
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Jeremije', 'Jelkić', 'jeremije.jelkic@email.com', '$2b$12$EtFYU2DAejcZ2h6z4y3YxeciR.VfinWqlzpa9HUk0bSf9ydvDSx7q', 'true', 'true');

--email = radule.kitonjic@email.com password = 8105
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Radule', 'Kitonjić', 'radule.kitonjic@email.com', '$2b$12$yxh8feG1PLkRveE5kC55/en0DSkv5bVbk5oVxeevUBXk4GSJ4rw3q', 'true', 'true');

--email = mijat.igic@email.com password = 4044
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Mijat', 'Igić', 'mijat.igic@email.com', '$2b$12$qO.kxoJs9lYJNtH/iiVOpOoaUucLJbGnaa/2ayHRPE6524Z3xsQVu', 'true', 'true');

--email = milijana.strojic@email.com password = 5780
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Milijana', 'Strojić', 'milijana.strojic@email.com', '$2b$12$MfxCssKARpXGVQ4TL8UKFe8iA5zkHUOtkbF07GJLxFwLluPO.preO', 'true', 'true');

--email = teofan.grcinic@email.com password = 8137
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Teofan', 'Grcinić', 'teofan.grcinic@email.com', '$2b$12$1xTVGHa9Ra/hogdVf232Uudc6KQFa8qiPTtSmVM15QslQbXYY05LC', 'true', 'true');

--email = tosa.ljubisic@email.com password = 1780
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Toša', 'Ljubišić', 'tosa.ljubisic@email.com', '$2b$12$llrK1CM90NwMGNildTWcmeecXEk/WATE7d3OLYSJHZR9eekQBtKWK', 'true', 'true');

--email = trifun.cvejic@email.com password = 2916
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Trifun', 'Cvejić', 'trifun.cvejic@email.com', '$2b$12$xyRkOy7RP6w/8oTBkxRt/OUeTQi.VqiD8AdYUIb/uqwpVrAY0Zc3K', 'true', 'true');

--email = sofija.binic@email.com password = 1684
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Sofija', 'Binić', 'sofija.binic@email.com', '$2b$12$57D.J1oxvre0Eu8xfXlbe.YF65luUnGCjUANXPPR1BkLUkcWu1FeK', 'true', 'true');

--email = ozrenka.dzunic@email.com password = 8063
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Ozrenka', 'Džunić', 'ozrenka.dzunic@email.com', '$2b$12$oFzKJZz7AK.1OZapFknVee.SiImtNgd0ZyciuQxPUMfqnrS14TOF2', 'true', 'true');

--email = roksanda.rusic@email.com password = 4142
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Roksanda', 'Rusić', 'roksanda.rusic@email.com', '$2b$12$o2tcui/mEjOl4fTDeTS/G.EDl5yPemNzdkPBl.umWlHB.l0pFqziq', 'true', 'true');

--email = ceda.cemerikic@email.com password = 8515
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Čeda', 'Čemerikić', 'ceda.cemerikic@email.com', '$2b$12$gjEWWufZEcjX1iAHB4FVLeGEQRCpnEeRyMsJmaoR9yXzyHw1C6O06', 'true', 'true');

--email = obren.makivic@email.com password = 8298
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Obren', 'Makivić', 'obren.makivic@email.com', '$2b$12$SHlgLcoO0sjPJHPdj0rOy.kt9tcVul1SGKqM0a2esVZPqKq/LRItC', 'true', 'true');

--email = jeremije.jergic@email.com password = 3480
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Jeremije', 'Jergić', 'jeremije.jergic@email.com', '$2b$12$aXBKdsCu1FUbW.fcapkqsOTWJAfv1oj3nas2XtOa0rQpMAZszsn1K', 'true', 'true');

--email = rados.palangetic@email.com password = 7643
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Radoš', 'Palangetić', 'rados.palangetic@email.com', '$2b$12$4bIxim1U17Zziyly4AZVQO2.w/lFKpsIDu9DrM/Y.9ugJNmnYrX1K', 'true', 'true');

--email = jakov.mijacic@email.com password = 6062
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Jakov', 'Mijačić', 'jakov.mijacic@email.com', '$2b$12$a2OnyoYrhYqdMBxx/LOSouVbFBtSWe5k/aRLVtbXjpoUasF6Q09iG', 'true', 'true');

--email = ljiljana.tadic@email.com password = 3739
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Ljiljana', 'Tadić', 'ljiljana.tadic@email.com', '$2b$12$5XBKOuz.sDpvHbZdNtT54.KXVhAB08KEL6EyJqAPVTbn65.Gt8A6G', 'true', 'true');

--email = olgica.curlic@email.com password = 7820
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Olgica', 'Ćurlić', 'olgica.curlic@email.com', '$2b$12$tqcEus49B1igiM7zYXECv.UHUnDqhoeQny4TpD2wBC4cvALWpGL92', 'true', 'true');

--email = sisko.jolicic@email.com password = 3086
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Šiško', 'Joličić', 'sisko.jolicic@email.com', '$2b$12$QQ7eLAP0YCQnPwIcoj3mF.Bb7Jw2RZoxzCIVC66o2MuGFd0dqnhYK', 'true', 'true');

--email = slaven.vasic@email.com password = 2745
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Slaven', 'Vasić', 'slaven.vasic@email.com', '$2b$12$owcMoJaIs97Dlppx0vMPpONAbR7uzy/UaSu9dOaJ8mLX5dAcWRf.G', 'true', 'true');

--email = stamena.bolic@email.com password = 9059
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Stamena', 'Bolić', 'stamena.bolic@email.com', '$2b$12$LZjJzEx4ysT38XlwhA5gcOBUuDKHuSA2qO3ShIFvQ4awI7ggucwQu', 'true', 'true');

--email = ostoja.icelic@email.com password = 9614
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Ostoja', 'Ičelić', 'ostoja.icelic@email.com', '$2b$12$mfHMfQmbjwdcuBBLpEGAaurCo4mwQFRujR1gnHOUv1DQ1NhCVHKrG', 'true', 'true');

--email = djuradj.leposavic@email.com password = 5124
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Đurađ', 'Leposavić', 'djuradj.leposavic@email.com', '$2b$12$Odg/57pOQWtM.TzttWgt7Ow8dQDDI2UZtrinI9HivhhebAoHN6trq', 'true', 'true');

--email = zlatomirka.tutoric@email.com password = 8031
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Zlatomirka', 'Tutorić', 'zlatomirka.tutoric@email.com', '$2b$12$SIalM79aVo0JPR.whN9ps.mONqrzUv7WsqHOS9jp7uh3z2Sumh0Yi', 'true', 'true');

--email = stojmen.tumaric@email.com password = 4835
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Stojmen', 'Tumarić', 'stojmen.tumaric@email.com', '$2b$12$AqC9.aoFvyc9Vh/sKhzSme0Y/jg6vfkfya3e900gfj4kEgo3rF5Oa', 'true', 'true');

--email = lazar.bojcic@email.com password = 7323
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Lazar', 'Bojčić', 'lazar.bojcic@email.com', '$2b$12$f401KooW/EVQEcFJhBbdx.FmbgN6cpmg9YZkgclqG0vpJIdlg0pxu', 'true', 'true');

--email = milija.kopcalic@email.com password = 1379
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Milija', 'Kopčalić', 'milija.kopcalic@email.com', '$2b$12$U.RUDX9ND69.FkH1rr3cs.TULAKCgYh4kOZmj5C2wNSi3sZazqpy2', 'true', 'true');

--email = vesna.folic@email.com password = 9367
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Vesna', 'Folić', 'vesna.folic@email.com', '$2b$12$HrrbKMj7vWhC/MtAlv6sKe1ogmRSYQA7Jz0XQYRkVbC5zI5rXSfki', 'true', 'true');

--email = toplica.zoric@email.com password = 7077
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Toplica', 'Žorić', 'toplica.zoric@email.com', '$2b$12$bs5dl37mLEUzC9AgbHYLJ.LLPEjheHA/heWuC52LWXH8n66QtYB7C', 'true', 'true');

--email = filotej.lukic@email.com password = 1055
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Filotej', 'Lukić', 'filotej.lukic@email.com', '$2b$12$Et2p/YOl5DEYTwvp1aWBYuZ5t3wY53nW7bJuibYaGhGh68OjeMp62', 'true', 'true');

--email = evica.becic@email.com password = 6121
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Evica', 'Bećić', 'evica.becic@email.com', '$2b$12$yysAba0a6VlpJIDeMOV6NOEJ3i9yzU3VkolhXHdUYaB9mFKgQn7KG', 'true', 'true');

--email = cirilo.damjanic@email.com password = 6007
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Ćirilo', 'Damjanić', 'cirilo.damjanic@email.com', '$2b$12$o4JnETG6Cn0RqaBvoMXP2.XhGMpZzIwO6b1sxJgdISQk9mCtCiDN6', 'true', 'true');

--email = teodosije.jonicic@email.com password = 1891
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Teodosije', 'Joničić', 'teodosije.jonicic@email.com', '$2b$12$AsKmr5UyLSoQOo7/XNG8buOSsWpmHcWtVT4ueeiNC3XsP83.MqF26', 'true', 'true');

--email = mosa.kocic@email.com password = 2223
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Moša', 'Kočić', 'mosa.kocic@email.com', '$2b$12$lJymt/eJniUpEjT7XoBbKu.loKKFPqQp5J2g6GwC6OtwXJ13CZQcW', 'true', 'true');

--email = soja.borovinic@email.com password = 2966
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Soja', 'Borovinić', 'soja.borovinic@email.com', '$2b$12$DFH941LFEoiS1/G/QWVV1OnYRN5MgLycDPohWm1e0uSSqeLXOF.R.', 'true', 'true');

--email = ljeposava.smiljkic@email.com password = 1993
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Ljeposava', 'Smiljkić', 'ljeposava.smiljkic@email.com', '$2b$12$2LeXCzN.a3uAYOBZpMF38.X2if6QFsjbhPz9hl0mQ5z1wT3c2/3pG', 'true', 'true');

--email = ubavka.kukaric@email.com password = 3331
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Ubavka', 'Kukarić', 'ubavka.kukaric@email.com', '$2b$12$nnOSliXzwYiZU4vzyoRhIeK6cCyN9T7DeYImeU/1MyM6vHVXASUBq', 'true', 'true');

--email = zora.puletic@email.com password = 9608
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Zora', 'Puletić', 'zora.puletic@email.com', '$2b$12$zEuTct2qCggyfj8A1vIOZ.9x/EpZgsTcfIfqYM7mc6MVwsrf1pejy', 'true', 'true');

--email = evica.skrnjic@email.com password = 8419
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Evica', 'Škrnjić', 'evica.skrnjic@email.com', '$2b$12$XYxgNiMbBOtxojz3CyJXLeKulnWSMILTRqu38RPPDStubQfQRSPzG', 'true', 'true');

--email = vasilija.tanic@email.com password = 1691
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Vasilija', 'Tanić', 'vasilija.tanic@email.com', '$2b$12$3pUNM7SgKRRcKz/r7/bToeAzE/uiCP5BEDZtXkThbb/WoZDluSjn6', 'true', 'true');

--email = zivko.trifunjagic@email.com password = 1760
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Živko', 'Trifunjagić', 'zivko.trifunjagic@email.com', '$2b$12$uYf6irzvlXI8xmvBhFV0PudPkKtJfiPyPp29pmCZG98BUu7FUcl3a', 'true', 'true');

--email = rodoljub.coguric@email.com password = 3426
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Rodoljub', 'Čogurić', 'rodoljub.coguric@email.com', '$2b$12$2JFvnWdXYxVzavU.1Yh0lel5N9/cgDEqi63fLfPA8CIbFVkVaPFOa', 'true', 'true');

--email = sandra.gosnjic@email.com password = 6572
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Sandra', 'Gošnjić', 'sandra.gosnjic@email.com', '$2b$12$RSCjXcbrN6gfOFG.os9xBe/T2PYjp94587n1Q9b2wzq/miTM6Hg5S', 'true', 'true');

--email = jugomir.ziletic@email.com password = 5773
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Jugomir', 'Žiletić', 'jugomir.ziletic@email.com', '$2b$12$62cC8Dvubz84s1LR.pl3/uiGvGCrekFgs.HAS075u4obUo1o/UQ2a', 'true', 'true');

--email = velinka.baveljic@email.com password = 7778
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Velinka', 'Baveljić', 'velinka.baveljic@email.com', '$2b$12$dROkjrAlon6/h/Iy7.v8veNmK3YlCFL9LBg6o2yFRcQECD1vSvEXi', 'true', 'true');

--email = ivan.saramandic@email.com password = 5467
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Ivan', 'Saramandić', 'ivan.saramandic@email.com', '$2b$12$d/XDoKKCGVj26SJNTHAHeOpl5tzPGmJNcMuOfn3Pvrt1ef1Q7YcwG', 'true', 'true');

--email = elena.krivacic@email.com password = 9712
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Elena', 'Krivačić', 'elena.krivacic@email.com', '$2b$12$T3nM6IXWrsgjZbLShI1JIemspw8idhPg.HoaLYNKXHkaHn/dLU1nm', 'true', 'true');

--email = desanka.cipranic@email.com password = 8963
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Desanka', 'Ćipranić', 'desanka.cipranic@email.com', '$2b$12$.D7qbdezDalfrK1hO.G6gedGrhzDSlC7tjlatW4LqyI15ciX82ppu', 'true', 'true');

--email = takosava.kuzmic@email.com password = 5132
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Takosava', 'Kuzmić', 'takosava.kuzmic@email.com', '$2b$12$uEOLStKynQzXjiPSzwxb0.wEMcHT5UlRP.xBY44DOiUw0YUdRKLNC', 'true', 'true');

--email = zivadinka.djurdjic@email.com password = 6208
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Živadinka', 'Đurđić', 'zivadinka.djurdjic@email.com', '$2b$12$HCMbZRxD/3RGIIW7Fsrf7.gFhUu1p3oy/joCsfYNtvtjEzmuZMYdO', 'true', 'true');

--email = stojan.pusulic@email.com password = 1940
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Stojan', 'Pusulić', 'stojan.pusulic@email.com', '$2b$12$CPpz5s3NflaJAPgavlaAku/YVpqmUqXm3CszqJtYaeC4h2jPowMqe', 'true', 'true');

--email = vukica.bisercic@email.com password = 4445
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Vukica', 'Biserčić', 'vukica.bisercic@email.com', '$2b$12$2jBekuFgIXhWTuDX5XtiRuchgSzQ7Gc/FhHKA4qUdGWLPeFFhyts2', 'true', 'true');

--email = poljka.bjeletic@email.com password = 8525
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Poljka', 'Bjeletić', 'poljka.bjeletic@email.com', '$2b$12$5gUGKXugzjEWFU2sy4172ecyuZ1WcLsa0/vWBEJFWDkBvpcLhgYda', 'true', 'true');

--email = soka.karolic@email.com password = 8900
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Soka', 'Karolić', 'soka.karolic@email.com', '$2b$12$0.Y9Z6hff5GG25i0g79FzOAb8v8X0eItglZVMrbEBva/rn46PBvrW', 'true', 'true');

--email = radan.jerosimic@email.com password = 4583
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Radan', 'Jerosimić', 'radan.jerosimic@email.com', '$2b$12$Wtvg5QJRnTJpUIj5VQnQQOP0MfHGLi/sHjJ2Sn.01pHDKicVzXi.O', 'true', 'true');

--email = petar.cekic@email.com password = 8707
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Petar', 'Cekić', 'petar.cekic@email.com', '$2b$12$H7aBqUGiq7i13Kjg21yTfeWs65pqNNXaQ7lezbATjV6tD5za2Cp2.', 'true', 'true');

--email = vladimir.indzic@email.com password = 9497
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Vladimir', 'Indžić', 'vladimir.indzic@email.com', '$2b$12$ZhwPcjB1AyN60urMNbFmm.QGl54V4JZ4wuUtOsWNG5DwYUZ0By8W6', 'true', 'true');

--email = antonije.miricic@email.com password = 1578
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Antonije', 'Miričić', 'antonije.miricic@email.com', '$2b$12$Qy4IaDxNY1/QXxSyqJ/LBuDHTWHhN6.x9lIHUKDC.It6XKgQZb0sq', 'true', 'true');

--email = timotije.dragonjic@email.com password = 9481
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Timotije', 'Dragonjić', 'timotije.dragonjic@email.com', '$2b$12$acod4o9ARjwYAbNu8KQ84OYEuWR5j2I2Xd4J6xcFEVYLgqY6VZ3lu', 'true', 'true');

--email = aco.dubic@email.com password = 6373
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Aco', 'Dubić', 'aco.dubic@email.com', '$2b$12$Iec9991Rgcbf7y.LIUXEiexsU5I3KWEyWiIn5Rq3IVGE4wzOq/B.K', 'true', 'true');

--email = radinka.busic@email.com password = 1927
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Radinka', 'Bušić', 'radinka.busic@email.com', '$2b$12$.LSNT4LWe6xxRW9sc6U0iuis/ej.svu0VSxOfwPIF8Id6h0DRXwRe', 'true', 'true');

--email = stokan.azaric@email.com password = 6182
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Stokan', 'Azarić', 'stokan.azaric@email.com', '$2b$12$Wul1vucmwmtmfuSvpkV5he/RkjtbX4/s0sSqBazgPZaEth7NyppkC', 'true', 'true');

--email = trifun.dinic@email.com password = 9862
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Trifun', 'Dinić', 'trifun.dinic@email.com', '$2b$12$V5SE0QdGoCWwrNQjt/aSpuXn4FBNdki.ABkHxr9fQBd9buHN1PUiy', 'true', 'true');

--email = spomenko.kilic@email.com password = 2154
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Spomenko', 'Kilić', 'spomenko.kilic@email.com', '$2b$12$AvSMQl3zuFd4y7HWCHMuEut.dT/TiuDBbzu92hhf64iY4k5tzCW6W', 'true', 'true');

--email = gavra.pecenicic@email.com password = 7591
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Gavra', 'Pečeničić', 'gavra.pecenicic@email.com', '$2b$12$N16POE9h8e5pkHplqNXuUuEissgssnqNKGnvn62uze81ELusNAtGa', 'true', 'true');

--email = djuro.bukelic@email.com password = 2858
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Đuro', 'Bukelić', 'djuro.bukelic@email.com', '$2b$12$50FGUxf/Zg70U7lOw9CXhefBeJZaAIYItbR8u/yFYXyn4kGd0hKHy', 'true', 'true');

--email = njegovan.bresic@email.com password = 9553
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Njegovan', 'Brešić', 'njegovan.bresic@email.com', '$2b$12$EDbgOrcQjrJUDh6wLifLi.ZFl4uyjVP8rIMfhcsVXzTalPIJeuL6.', 'true', 'true');

--email = vujadin.cuparic@email.com password = 6918
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Vujadin', 'Cuparić', 'vujadin.cuparic@email.com', '$2b$12$MIF4SLBCEMGsGkqJtFtrBeR2EfuKYB5.RNPEclVoS03JQ789zTMd.', 'true', 'true');

--email = tomka.tresnjic@email.com password = 7687
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Tomka', 'Trešnjić', 'tomka.tresnjic@email.com', '$2b$12$wczvRp5kRb4sRaUMTnh0.u0LkIGAvIyO9xy5tS2yxy3JUhn4//TH2', 'true', 'true');

--email = radojica.veljancic@email.com password = 7618
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Radojica', 'Veljančić', 'radojica.veljancic@email.com', '$2b$12$abjPtYp8yipx1C/0/F3ZkuGhMBd/UFbViH3wCcMjLWdAFPV8xbP8C', 'true', 'true');

--email = julija.kljutic@email.com password = 6026
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Julija', 'Kljutić', 'julija.kljutic@email.com', '$2b$12$e6WYqvR0Rr5s5Do39QX9nO40NjB8gVP7DZQdDS28qzcHAIDLuuGc2', 'true', 'true');

--email = dejan.negucic@email.com password = 5510
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Dejan', 'Negucić', 'dejan.negucic@email.com', '$2b$12$0NyCshOkcQY91W1iM5r25eC.40ORgxSTdQf/Gtr5630kHhKekgjdS', 'true', 'true');

--email = dimitrije.krkotic@email.com password = 5219
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Dimitrije', 'Krkotić', 'dimitrije.krkotic@email.com', '$2b$12$hvUtLMIVl/aRNU.tC8VC9.J6sphZgM8cEVWWmrt5yr.eUpwWYE0.m', 'true', 'true');

--email = radojlo.plazacic@email.com password = 7966
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Radojlo', 'Plazačić', 'radojlo.plazacic@email.com', '$2b$12$R1ETXRAKp6qie.uHP74OVeDIgS.iI4I293hJrM98xyNwE5CPfYsg.', 'true', 'true');

--email = zivota.komnenic@email.com password = 2746
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Života', 'Komnenić', 'zivota.komnenic@email.com', '$2b$12$hRwCbqTLGymz.4Qu2WDIAumeAwmE4iNQGC9qeasudvBz7AgQCpN2q', 'true', 'true');

--email = mitar.lupikic@email.com password = 9949
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Mitar', 'Lupikić', 'mitar.lupikic@email.com', '$2b$12$3Q7N1gmnYFsMxeYgLZfmT.VmdPr8Vh8/Rd0GQVu4frq3c.YBsJ9aO', 'true', 'true');

--email = zlatoje.trumpic@email.com password = 6611
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Zlatoje', 'Trumpić', 'zlatoje.trumpic@email.com', '$2b$12$zzoKHBOQty.fUFtwiqlAy.5dFGb4lc5e.eTgRaFXf/lkXbNNchSou', 'true', 'true');

--email = zaklina.kojundzic@email.com password = 1327
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Žaklina', 'Kojundžić', 'zaklina.kojundzic@email.com', '$2b$12$x9gMZELbQndIlN8RYyS/dOvEOoP5BLZ6uyRzPdCuRlqOmll1S4uMe', 'true', 'true');

--email = ljiljana.acic@email.com password = 5076
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Ljiljana', 'Ačić', 'ljiljana.acic@email.com', '$2b$12$cJFl6xFwQlpRrbesg33yD.HkawNk9Xwz65rJKfO9JFG0j0hlCOuLK', 'true', 'true');

--email = nesko.brboric@email.com password = 7946
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Neško', 'Brborić', 'nesko.brboric@email.com', '$2b$12$B0CeIQErAdzCCbjus0fF0.xWrKVq65pVJ3pqQhUlIlsUAIXzXoOIm', 'true', 'true');

--email = luka.presic@email.com password = 3131
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Luka', 'Prešić', 'luka.presic@email.com', '$2b$12$Wn3ZgyLkG8OId4Vfkk8Ud.hucyeSGtHdaN5DVTNArMGQFCjRHFuTC', 'true', 'true');

--email = jordan.sakic@email.com password = 8962
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Jordan', 'Sakić', 'jordan.sakic@email.com', '$2b$12$cMG1rNyeyo5RHL0vXdiYpemq0S.UDhT7OIOz3H6.PHyow4PoTjiNu', 'true', 'true');

--email = petrija.lukendic@email.com password = 4707
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Petrija', 'Lukendić', 'petrija.lukendic@email.com', '$2b$12$vt1kymNwVQk4GmmM/D6xEerO0SRO5QsjcHC6gx6eFwRz5XP/5XhW6', 'true', 'true');

--email = ivanka.bizetic@email.com password = 5112
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Ivanka', 'Bizetić', 'ivanka.bizetic@email.com', '$2b$12$I4k3I2xD2CAfT2qn09gtuOe.v5to.4M5V4yaw60dej6qm0Yp3Tozm', 'true', 'true');

--email = bogdan.florikic@email.com password = 7243
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Bogdan', 'Florikić', 'bogdan.florikic@email.com', '$2b$12$EjdZKxTYOviMPFfMfg9z..Gw9kKchcdUBrheu5k3PG2/g7rvbhinC', 'true', 'true');

--email = nicifor.vidic@email.com password = 2575
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Nićifor', 'Vidić', 'nicifor.vidic@email.com', '$2b$12$7FWVh3TXMZT1j8/tzZl0C..8zbn/XA1mRliQ9A82SwoaGpH87A756', 'true', 'true');

--email = cvetanka.besedic@email.com password = 6277
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Cvetanka', 'Besedić', 'cvetanka.besedic@email.com', '$2b$12$Q.kyvvVbxkk8m4y8BjGGUOgroCDy/WU9nkzUiqKo8yE.EiuJXCgZ2', 'true', 'true');

--email = zlatko.stamencic@email.com password = 6730
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Zlatko', 'Stamenčić', 'zlatko.stamencic@email.com', '$2b$12$Yo0n21ExbgxcDXKN.JEpee/jwueSF60DXZRpk0.ytWPCU179.LtxG', 'true', 'true');

--email = zivomir.boberic@email.com password = 1170
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Živomir', 'Boberić', 'zivomir.boberic@email.com', '$2b$12$J4x4WOLTPpgRCl00RSxTC.SFHANOKYXQXkL6NqsBNkiUNddxvLWw.', 'true', 'true');

--email = spomenko.rogic@email.com password = 4152
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Spomenko', 'Rogić', 'spomenko.rogic@email.com', '$2b$12$.IdWoCdMoFwl15ty6Ri7rO8IcpW1AC1yfn/.Zk3FH.QPCcgy5zMkq', 'true', 'true');

--email = jugoslav.kolcic@email.com password = 2325
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Jugoslav', 'Kolčić', 'jugoslav.kolcic@email.com', '$2b$12$/mp6N/mohZ8HVh1b8uSBoOxRVxzcM2ZGdm5qwK3SN0CQdCGsADQL2', 'true', 'true');

--email = borislav.bojanic@email.com password = 8933
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Borislav', 'Bojanić', 'borislav.bojanic@email.com', '$2b$12$dQzfWZsGDZSMi4k.sc2AweK/IfV5Krz8JrGaM53rBwAzjVqx5Z2he', 'true', 'true');

--email = djurica.dasic@email.com password = 4998
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Đurica', 'Dašić', 'djurica.dasic@email.com', '$2b$12$aptG5di44a0OBmTAlz0AHedp0x4UJTJpyeqwYEM/9VjbmkPrVOES6', 'true', 'true');

--email = sofronije.grabic@email.com password = 2086
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Sofronije', 'Grabić', 'sofronije.grabic@email.com', '$2b$12$s9AZEcdbj3VLlu3j2JmLR.au3NohmcIRvkEtHj1Qpku1fKh30echC', 'true', 'true');

--email = damjanka.krompic@email.com password = 2375
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Damjanka', 'Krompić', 'damjanka.krompic@email.com', '$2b$12$3u.89acaoWo4VCbLJjTEVOm.Vp5AFEwxAJ/KAIEnMwazuSOTGVC16', 'true', 'true');

--email = jelisaveta.askrabic@email.com password = 5182
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Jelisaveta', 'Aškrabić', 'jelisaveta.askrabic@email.com', '$2b$12$cAhfY6c31wN4byjwuXmjbuVGoT04gZdkz58can.Qdx3lT7zzLi7GS', 'true', 'true');

--email = ivko.becic@email.com password = 4140
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Ivko', 'Bečić', 'ivko.becic@email.com', '$2b$12$qfqX4K5LZsm84olyVc.eQeyKikmRQLj3aG.YX6BntF0Y9lzJpWvKS', 'true', 'true');

--email = uros.sapic@email.com password = 3408
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Uroš', 'Šapić', 'uros.sapic@email.com', '$2b$12$0yaI5/o1Vch3NZDNeYQbse.sm8ZCvXbKyXiky0eEBWSt940PYtgRK', 'true', 'true');

--email = jefimija.brkic@email.com password = 7664
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Jefimija', 'Brkić', 'jefimija.brkic@email.com', '$2b$12$exieV2XyCIa9k6IdHOtvYekXkqiYNDP9Vk3m5A3bQM5FaD4pqFBwy', 'true', 'true');

--email = prerad.todosic@email.com password = 3759
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Prerad', 'Todosić', 'prerad.todosic@email.com', '$2b$12$xVaEiYKgHslCLwDV0o/5DuQiVWWM0jFame2/5sCjz0M4utsiLWKz6', 'true', 'true');

--email = danilo.sipetic@email.com password = 4942
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Danilo', 'Šipetić', 'danilo.sipetic@email.com', '$2b$12$s3NyCowD/2KaazW42CTwN.GLWmJTj1OaPOFMRpAmxO7gEzvzm42iG', 'true', 'true');

--email = jugomir.orlic@email.com password = 5915
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Jugomir', 'Orlić', 'jugomir.orlic@email.com', '$2b$12$4IHNwcuXsexpFKUz1RWxJ.LI/UkYoRcN6kNMlMaiKT/Bgha36ZNnG', 'true', 'true');

--email = danojlo.vazic@email.com password = 7654
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Danojlo', 'Važić', 'danojlo.vazic@email.com', '$2b$12$XJeerZ4pqhl4o4334fq1feToYzxmDBPmcdW3ebEOxrv5UcGYkYuPa', 'true', 'true');

--email = velimir.maslaric@email.com password = 1676
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Velimir', 'Maslarić', 'velimir.maslaric@email.com', '$2b$12$PQK3svLcCyI4C6Fe1QetluUsBtBn/ip4AJsWWjd9gtnJ9KMI/yJ2.', 'true', 'true');

--email = zavisa.stojcic@email.com password = 4333
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Zaviša', 'Stojčić', 'zavisa.stojcic@email.com', '$2b$12$mRtRXZwfp0rgsobleS9cvertl4sM3RwlIdRkiDGabvsdh//O12gza', 'true', 'true');

--email = kruna.vukolic@email.com password = 3710
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Kruna', 'Vukolić', 'kruna.vukolic@email.com', '$2b$12$x6da1vaeEv8Rgvmrm6ukKuIntbP8f.mE.ao0mzzvuPGeflcPqQIgS', 'true', 'true');

--email = krsman.debelnogic@email.com password = 1435
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Krsman', 'Debelnogić', 'krsman.debelnogic@email.com', '$2b$12$c89DZejgtJe4d/a8ldZXFu2V2Hxc1gh6nGHnPXnfyLs7OQdz4eBN.', 'true', 'true');

--email = hranislav.drulic@email.com password = 8244
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Hranislav', 'Drulić', 'hranislav.drulic@email.com', '$2b$12$aE6QhkNhk2HQZ1JRt2prjOYmhnkhFhMXNq7AEvSXq5db48C0NihKa', 'true', 'true');

--email = srbislav.bacic@email.com password = 8260
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Srbislav', 'Bacić', 'srbislav.bacic@email.com', '$2b$12$D/z.r5GesjFDJgHv/8tDF.8PeoIzii7o0HyfT5PwZn83hOHFyE6fG', 'true', 'true');

--email = sretenka.tatic@email.com password = 4842
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Sretenka', 'Tatić', 'sretenka.tatic@email.com', '$2b$12$6/uFvpes5qww..NegpjOrOwf388TUnPZjZVGXyYungO1.CBFXvhTm', 'true', 'true');

--email = vukoje.cuplic@email.com password = 9098
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Vukoje', 'Cuplić', 'vukoje.cuplic@email.com', '$2b$12$xhjvs1fnjUShILYSFZZFDusjk2e7xkL0qlGs0yMPLoC0FRTBX7s0S', 'true', 'true');

--email = ljuban.brocic@email.com password = 4961
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Ljuban', 'Broćić', 'ljuban.brocic@email.com', '$2b$12$wS8ZDJEl17Z96gCLKmiad.lFMeziSQLu35pOOtCPkDoTC.qdbSByi', 'true', 'true');

--email = ratiborka.radeljic@email.com password = 8829
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Ratiborka', 'Radeljić', 'ratiborka.radeljic@email.com', '$2b$12$wbWAPatWLiAKpOR/2wCATOoTkaeJ3O4oCnwt8CjnnWtjGhQfdbGxu', 'true', 'true');

--email = slavka.stikic@email.com password = 3976
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Slavka', 'Stikić', 'slavka.stikic@email.com', '$2b$12$Oyij/vR1gOPTz4jk8bNNPebNGJ9Wa17koQ1N5hHbrFJqdeNimxaYG', 'true', 'true');

--email = zvezdana.vrkatic@email.com password = 5996
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Zvezdana', 'Vrkatić', 'zvezdana.vrkatic@email.com', '$2b$12$xR/GNpNUBu3NQyX9zSHszOIEXPG9KA7D.HZYshkUCJGgPzb2UTzXC', 'true', 'true');

--email = miroljub.vujicic@email.com password = 2375
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Miroljub', 'Vujičić', 'miroljub.vujicic@email.com', '$2b$12$Z2P.cwwKEyOvqYPrqRPGTey/SPhIePtTo3rZpMo3eIKrp2PTHJtX2', 'true', 'true');

--email = anastasija.becic@email.com password = 5494
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Anastasija', 'Bećić', 'anastasija.becic@email.com', '$2b$12$FCwNFr5LA309KYoAZSbHn.AftHdk9xRYao86.kM.wVjdVpTJIa5jy', 'true', 'true');

--email = radul.pepic@email.com password = 4137
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Radul', 'Pepić', 'radul.pepic@email.com', '$2b$12$4bAJwFVHEUNayxxjU9vpfeyWnwGXColhWQwZu8vhYSdgYZLR4r1w6', 'true', 'true');

--email = biserka.dunjic@email.com password = 8080
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Biserka', 'Dunjić', 'biserka.dunjic@email.com', '$2b$12$0zePHNA/EC/Pckjz8mecdOaqrZ8K2G5.tRE/M.mLEuE2MWZYqlFvK', 'true', 'true');

--email = blagica.misulic@email.com password = 9694
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Blagica', 'Mišulić', 'blagica.misulic@email.com', '$2b$12$rjympWIfnVzJrjfvvgZAOOxVyVqZWgeyC9WqljPNWKVCIyoeSitFG', 'true', 'true');

--email = slavisa.ivanic@email.com password = 7681
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Slaviša', 'Ivanić', 'slavisa.ivanic@email.com', '$2b$12$otgcTMERG50CowQRvexW6.gfzoKP80cBvw14Dxr7FUwhpev0L4yAS', 'true', 'true');

--email = spridon.kutlacic@email.com password = 5067
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Spridon', 'Kutlačić', 'spridon.kutlacic@email.com', '$2b$12$h4KuPVp4Ov5z2Usve3k3AOrkQYa1jCHGU84/4QX/yk2wVaf3e9cSu', 'true', 'true');

--email = fanija.tukelic@email.com password = 1093
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Fanija', 'Tukelić', 'fanija.tukelic@email.com', '$2b$12$JYrhoCaQ4Gr4Dv5WuFSmAO634dXRhaBlDGhRgql.Tu8o.Ka/mSusS', 'true', 'true');

--email = oliver.tomicic@email.com password = 6638
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Oliver', 'Tomičić', 'oliver.tomicic@email.com', '$2b$12$2BcejMwJMJ2AwlYy0zmczehNguRS84i9m0UjhHVdogS8fv.PGcqGC', 'true', 'true');

--email = radojka.spiric@email.com password = 9518
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Radojka', 'Špirić', 'radojka.spiric@email.com', '$2b$12$rbgAVAM8Ae2Ff3BA/JKTROaS5cEQkxCVpS7Sn5Poc3AsHwZORVeUO', 'true', 'true');

--email = petrija.rogljic@email.com password = 5793
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Petrija', 'Rogljić', 'petrija.rogljic@email.com', '$2b$12$lQ4fneeuj/cD3x3z9NzTqOW5f59x5ihHWkUtzQNWnCym886KVuxxy', 'true', 'true');

--email = dobroslavka.gajetic@email.com password = 4423
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Dobroslavka', 'Gajetić', 'dobroslavka.gajetic@email.com', '$2b$12$BcIjOyLQetid5hD2/ygmRezFXDUQ4MMciabOx4fPP8jA/I2vzJbF2', 'true', 'true');

--email = vojin.pesukic@email.com password = 3965
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Vojin', 'Pešukić', 'vojin.pesukic@email.com', '$2b$12$pOIXtSecG87mMk3lI/xv/e41pzIYBprHcuxCwLHKY7zuqTxaEt6j6', 'true', 'true');

--email = radojka.pendic@email.com password = 7048
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Radojka', 'Pendić', 'radojka.pendic@email.com', '$2b$12$1lFSp6VPeY/lBYaG8V13MOEq5u2BwimOMCM.xk2VOTLAPhFii4sQa', 'true', 'true');

--email = mitra.koljajic@email.com password = 3780
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Mitra', 'Koljajić', 'mitra.koljajic@email.com', '$2b$12$95j43HyvBHvu0QCCG348.eH0lKILVcWNID0pUVXFsNIxFs052u8Je', 'true', 'true');

--email = atanasije.rajacic@email.com password = 6005
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Atanasije', 'Rajačić', 'atanasije.rajacic@email.com', '$2b$12$U9nUMSivDGEUV8V0eZkAAuCWk8xsTYfv1ewSiOERi/Wh5ocLr/tWO', 'true', 'true');

--email = ruzmirka.aleksendric@email.com password = 2760
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Ruzmirka', 'Aleksendrić', 'ruzmirka.aleksendric@email.com', '$2b$12$ENF6axpaCf2rGzSYhulTzOlgPNb9foJEVs36lxbDRX.rkqeHvEliW', 'true', 'true');

--email = milenija.klipic@email.com password = 9092
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Milenija', 'Klipić', 'milenija.klipic@email.com', '$2b$12$Bj.Qyiim5DP7LkaEYk8MQOW58YUubAM9SFVggTevbJ5vYSD4tHd4W', 'true', 'true');

--email = njegoje.rutesic@email.com password = 5302
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Njegoje', 'Rutešić', 'njegoje.rutesic@email.com', '$2b$12$kmBM39M47SorpbcQX2fHjeMUlBbxzVHatDuAt9Pk9tIQHGMHGqD.W', 'true', 'true');

--email = radoslavka.panic@email.com password = 8138
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Radoslavka', 'Panić', 'radoslavka.panic@email.com', '$2b$12$ryb4PJTNKtuBDs36T6Xh7eQl/0kylAGMB5LrBuHiC2u7QQ44bCfJG', 'true', 'true');

--email = hranislav.gajanic@email.com password = 7281
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Hranislav', 'Gajanić', 'hranislav.gajanic@email.com', '$2b$12$baefWQQ6m0grOS.gxRC7P.DtqtzMlu9gWNQOtQ9VSomM.oQyVM6Mm', 'true', 'true');

--email = latinka.steljic@email.com password = 7479
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Latinka', 'Steljić', 'latinka.steljic@email.com', '$2b$12$7eyqFCQ6Lt2f23qYqdjDJuOkKUOKY2LD7vyutIiPMPIa1Gk0UPONq', 'true', 'true');

--email = stokan.tomcic@email.com password = 2868
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Stokan', 'Tomčić', 'stokan.tomcic@email.com', '$2b$12$jz2L9GsxKe17IAhIXN0MQOnJ4/FFYLIYcHmxTUKalLmAaC6PqD7AW', 'true', 'true');

--email = gavrilo.borongic@email.com password = 4709
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Gavrilo', 'Borongić', 'gavrilo.borongic@email.com', '$2b$12$WgZFtflT1TyJw/gezmQAS.4FsV3aHs0K6n915JfdU6r0cESiL4Bnu', 'true', 'true');

--email = jerotije.dzavic@email.com password = 3824
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Jerotije', 'Džavić', 'jerotije.dzavic@email.com', '$2b$12$KDttiU0n7ka.be3peK4jJuS8PP.Fw098pMHkNE./.4J3HAmmU.PX2', 'true', 'true');

--email = ignjat.curic@email.com password = 8102
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Ignjat', 'Ćurić', 'ignjat.curic@email.com', '$2b$12$ZFXWyB/Zl/xe/HX5DPGD5OnoH4dOL5MWdzeBqCIIx1OHtYs.B1BRq', 'true', 'true');

--email = dusana.rusic@email.com password = 8062
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Dušana', 'Rusić', 'dusana.rusic@email.com', '$2b$12$4buxIBtCKo8zQEC3W2D93.Qjt1j7ZLaafQFfVzPj5QngbOTAmDJe6', 'true', 'true');

--email = gordana.dostanic@email.com password = 9007
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Gordana', 'Dostanić', 'gordana.dostanic@email.com', '$2b$12$dmEYoFNrd8CutzJSIEv1B.3unATpXlm1pKQ4e92sQIEcwV0mWV4di', 'true', 'true');

--email = radul.caloveic@email.com password = 8731
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Radul', 'Čaloveić', 'radul.caloveic@email.com', '$2b$12$wmM6vD8Ne6AIa7UNYq0.TOUfcteet2Imp3WhxEk.MEub8Egp20YPC', 'true', 'true');

--email = ljuba.stokanic@email.com password = 2452
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Ljuba', 'Stokanić', 'ljuba.stokanic@email.com', '$2b$12$tbO/xei.6LUxz1E9Mkg3TO6OGiz1t3OujbLfpNahdX36pYhn0ZKNG', 'true', 'true');

--email = nedeljko.milovankic@email.com password = 6927
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Nedeljko', 'Milovankić', 'nedeljko.milovankic@email.com', '$2b$12$vwqDlJPsFYCqsh0rQW01/O0zp8FrL6kMpOd6fJgPtKlOrwF1T95bi', 'true', 'true');

--email = drgorad.mihaldzic@email.com password = 4634
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Drgorad', 'Mihaldžić', 'drgorad.mihaldzic@email.com', '$2b$12$enHQmp4g5dNg0Mf8ESuNWO0vPAstKe5lX8kxVDbNPG.MarH74kVHe', 'true', 'true');

--email = srbijanka.vajkaric@email.com password = 8169
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Srbijanka', 'Vajkarić', 'srbijanka.vajkaric@email.com', '$2b$12$QJUDQ5vs/NL3MkGYufh85O9/jGrKzBsaHvYFFYWBMYwzC1UCdGMJu', 'true', 'true');

--email = djukan.stefkic@email.com password = 1715
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Đukan', 'Štefkić', 'djukan.stefkic@email.com', '$2b$12$5zpURGOtO8EwQpO/LP4Aa.Kxi9nkT4THeDTFxmJqMn3nkzp.7QdLO', 'true', 'true');

--email = dragutin.lemaic@email.com password = 4424
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Dragutin', 'Lemaić', 'dragutin.lemaic@email.com', '$2b$12$NlYPTR3ZzgWZiY9rART5nOAUVTVCfS0vIdyHwVS7pO/5Pl5Nx91v.', 'true', 'true');

--email = radonja.aleksandric@email.com password = 5925
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Radonja', 'Aleksandrić', 'radonja.aleksandric@email.com', '$2b$12$ItbAcPEAUeIcgInsf4v4W.Ah.bIlmaXzbnWLK.C79GGPFDeg.KviS', 'true', 'true');

--email = zorica.stanacic@email.com password = 5528
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Zorica', 'Stanačić', 'zorica.stanacic@email.com', '$2b$12$GKz2BBCe8AusFmKKluw2tuXRQUEnVrzUvOLffnIxWDk3IhRkF6dmu', 'true', 'true');

--email = ilinka.kentric@email.com password = 4198
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Ilinka', 'Kentrić', 'ilinka.kentric@email.com', '$2b$12$XGagSNUNkQUfCEwoGZOxn.xUNu4eboHW.IsW0cXSZJn9vel.NgTt2', 'true', 'true');

--email = radinka.kmezic@email.com password = 9534
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Radinka', 'Kmezić', 'radinka.kmezic@email.com', '$2b$12$fGRq.wWIW0cHYu0J8LPmyO2B6NNy69/FrENwJvXkjHaYORSLTCPaS', 'true', 'true');

--email = kruna.gleznic@email.com password = 5003
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Kruna', 'Gležnić', 'kruna.gleznic@email.com', '$2b$12$pl8Vv54kz5CzgaWAepiH/.j30EFkV8uiK6NrkaLLS6pCv4KpCGH1G', 'true', 'true');

--email = cvetko.besarabic@email.com password = 6623
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Cvetko', 'Besarabić', 'cvetko.besarabic@email.com', '$2b$12$bNcF/UOY.KZXSn6fyNOmye.22umwLZuX3UqOCys.kmaMjYgYFwcHi', 'true', 'true');

--email = malina.cobeljic@email.com password = 5764
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Malina', 'Čobeljić', 'malina.cobeljic@email.com', '$2b$12$A3mHZzHx9bmSj32Hh7Q1HudIu98B3U5baYHSr1VlgcFRPGJGlek7O', 'true', 'true');

--email = tomanija.opacic@email.com password = 1873
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Tomanija', 'Opačić', 'tomanija.opacic@email.com', '$2b$12$vL/IRf6JnqrbwvEM.j9nte9wKL0jaiRdUDekJqfmjRC81s5sS/67e', 'true', 'true');

--email = milun.kukic@email.com password = 7964
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Milun', 'Kukić', 'milun.kukic@email.com', '$2b$12$tpxBwZR1DqeRru3WJcw/zO74soc8bEiRs8HADDJBgqWTVJWKQe0Gq', 'true', 'true');

--email = budislav.grabic@email.com password = 2891
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Budislav', 'Grabić', 'budislav.grabic@email.com', '$2b$12$UwLzjnTeuRJprHyNOIgQ0eGWWHXyhrR86RjzOzcYdzJEXfBd0S0m6', 'true', 'true');

--email = bojan.azaric@email.com password = 1966
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Bojan', 'Azarić', 'bojan.azaric@email.com', '$2b$12$Ty8SvE9HliNAlGT/dxaGu.mz.qfQQPx85HywsD93pIKJ9LDUyWx.G', 'true', 'true');

--email = katica.milinic@email.com password = 5013
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Katica', 'Milinić', 'katica.milinic@email.com', '$2b$12$d4wAg7mdyER/pNmjUdtgiuQDQOaRghBxidzhybdnpSQ5pEKga/liu', 'true', 'true');

--email = ljiljana.kuic@email.com password = 5516
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Ljiljana', 'Kuić', 'ljiljana.kuic@email.com', '$2b$12$7z6XU25BHUbuFMmHFlHoo.zEWZ72OMulc6KTNd5yCyTNef2SI6U4K', 'true', 'true');

--email = djordje.prigodic@email.com password = 8227
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Đorđe', 'Prigodić', 'djordje.prigodic@email.com', '$2b$12$kRKHomvhCe2uRiH8dyrU1ej1XLAmYBxVh.EKmt13Mud8MuxW6jt6u', 'true', 'true');

--email = djurica.despenic@email.com password = 5145
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Đurica', 'Despenić', 'djurica.despenic@email.com', '$2b$12$RbVJNKBd3Wd4TnIgTm/tw.5VL1j3EzTI42XTfAd4doAMGNtjJpIwe', 'true', 'true');

--email = stevan.petric@email.com password = 6137
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Stevan', 'Petrić', 'stevan.petric@email.com', '$2b$12$i8JcxWYjdpiTJEVfgqxGcu5YY2BHjC3Zb9sHeh8pAd3Q.ZOxVG8vG', 'true', 'true');

--email = ljubisa.dimkic@email.com password = 1708
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Ljubiša', 'Dimkić', 'ljubisa.dimkic@email.com', '$2b$12$fm22w0tzVXh0QQJ99cjnK.ms.4M8QpOga7RXXeN2lw4gVjd8ZDrCa', 'true', 'true');

--email = sibinka.komnenic@email.com password = 1614
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Sibinka', 'Komnenić', 'sibinka.komnenic@email.com', '$2b$12$TyBkuzPsYTTJBBLA19x8QepQIU6tGlGg2b6G0BsvUEOvRmrRKjcKy', 'true', 'true');

--email = bojan.skrkic@email.com password = 5246
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Bojan', 'Škrkić', 'bojan.skrkic@email.com', '$2b$12$2kuCJjPrbOVFYovOp/JlH.tuVBpsLfkaE.lA0dalKImjFd6wYEedq', 'true', 'true');

--email = jugomir.krstajic@email.com password = 3830
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Jugomir', 'Krstajić', 'jugomir.krstajic@email.com', '$2b$12$2Hu.VMCqHQBel3gPsxZOIeaw7pH55tQHjOgjnGZieg0WnlzBuWn7m', 'true', 'true');

--email = janovka.pakic@email.com password = 3688
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Janovka', 'Pakić', 'janovka.pakic@email.com', '$2b$12$VLung3FLdV5z0H1kFtxjrOoQx2P1xp50r2EQvt74OF02biNkt67r.', 'true', 'true');

--email = uranko.miricic@email.com password = 5301
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Uranko', 'Miričić', 'uranko.miricic@email.com', '$2b$12$8laq4xUo5Nl.WcOJuexU/umcpdImSkofhO/97.8POmff7JaEwhto.', 'true', 'true');

--email = jagoda.pavic@email.com password = 6799
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Jagoda', 'Pavić', 'jagoda.pavic@email.com', '$2b$12$/oNw771iRjDbysXwvzblAOWV8wtpLcMK9J0hB5Zea.XkybacHWtG6', 'true', 'true');

--email = makrena.grokanic@email.com password = 8791
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Makrena', 'Grokanić', 'makrena.grokanic@email.com', '$2b$12$KEL6O/b83QaNZvfSd43sseSZVFc3YHTTwmoGe/YlV7k8LBIU0r.jm', 'true', 'true');

--email = isak.smiljanic@email.com password = 9756
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Isak', 'Smiljanić', 'isak.smiljanic@email.com', '$2b$12$36S8M7Le87Doza.f.JXf7.5axYZDZtpl5BCwtqtT9PEgWjP/cG3FS', 'true', 'true');

--email = krsmanija.dzankic@email.com password = 9052
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Krsmanija', 'Džankić', 'krsmanija.dzankic@email.com', '$2b$12$rY0xtswzrSo8j3aNf9stJet7/4Sm/Lyk9tApo6Po6tpCH/.tSA/0e', 'true', 'true');

--email = canka.kovcic@email.com password = 1518
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Ćanka', 'Kovčić', 'canka.kovcic@email.com', '$2b$12$oAcOP8P/SU0nnjsQGJpRreLRY2lQG54Icj8A3jUb2668VUyrCAoGq', 'true', 'true');

--email = justin.bugaric@email.com password = 4111
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Justin', 'Bugarić', 'justin.bugaric@email.com', '$2b$12$9CO7ggEtrFPVwo.a1J/S0./tWWuIyaf8e6FsZvL2k5bbFnskMkLZK', 'true', 'true');

--email = ljiljana.atlagic@email.com password = 2146
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Ljiljana', 'Atlagić', 'ljiljana.atlagic@email.com', '$2b$12$LyTeMPpmqcnTqV2XRhRCa.QK/dGTxxezOyBBpnwIhvQMNXveq9.Ii', 'true', 'true');

--email = peladija.pevalic@email.com password = 3938
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Peladija', 'Pevalić', 'peladija.pevalic@email.com', '$2b$12$bIQbUlitdxLScJiIMDz5Kex.nS2IEbU0OekkUdSgxDAIOuW/oiLLO', 'true', 'true');

--email = ugljesa.savurdic@email.com password = 3875
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Uglješa', 'Savurdić', 'ugljesa.savurdic@email.com', '$2b$12$LU82A9Fvdf2ph1OxeHMMMeHMob1NxgDMVZLnp2IPIHWqcqDvhYVje', 'true', 'true');

--email = jovica.vukelic@email.com password = 2246
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Jovica', 'Vukelić', 'jovica.vukelic@email.com', '$2b$12$xJNgEJkGnfn0wBbEudtsn.WF0tvC/ZCbcdEZkTXSxmO5xCo7uWiLa', 'true', 'true');

--email = gabrijela.zmuric@email.com password = 5771
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Gabrijela', 'Žmurić', 'gabrijela.zmuric@email.com', '$2b$12$Tfow7eyGVA5qJF7GFjZ/ne/fPJa6SfT1OiB1jCnQkw5hxq21EGb7y', 'true', 'true');

--email = makrena.jojkic@email.com password = 5357
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Makrena', 'Jojkić', 'makrena.jojkic@email.com', '$2b$12$uiwKhgECb/TGpUCa/qIVYOknf9LxLNrYasawT5tcuFCsom78jIj1q', 'true', 'true');

--email = selena.celic@email.com password = 4724
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Selena', 'Ćelić', 'selena.celic@email.com', '$2b$12$bJWYkG8gi1lqoUcP.IIw5Ow/pDhA5qck2dPbt.XFKpgAw0Y/nZToe', 'true', 'true');

--email = drgorad.kapetinic@email.com password = 4696
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Drgorad', 'Kapetinić', 'drgorad.kapetinic@email.com', '$2b$12$goluUz8YxRpChdCByONSP./rFjLARiPnv.uXyq1lXtEDHw6m9JGPy', 'true', 'true');

--email = zlatoje.karagic@email.com password = 3458
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Zlatoje', 'Karagić', 'zlatoje.karagic@email.com', '$2b$12$qxooLacEGZgzvVbET24F5.EyHFGb.rbxIRBNWc4M19mJRANRIpyrG', 'true', 'true');

--email = mitra.petkanic@email.com password = 5003
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Mitra', 'Petkanić', 'mitra.petkanic@email.com', '$2b$12$zsGsWhw2WLvi2FHdlC4WOuMXpInBaz6M.oDBMGfCyEX5Q1z4tlDnq', 'true', 'true');

--email = slavko.bosic@email.com password = 5816
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Slavko', 'Bosić', 'slavko.bosic@email.com', '$2b$12$H1.L.Jc1hsesEiqiXceyhukUuP6RrJ9AcG.qnybwTgHdhdutz0t8e', 'true', 'true');

--email = andjelija.ludajic@email.com password = 3758
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Anđelija', 'Ludajić', 'andjelija.ludajic@email.com', '$2b$12$i.nZKR1EYTIH8GdjLW84Fu6u3wkM04swsHv9xtAOzJ8T0RB7pZjjq', 'true', 'true');

--email = gaga.dangubic@email.com password = 8564
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Gaga', 'Dangubić', 'gaga.dangubic@email.com', '$2b$12$S54R7hRKsKW7RRxjOXIjiOHF3/A97goH4VKKwAX6cXMFASvauen1G', 'true', 'true');

--email = marko.mrkusic@email.com password = 4107
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Marko', 'Mrkušić', 'marko.mrkusic@email.com', '$2b$12$O8v5MpGIRveb774GieSp3eZrpBI3tTreJemNatVVuw0LJDhGUkf/6', 'true', 'true');

--email = trajko.jaredic@email.com password = 8455
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Trajko', 'Jaredić', 'trajko.jaredic@email.com', '$2b$12$WjkeuoJ.QTEXacXMqDTYDe2qR0Jyj4qkHwmHyXB.AwEpSJoSauOPS', 'true', 'true');

--email = zivoslava.kovanusic@email.com password = 7082
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Živoslava', 'Kovanušić', 'zivoslava.kovanusic@email.com', '$2b$12$MsrHAwazLv3ATAVzYuUYOOfZ8WeXCtE4FZu/NnPWj.bnaYA2bVjkq', 'true', 'true');

--email = maksim.ojdanic@email.com password = 2549
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Maksim', 'Ojdanić', 'maksim.ojdanic@email.com', '$2b$12$PX1W/RWz.koRgJB33.5F4uQUf66IVv6Vx/0H9h3JX5hkS8QdqMely', 'true', 'true');

--email = gavrilo.bosnic@email.com password = 3049
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Gavrilo', 'Bosnić', 'gavrilo.bosnic@email.com', '$2b$12$OupQW688Jbaf7UP43/GtgODyOHGnZZNTrXutOuVyNylEiXQHnf.cW', 'true', 'true');

--email = veroljub.stojacic@email.com password = 1441
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Veroljub', 'Stojačić', 'veroljub.stojacic@email.com', '$2b$12$sW/tkEXIJKOORz45stBBXO.lNHWidOF6R453/rc6TmUUV5DBWHBKy', 'true', 'true');

--email = damjanka.mavric@email.com password = 9693
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Damjanka', 'Mavrić', 'damjanka.mavric@email.com', '$2b$12$AACmLhztA9Ja8h1ofMGVgOgST1Eg2F08jI3deXpQYf0WWe8o9Kvem', 'true', 'true');

--email = dobrivoj.rutesic@email.com password = 6196
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Dobrivoj', 'Rutešić', 'dobrivoj.rutesic@email.com', '$2b$12$sTdXSRcuo/M3matFZhrO/OTpGGp2tsfurZBm2W4GsNPYW.pUGo/my', 'true', 'true');

--email = jelica.cobeljic@email.com password = 4809
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Jelica', 'Čobeljić', 'jelica.cobeljic@email.com', '$2b$12$Z88WUyq459V6SHv11UDu1uc58ebzxMFubIBxAXh3/vEafQ00Hin8S', 'true', 'true');

--email = aleksija.mrvic@email.com password = 8404
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Aleksija', 'Mrvić', 'aleksija.mrvic@email.com', '$2b$12$KEe6Kfg5NE7kP.FvZAsId.OiBV3Upq4o5ofur5zto.8yUmPRtn./C', 'true', 'true');

--email = stojadinka.sipetic@email.com password = 7782
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Stojadinka', 'Šipetić', 'stojadinka.sipetic@email.com', '$2b$12$J7Mmo1i/MspgNEyws2V13uGtIcFOHT.G66DjPOQ.sDvRmUJjK321a', 'true', 'true');

--email = radmila.stiklic@email.com password = 4227
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Radmila', 'Stiklić', 'radmila.stiklic@email.com', '$2b$12$UkXf.OCPnyp.aJDHeuLAv.z8U1wqKYz1MYdIlhwi4/NnUlZ7WhMgW', 'true', 'true');

--email = lela.erkic@email.com password = 6768
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Lela', 'Erkić', 'lela.erkic@email.com', '$2b$12$BlxCULNYNg5aJHmbVTk5veGvOYUfXqlOwp4wels1398hurLm3tVRa', 'true', 'true');

--email = sisko.mikucic@email.com password = 4618
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Šiško', 'Mikucić', 'sisko.mikucic@email.com', '$2b$12$3piUAYiJC/RxAVqZCXJ.IOPhUsAZ4RXUnozAdyRU4Tbvo3ejT4EOu', 'true', 'true');

--email = cirka.glumicic@email.com password = 5421
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Ćirka', 'Glumičić', 'cirka.glumicic@email.com', '$2b$12$xw5KrVWL9KfsOIsoG6CkqOkKc9n3mTeGO.s4Yop5lj4jyonsAWcwq', 'true', 'true');

--email = radojka.sendric@email.com password = 5345
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Radojka', 'Sendrić', 'radojka.sendric@email.com', '$2b$12$NhndAbdnrxqppbvOBqkcmu0txWCcBND2sJuEdJDxXg7zCF8lUziOa', 'true', 'true');

--email = tina.tanic@email.com password = 8489
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Tina', 'Tanić', 'tina.tanic@email.com', '$2b$12$TjjxYZ2HoCgYvMOeEWZS.uXZSIHQLKp4QqsR5vlExeDWMJ44WBj0K', 'true', 'true');

--email = stojiljko.vorkapic@email.com password = 8931
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Stojiljko', 'Vorkapić', 'stojiljko.vorkapic@email.com', '$2b$12$z3tOk/xvBT8u8WUhsRgaS.Fbn2HSWW1rTfPa1htfzMJWLvQjh86AW', 'true', 'true');

--email = obren.uric@email.com password = 3960
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Obren', 'Urić', 'obren.uric@email.com', '$2b$12$kWlVl54IOGBggc5/87ffYOo3krXJ.TRzxGLX6bfpTIYN6JEQhRBmO', 'true', 'true');

--email = milijana.lijeskic@email.com password = 9228
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Milijana', 'Lijeskić', 'milijana.lijeskic@email.com', '$2b$12$qeeaGKD3tonVb2rqqVz4COkcYv9WjlCRJ47zXy1o.PEUIQwZBuCAa', 'true', 'true');

--email = djurdjevka.klasnjic@email.com password = 1381
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Đurđevka', 'Klašnjić', 'djurdjevka.klasnjic@email.com', '$2b$12$soMsIe8dUD9MYx5wUDVtJ.KaIwTB2S.JIwUcLcLlsoJRU12ykpL0q', 'true', 'true');

--email = stamenko.budic@email.com password = 8488
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Stamenko', 'Budić', 'stamenko.budic@email.com', '$2b$12$uMccC1Trd2E8iG85UeKcRO/slE6nzF/2SJmnkv78Bqld1Cw67sST.', 'true', 'true');

--email = stanislav.barbucic@email.com password = 3867
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Stanislav', 'Barbucić', 'stanislav.barbucic@email.com', '$2b$12$hoyNV1o0otWeJ1tkY4NwlOrcmxopDxTdNVv28jCOeyGA74EoJAHDi', 'true', 'true');

--email = radoman.planincic@email.com password = 8575
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Radoman', 'Planinčić', 'radoman.planincic@email.com', '$2b$12$pKGsP.dDGdwYgKG4SOVCzOIHpvZ0x5.sWNGk5V576g3Rq17zpEGma', 'true', 'true');

--email = ljubomir.stolic@email.com password = 2760
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Ljubomir', 'Stolić', 'ljubomir.stolic@email.com', '$2b$12$5jffXQMKsXvF81DPO2R/BOapzG6Jm02hZeEfU2FVqESrXcBpe5JGe', 'true', 'true');

--email = zivorad.vitic@email.com password = 5099
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Živorad', 'Vitić', 'zivorad.vitic@email.com', '$2b$12$54inuF4JTVnbyqxl4CLgXOwQCTBVCZi6ph5MKesLe2W8P96oaGXoO', 'true', 'true');

--email = julka.aljancic@email.com password = 7399
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Julka', 'Aljančić', 'julka.aljancic@email.com', '$2b$12$omKd0G5exlMHScJFZ/u4yeh0BhIMGOJUq3I0D3BPGpLJKjEUu6g0m', 'true', 'true');

--email = todor.zuvic@email.com password = 4318
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Todor', 'Zuvić', 'todor.zuvic@email.com', '$2b$12$PvypnCbXF5.JBQL2pNSLHul958QHo7FUFD7QZKlqrj9Bj69W6diDG', 'true', 'true');

--email = justin.gramic@email.com password = 4977
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Justin', 'Gramić', 'justin.gramic@email.com', '$2b$12$iOdc2Rqo/cSqTAhLP9S1i.tGRwdNQtqln6DKT.pYY3x1ChhqdhCvm', 'true', 'true');

--email = zlata.kilic@email.com password = 6932
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Zlata', 'Kilić', 'zlata.kilic@email.com', '$2b$12$y3BiKoYJV0yTJtQNvgwbmeGgvAkeMoez4xyHM8PIYIOytg8YW/B7m', 'true', 'true');

--email = novak.baosic@email.com password = 9758
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Novak', 'Baošić', 'novak.baosic@email.com', '$2b$12$5XpByEKmVntoq9pmpL8HeuiarlHz7ZJ3mbjcgQyzvKxTYVnIQuHae', 'true', 'true');

--email = marija.jevdosic@email.com password = 7643
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Marija', 'Jevdosić', 'marija.jevdosic@email.com', '$2b$12$G/WDgF/SkQsgZ7W.vDWSYOZ7u1JlxlkQUcZzXA0U8KgAXVCrU7kpy', 'true', 'true');

--email = bojan.ratkelic@email.com password = 8487
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Bojan', 'Ratkelić', 'bojan.ratkelic@email.com', '$2b$12$OYxwOkJVNWofcRIOIURxguo.MAfVw9la8GOcJTaSBIe2dIQyuMSpi', 'true', 'true');

--email = vukadin.kalentic@email.com password = 3200
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Vukadin', 'Kalentić', 'vukadin.kalentic@email.com', '$2b$12$SeBBZtyiukpCkrXNxH7jquqcootxpKuPyTuZ9JMHqrtH25UMWaHMC', 'true', 'true');

--email = lazar.stefic@email.com password = 2212
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Lazar', 'Stefić', 'lazar.stefic@email.com', '$2b$12$ccGCFW18P2885/8G3YVCR.en2aGzryk7ZpV/cckVU9rxadmj2NBWu', 'true', 'true');

--email = vlajko.tajdic@email.com password = 7046
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Vlajko', 'Tajdić', 'vlajko.tajdic@email.com', '$2b$12$mHh0IoAyGBVoq4LwGFk4pu/8Mh2ZEZP05431tRi9knIlAS.NDuOsS', 'true', 'true');

--email = ranka.vasiljkic@email.com password = 5580
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Ranka', 'Vasiljkić', 'ranka.vasiljkic@email.com', '$2b$12$d5qSRLzEG3dK1cvtw9mU0uIevzpz1IDMzSzpMIYyk9gXf4fh.e88K', 'true', 'true');

--email = fema.buzaretic@email.com password = 1317
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Fema', 'Buzaretić', 'fema.buzaretic@email.com', '$2b$12$p2SkSNDxWZ4JbWdLU2hg8eQh/dr29N/RUx0g7aF/DjPm/uYMaDXUa', 'true', 'true');

--email = kadivka.javoric@email.com password = 2553
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Kadivka', 'Javorić', 'kadivka.javoric@email.com', '$2b$12$8fMBmEO3YMSyt3zYJw3GHugO8LumZIwlpoctUsQADcuQI9u6U2QvK', 'true', 'true');

--email = vera.frtunic@email.com password = 8813
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Vera', 'Frtunić', 'vera.frtunic@email.com', '$2b$12$9n.DUuc/dsNRvUlNIU7d3udTdLVI8C3CRvII4RO5uvPvC/lOag2hq', 'true', 'true');

--email = ljupka.vugdelic@email.com password = 2608
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Ljupka', 'Vugdelić', 'ljupka.vugdelic@email.com', '$2b$12$7uE5IPfR8uMH0ebPqdT6Wei.cYlV5sNfSxFaY.mF7Opi3Hw79AGPa', 'true', 'true');

--email = gradimir.poznic@email.com password = 8308
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Gradimir', 'Poznić', 'gradimir.poznic@email.com', '$2b$12$zUJsFt44fY5DVAEHXk/xlOEFig/D8aQFH.x9EWYlS3OPErQkViY6W', 'true', 'true');

--email = radoljub.truskic@email.com password = 6031
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Radoljub', 'Truškić', 'radoljub.truskic@email.com', '$2b$12$nBGyzo0SkI8/WoBN8KBg8emRTlYYpNdclgp71l2v.85VNlkGGV4ZS', 'true', 'true');

--email = takosava.palic@email.com password = 5051
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Takosava', 'Palić', 'takosava.palic@email.com', '$2b$12$zJn/n.iWLsqdiayJCz1bT.jzlf50D2cXYMyzKMsDXcTg3uNPCLC.6', 'true', 'true');

--email = radivojka.poparic@email.com password = 3590
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Radivojka', 'Poparić', 'radivojka.poparic@email.com', '$2b$12$3/8FpgEuZnWDVTcB24N7zOxXVwFHRtqqzrq4sG4yoBOJvV11FhtH6', 'true', 'true');

--email = zlata.cvoric@email.com password = 8911
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Zlata', 'Čvorić', 'zlata.cvoric@email.com', '$2b$12$lDMd4A7A6SPROSwhR0Oq7etPw.kyNSVdkz0zeg1VRYU2Mx3M/Vl1y', 'true', 'true');

--email = viseslav.cicic@email.com password = 5371
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Višeslav', 'Čičić', 'viseslav.cicic@email.com', '$2b$12$5fYdxz.hhl8BrlzMRvoeLuTdjeRAVEz7BLRnK4JVkPNjN52VAs8p2', 'true', 'true');

--email = ozrenka.decermic@email.com password = 5410
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Ozrenka', 'Dečermić', 'ozrenka.decermic@email.com', '$2b$12$c60OeHVjn2AVYLW9nBPcDuRxhlndaJDgqVK3wU1E5EV6diIU/wlou', 'true', 'true');

--email = nemanja.tresnjic@email.com password = 6891
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Nemanja', 'Trešnjić', 'nemanja.tresnjic@email.com', '$2b$12$IhUS9AQb/BXyE5vbsJCyz.Fta86aqanLFOAFHOi6vm.9T.DcfcusG', 'true', 'true');

--email = njegoslava.miksic@email.com password = 2947
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Njegoslava', 'Mikšić', 'njegoslava.miksic@email.com', '$2b$12$O3peJIoA77.r2i5imtytMexvygT0ExIlq7LDEAzoYicSuTN0zW1XG', 'true', 'true');

--email = djuro.milojic@email.com password = 6823
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Đuro', 'Milojić', 'djuro.milojic@email.com', '$2b$12$0LS/T19LgyX2.w0CNL45JuwSneK93QsL/BDqYPFV0vh4v6kBNEH3C', 'true', 'true');

--email = tijana.dziknic@email.com password = 3873
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Tijana', 'Džiknić', 'tijana.dziknic@email.com', '$2b$12$Gskkm7pcdhSAdtbmHhCgyeJgDpettMlOD01tCAGGE.B6TOlr.Tdc2', 'true', 'true');

--email = vojimir.suljagic@email.com password = 5597
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Vojimir', 'Šuljagić', 'vojimir.suljagic@email.com', '$2b$12$T6EZeWEGN3zfU56zEWtTM.S6O59YX/60k.bj83EwYmtfCNduwkFJ2', 'true', 'true');

--email = kosovka.guberinic@email.com password = 1513
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Kosovka', 'Guberinić', 'kosovka.guberinic@email.com', '$2b$12$7GuhbDONJloK1QK/wzL0HuXPbEje4Yd1t6moEXqqKsLr0xEo8Dbhm', 'true', 'true');

--email = caslavka.jonicic@email.com password = 1615
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Časlavka', 'Joničić', 'caslavka.jonicic@email.com', '$2b$12$F8l8DI4tx8AuAF4.0vpAd.sV68YAN2ZbMEJxWPKWHrNuJq/M2AfqG', 'true', 'true');

--email = podgorka.rakezic@email.com password = 4158
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Podgorka', 'Rakezić', 'podgorka.rakezic@email.com', '$2b$12$YPuyPr.f0co5pKmJrOPseOZAPbxcvbXQLCYaweNywoO/oAgE/JcGa', 'true', 'true');

--email = fanija.jaksic@email.com password = 4647
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Fanija', 'Jakšić', 'fanija.jaksic@email.com', '$2b$12$AMnW7EFGqDE88ACgKCV3curYqrcHhqssfpuP7SwME0/XSu4hk2S6q', 'true', 'true');

--email = slobodanka.boricic@email.com password = 2964
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Slobodanka', 'Boričić', 'slobodanka.boricic@email.com', '$2b$12$Tz1eP0X4wOQQWOvu25J12.m5o.Vdlst656xoYzYNVvIR13mkZNo.K', 'true', 'true');

--email = viktor.krkobabic@email.com password = 7209
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Viktor', 'Krkobabić', 'viktor.krkobabic@email.com', '$2b$12$ANh78XoMnaYgzk.nyoBDgO4/QFPGQkP82MpEPdoh0w50HfI/QTwxm', 'true', 'true');

--email = cvijetin.mrkaic@email.com password = 9347
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Cvijetin', 'Mrkaić', 'cvijetin.mrkaic@email.com', '$2b$12$5ZRn6AplZb1waYjVRgvkSO8KFg2ZmqCo5/jZnyy.zN5Am3r06WTbG', 'true', 'true');

--email = ranisav.milic@email.com password = 1807
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Ranisav', 'Milić', 'ranisav.milic@email.com', '$2b$12$7VBiGt/BwuQVKQvksoIL5eu.MFzB.w7ADGYw1KUiRVMCxlY4qRRNG', 'true', 'true');

--email = zivana.grubic@email.com password = 6179
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Živana', 'Grubić', 'zivana.grubic@email.com', '$2b$12$S/jMzdN.cs2k55NmZH3LqOiLZ5jOCXRk/DRZ7c8.QSt/yFLAbf29y', 'true', 'true');

--email = momir.budalic@email.com password = 9692
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Momir', 'Budalić', 'momir.budalic@email.com', '$2b$12$9EYyIOJf0tsMiBSvFlWJKu0UUO05Ju55TDAFbxKkbkDOfCoxJEwWq', 'true', 'true');

--email = adam.graonic@email.com password = 5978
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Adam', 'Graonić', 'adam.graonic@email.com', '$2b$12$7vs2Ly07Fgg.xjjReQ7rgOsIoQ1SzGh//hs8pPwLju2Pu69LZPy.m', 'true', 'true');

--email = dmitar.stupic@email.com password = 3282
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Dmitar', 'Stupić', 'dmitar.stupic@email.com', '$2b$12$7HwEpeUUWhrjX26Qalp4X.NKCz0x81UX8qGqGYn6Q91G7itXyuwBu', 'true', 'true');

--email = cirilo.garacic@email.com password = 6429
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Ćirilo', 'Garačić', 'cirilo.garacic@email.com', '$2b$12$MRS6w.sEI3YFVRl4TycSV.YwU/m1UJqVErwuFCYvx.ne37f2QHqzC', 'true', 'true');

--email = toma.salajic@email.com password = 8366
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Toma', 'Šalajić', 'toma.salajic@email.com', '$2b$12$0i8sKQI4BNKsCVwJoF4LeOTQVLrdI6o4jH2yQGK3oie/479L38Nbm', 'true', 'true');

--email = milos.stijepic@email.com password = 2330
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Miloš', 'Stijepić', 'milos.stijepic@email.com', '$2b$12$YIan6DEfvTI1iAsSRLDgL.0ZuFpJTVipXpqILrWnCP.XkwP5bChu6', 'true', 'true');

--email = djurica.jalic@email.com password = 8404
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Đurica', 'Jalić', 'djurica.jalic@email.com', '$2b$12$CxcpWzO6GcEczYQoOfIJ3e9dVtZWj3s7THWCAktiDbDGGBq66frC2', 'true', 'true');

--email = ostoja.simendic@email.com password = 4772
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Ostoja', 'Simendić', 'ostoja.simendic@email.com', '$2b$12$tir8ZOzPVBT/.JpI3CRVdO0aSkJNenYJMJHDzYoufWAeVBOSRZZJq', 'true', 'true');

--email = ristivoj.plavljanic@email.com password = 7890
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Ristivoj', 'Plavljanić', 'ristivoj.plavljanic@email.com', '$2b$12$p.96IsAt0xoI/mzgvg4WwemCQTD9wonuMHM2ncs7771OD2wVVEd2K', 'true', 'true');

--email = svetolik.bastasic@email.com password = 5667
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Svetolik', 'Bastašić', 'svetolik.bastasic@email.com', '$2b$12$5aTiAE48VjsLv9C5XRF4Kes7xxawO0oFxao4vuDJpgq3qqn8pQOi.', 'true', 'true');

--email = bogdana.stojankic@email.com password = 7753
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Bogdana', 'Stojankić', 'bogdana.stojankic@email.com', '$2b$12$IU8oy722As9aUHnZkbtdvuyGBh8MkU7EA0BTEgav5xe3DjkUR9Swi', 'true', 'true');

--email = mihailo.djuricic@email.com password = 2380
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Mihailo', 'Đuričić', 'mihailo.djuricic@email.com', '$2b$12$MYWDezaMOxm5MOJ2d/gnKuWbRlf/JC1rS3pI8o9FZLgtUuwHDsNBC', 'true', 'true');

--email = nedeljka.gleznic@email.com password = 2474
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Nedeljka', 'Gležnić', 'nedeljka.gleznic@email.com', '$2b$12$yYXtTw8Db.jNx8CP1SFY/uW1HFKVr1KCy9avqoQtT/taDYiFMagbO', 'true', 'true');

--email = dobrilo.music@email.com password = 5109
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Dobrilo', 'Musić', 'dobrilo.music@email.com', '$2b$12$dZ827VAeBdg79FYQYyAjnedPiE3e4DMebJ6VH4/ZL5rMfgs8giM72', 'true', 'true');

--email = gruja.stakic@email.com password = 1895
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Gruja', 'Štakić', 'gruja.stakic@email.com', '$2b$12$kA6h1tS60lar0INQ6MHCzOt24OmhZ2e7eonREgXbJaj.CbEFcbddi', 'true', 'true');

--email = filotej.zipancic@email.com password = 9304
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Filotej', 'Zipančić', 'filotej.zipancic@email.com', '$2b$12$tjlyCCtdVO6mL1MvyC9qp.JaPpgkecQ3UjGa44fYWAD911UzbJFHm', 'true', 'true');

--email = jordan.graocankic@email.com password = 4099
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Jordan', 'Graočankić', 'jordan.graocankic@email.com', '$2b$12$tTAjTyYRNbzxuTbIBy2Qd.ePCYTbVHRG9QLZOVF1hiBwjuH75j/V.', 'true', 'true');

--email = dmitar.cucic@email.com password = 5415
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Dmitar', 'Cucić', 'dmitar.cucic@email.com', '$2b$12$gyWRymUs51WoKsjomXn1eufa35ZPNA4kgK6FO5uny8fh2b5yJgvuC', 'true', 'true');

--email = filipinka.vesic@email.com password = 3444
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Filipinka', 'Vesić', 'filipinka.vesic@email.com', '$2b$12$7ooWhXJUKKGFeVOSqEjGdezg99GtX0lK/WeCkq3Ri84mXUhq45AHy', 'true', 'true');

--email = vuk.jovanic@email.com password = 7242
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Vuk', 'Jovanić', 'vuk.jovanic@email.com', '$2b$12$h1a8NQQJwn4aEPp/4lsLxuxXvXb5Z3rN6iw43aJPum5Gjg2VNI.NO', 'true', 'true');

--email = veroljub.kremonjic@email.com password = 1230
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Veroljub', 'Kremonjić', 'veroljub.kremonjic@email.com', '$2b$12$UTpZCE/L5.dbIbsQAetd9OpaK73SShDhgWtdIQTIQJTSmseUvFuRG', 'true', 'true');

--email = julijana.bocic@email.com password = 5645
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Julijana', 'Bocić', 'julijana.bocic@email.com', '$2b$12$j.4XNE2kJRIkmmaU70.NWOpfzALQ07x3NcZGxdw.9RoD.qEorVIoe', 'true', 'true');

--email = ignjatije.teodosic@email.com password = 3539
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Ignjatije', 'Teodosić', 'ignjatije.teodosic@email.com', '$2b$12$n3tv6a.Zgmc7LzWlgeYyR.LpoM1LGWG6WiJfn1jgTR/jPxNMJAMDy', 'true', 'true');

--email = isidora.dzamic@email.com password = 3534
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Isidora', 'Džamić', 'isidora.dzamic@email.com', '$2b$12$lamoWHMxcHH5m2e9nwfK5O6JVCeQ8Jpr0N8ZGO1MwO8utAg5jOWt.', 'true', 'true');

--email = pauna.salinic@email.com password = 9601
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Pauna', 'Šalinić', 'pauna.salinic@email.com', '$2b$12$3A3hbVNMSf5TPFsMFbVwl.O.IOPLRzbPBgn7M36wlt2oPrnzKEvuK', 'true', 'true');

--email = ranka.skrobic@email.com password = 2662
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Ranka', 'Skrobić', 'ranka.skrobic@email.com', '$2b$12$wLNjDLZPs7MOMQNxV2CAXeVh/hJjgG0GHEMp1rkwIWy7q7JoCCDq6', 'true', 'true');

--email = randja.redzic@email.com password = 7346
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Ranđa', 'Redžić', 'randja.redzic@email.com', '$2b$12$aEnAXPEeHtYghbdgbOw7zuDrct0bEVNDOtJ/3nwZq3twNAJG5caRG', 'true', 'true');

--email = stamenko.malencic@email.com password = 1529
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Stamenko', 'Malenčić', 'stamenko.malencic@email.com', '$2b$12$r4/xVBf2N5oU4CIW8MOjIuWM8bPJu9h4ghz51jo6LF9a95NqFU/ny', 'true', 'true');

--email = zvonka.curlic@email.com password = 6353
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Zvonka', 'Čurlić', 'zvonka.curlic@email.com', '$2b$12$lqpLFEV8kmrIW8qO7oVSl.TDbD3esNugFl6usrHVnHnBXtVlwxgoa', 'true', 'true');

--email = bozana.piljikic@email.com password = 9059
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Božana', 'Piljikić', 'bozana.piljikic@email.com', '$2b$12$TFze.TKnqE85G40CwJNdZulxPLL8Lpby2lGAVELsBEYSaP7x0XQa.', 'true', 'true');

--email = nebojsa.jablancic@email.com password = 4780
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Nebojša', 'Jablančić', 'nebojsa.jablancic@email.com', '$2b$12$fRlAVYWNYAdr5w8oW.0S2.odDnDVrWFr42cEn1yls8G5UZZGaNZ1q', 'true', 'true');

--email = vera.sojkic@email.com password = 4538
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Vera', 'Sojkić', 'vera.sojkic@email.com', '$2b$12$mDBRH4FWDg/WgDX2T95v3edwOSiBpQ3CjnJv3LWEx4B.mrvCOwnI2', 'true', 'true');

--email = sonja.kovarbasic@email.com password = 6071
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Sonja', 'Kovarbašić', 'sonja.kovarbasic@email.com', '$2b$12$GZx.jMhzwqRY8DS.O.2FNuxI/GO2y8r51xubs1J9P6wL.FrUocwLa', 'true', 'true');

--email = predrag.zaric@email.com password = 1142
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Predrag', 'Zarić', 'predrag.zaric@email.com', '$2b$12$oZZQlzUHBUu2DaYUjpqwkeGPCIAMjhEHL04ixay/R1XqMFphDd5N.', 'true', 'true');

--email = doris.vavic@email.com password = 8426
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Doris', 'Vavić', 'doris.vavic@email.com', '$2b$12$kyrkcFzNUO9j7cKYptnJ9eNGPssnQ66SaWd5aB7MdP.D8eh2cMucG', 'true', 'true');

--email = vukota.palangetic@email.com password = 4316
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Vukota', 'Palangetić', 'vukota.palangetic@email.com', '$2b$12$V4zRnFf2ENfpjnLK8tVBU.6pkFCto5ookU5ofr4DSOF62MVGRVRr.', 'true', 'true');

--email = grozdan.kesic@email.com password = 2096
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Grozdan', 'Kesić', 'grozdan.kesic@email.com', '$2b$12$1vZmU6abzhsm5sBPZ0W0GOSdOLeitGVbu0vZPumXxEOb4yvHhbTrq', 'true', 'true');

--email = lucija.gliguric@email.com password = 4751
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Lucija', 'Gligurić', 'lucija.gliguric@email.com', '$2b$12$DLiX.RaCWj2kNknmv.NM7ONj44L/n9qyFAmv9huF4w9TuTfwBPAd.', 'true', 'true');

--email = prerad.dobranic@email.com password = 1067
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Prerad', 'Dobranić', 'prerad.dobranic@email.com', '$2b$12$10G2ZLuqTaVMaAtyMPBiceeEGELr0i5MEFLzSN48UhCaRO/2UVZw6', 'true', 'true');

--email = stokan.calisic@email.com password = 4002
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Stokan', 'Čališić', 'stokan.calisic@email.com', '$2b$12$4pIE0/SnU7WnDYRz05r3D.r0SqoFRWLh.NR9gSINsrSjOe2fYuyYu', 'true', 'true');

--email = milica.skrnjic@email.com password = 9162
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Milica', 'Škrnjić', 'milica.skrnjic@email.com', '$2b$12$ZLDvMZrYUl83mc7DWSrLluBOKNH8RBK2FI9lqjeeioGseQUgU94Vq', 'true', 'true');

--email = slavna.likodric@email.com password = 7296
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Slavna', 'Likodrić', 'slavna.likodric@email.com', '$2b$12$RnBOeSsr2F6/vECCyPxEHOaYDmXdKMdt59ZdRT0C.UiE4HyQgshoi', 'true', 'true');

--email = jana.hristic@email.com password = 3803
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Jana', 'Hristić', 'jana.hristic@email.com', '$2b$12$00pWGvzGUkc42Q48vlloROxRwsas62b9jDM3p7HVoEllRS3YR773e', 'true', 'true');

--email = petko.demonjic@email.com password = 2489
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Petko', 'Demonjić', 'petko.demonjic@email.com', '$2b$12$wcNSN/aa7U5J4/HPf1223uCV4lCELNrrf/w.6ui9Dxp7xYVr562oe', 'true', 'true');

--email = obradin.scekic@email.com password = 7430
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Obradin', 'Šćekić', 'obradin.scekic@email.com', '$2b$12$nNB1jLPBc7upX4b.DsKzU.wsyouHPGVzlj5ITsry/vDMCeQtfe9Be', 'true', 'true');

--email = jordanka.traparic@email.com password = 4138
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Jordanka', 'Traparić', 'jordanka.traparic@email.com', '$2b$12$kX1/7HYfKKhGi5gLyCtn/./GU.Nkg5YCkrO/acobgM94OubLiZ6my', 'true', 'true');

--email = danojlo.kustudic@email.com password = 2542
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Danojlo', 'Kustudić', 'danojlo.kustudic@email.com', '$2b$12$fT8MDjQ2bQnmaYy03E/kcuiWyBLqxPNJyJvsVsxok.plAWkknq8wS', 'true', 'true');

--email = djulijana.makragic@email.com password = 9949
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Đulijana', 'Makragić', 'djulijana.makragic@email.com', '$2b$12$vLZSE38xD8OENo1dG9R4HOqCximF2ygLd9qJCAB4kcFQ4QSPqa6YC', 'true', 'true');

--email = katica.kujundzic@email.com password = 6177
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Katica', 'Kujundžić', 'katica.kujundzic@email.com', '$2b$12$f1TgQwpfZszFafickcdx9OWljaXdytlLh2FfAHqAbxRp8tPRrWdKC', 'true', 'true');

--email = emilija.budincic@email.com password = 8028
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Emilija', 'Budinčić', 'emilija.budincic@email.com', '$2b$12$y7ey6jZkrdi02EXgX30TT.5hp9n8ujVhPITjysCnRtPoxfVGYnMGy', 'true', 'true');

--email = radojko.kureljusic@email.com password = 4237
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Radojko', 'Kureljušić', 'radojko.kureljusic@email.com', '$2b$12$1jz7yyQpMvTtMC1F8ikQ1..b427LCl7PMw8mUMLfk58c6KVoV.vqC', 'true', 'true');

--email = zora.letic@email.com password = 3726
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Zora', 'Letić', 'zora.letic@email.com', '$2b$12$DPuvqgiv732FZsq6.vqZwu/6fSh357TgTi.vcjTfO2PEVkMzYNmT6', 'true', 'true');

--email = drasko.lotic@email.com password = 7350
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Draško', 'Lotić', 'drasko.lotic@email.com', '$2b$12$DvBAv2DbJrxfIhyfrUGrHei9fZJtUYfvNUcXGrIuIkJZMxHgobVgW', 'true', 'true');

--email = oliverka.djurendic@email.com password = 5507
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Oliverka', 'Đurendić', 'oliverka.djurendic@email.com', '$2b$12$YxQ.797Mhi/kA3A6xfEI3.H1Omb2TuhzEU4GwarEhr1K4my4h4/Dm', 'true', 'true');

--email = cveta.kedic@email.com password = 1446
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Cveta', 'Kedić', 'cveta.kedic@email.com', '$2b$12$F2aBn7/o/TpLUmj1xH.7/O5zG1fErWwAC4PzQ9EbLN/rW2LU3WSxS', 'true', 'true');

--email = marjan.gojacic@email.com password = 1644
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Marjan', 'Gojačić', 'marjan.gojacic@email.com', '$2b$12$9yvN2NCaseFP0fcWxahEg.mHMFCNHO7lI0wucvcNrTWTqW08VabTi', 'true', 'true');

--email = leonida.vrackic@email.com password = 1083
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Leonida', 'Vračkić', 'leonida.vrackic@email.com', '$2b$12$QZDfry17Xm2S3w/H7lr2qu3C.rZQXbmIS8QXO6CWGpa9MltW.Gw/K', 'true', 'true');

--email = blaza.jovicic@email.com password = 1801
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Blaža', 'Jovičić', 'blaza.jovicic@email.com', '$2b$12$Pl6t9hU.kVfTiWdwRgSkxej81iua/24UGk0M.2/PYRn5TdqNWl0jy', 'true', 'true');

--email = blagomir.granulic@email.com password = 1849
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Blagomir', 'Granulić', 'blagomir.granulic@email.com', '$2b$12$yBy6c56o7WBErlKuKt7XburAnfUrdyDPPjXQh2SOfP22SWS4/1CDq', 'true', 'true');

--email = zelimirka.curcic@email.com password = 5766
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Želimirka', 'Ćurčić', 'zelimirka.curcic@email.com', '$2b$12$WQpyC/iKxJG7HSWQp/7XZ.WA8M/FQMNQAiah0Ej.DLMaUjSYeyiO.', 'true', 'true');

--email = stanko.guzvic@email.com password = 8625
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Stanko', 'Gužvić', 'stanko.guzvic@email.com', '$2b$12$iCZWPblifiEm74o7HFMk9.NQE9z3TMHqMexPE2N2H3gAcsZlbsx2W', 'true', 'true');

--email = ljubisa.sofrenic@email.com password = 6672
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Ljubiša', 'Sofrenić', 'ljubisa.sofrenic@email.com', '$2b$12$k5Y8NHf7b.mmJzU86BFefOIdwLsZPxapnziFtmFjgOv4cIW0luSF2', 'true', 'true');

--email = bane.biljuric@email.com password = 7245
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Bane', 'Biljurić', 'bane.biljuric@email.com', '$2b$12$gY4Ixz2iBRwaQ0zkKQwRau/uBFRez3p0gFAfmqG90kMbtJhOOAhE6', 'true', 'true');

--email = nevenka.ljusic@email.com password = 3656
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Nevenka', 'Ljušić', 'nevenka.ljusic@email.com', '$2b$12$buP2KTPYK1sdtCNNfuGp5.OFqUhzXDTFRlZRY4e2SRNaj5I96pJne', 'true', 'true');

--email = hranislav.kerebic@email.com password = 1682
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Hranislav', 'Kerebić', 'hranislav.kerebic@email.com', '$2b$12$cVVG6ba0Ho6cszDkSFvVmOsUrXSK2ikJQzzfk00sRsqr5AiKV3ptW', 'true', 'true');

--email = negosava.bobicic@email.com password = 9732
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Negosava', 'Bobičić', 'negosava.bobicic@email.com', '$2b$12$idh7el635h.WixMNBZvd7uwNk8dFqMNl/D3YJI.PNPHczV7EHne0q', 'true', 'true');

--email = ivanka.jandric@email.com password = 3903
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Ivanka', 'Jandrić', 'ivanka.jandric@email.com', '$2b$12$E9QAvy57GBdx1jZ8U5gtru3octVMLsOSqSDGkKUUUcatRulCI.y22', 'true', 'true');

--email = djurdjina.bosankic@email.com password = 2464
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Đurđina', 'Bosankić', 'djurdjina.bosankic@email.com', '$2b$12$cln6o0wTdIR2bhxJqCfP7OF7AiPu3HWuzn3NNOSGnDcx4.BsZ/pia', 'true', 'true');

--email = stamena.todorcic@email.com password = 3403
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Stamena', 'Todorčić', 'stamena.todorcic@email.com', '$2b$12$EHsY0AWavFPqNzZHHxctdur4D7pgahtLRIVO/M82Rm4UqsARRW8IG', 'true', 'true');

--email = obrad.sudjic@email.com password = 1969
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Obrad', 'Suđić', 'obrad.sudjic@email.com', '$2b$12$BrTZI6KSH0cLJIfYY.nPHum2DLRZhEAhi6sWwreEOYg181ABXlBFm', 'true', 'true');

--email = ljuba.ponjausic@email.com password = 1332
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Ljuba', 'Ponjaušić', 'ljuba.ponjausic@email.com', '$2b$12$9xWe.VNNtzSXPjB8upyP4Oes3QIvqwHJpnTZYjA.VZ2znBepXtGHC', 'true', 'true');

--email = zorica.patric@email.com password = 5111
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Zorica', 'Patrić', 'zorica.patric@email.com', '$2b$12$JjbYFcYwXRU.mbrgEzvYwuHSmN.0pkb8oF2M938JMv1ht8yoIbYQu', 'true', 'true');

--email = njegoje.mrkaic@email.com password = 8589
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Njegoje', 'Mrkaić', 'njegoje.mrkaic@email.com', '$2b$12$qEwQi/khpVg7vpNckR6PSOna8s2e2SiOQ.yy1t/GIfI455BxEgZcy', 'true', 'true');

--email = zlatko.leontic@email.com password = 9605
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Zlatko', 'Leontić', 'zlatko.leontic@email.com', '$2b$12$RK5u/Pknmy9AtpAMYdfCiOitdT7h36HdRfpOzZe0GhscVFJIZkuJm', 'true', 'true');

--email = mitra.grabljic@email.com password = 2631
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Mitra', 'Grabljić', 'mitra.grabljic@email.com', '$2b$12$p2xqCAZxccwM1z9JWAIK4.Zxk.iCqhIAHkl0HOU/8bm5ShM6AApNK', 'true', 'true');

--email = ozren.tufonic@email.com password = 3796
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Ozren', 'Tufonić', 'ozren.tufonic@email.com', '$2b$12$mcnt/AlpooEpx0U49IrDlOZOfliPGVOf4TIM.h5BtNp.tCUNuG.GC', 'true', 'true');

--email = hristina.ugrinic@email.com password = 9321
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Hristina', 'Ugrinić', 'hristina.ugrinic@email.com', '$2b$12$HTHzyPFwngkhfXFIleZpeODXHlXS8Dr0nzc8/syiTNeXPYcP1Ka2C', 'true', 'true');

--email = vesna.bjeletic@email.com password = 6883
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Vesna', 'Bjeletić', 'vesna.bjeletic@email.com', '$2b$12$Yx0nMaWHfC9kABWDAyxFe.JUGbZZQkvbypMTrkzzB64wRMPoVZfpG', 'true', 'true');

--email = javorka.drobic@email.com password = 5994
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Javorka', 'Drobić', 'javorka.drobic@email.com', '$2b$12$O2ONfoiL2kYJp8nVxKAsrOmJZ9JhKSqOqOf6m75K4SeTGENj17LwK', 'true', 'true');

--email = spiro.bekic@email.com password = 2435
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Špiro', 'Bekić', 'spiro.bekic@email.com', '$2b$12$.gSRV1FO95w4xE0OpROhjOczDwG8v9oNfVzY3FV7n7Reb7OrCk6Tm', 'true', 'true');

--email = lara.dasic@email.com password = 7982
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Lara', 'Dašić', 'lara.dasic@email.com', '$2b$12$0u7C7pz9mVvKOVBCiXnrEueuFnpD3/dwA3s.H9c0EENqKzYhnX/0S', 'true', 'true');

--email = mitar.vukojicic@email.com password = 6175
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Mitar', 'Vukojičić', 'mitar.vukojicic@email.com', '$2b$12$4qJ1ssMhJtnOUsp./YJw.ugyJ5wa/XFc3QUfMA4OVcgTjY.Ezir4u', 'true', 'true');

--email = jugoslav.djoric@email.com password = 7752
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Jugoslav', 'Đorić', 'jugoslav.djoric@email.com', '$2b$12$mA4IUFVviF0omjv1QbVxae/FDXN89j3m7ruX9QDFY27j0PD2mUTQ6', 'true', 'true');

--email = vladislav.predic@email.com password = 7770
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Vladislav', 'Predić', 'vladislav.predic@email.com', '$2b$12$uoXBT9DJkhhLliDkYsVCTOJZZN5ThiPPsunXbLlphoMS8yGMmNhdS', 'true', 'true');

--email = spomenka.andjelic@email.com password = 7515
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Spomenka', 'Anđelić', 'spomenka.andjelic@email.com', '$2b$12$ZqfriueCbs5luEr48a6qBOztXHFq5zcJr4Qjzy5EBy5immBMNiRFu', 'true', 'true');

--email = tatjana.racic@email.com password = 9353
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Tatjana', 'Racić', 'tatjana.racic@email.com', '$2b$12$HgMZbod5Uct3FYihjYAUqux3A42zmPv9XtZo1XUti9Qi6ka7POov6', 'true', 'true');

--email = stana.pasalic@email.com password = 9272
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Stana', 'Pašalić', 'stana.pasalic@email.com', '$2b$12$V6i9LphxhaB4IwECDa2v8Okfj0PIF3U91IeLkh7hz1ORz4cFXe20m', 'true', 'true');

--email = melentije.djuketic@email.com password = 8977
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Melentije', 'Đuketić', 'melentije.djuketic@email.com', '$2b$12$naxcpJexXA9wtX8lub4moO056nXOsObTLE..NB7RE6J81Jm7RAnFu', 'true', 'true');

--email = nina.baltic@email.com password = 3141
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Nina', 'Baltić', 'nina.baltic@email.com', '$2b$12$Prm0SqJ76YZjOan/Gkdwde9caXmta.Gv.ZUKe2C6udqBoKM8j6RjC', 'true', 'true');

--email = olga.tubic@email.com password = 1661
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Olga', 'Tubić', 'olga.tubic@email.com', '$2b$12$/A/dq6C4RYiCnKjTmy2c.O7gcr3jDWAwTHNX0ixJoR4h5R2kFoBt2', 'true', 'true');

--email = razumenka.lombardic@email.com password = 3145
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Razumenka', 'Lombardić', 'razumenka.lombardic@email.com', '$2b$12$IBM5xgOK2OZFMC95J8YHhOzGBRQRDEa0dMKVvKTUCIt5GKVp6ItEm', 'true', 'true');

--email = eleonora.bulajic@email.com password = 9314
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Eleonora', 'Bulajić', 'eleonora.bulajic@email.com', '$2b$12$ONmhrxEkhIHdCJAedqJSHOjOp2fue7797oaVJLeromFmCT31eF9qG', 'true', 'true');

--email = veronika.d@email.com password = 8938
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Veronika', 'D', 'veronika.d@email.com', '$2b$12$e2CkQcGpwOfcj4OvQVIsZuX8CVLzwW90cz2r.yrDKZkd.IaCUCt8a', 'true', 'true');

--email = gabrijela.karadaglic@email.com password = 8226
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Gabrijela', 'Karadaglić', 'gabrijela.karadaglic@email.com', '$2b$12$tozTFD64g/5JWubO2QX3VeJ1oY9MOIdL28NYrWN6adMUkDsCBMBum', 'true', 'true');

--email = obradin.bondokic@email.com password = 7781
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Obradin', 'Bondokić', 'obradin.bondokic@email.com', '$2b$12$UoNM3rZpK7U7olQZm4b5POkNwf38i5WEfsLJxvBt.XRqhdm/FKtvG', 'true', 'true');

--email = stanislava.stefkic@email.com password = 9057
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Stanislava', 'Štefkić', 'stanislava.stefkic@email.com', '$2b$12$CIQSr4b8KG6z5WBodrpx8O8s0lBOaRZ4vFgoNkN0gl6jhkn0F0eqe', 'true', 'true');

--email = janovka.srzentic@email.com password = 7460
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Janovka', 'Srzentić', 'janovka.srzentic@email.com', '$2b$12$2rJ9dd373uctVCIvetNhMO/gGElsc/iHby7106S2ZljWT3BB/QzHi', 'true', 'true');

--email = ljilja.vitakic@email.com password = 4689
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Ljilja', 'Vitakić', 'ljilja.vitakic@email.com', '$2b$12$iA9B.i4e0mG7YetgUJr7Yuwjg84UUvD2Nr8bzFF/5gID9sgYD4PCm', 'true', 'true');

--email = aleksandra.cvikic@email.com password = 6298
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Aleksandra', 'Cvikić', 'aleksandra.cvikic@email.com', '$2b$12$rIqecAi9JRu1emUNoEeFMeOjAkiJoIvucgnyFsN4/XJlIAfOOENAu', 'true', 'true');

--email = zivojin.opacic@email.com password = 2889
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Živojin', 'Opačić', 'zivojin.opacic@email.com', '$2b$12$qgImF7FEuwhcTOBQiFeJReluOozaak4t5vusFGBZPymOBFF4KJW.e', 'true', 'true');

--email = verka.priocic@email.com password = 5125
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Verka', 'Priočić', 'verka.priocic@email.com', '$2b$12$mYpaqcK03cdoeduVD.LgAOiTpLgWDKP0NDyeP5Ayam63mbOCq0hA.', 'true', 'true');

--email = cubrilo.tatisic@email.com password = 4308
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Čubrilo', 'Tatišić', 'cubrilo.tatisic@email.com', '$2b$12$j0Kv5h7blrYvFiheicY4veB.YDV9dua3LcMIh2VuhozJ.nKz3uIBy', 'true', 'true');

--email = radonja.tamburic@email.com password = 2994
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Radonja', 'Tamburić', 'radonja.tamburic@email.com', '$2b$12$xwk8dFGbiV5EtVM3aWnv8uG/cjaPUUHndiGXWiA9bShwrIIHE0Udq', 'true', 'true');

--email = zaga.tepic@email.com password = 5763
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Zaga', 'Tepić', 'zaga.tepic@email.com', '$2b$12$uMt91AL6o.BjkJnjQSOKyuzv4Gjh0/8AaQbjNQ7MggyqbI3UW/9UK', 'true', 'true');

--email = vladimir.cucic@email.com password = 4131
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Vladimir', 'Cucić', 'vladimir.cucic@email.com', '$2b$12$KxTOlHZq0uvtpnZpklNMQ.7b1CryX9Kb8QkJ5LYH/THT0cAGWfv5C', 'true', 'true');

--email = kristina.macic@email.com password = 7758
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Kristina', 'Maćić', 'kristina.macic@email.com', '$2b$12$eoucLAYJodDTxJpGiJEKCO/Cf27YpoJ3V0gj5s4KsVqpy97Nhshou', 'true', 'true');

--email = jordan.babecic@email.com password = 5522
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Jordan', 'Babecić', 'jordan.babecic@email.com', '$2b$12$bY9nez4G/WanzuBSPUmt1.1uMqBmMuHUobfvYWm87Jxqq1MjCJTf2', 'true', 'true');

--email = srboljub.buduric@email.com password = 3958
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Srboljub', 'Budurić', 'srboljub.buduric@email.com', '$2b$12$IcF1hmTNmYd2ILLOucGQKOWwHqrLX/veOYnbfsczrRddkipTiAW4C', 'true', 'true');

--email = ozren.vukoicic@email.com password = 2014
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Ozren', 'Vukoičić', 'ozren.vukoicic@email.com', '$2b$12$XkYkmaWbE9TV5P7kZ8EXAuFMXLaiBIvc1LL6aN2wKyEPNYjfhPk6m', 'true', 'true');

--email = teohar.paligoric@email.com password = 6548
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Teohar', 'Paligorić', 'teohar.paligoric@email.com', '$2b$12$QWCoH7uuqRf5F6g/iCEubu4cky9rCNS4U3A0fXrAE1WnX/evDsGCi', 'true', 'true');

--email = una.mutibaric@email.com password = 8671
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Una', 'Mutibarić', 'una.mutibaric@email.com', '$2b$12$aE3GBXAvvBFcDz7WGSSe2e/M6UjKfFVTS9OUCEefcj0NW77I7iUNG', 'true', 'true');

--email = zdravka.mladenic@email.com password = 1435
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Zdravka', 'Mladenić', 'zdravka.mladenic@email.com', '$2b$12$PLEWQJ/ld4/dkBeDYIw1f.eCDjQpQBBCL05xGV7TKPxJ8.YkE.BG6', 'true', 'true');

--email = sibinka.sevkusic@email.com password = 1017
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Sibinka', 'Ševkušić', 'sibinka.sevkusic@email.com', '$2b$12$xv.Kz6mBDjf4yyI7hMKNkOtrrpjCPr0VNWiFh4mSSqolRfJUgJMXm', 'true', 'true');

--email = darko.bozaric@email.com password = 8030
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Darko', 'Božarić', 'darko.bozaric@email.com', '$2b$12$S9kuLZIZK97mJ8.j1Y6xkO.b9XM96Ctr1wFtsjBDOiHc4.IlT8xnO', 'true', 'true');

--email = melenija.vulic@email.com password = 9260
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Melenija', 'Vulić', 'melenija.vulic@email.com', '$2b$12$mCMZrqJcFWrze3q7L1fTZerWCi3Ptre29LT3V.WneZ/CbJUqsu96y', 'true', 'true');

--email = gorica.aladic@email.com password = 1193
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Gorica', 'Aladić', 'gorica.aladic@email.com', '$2b$12$JGtefU82TwKwGud/d4CJXuh.7k7R8N4ZIJv8NQ7UK7WULHhFZfFW.', 'true', 'true');

--email = timotije.bjeletic@email.com password = 6240
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Timotije', 'Bjeletić', 'timotije.bjeletic@email.com', '$2b$12$WfEzsoyNi8dpUCO7.2TjWOAV6nOVKjPFkgGLsOExDfSHtrqXR5Tx.', 'true', 'true');

--email = takosava.basarabic@email.com password = 6663
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Takosava', 'Basarabić', 'takosava.basarabic@email.com', '$2b$12$GSgITMjEdDVm5TyXymCTc.yraQ0wssZhb5tbca1LaGLdapSufqdPy', 'true', 'true');

--email = zivka.vladnic@email.com password = 2395
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Živka', 'Vladnić', 'zivka.vladnic@email.com', '$2b$12$Z/059//KxHdy0AqdU1kLHubSBaxNJTpPC2QHX91qOQ6znhuR9KlcS', 'true', 'true');

--email = bozana.garalejic@email.com password = 2634
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Božana', 'Garalejić', 'bozana.garalejic@email.com', '$2b$12$7KanDCCrGc5SsMpLv33Ma.Oh7PXNZKu9o97XJ02YJCal4k1V2xMoG', 'true', 'true');

--email = ratibor.budalic@email.com password = 4718
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Ratibor', 'Budalić', 'ratibor.budalic@email.com', '$2b$12$3QwBiEYheJl2V7povakma.Lar3yzJl4/QtpgxgeaMnHcoGI7UN7t6', 'true', 'true');

--email = srba.baskic@email.com password = 8751
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Srba', 'Baskić', 'srba.baskic@email.com', '$2b$12$nLLFtvcbwvxqIuRX3WCwQusL0Ru2oFM1kbp2/JF8hEBoAWM3s0doW', 'true', 'true');

--email = zlatko.ivantic@email.com password = 7514
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Zlatko', 'Ivantić', 'zlatko.ivantic@email.com', '$2b$12$aXMyLzhoa/Hzl0ZMqGoFWuCQhPJv9z5o4TzNqYlopcDGbG89D6Kvy', 'true', 'true');

--email = srpko.aksic@email.com password = 8553
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Srpko', 'Aksić', 'srpko.aksic@email.com', '$2b$12$Uz89pyUcSWb6fYiXUT3MFeHPPD06xE4vhPqiEKE5slUXIVmlImXrC', 'true', 'true');

--email = doroteja.dimcic@email.com password = 8211
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Doroteja', 'Dimčić', 'doroteja.dimcic@email.com', '$2b$12$rFwlNSBCpO5z7ojTopv3qeQ9aoNFhYopQt5otElD.tmucba.WX69q', 'true', 'true');

--email = simonida.marincic@email.com password = 3170
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Simonida', 'Marinčić', 'simonida.marincic@email.com', '$2b$12$BC0fQRJ3lV8BUdgt7HtxkOvkFTTL2IvjcDKv5r7QkGs/241Z5XCyy', 'true', 'true');

--email = bane.gadzic@email.com password = 6101
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Bane', 'Gadžić', 'bane.gadzic@email.com', '$2b$12$Cg.eWInAPgnH2drcTW3ZmuP1GgqESAEmzvEUFLwSPAZrLwyveCN4.', 'true', 'true');

--email = budislav.kiselcic@email.com password = 9551
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Budislav', 'Kiselčić', 'budislav.kiselcic@email.com', '$2b$12$gKC/fx3jbLIhGym.64lAsOQkSErXqisruFbNG.qbziPYWeaRfVOlK', 'true', 'true');

--email = olja.vajkaric@email.com password = 5691
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Olja', 'Vajkarić', 'olja.vajkaric@email.com', '$2b$12$5NV4Iw3KItV2Cxa2g7WpRecToKqjGQP1QbUUYTxFKLPQ3Wkh5o2NO', 'true', 'true');

--email = bojan.gledic@email.com password = 4163
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Bojan', 'Gledić', 'bojan.gledic@email.com', '$2b$12$pgG/APL8TjMCzj/r3EhLpOpd4HSFJCF4qcnabZYO1tQ9PPETaJzKC', 'true', 'true');

--email = veselinka.besarabic@email.com password = 8621
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Veselinka', 'Besarabić', 'veselinka.besarabic@email.com', '$2b$12$U85Dprw4MYeB.BRk97nQEeNWgPUGK0FGaWScdOpIrdQin/gJHkbdu', 'true', 'true');

--email = dobrasin.plazacic@email.com password = 2854
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Dobrašin', 'Plazačić', 'dobrasin.plazacic@email.com', '$2b$12$ojGOag/GumNb1PT6noD1Y.Ev0NG0MO1hQNYFDeJKeUdO08E0ivcQ.', 'true', 'true');

--email = paun.raicic@email.com password = 4042
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Paun', 'Raičić', 'paun.raicic@email.com', '$2b$12$vEJ97WW2xpTg2RTYh6o7bOe.EpK1j5ECna.EnNcny8CedR4YRvR8C', 'true', 'true');

--email = elizabeta.cmiljic@email.com password = 4559
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Elizabeta', 'Cmiljić', 'elizabeta.cmiljic@email.com', '$2b$12$P1WMkbgw3CSMOfvjBAG/7OU.HBffHAppDy3r.XX9qdIwnoCZcW2ie', 'true', 'true');

--email = sima.grubjesic@email.com password = 2116
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Sima', 'Grubješić', 'sima.grubjesic@email.com', '$2b$12$7WhSORvm0.C8gWXUyL4vmuhobC49B8vigr.o4BVicQGtwX1Hlf0.O', 'true', 'true');

--email = jezdimir.malisic@email.com password = 4403
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Jezdimir', 'Mališić', 'jezdimir.malisic@email.com', '$2b$12$gy5H9ErvOx1VXJHTZWO2kOWqKkk/3ALqksCMSxfUmLrejhnELo98S', 'true', 'true');

--email = milun.aksentic@email.com password = 6062
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Milun', 'Aksentić', 'milun.aksentic@email.com', '$2b$12$KJRsewhlDqleCdrbo15IEueA3G4rHhy2Nei.iTmbOex2ch01Y1ud6', 'true', 'true');

--email = glorija.milusic@email.com password = 2763
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Glorija', 'Milušić', 'glorija.milusic@email.com', '$2b$12$tuh5XkZ9XL4uWcvThyTKA.CfskPEp.ko8sYBHRTaQXSQKnbeUd.li', 'true', 'true');

--email = ozren.galcic@email.com password = 1131
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Ozren', 'Galčić', 'ozren.galcic@email.com', '$2b$12$jg.RepGdngYAqn8sVLbaKuEuCZPxH7rTaHzQS4oD.E5dS7CFBlqdC', 'true', 'true');

--email = david.janic@email.com password = 3182
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'David', 'Janić', 'david.janic@email.com', '$2b$12$9x0BM2P9bhb4GFyf8D/.Bu7YeR/a4jotll.ch6G80cdnCc5HqRare', 'true', 'true');

--email = rastko.plavljanic@email.com password = 6039
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Rastko', 'Plavljanić', 'rastko.plavljanic@email.com', '$2b$12$y61LeKkkY/I/mgLcS/E/7ehxZp6OubuQqF9nlwPdaRZ.T5h3CsIeu', 'true', 'true');

--email = caslav.trific@email.com password = 5185
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Časlav', 'Trifić', 'caslav.trific@email.com', '$2b$12$JgdVPNdNn.bJeeaOsRmkXeRqFkVvizMfNhfXs22RkSyBTZV4oZFZO', 'true', 'true');

--email = stanoje.jegdic@email.com password = 7979
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Stanoje', 'Jegdić', 'stanoje.jegdic@email.com', '$2b$12$Li.zUjevX/0CMKmGnXlrsO3v3rSNNZcapuNEisEPheB7rSLnrH8Ku', 'true', 'true');

--email = srdjan.ticeric@email.com password = 6088
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Srđan', 'Tičerić', 'srdjan.ticeric@email.com', '$2b$12$JiLTU87b7F5xTCIMVdienu6BmdhKq3.k3aS2DzAkO2rhbEDoY.EP.', 'true', 'true');

--email = ninko.ergic@email.com password = 5642
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Ninko', 'Ergić', 'ninko.ergic@email.com', '$2b$12$ORcOKUB7bxmkj.9ZTSnBzenyhdaR9S1lpNAYlh7BZVczTHcJHaEK6', 'true', 'true');

--email = zorislava.zaburnic@email.com password = 4083
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Zorislava', 'Zaburnić', 'zorislava.zaburnic@email.com', '$2b$12$MHFkt51YpnECln6BBAalVeQBgfF0UgqRzrBndZU9af4dUTDWo3stq', 'true', 'true');

--email = blagomir.pekic@email.com password = 2718
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Blagomir', 'Pekić', 'blagomir.pekic@email.com', '$2b$12$J21GEbShdvGtdvGiBRe01uIGWasUh.i7vZONs/m2zmvMUPLJlsO1m', 'true', 'true');

--email = milojko.oljacic@email.com password = 6576
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Milojko', 'Oljačić', 'milojko.oljacic@email.com', '$2b$12$2P7hGj7E8XLJe3OJ2Gc1VOwTVOJvA77VSlCi6qant9YlAiT7qSD2K', 'true', 'true');

--email = krsman.joncic@email.com password = 8323
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Krsman', 'Jončić', 'krsman.joncic@email.com', '$2b$12$WE7p8UEMShECRHDaatCH4eUxtw/QzEuLZYCFFq4AHT/QebppfhF2i', 'true', 'true');

--email = vidoje.budalic@email.com password = 7869
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Vidoje', 'Budalić', 'vidoje.budalic@email.com', '$2b$12$uOeTvaNuWm10OvVsS3M1euMdVAe87ubbhzH27ORptcndQfeOK7V/y', 'true', 'true');

--email = milijana.dedic@email.com password = 3355
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Milijana', 'Dedić', 'milijana.dedic@email.com', '$2b$12$E5WxwTVTy3py7NoXz0tBmuodyb7pqgh6hI0mjVUJQrmvVFAhGgsdO', 'true', 'true');

--email = pava.mircic@email.com password = 8604
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Pava', 'Mirčić', 'pava.mircic@email.com', '$2b$12$vi6oWZjQiHA1YvaktqCEauOlGjCieTgqitgFnUlUJO9GqgvVH8IC2', 'true', 'true');

--email = dragutin.zjalic@email.com password = 2849
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Dragutin', 'Zjalić', 'dragutin.zjalic@email.com', '$2b$12$8Imq/cc92TsSAylyLPyeJeyyTTzUPDVLgvg4Gc5POE1OOh3uqCDMa', 'true', 'true');

--email = zlatoje.tesendic@email.com password = 2035
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Zlatoje', 'Tešendić', 'zlatoje.tesendic@email.com', '$2b$12$Zi/rizOPgdGlbiQb3uQUR.6.wNTMdG3E32W8GCOuIbE2x7TxbfsSm', 'true', 'true');

--email = ratibor.kazic@email.com password = 5195
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Ratibor', 'Kažić', 'ratibor.kazic@email.com', '$2b$12$0gAvJ5tHACinb92CcvjGMOInhkvixnt/jwpQUlF9ihy18JeZ3WT3W', 'true', 'true');

--email = selena.samardzic@email.com password = 1563
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Selena', 'Samardžić', 'selena.samardzic@email.com', '$2b$12$KrDJZOvEHOoBx8lbRgf9JO91fLyE.R5Gc19BTYfjHRJv4yqfBO8Lm', 'true', 'true');

--email = olgica.avdulic@email.com password = 1848
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Olgica', 'Avdulić', 'olgica.avdulic@email.com', '$2b$12$ysMXGhajzaGSMXmOqxIO8ezx3Goo.o3Hrs8lYINNlTx0xn3JT4TTW', 'true', 'true');

--email = saveta.susic@email.com password = 7234
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Saveta', 'Sušić', 'saveta.susic@email.com', '$2b$12$tbVJsQY6IslyOuv.f8rRaOWRTrePuQd.0lWX6KpERCjS09fy61WXm', 'true', 'true');

--email = paun.cukic@email.com password = 6669
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Paun', 'Cukić', 'paun.cukic@email.com', '$2b$12$6.JOjadvw3vHm3HCUt40k.9vQHbKvTTXE3sUeduf5RQAIbj1sb3C2', 'true', 'true');

--email = vera.subosic@email.com password = 7223
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Vera', 'Subošić', 'vera.subosic@email.com', '$2b$12$5f2cn.6/UqrgESEIfGL/nuvZ55vfbEe.IRJ1JyMhc5zyAemIiEUx2', 'true', 'true');

--email = cirka.jovadzic@email.com password = 2046
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Ćirka', 'Jovadžić', 'cirka.jovadzic@email.com', '$2b$12$OFIzp9sqVf2mQ0tAW5tEJetgPqk/mvIx69uA7iFjVQtmZIwq8f2yG', 'true', 'true');

--email = lale.salinic@email.com password = 7867
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Lale', 'Šalinić', 'lale.salinic@email.com', '$2b$12$AzgDVkAxJLsehAQXJ43GP.C3W.n2fFykguU5DEt/dlU/04qDdA9ri', 'true', 'true');

--email = dragomir.dajlic@email.com password = 7242
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Dragomir', 'Dajlić', 'dragomir.dajlic@email.com', '$2b$12$er18SLIaH1n0EN7ci3BR3uRon4fB6hd/grbWG0l3RZuWos8TpnEza', 'true', 'true');

--email = djordje.mrkaic@email.com password = 6112
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Đorđe', 'Mrkaić', 'djordje.mrkaic@email.com', '$2b$12$unBUCiuRivTVJyjtisEoheE.ACZP.wXX5OAty0WNgXVpj.pd9MSUO', 'true', 'true');

--email = branko.vuksic@email.com password = 2138
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Branko', 'Vukšić', 'branko.vuksic@email.com', '$2b$12$Ui2dbBPgAVBtax9Q7JnjD.zoyJs5mwdtblKuJ6VpjhTB5/wl0Lo/u', 'true', 'true');

--email = kadivka.krnjeusic@email.com password = 6174
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Kadivka', 'Krnjeušić', 'kadivka.krnjeusic@email.com', '$2b$12$gCKwGY0.r5tUw93OB4GkLO.pyV8AygYmH5YACiE4xHkHMUv15GxIe', 'true', 'true');

--email = miloje.krompic@email.com password = 4899
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Miloje', 'Krompić', 'miloje.krompic@email.com', '$2b$12$DlTjTtLR4B1d3rCv3QFrWO0EHTt2CFu.fv/Sf66YR8uy74CHfGHUC', 'true', 'true');

--email = zivomir.midic@email.com password = 5656
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Živomir', 'Midić', 'zivomir.midic@email.com', '$2b$12$OWH.WU3ljDQ8AkyXUrqauO8IYu1wnC1P.wD026O2xq7J9X55RgC.m', 'true', 'true');

--email = simeon.turnic@email.com password = 7268
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Simeon', 'Turnić', 'simeon.turnic@email.com', '$2b$12$iL/YNaVdtMr/jyG8qoYkKuUjr90gjDF2o1nJDAquAiVAsunqTffgi', 'true', 'true');

--email = simka.dotlic@email.com password = 5506
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Simka', 'Dotlić', 'simka.dotlic@email.com', '$2b$12$QuEKAX7B.A4xzGTWotjL9.0arpekEhQwOX.wBOOm1dpo/kYdLgy9a', 'true', 'true');

--email = maksim.aljetic@email.com password = 2977
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Maksim', 'Aljetić', 'maksim.aljetic@email.com', '$2b$12$VAPF02VSb9DvQOkNrLF6yO1fJEquJXCVadnI8.l7khybz.LjEExRy', 'true', 'true');

--email = svetozar.subic@email.com password = 7453
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Svetozar', 'Šubić', 'svetozar.subic@email.com', '$2b$12$rNYlx8QWTahVOA4qaLBF6uhixUba0ibLb/jkeb0rcXZKRmbMGaKMm', 'true', 'true');

--email = dobroslavka.buloscic@email.com password = 8961
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Dobroslavka', 'Buloščić', 'dobroslavka.buloscic@email.com', '$2b$12$fvnuqoNo/dCHp2M0cAv3leZvZX8TISOaG0baFuRWlHcGZI22W1Dd.', 'true', 'true');

--email = verica.pelkic@email.com password = 2568
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Verica', 'Pelkić', 'verica.pelkic@email.com', '$2b$12$zjWtW96U.Z1j541FVeDBJe79nMIMKoWd0g2Pr3v58NotoqAvBgjGW', 'true', 'true');

--email = zika.gluvajic@email.com password = 9595
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Žika', 'Gluvajić', 'zika.gluvajic@email.com', '$2b$12$4V2.Fvq7Fcnn/j8ACfdAGOw6qlOLRyJS1YSdOFXpaYW1pvTUnmJca', 'true', 'true');

--email = blazenka.docic@email.com password = 7312
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Blaženka', 'Docić', 'blazenka.docic@email.com', '$2b$12$i3RbA.yfBQmZOqcqJ0jx1.f1GdpNrYJmUNbtOoBkXUwhm65ngdssO', 'true', 'true');

--email = krsmanija.raduljcic@email.com password = 2880
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Krsmanija', 'Raduljčić', 'krsmanija.raduljcic@email.com', '$2b$12$wJ/.RscqqX/qKLXruaGMg.akoPqMBgUbWOYLZctNGyp9Net2KojFG', 'true', 'true');

--email = stojna.maslic@email.com password = 4485
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Stojna', 'Maslić', 'stojna.maslic@email.com', '$2b$12$zKlYToDI3sMuEIaPTt8MyunbOvLXnf.gKUlHcWPZAI2h09WV2OQku', 'true', 'true');

--email = milinko.radulic@email.com password = 9739
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Milinko', 'Radulić', 'milinko.radulic@email.com', '$2b$12$Y6QEnr9n4k4H/bOUNQmmyevdMUwjho6KaEuV8YiBBiqvANj1ihM4G', 'true', 'true');

--email = zivko.ljubavic@email.com password = 3331
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Živko', 'Ljubavić', 'zivko.ljubavic@email.com', '$2b$12$KzVV1VB.BLju031rHkoc3eDMk489KQP5vVsLlk.nA1FvyEaX4/FVe', 'true', 'true');

--email = javorka.dusanic@email.com password = 9445
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Javorka', 'Dušanić', 'javorka.dusanic@email.com', '$2b$12$r1UySI8KbdDckvg22ZztcOM5kUm1ljcxwGtonGZ.hn2dMQkYmQ.ra', 'true', 'true');

--email = bogdana.mandinic@email.com password = 6159
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Bogdana', 'Mandinić', 'bogdana.mandinic@email.com', '$2b$12$mlPlXHABrEMUWo1V1311FOwAeM7lhyexl7TSktXu4qzcfqYlEMnPC', 'true', 'true');

--email = zagorka.jaksic@email.com password = 2686
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Zagorka', 'Jakšić', 'zagorka.jaksic@email.com', '$2b$12$/iJZsRddBlPi7Jo4EBJcy.cvOCfZ11ktFxAawdhEuslylPSa2/Csa', 'true', 'true');

--email = budislav.trosic@email.com password = 3018
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Budislav', 'Trošić', 'budislav.trosic@email.com', '$2b$12$YSjvXFrqbiMdrthCO/MW5useIl8ZBCng.rEIjkHLM2Kd/jss2Ilgi', 'true', 'true');

--email = teodora.bozanic@email.com password = 9440
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Teodora', 'Božanić', 'teodora.bozanic@email.com', '$2b$12$N6QCDLgEkN8tkt0BT7aZru55X51xye8c6L733mQ3RUmqFJKmzk0rm', 'true', 'true');

--email = jagos.tosnic@email.com password = 1703
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Jagoš', 'Tošnić', 'jagos.tosnic@email.com', '$2b$12$R5cfkjClTw7vU6SXFa02zujxoOMWhaVFUrwNdkTWy/gVa2N7XevFe', 'true', 'true');

--email = dobrosav.stoicic@email.com password = 3973
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Dobrosav', 'Stoičić', 'dobrosav.stoicic@email.com', '$2b$12$Z3wzMFXzpitOMeIowriihex1dSLmvNVnkP8h5bEXSKZm6g/2ePtt.', 'true', 'true');

--email = hariton.lijeskic@email.com password = 9827
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Hariton', 'Lijeskić', 'hariton.lijeskic@email.com', '$2b$12$XzB9jx1IzYxxc6yFCx0nq../OtmtIOZfZ25H7VxAzX9EIAgMqDQL.', 'true', 'true');

--email = mira.razumenic@email.com password = 5461
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Mira', 'Razumenić', 'mira.razumenic@email.com', '$2b$12$pu5HQeHuPgDJWp5897IwR.uXqjvnPopaT9bPPjq9ggefb8BSQ1Ee2', 'true', 'true');

--email = mojsilo.krsic@email.com password = 4743
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Mojsilo', 'Kršić', 'mojsilo.krsic@email.com', '$2b$12$UVOuHwm3z3MGGW7K4hvEReI34HMVpILYEI4MUeEIcI4B9tmFXk6k.', 'true', 'true');

--email = dobrosav.pencic@email.com password = 2791
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Dobrosav', 'Penčić', 'dobrosav.pencic@email.com', '$2b$12$4VvqKIkFCGrTkr.8m.mqD.2IS638NfFtob3Q6I5z2rWdYZ2v3nytm', 'true', 'true');

--email = budislav.vasilic@email.com password = 3087
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Budislav', 'Vasilić', 'budislav.vasilic@email.com', '$2b$12$eUPfexUt/IhBMtt/n3g3Fe3CsYYPEtqqXCrWMlZkubDWy8TWZQb/W', 'true', 'true');

--email = zivodarka.becic@email.com password = 5796
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Živodarka', 'Bečić', 'zivodarka.becic@email.com', '$2b$12$Dai70Buk5DvA7V3SJz17ve1WddYF9y/LERL8L4VgoGLrVHtDrL3jm', 'true', 'true');

--email = zaklina.djuricic@email.com password = 6276
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Žaklina', 'Đuričić', 'zaklina.djuricic@email.com', '$2b$12$6efS8499wDZatg2pSrhlMOoFlSQRO..58YhwHFquvkf.IGeFwdOIK', 'true', 'true');

--email = ostoja.trifunjagic@email.com password = 3892
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Ostoja', 'Trifunjagić', 'ostoja.trifunjagic@email.com', '$2b$12$.ndJZLktu8lDYjxakRKKN.om/DVcr0OU99Yuvgyzrdujlem7h37qi', 'true', 'true');

--email = srboljub.maretic@email.com password = 4168
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Srboljub', 'Maretić', 'srboljub.maretic@email.com', '$2b$12$j9MgdWVRcsVBoo/C.pgHWeZF8T/U3GdkkFhRDUoRvkUc.sYfHiKRq', 'true', 'true');

--email = svetoje.vlastic@email.com password = 2780
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Svetoje', 'Vlastić', 'svetoje.vlastic@email.com', '$2b$12$5WOpa3D0VJq/eb2O.9wo5e5WrKlUcyZ30Sxgz0UojhP7CdfrabOoK', 'true', 'true');

--email = dobroslavka.vragolic@email.com password = 5185
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Dobroslavka', 'Vragolić', 'dobroslavka.vragolic@email.com', '$2b$12$ygHdmq5WTEw5cnolB3mtDObj05ZjZe7vkNNKC1gqt/aPesV8CJLKy', 'true', 'true');

--email = vojimir.joncic@email.com password = 9825
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Vojimir', 'Jončić', 'vojimir.joncic@email.com', '$2b$12$7FwxeQ43RFwVZbWSa1yRF.eA6qhcUfE8Z541cGtry5q45YGG8Xx.q', 'true', 'true');

--email = dobrosav.brencic@email.com password = 1905
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Dobrosav', 'Brenčić', 'dobrosav.brencic@email.com', '$2b$12$/wkQrbyy3AxgSUE4ldn7EeFXWj/riG4FvchBAvzl5LJaKvnxX6o7q', 'true', 'true');

--email = caslavka.pisteljic@email.com password = 2993
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Časlavka', 'Pišteljić', 'caslavka.pisteljic@email.com', '$2b$12$9CPfD2HEguJvQUFdAzxpteqZlnIeVvmfvzms2zUehfaQfVvDSEdLm', 'true', 'true');

--email = milja.purisic@email.com password = 2472
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Milja', 'Purišić', 'milja.purisic@email.com', '$2b$12$jG3WQkWUuXI2j28I2DAfZ.8b24j.Kgmd0UefLewvzz.ZXOdeDSOim', 'true', 'true');

--email = oliverka.delic@email.com password = 4606
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Oliverka', 'Delić', 'oliverka.delic@email.com', '$2b$12$6KrdlKPwzOi0xsug60ufiuHqA03V8mtLVOhCWGqoau8jb25siyeWe', 'true', 'true');

--email = steva.cojcic@email.com password = 5965
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Steva', 'Čojčić', 'steva.cojcic@email.com', '$2b$12$i4QAjR3NK3fJDFfwhPHkouJRMm39.996XTO2dZgST7PiFSKQWhN.y', 'true', 'true');

--email = tomislav.lalicic@email.com password = 1620
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Tomislav', 'Laličić', 'tomislav.lalicic@email.com', '$2b$12$AvnxXZcV3t.VLNSK6lBZLex2Cs48N8PlWGEvX5oWB.ALPunmsiCKa', 'true', 'true');

--email = vladislav.rasljic@email.com password = 6910
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Vladislav', 'Rašljić', 'vladislav.rasljic@email.com', '$2b$12$woOYN1ZJg10msMVERnzG3.zN0WUGxWzCeGAEZxa/XsXve8oBfWlIm', 'true', 'true');

--email = jovica.ciglic@email.com password = 1575
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Jovica', 'Ciglić', 'jovica.ciglic@email.com', '$2b$12$SGC4a5JS.LgNQSII0e3EEuqdAcyPpMovWosUNbP2dAevmqTuk.JZu', 'true', 'true');

--email = dusan.miodanic@email.com password = 3784
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Dušan', 'Miodanić', 'dusan.miodanic@email.com', '$2b$12$pc4DIn1qztRZR46nRKt64.TpmPqJ6cdKZRFFtQ3vmb8hE4A2l8Uxu', 'true', 'true');

--email = stamenka.jakisic@email.com password = 2399
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Stamenka', 'Jakišić', 'stamenka.jakisic@email.com', '$2b$12$SMRVnppIr9Mi9WPacbsMc.N0c/I3OiYwHnnBrYxVJMlRVzecXx8UC', 'true', 'true');

--email = milorad.krancic@email.com password = 3136
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Milorad', 'Krančić', 'milorad.krancic@email.com', '$2b$12$aONlf8I.qPvBe3scNflxVOz0JVXC5cPIijSKCVKdg/2XBWR1xCBn.', 'true', 'true');

--email = katarina.grumic@email.com password = 1109
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Katarina', 'Grumić', 'katarina.grumic@email.com', '$2b$12$17sN1e.kFl.y2JTgwcC./.3/PN0X3nNRA0ZTY3cqqzBobUx3tQ0Eu', 'true', 'true');

--email = hranislav.saletic@email.com password = 8409
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Hranislav', 'Šaletić', 'hranislav.saletic@email.com', '$2b$12$X0sbJefHI6Yu.6FIaE6nY.aAhUeQ/L3WEtVPqSMe6c8xmG12jU4Ny', 'true', 'true');

--email = vladan.saljic@email.com password = 9762
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Vladan', 'Šaljić', 'vladan.saljic@email.com', '$2b$12$9Cy5BjS73MkQna5Xhoc0aeYwJ8TLezAfV6f3OnUVJQS.De8A0KNpa', 'true', 'true');

--email = andrijana.malencic@email.com password = 7742
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Andrijana', 'Malenčić', 'andrijana.malencic@email.com', '$2b$12$OKWSVsy.wIROTxds3depD.Zzsw9pdNayisIYr8bf5Nl0kVDptXsZS', 'true', 'true');

--email = branka.baosic@email.com password = 6888
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Branka', 'Baošić', 'branka.baosic@email.com', '$2b$12$6RFiGpamRxRrY7XtphMHfO81nprGtgqoNe5tx4c.QZ9xWeor9xvc6', 'true', 'true');

--email = djurdje.zikic@email.com password = 4626
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Đurđe', 'Žikić', 'djurdje.zikic@email.com', '$2b$12$8z6MuwmaCNA8iOz33YDEL.TuganJrkkDskOFuPHDt/8ZYau8N16eO', 'true', 'true');

--email = ristivoj.plintic@email.com password = 1963
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Ristivoj', 'Plintić', 'ristivoj.plintic@email.com', '$2b$12$D5O5MeMfz3NkWwuxoKWeQeu/3VYBsy3ZbcQL9Ecq/YidIiVwqik1O', 'true', 'true');

--email = bratislava.reznic@email.com password = 4285
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Bratislava', 'Reznić', 'bratislava.reznic@email.com', '$2b$12$biN5E.BgqxjcAapYaUYXzO5l2pMwkOzvDLgKDbPRhrKtcWhvOxVQe', 'true', 'true');

--email = milijan.teslic@email.com password = 1200
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Milijan', 'Teslić', 'milijan.teslic@email.com', '$2b$12$YZZMWbqpvmlv.OGYIq1PEe.bmtQ9blzcQP/eLay8ueAGMFkuzpduy', 'true', 'true');

--email = janko.velicic@email.com password = 1612
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Janko', 'Veličić', 'janko.velicic@email.com', '$2b$12$f10snZMJA4u1fXWxvb4.2eRWrkKiQ/v9D23LnbFGZq477/6WPpKEq', 'true', 'true');

--email = milutin.vizulic@email.com password = 6279
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Milutin', 'Vizulić', 'milutin.vizulic@email.com', '$2b$12$CWHnAano35YB5KvwCgAyu.Y2sViaPXtt60kvVUBWA1CKaTd3Xw4y6', 'true', 'true');

--email = slavenko.besjedic@email.com password = 8426
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Slavenko', 'Besjedić', 'slavenko.besjedic@email.com', '$2b$12$/3Y.xT/DkA1zdrzdi1mjiuFJijUdxj1GyANzrs28DPzrdrkw4esQm', 'true', 'true');

--email = simonida.malcic@email.com password = 4531
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Simonida', 'Malčić', 'simonida.malcic@email.com', '$2b$12$1pEXH6gk8uD/qw1hyCe0S.fEiGvuz.pCVvRoVvLOgJJl73qxr4xhy', 'true', 'true');

--email = persa.djukic@email.com password = 5248
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Persa', 'Đukić', 'persa.djukic@email.com', '$2b$12$WzCgskdFlRjpZdc/pRxxMO1QAaEyWR92ARPWYITk/0tsP87lsimFi', 'true', 'true');

--email = pavle.rendic@email.com password = 5556
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Pavle', 'Rendić', 'pavle.rendic@email.com', '$2b$12$hfmuvENOF0TUf64BMxgmE.lGj2rtI/fWn0fpXcIAKf.KuFczeLrNW', 'true', 'true');

--email = prodana.mirjacic@email.com password = 6591
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Prodana', 'Mirjačić', 'prodana.mirjacic@email.com', '$2b$12$XF90ZVBGfwksykChMvVe.ubI/aIAasLdHuek/42.zzanFFrOThOLy', 'true', 'true');

--email = stanojka.asceric@email.com password = 4170
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Stanojka', 'Ašćerić', 'stanojka.asceric@email.com', '$2b$12$REMY2Js2nLyOAL8f7/aDn.7uoAsjU0ShyP2pFZmfDHZCZTq5t2UnS', 'true', 'true');

--email = petrija.comic@email.com password = 8476
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Petrija', 'Čomić', 'petrija.comic@email.com', '$2b$12$Yf2qgSjyJQWAezIEpC05c.g53keA5.JSLyr6afwQRM01Q3ZuPabQy', 'true', 'true');

--email = hranislava.kuic@email.com password = 1381
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Hranislava', 'Kuić', 'hranislava.kuic@email.com', '$2b$12$dKtArCdaUqTSBWmhz88sQ.ous8/eCjabZO9jo9oB8pMnJV.eGSPeO', 'true', 'true');

--email = spasoje.kokoric@email.com password = 1212
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Spasoje', 'Kokorić', 'spasoje.kokoric@email.com', '$2b$12$s4aKHxLSWK/7qOf74j/Pz.nsSIEgsHI6OD4AmJpxosZvtcrrMDDxy', 'true', 'true');

--email = ninko.soprenic@email.com password = 7268
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Ninko', 'Soprenić', 'ninko.soprenic@email.com', '$2b$12$UxsnqGcTTu/PK/p2JDyfOuTZxT1aelbPINs1koDNChrnxjqF.mq/2', 'true', 'true');

--email = stojan.romandic@email.com password = 9915
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Stojan', 'Romandić', 'stojan.romandic@email.com', '$2b$12$JtLl9Ibzm9V6DwHlzG4Q.ec87MKofEqEJMZIOnTY3K2rPFzDd8joC', 'true', 'true');

--email = cirka.abzic@email.com password = 9352
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Ćirka', 'Abžić', 'cirka.abzic@email.com', '$2b$12$DnDs9OIUMr0Sgw/7thGoZetll7XGahz7Mn1hf9y/rBO4keHQliQu.', 'true', 'true');

--email = nastasija.skondric@email.com password = 8981
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Nastasija', 'Škondrić', 'nastasija.skondric@email.com', '$2b$12$1EJWTU/vnfcdunrozoeb4.QtgCXYvANpaHre0PeMW/AANQE91urAq', 'true', 'true');

--email = stanojla.neoricic@email.com password = 8766
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Stanojla', 'Neoričić', 'stanojla.neoricic@email.com', '$2b$12$cWGihWiSRVczn1I0YXIOY.gEtTu1xLJFwWOkDnWdsHVcoE3diqiHy', 'true', 'true');

--email = simka.parausic@email.com password = 1273
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Simka', 'Paraušić', 'simka.parausic@email.com', '$2b$12$xRlOOHPy6TbS5Qy27rDFi.Xt6DNH7CZEoJIv5/adf1ZVY7aoQtTyO', 'true', 'true');

--email = borisav.ubavkic@email.com password = 7219
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Borisav', 'Ubavkić', 'borisav.ubavkic@email.com', '$2b$12$IzvxkkGTWlZvzGiAihb3HOsZTmlwj5ahYPQ7qYrRRXgzLH79wTXYO', 'true', 'true');

--email = borivoje.burgic@email.com password = 9117
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Borivoje', 'Burgić', 'borivoje.burgic@email.com', '$2b$12$UQGSPFx5xqskWgpKd9Ukk.O7Fjy8jX9LqKvbzv6uW5k52A4R1vZ/a', 'true', 'true');

--email = aco.diklic@email.com password = 2856
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Aco', 'Diklić', 'aco.diklic@email.com', '$2b$12$6XxFLGTiyHoR6nMimN9yk.7p4a.N64j4zZ.Piyeb4sAI1oLdpVfbm', 'true', 'true');

--email = svetozar.vincic@email.com password = 2127
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Svetozar', 'Vinčić', 'svetozar.vincic@email.com', '$2b$12$ie3cV8q5YTnJNsWMAOxbueDbu5AhZSfkg.zuG3F6eRfIUpUJqi19C', 'true', 'true');

--email = caka.dajic@email.com password = 9706
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Caka', 'Dajić', 'caka.dajic@email.com', '$2b$12$W/4Luj2UAe9ilIfkU0CsDuLCgfd9uGsd59g/KrPZ0uMVvldWse6t2', 'true', 'true');

--email = radisav.cikaric@email.com password = 6456
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Radisav', 'Čikarić', 'radisav.cikaric@email.com', '$2b$12$c6nyAva0bd8UeuwotL6v8eYxNqNfUVtaVsJcJtIhuOF0/Q3bkP6pe', 'true', 'true');

--email = sara.boncic@email.com password = 7820
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Sara', 'Bončić', 'sara.boncic@email.com', '$2b$12$XcHxhu4jTb5uVFIbK0EmPuVOuHgP3mYVc6KMInG1n13APtJIDp/fq', 'true', 'true');

--email = kornelije.djaletic@email.com password = 3546
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Kornelije', 'Đaletić', 'kornelije.djaletic@email.com', '$2b$12$zvSfsMWgV6X3kLvgexikcejSbKZkr.PHdZDDnW7tIPsBs2I7gTszi', 'true', 'true');

--email = ljubica.karetic@email.com password = 9582
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Ljubica', 'Karetić', 'ljubica.karetic@email.com', '$2b$12$woUiIIsutbDnPphcInnEPOugqrLopliADRrh4oxIzxSwgL69PggtK', 'true', 'true');

--email = zivota.santric@email.com password = 8641
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Života', 'Šantrić', 'zivota.santric@email.com', '$2b$12$vnlal6K/alk972zOBK3ZB.gihPx0mFwbyg/iTCjzGRCypaejr4W4.', 'true', 'true');

--email = tesman.dimic@email.com password = 7681
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Tešman', 'Dimić', 'tesman.dimic@email.com', '$2b$12$6ELu/VNWeudJsjCw4ykJUuHp5YOYWCyjrK0rE2zzweqi4zL9eWs62', 'true', 'true');

--email = sinisa.turlikic@email.com password = 8764
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Siniša', 'Turlikić', 'sinisa.turlikic@email.com', '$2b$12$0Jd1Gv6jRdnHMwipQTrSYOsXzP48J18HPXEqsLwqf01EeJqXblPf.', 'true', 'true');

--email = vukan.vezuric@email.com password = 5072
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Vukan', 'Vezurić', 'vukan.vezuric@email.com', '$2b$12$3liuT0b7qGvfkdgrrP1OvukBzQqH6feVNvJ9PdtNWadjtqisMDIZ6', 'true', 'true');

--email = tanasije.krnic@email.com password = 2894
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Tanasije', 'Krnić', 'tanasije.krnic@email.com', '$2b$12$RpGeEZHH1e4IchjGaHIlA.0ix.ebmWN6x8FjoDqtpUrwAsSff/ka6', 'true', 'true');

--email = ljuban.dziknic@email.com password = 7080
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Ljuban', 'Džiknić', 'ljuban.dziknic@email.com', '$2b$12$ni/nFXTcBy9O.7QD/0IPB.y8w6hXZ/UpoGIfYsw7X52f1CKo8qPVC', 'true', 'true');

--email = savka.tutulic@email.com password = 7929
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Savka', 'Tutulić', 'savka.tutulic@email.com', '$2b$12$jr0NdfOU8Y6lRMj6noerdOk5ypKGph4aXH7C.35p3EWOTUE76jLWC', 'true', 'true');

--email = verka.brndusic@email.com password = 4605
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Verka', 'Brndušić', 'verka.brndusic@email.com', '$2b$12$wfEz9Sltp9Nb1DyCirB.LON7HBlghCICSA1K7ayrjttAB/3CPNtiu', 'true', 'true');

--email = bratislava.biberdzic@email.com password = 8971
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Bratislava', 'Biberdžić', 'bratislava.biberdzic@email.com', '$2b$12$6HQFtcFaPCjG4NLHDoezT.kmNJ.J4igqBJVGkwNHYyo.tHH8nXI8C', 'true', 'true');

--email = lepa.brkic@email.com password = 1877
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Lepa', 'Brkić', 'lepa.brkic@email.com', '$2b$12$g2coxdeyUsVr05xYreEO9ejvz9DwAobul0ZES8uGL5k/wf/e7YZge', 'true', 'true');

--email = milija.hadzi@email.com password = 4267
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Milija', 'Hadži', 'milija.hadzi@email.com', '$2b$12$hFs6ME4ilYBQlQW7ttiLfuaGv.Nuw1r6fK6Ut8xcGz6rn4.eEo6j6', 'true', 'true');

--email = elena.prenkic@email.com password = 3082
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Elena', 'Prenkić', 'elena.prenkic@email.com', '$2b$12$smO5sTxqWKWajXso/nDkj.oHGIjKXL0NWqRW.SqdFWjxY1mf4oC7m', 'true', 'true');

--email = miroljub.lotic@email.com password = 1752
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Miroljub', 'Lotić', 'miroljub.lotic@email.com', '$2b$12$W2tBcaj4j493yAViCNfLYOx6TKL0IQ87LpM2sgfwCKgI2lNh39/we', 'true', 'true');

--email = ugren.sofranic@email.com password = 4466
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Ugren', 'Sofranić', 'ugren.sofranic@email.com', '$2b$12$QOhn86DZyKaYyg/nkQYLX.GxjS2LHakhhOJRrrCpI7HmCdQS3nGm2', 'true', 'true');

--email = caslav.nakalamic@email.com password = 6658
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Časlav', 'Nakalamić', 'caslav.nakalamic@email.com', '$2b$12$vd6H2aj0lkbnCFPudbHETOPMJxQw7dZmJ5IxcXJkDJI.BXmGMlDR.', 'true', 'true');

--email = lenka.djurbabic@email.com password = 9493
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Lenka', 'Đurbabić', 'lenka.djurbabic@email.com', '$2b$12$PcEWZR890YB2oxUbyKxsV.awWv0skmu0sCuPAs4jhRgVBqQ7cJQP2', 'true', 'true');

--email = nemanja.kljutic@email.com password = 9827
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Nemanja', 'Kljutić', 'nemanja.kljutic@email.com', '$2b$12$4VAmTTqwoUGjsYK50PwCo.3hpp25E7WtNn30.xsxjBxGyDqSQqkjW', 'true', 'true');

--email = dragojla.drekic@email.com password = 8655
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Dragojla', 'Drekić', 'dragojla.drekic@email.com', '$2b$12$rCwKU1rzjmDq4bYP1jXKh.UGhFgS6L7Qy486dza0GaXP0eVtAW6Dm', 'true', 'true');

--email = anastasija.miletic@email.com password = 8907
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Anastasija', 'Miletić', 'anastasija.miletic@email.com', '$2b$12$kf2BUUB4HYIK9zEscX2YiOkmfSK9NHTbmhmULNTLeMTrVjI5M8zxu', 'true', 'true');

--email = lidija.nikitic@email.com password = 5021
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Lidija', 'Nikitić', 'lidija.nikitic@email.com', '$2b$12$PSgrttM1z12f2igdwNkbau42gee17w6qpnmyWKfzyFNPP3VhEryWq', 'true', 'true');

--email = spira.micic@email.com password = 7911
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Spira', 'Mičić', 'spira.micic@email.com', '$2b$12$dexZRCfIF3mFizSqywrlR.h0pABHuXkaYI7jjj4n7z3ahjgWhKbd6', 'true', 'true');

--email = milijana.gajicic@email.com password = 2337
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Milijana', 'Gajičić', 'milijana.gajicic@email.com', '$2b$12$mWP6U/XrtJ8pcQq4dB0FTuLTn/dJpD.qKl5JfDQ4wV7CrQ4P2LC3i', 'true', 'true');

--email = djuro.gogic@email.com password = 7064
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Đuro', 'Gogić', 'djuro.gogic@email.com', '$2b$12$QpBBnw1Y/uQFIM2z1YtSJ.6hUvXdorr1YRb4w2pzQaFqZgwxl5BDC', 'true', 'true');

--email = ljupce.smakic@email.com password = 3697
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Ljupče', 'Šmakić', 'ljupce.smakic@email.com', '$2b$12$ju17czGKOTPwBWv3bAskcuWmLiwcDzg4.p/ByYJfFEZ/RMMS0n9s.', 'true', 'true');

--email = negoslav.jovic@email.com password = 5642
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Negoslav', 'Jović', 'negoslav.jovic@email.com', '$2b$12$/V9dGyaK/VTp.hUMTKDyMuX1Zf6uZO0j57zTI6yiF.cj5E0AAUo4q', 'true', 'true');

--email = razumenka.calic@email.com password = 3924
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Razumenka', 'Ćalić', 'razumenka.calic@email.com', '$2b$12$U3o6/XIGGgRv.v.6.CBqNOo2MoNwqBSdlGPltC106MfhYOpsCS3WK', 'true', 'true');

--email = borka.acic@email.com password = 9507
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Borka', 'Aćić', 'borka.acic@email.com', '$2b$12$vBGlqfBk1fc8QYFpg5afDu2KY1DdnAkvfelfDbham2r9NDlX8CxG2', 'true', 'true');

--email = srdjan.cokonic@email.com password = 1536
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Srđan', 'Čokonić', 'srdjan.cokonic@email.com', '$2b$12$1Ito4XG.1nyGERDDyssnm.HZrlhH1BshgzWxJVlpQIX7wc0/1gd66', 'true', 'true');

--email = ruza.krkobabic@email.com password = 9175
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Ruža', 'Krkobabić', 'ruza.krkobabic@email.com', '$2b$12$Ohy4HzY34jzLNqCl2L7B4Odx9LP5da2FqiT.NmTgFz3RTrPD2BxNu', 'true', 'true');

--email = ljupce.binic@email.com password = 8747
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Ljupče', 'Binić', 'ljupce.binic@email.com', '$2b$12$n5EyXtDlkVgSBGz1TsD//ul0k4oto25ywHHPhAvJ9AQKRmdkbK.wS', 'true', 'true');

--email = stanica.sentic@email.com password = 1880
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Stanica', 'Sentić', 'stanica.sentic@email.com', '$2b$12$QK.PgkWRS46oMZC3HeI1sOLhTfPJK7e1JBsdTCKKEVFwy0q1vecf.', 'true', 'true');

--email = slavoljub.galonic@email.com password = 2577
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Slavoljub', 'Galonić', 'slavoljub.galonic@email.com', '$2b$12$0XIBUhzW6BQ/Ltu6Jht36.wkhB/8hM9i7IJ88k0h59fzFT8ZIR6R.', 'true', 'true');

--email = zivanko.rapajic@email.com password = 6737
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Živanko', 'Rapajić', 'zivanko.rapajic@email.com', '$2b$12$oqWocPFHHsJZZ41OC3mAAet5B9RXdPCw0HZWDleU4CCfaKCFoY1B2', 'true', 'true');

--email = velimir.sikimic@email.com password = 2263
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Velimir', 'Sikimić', 'velimir.sikimic@email.com', '$2b$12$E9TymAMOzg7Ohvp73m9RaeUE1G.liMZ8hsX4hWaso3xsfxYOLZ4AO', 'true', 'true');

--email = stavra.drezgic@email.com password = 7769
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Stavra', 'Drezgić', 'stavra.drezgic@email.com', '$2b$12$p27.ga1oyGMz9OAI0.Xxs.WbVRAKq.wYUWSfOVC3De2KcVejq7zOq', 'true', 'true');

--email = perka.cokonic@email.com password = 9108
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Perka', 'Čokonić', 'perka.cokonic@email.com', '$2b$12$7G3CMP18PJjCSYV5vYVuieTvNNP6nBqetsDohHLfDOu12wIjKBeoi', 'true', 'true');

--email = hristina.culic@email.com password = 5085
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Hristina', 'Čulić', 'hristina.culic@email.com', '$2b$12$SOgzXhrntdHURMriJxnA1OX3ej0JQ8ty/iLP5zcZL3dn.3g55gkiS', 'true', 'true');

--email = radojko.cilerdzic@email.com password = 6794
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Radojko', 'Ćilerdžić', 'radojko.cilerdzic@email.com', '$2b$12$fjMmADzKhLC218wXXnLMxOmvW3SQ56kitu3FJklwoff2La71tTRby', 'true', 'true');

--email = srdjan.luksic@email.com password = 1522
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Srđan', 'Lukšić', 'srdjan.luksic@email.com', '$2b$12$55yI6E46VFJT/M9XuKwyDuFpmxtRYwgyU/h6AtPbRUtsjsaaL905y', 'true', 'true');

--email = veselinka.lopatic@email.com password = 5061
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Veselinka', 'Lopatić', 'veselinka.lopatic@email.com', '$2b$12$PgS84U4RNUPN22.KMg00VekgDsfV9eqkl3mvQsJRXwoUymXmWui3G', 'true', 'true');

--email = njegovan.krstic@email.com password = 6578
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Njegovan', 'Krstić', 'njegovan.krstic@email.com', '$2b$12$owYXn5b6Pw1UsxsHm8lmz.hNvhFLG8vc8ZiMipV33bVZ5B6anNGxG', 'true', 'true');

--email = nevenka.kimcetic@email.com password = 6700
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Nevenka', 'Kimčetić', 'nevenka.kimcetic@email.com', '$2b$12$sVORMcmdMVAjhjN1ETzEVetc4cSdhbuZaF5yrTp7nLI9armCqggie', 'true', 'true');

--email = mirjana.smrzlic@email.com password = 3397
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Mirjana', 'Smrzlić', 'mirjana.smrzlic@email.com', '$2b$12$ibpgF/Har9yYuQkvhfY82eJBAB/.DGXT55aVNoROHhGz/mh5nHNau', 'true', 'true');

--email = stanoje.nedic@email.com password = 9821
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Stanoje', 'Nedić', 'stanoje.nedic@email.com', '$2b$12$.VcZACSPCP1Ut3KAqiyPMORczeIp6YFnGUFinU9bRgvKduDHSURpO', 'true', 'true');

--email = petko.vulezic@email.com password = 5324
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Petko', 'Vulezić', 'petko.vulezic@email.com', '$2b$12$QWDgHmD5UktIip7d8gscleea8ZsYz/FhBRMAU2S83r8BRK6oTOhKW', 'true', 'true');

--email = hristivoje.balacikic@email.com password = 4922
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Hristivoje', 'Balačikić', 'hristivoje.balacikic@email.com', '$2b$12$XZA2o4CS6CBu8eSYy2RRPuUdjE96er6G45HbU0sbsF7zJ83JwoKbq', 'true', 'true');

--email = drasko.kicic@email.com password = 2656
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Draško', 'Kičić', 'drasko.kicic@email.com', '$2b$12$twlqFOHFlDm8Eyojej3lKe0cqdgFSjRq9elsaXJ1RNPci12h4oSxC', 'true', 'true');

--email = zorislava.nuzdic@email.com password = 8157
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Zorislava', 'Nuždić', 'zorislava.nuzdic@email.com', '$2b$12$ZgePtt2O7z3p51rWTNtFzewM9Y1jtIMNpcUCseMQcxB3bD0SDKDaK', 'true', 'true');

--email = zdravko.djacic@email.com password = 1449
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Zdravko', 'Đačić', 'zdravko.djacic@email.com', '$2b$12$qFW/g5TxhvVl6jHNgkwNk.CsYP3Aqa5453OS431V8IYh7gQ1i/r1e', 'true', 'true');

--email = ivana.vulikic@email.com password = 2716
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Ivana', 'Vulikić', 'ivana.vulikic@email.com', '$2b$12$wHWhWRmEG49jr/Po1qcVhO9olUhFiq7eGqFrmEVAjDWHPkSdIJhU2', 'true', 'true');

--email = velimir.drenovcic@email.com password = 1808
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Velimir', 'Drenovčić', 'velimir.drenovcic@email.com', '$2b$12$jf4pR0Z4tu6oJUyVc3gCeuzBol2beIfpkmGwnOneZxx0VVc0wKfR6', 'true', 'true');

--email = novak.grubetic@email.com password = 1983
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Novak', 'Grubetić', 'novak.grubetic@email.com', '$2b$12$9ltNzHUdCuaJYweATOc16eY2VQnf8H0P5NHfBB3tunz7fQoqU6VfK', 'true', 'true');

--email = antonina.gorcic@email.com password = 5072
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Antonina', 'Gorčić', 'antonina.gorcic@email.com', '$2b$12$HwD8.BUHJviV.gvK.gXuZOm9Fp0cdPU10RH0HGB9t5hSiS4MswKte', 'true', 'true');

--email = filipa.jovandic@email.com password = 9955
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Filipa', 'Jovandić', 'filipa.jovandic@email.com', '$2b$12$zSe2F.DIQPo.hHFwIUS.FeYzTp0hnNVbKZ/YZDZKvz8ZR6r7AIXAi', 'true', 'true');

--email = tatjana.gvoic@email.com password = 2957
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Tatjana', 'Gvoić', 'tatjana.gvoic@email.com', '$2b$12$VMsf0/EEmSDoY6IDBf2W1eMxQjlpRjB4mhd4jqh/9Gt6lVY1TeUKC', 'true', 'true');

--email = alimpije.ralic@email.com password = 9197
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Alimpije', 'Ralić', 'alimpije.ralic@email.com', '$2b$12$l6ILHZq3Mnvy3afNpkadSuUVcTCXzKTvPKg6fpQ1UU9Q6p27ZfgvK', 'true', 'true');

--email = dalibor.aleksendric@email.com password = 5257
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Dalibor', 'Aleksendrić', 'dalibor.aleksendric@email.com', '$2b$12$4mYh0bwtzMOKNPqKOcNLYuX13rQ85KoOQuPvnch0W6KoxJxmrTfiO', 'true', 'true');

--email = matija.biljic@email.com password = 5336
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Matija', 'Biljić', 'matija.biljic@email.com', '$2b$12$LidQtRdfNLW8VpGG6gZVTeKpWucxHQfHHP/FQQZudDgDsHze/APxO', 'true', 'true');

--email = negomir.gmizic@email.com password = 2301
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Negomir', 'Gmizić', 'negomir.gmizic@email.com', '$2b$12$CRxMsUObdTFGneW1wapTe.f.cwcI10A2rLoJm3hXMb7JQD34tsHfK', 'true', 'true');

--email = viktor.leontic@email.com password = 1396
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Viktor', 'Leontić', 'viktor.leontic@email.com', '$2b$12$NTyCy4J.xYi5I9FeHqkPY.9PN7aiqr29Cyvx1i6GOiaNM8Ar/BY0C', 'true', 'true');

--email = marinko.nisavic@email.com password = 7417
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Marinko', 'Nišavić', 'marinko.nisavic@email.com', '$2b$12$0q/bPAbFUaL.C1ODSbE3L.5ONSrYAtB7b2eNnhgs37GW9KYZQI/i6', 'true', 'true');

--email = jelisavka.greblic@email.com password = 1459
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Jelisavka', 'Greblić', 'jelisavka.greblic@email.com', '$2b$12$./wZ5RAkKodBGMXB6qJ3d.ZJYXkD3hQLzXq8cxK6EwBzeWvc0AIJO', 'true', 'true');

--email = purisa.dabarcic@email.com password = 6718
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Puriša', 'Dabarčić', 'purisa.dabarcic@email.com', '$2b$12$WXSminWfMGPSZO9UAQDw5uARSWwMY39fvEP58sPu.y1xney3HaQGy', 'true', 'true');

--email = djura.mirazic@email.com password = 7770
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Đura', 'Miražić', 'djura.mirazic@email.com', '$2b$12$uEWOozt3QYjxN3ajeaID1O9BTgP.X2zm2yRUrRnrd/D3Sm68ZMxVC', 'true', 'true');

--email = persa.vostic@email.com password = 9580
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Persa', 'Voštić', 'persa.vostic@email.com', '$2b$12$/XylwcxwiVx5aVZRd1ZCmudeYVJJvSMt4JlczxiIR9rE1Ttj9ZstG', 'true', 'true');

--email = radomir.guduric@email.com password = 1678
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Radomir', 'Gudurić', 'radomir.guduric@email.com', '$2b$12$e26rNV/MneqxYsysXx/Lu.J9d8Rq1pQNhr.cul2lxf1ppNpVq/M2y', 'true', 'true');

--email = grigorije.biseric@email.com password = 1700
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Grigorije', 'Biserić', 'grigorije.biseric@email.com', '$2b$12$jcWpwLG0dX.Q584Fvxmp0OIijH7K9G11TdHufdINJi003VH5LSMH2', 'true', 'true');

--email = zagorka.milakic@email.com password = 2394
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Zagorka', 'Milakić', 'zagorka.milakic@email.com', '$2b$12$tvo0e0jsnOftLUlUMFyYau/004oMlBNWeWOzYAfaOp/Ybm3pFUch2', 'true', 'true');

--email = tatomir.dacic@email.com password = 6657
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Tatomir', 'Dačić', 'tatomir.dacic@email.com', '$2b$12$vEPlGBzAN7EhIMK8YCIun.NOGYTR/Dfc9Jfg5mJ042qGvPwHzBG6C', 'true', 'true');

--email = milka.mrakic@email.com password = 7712
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Milka', 'Mrakić', 'milka.mrakic@email.com', '$2b$12$1YPHHGBe.mGNPp4muD4FLuGOBFs2Qr/gfJl0JLDF4U4xYkTUr6gru', 'true', 'true');

--email = mladen.otic@email.com password = 9999
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Mladen', 'Otić', 'mladen.otic@email.com', '$2b$12$QzZY28hxG5yZ908hrSapROEuXpzKACj0cBib6pvEEzoDEcyUK8Zu6', 'true', 'true');

--email = predrag.joncic@email.com password = 2562
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Predrag', 'Jončić', 'predrag.joncic@email.com', '$2b$12$/YHEQ7/DwAsoOv3QybJbNu//MLXs80.K9.DFq85rcy896R.d3rQa.', 'true', 'true');

--email = ivica.batic@email.com password = 8596
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Ivica', 'Batić', 'ivica.batic@email.com', '$2b$12$XR7eUZ9Fksy1M0APFulYGu3y991pJeQ4/WzKQ1ZB68wFnQ3aAKo8K', 'true', 'true');

--email = spasoje.sepic@email.com password = 4653
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Spasoje', 'Šepić', 'spasoje.sepic@email.com', '$2b$12$dXbyfgeGkBh5XD.CxVlEfuk/hmiRvG6cB0Nb7fs2HC6BYqVXDE.sm', 'true', 'true');

--email = stanija.berdic@email.com password = 3866
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Stanija', 'Berdić', 'stanija.berdic@email.com', '$2b$12$nGIk1xu5GhCaMuS5vIdRQOGhrL3W8/Ewj.u/jCH7U6B8X7QGYaHsK', 'true', 'true');

--email = zivanko.kutlasic@email.com password = 2530
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Živanko', 'Kutlašić', 'zivanko.kutlasic@email.com', '$2b$12$C9.GOb5u/IAO8BM6I2CRIeigR8AuP07cn8S72u5TD2advkNTdVKry', 'true', 'true');

--email = kirilo.kanaric@email.com password = 3945
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Kirilo', 'Kanarić', 'kirilo.kanaric@email.com', '$2b$12$RrR9OWXT/6cr9T9NmxlJZeapLylZYFmBHu/qu04MStVnHz2aO3x6G', 'true', 'true');

--email = spomenko.dobranic@email.com password = 8906
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Spomenko', 'Dobranić', 'spomenko.dobranic@email.com', '$2b$12$A0Ah5w8XrbTFg2NZJm4zF.KUWskuGB2cv.Ig0E3sQO8E1kaub6Edy', 'true', 'true');

--email = srbijanka.dokic@email.com password = 3447
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Srbijanka', 'Dokić', 'srbijanka.dokic@email.com', '$2b$12$FKe9OeBP.KMXDVhgg7kYiOLe0wRs6jc3Insi/x44/MkC3TBLofm72', 'true', 'true');

--email = zlatica.bukic@email.com password = 6984
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Zlatica', 'Bukić', 'zlatica.bukic@email.com', '$2b$12$9rwEXTOugRCE23AD0EJi/u.g16UG.doLT/k7gGtcD7yNNGtlUa4sC', 'true', 'true');

--email = jovisa.djekic@email.com password = 7662
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Joviša', 'Đekić', 'jovisa.djekic@email.com', '$2b$12$Ty2HvpHxVskLAXZCgGf//eWrrqKuir.oR//OCLaxUIBECyi/nilwK', 'true', 'true');

--email = teodosije.perisic@email.com password = 1391
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Teodosije', 'Perišić', 'teodosije.perisic@email.com', '$2b$12$OkCkJI8h4JJBsuRVgpAl1OEIIpQD/0fy/boDIz3dMuoJdEyJ7laai', 'true', 'true');

--email = pajka.palic@email.com password = 4648
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Pajka', 'Palić', 'pajka.palic@email.com', '$2b$12$DLIE/9HBUAN3bYb5rQo53eZAnFzeaNYiMIEjOJKzEOVmGcmBItsMm', 'true', 'true');

--email = nevenka.sofronic@email.com password = 9395
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Nevenka', 'Sofronić', 'nevenka.sofronic@email.com', '$2b$12$vbty5nljoYIJ.Moja5VX1ukvXzYPx8eLC2BnvuMVvg8UH4tzqLrpG', 'true', 'true');

--email = andjelko.jovadzic@email.com password = 3084
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Anđelko', 'Jovadžić', 'andjelko.jovadzic@email.com', '$2b$12$jwgxmYiEW1huWNM.hIuOxu8WxQ9OmPwfslv2x8DT8zMLNHCpxX0zm', 'true', 'true');

--email = poleksija.mikonjic@email.com password = 5141
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Poleksija', 'Mikonjić', 'poleksija.mikonjic@email.com', '$2b$12$ZPI9AZzvHuQPPckzwz48u.NcmjF/jANQz4rxhwl8FhQLjYDkSftXa', 'true', 'true');

--email = biserka.ruzicic@email.com password = 3824
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Biserka', 'Ružičić', 'biserka.ruzicic@email.com', '$2b$12$UZVKBynlMVYIFMWJ23DFtOw1q9CezXe98LUnAmEKZSugOjgPnhFkC', 'true', 'true');

--email = antonina.kanic@email.com password = 7047
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Antonina', 'Kanić', 'antonina.kanic@email.com', '$2b$12$Ifh6WxoP6dlRZ9repfX8Iudcfk.q0kxRQHlyuYoRkwNUjzrYI0PcK', 'true', 'true');

--email = prodana.babic@email.com password = 4091
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Prodana', 'Babić', 'prodana.babic@email.com', '$2b$12$NJDU9EseY//XZ26057Qul.8TILLyMvw38Dk22Ha2yLMUxh41t1HMG', 'true', 'true');

--email = melenija.bogdanic@email.com password = 1307
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Melenija', 'Bogdanić', 'melenija.bogdanic@email.com', '$2b$12$u5EurnTI/tlrAfYZujooueNvB/oT6ToOP/Dw.p7Rl27U9lWevJcMq', 'true', 'true');

--email = justin.jerotic@email.com password = 6734
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Justin', 'Jerotić', 'justin.jerotic@email.com', '$2b$12$CMMLuQ116lZsU2q2JJAskO/ufZc/vUPWu3aIhUric1q0LAXm1oJOi', 'true', 'true');

--email = kosana.budincic@email.com password = 6996
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Kosana', 'Budinčić', 'kosana.budincic@email.com', '$2b$12$D6wE1VB98NrpCCrvoDNA5etXjTUpfcyZROTFOsCrkNosX1af0XDsq', 'true', 'true');

--email = timotije.potrebic@email.com password = 4601
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Timotije', 'Potrebić', 'timotije.potrebic@email.com', '$2b$12$Uh4MeUNnyI.OhLOD8Y.GNepM0QtGao1L5y5XrRJfOFpQ7b/FhODg.', 'true', 'true');

--email = vujka.sajtovidzic@email.com password = 6231
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Vujka', 'Šajtovidžić', 'vujka.sajtovidzic@email.com', '$2b$12$wCb1V7SX/CwUY9OGiDwruuoYa/uy3rv4uUcXnXNxOgP8WUgcR2apm', 'true', 'true');

--email = kristina.bokonjic@email.com password = 5727
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Kristina', 'Bokonjić', 'kristina.bokonjic@email.com', '$2b$12$0jy/HfXRCXyue0HHv1fUHeDdOI.dZ01VyZKjqRGxxFGzeJA/YVHkC', 'true', 'true');

--email = ratka.rasulic@email.com password = 6827
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Ratka', 'Rasulić', 'ratka.rasulic@email.com', '$2b$12$4J7UsmMrG6.kFjTqmMnhhunCzkj7gWpDDLyhP7VesyLp0HlCbRH.K', 'true', 'true');

--email = milija.racic@email.com password = 9582
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Milija', 'Racić', 'milija.racic@email.com', '$2b$12$6nzuzWMIDcTYzJz9CNC5WeZ6PDwuOaV/RHsIbMXaD4ToWdrCcECQu', 'true', 'true');

--email = andrijana.josic@email.com password = 5927
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Andrijana', 'Josić', 'andrijana.josic@email.com', '$2b$12$f.Q0F7jWOVxWSnOee6OqK.UbUsR2OhlWceewoxSce9ZcUsoUFJmDO', 'true', 'true');

--email = ljubo.corbic@email.com password = 3367
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Ljubo', 'Čorbić', 'ljubo.corbic@email.com', '$2b$12$89qedOTnQtaNlaNxtyUqOOINgPCj0nk..hfYhfgGIldN1VrSyCuWe', 'true', 'true');

--email = dobrila.ludajic@email.com password = 8801
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Dobrila', 'Ludajić', 'dobrila.ludajic@email.com', '$2b$12$h7DoTe32u4jHxPGtNADqouwNfnH7nwyAOHwS.yN8N5eePn0ckSgtW', 'true', 'true');

--email = ignjatije.sevkic@email.com password = 3127
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Ignjatije', 'Sevkić', 'ignjatije.sevkic@email.com', '$2b$12$TCOO6dDq.3yuUs1FAM8wpeanDiXLhSkhEVZNYemf9uboTPfNECGdi', 'true', 'true');

--email = dragojlo.stolic@email.com password = 8093
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Dragojlo', 'Stolić', 'dragojlo.stolic@email.com', '$2b$12$MpU14/VBoU1lSONrOdpQUeAjSriREXKTu1Y7xa8J1SZ76El95LA4a', 'true', 'true');

--email = kristina.ckrkic@email.com password = 5279
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Kristina', 'Čkrkić', 'kristina.ckrkic@email.com', '$2b$12$YSjy3vnKTwm8bnlyEAN8..YtuVCr4eg6gBAmrXhykCoSQX0NC/qwK', 'true', 'true');

--email = jagoda.kuzmic@email.com password = 4637
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Jagoda', 'Kuzmić', 'jagoda.kuzmic@email.com', '$2b$12$cVMN4vjSj7YF6Xn7bQpmyuR4QJ8EeWNaxOVc9tFxVWu4knwsscYMq', 'true', 'true');

--email = srbislava.gojnic@email.com password = 3047
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Srbislava', 'Gojnić', 'srbislava.gojnic@email.com', '$2b$12$iC55S2DmDe6JdHayeb9DP.o6NnyPWKP3HPPVk7hVQkj3B4w4NNEEW', 'true', 'true');

--email = elizabeta.zornic@email.com password = 1516
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Elizabeta', 'Zornić', 'elizabeta.zornic@email.com', '$2b$12$YcCYaMUesBJ2RNyBs40S8ulJKWeZnWXZUBZJmnCHuRcQsYGXfBTFS', 'true', 'true');

--email = stole.burcic@email.com password = 9200
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Stole', 'Burčić', 'stole.burcic@email.com', '$2b$12$/NF0rMEd0Iugm8DPSQccWOs0PKLWjUsBYL7qBR1jd3Ti/Doi9TLka', 'true', 'true');

--email = bratislava.pajicic@email.com password = 4689
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Bratislava', 'Pajičić', 'bratislava.pajicic@email.com', '$2b$12$QIk6rgpfo0KlxfhIBXzPROOaVcUocskO6LSV/cLVY4VLY7ybxlnk2', 'true', 'true');

--email = petar.dzadzic@email.com password = 5525
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Petar', 'Džadžić', 'petar.dzadzic@email.com', '$2b$12$6H0okOkTpmElm0MCANwO8e1UixGe1QFGE1NLyk.GpDbgd0OBINDJi', 'true', 'true');

--email = zivoslava.zorkic@email.com password = 3743
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Živoslava', 'Zorkić', 'zivoslava.zorkic@email.com', '$2b$12$q.v3NmfomANyH301U0LF..1y6AABwtrFCQ3JuBuB9oHa1qUOZi3/K', 'true', 'true');

--email = verka.jelesic@email.com password = 4526
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Verka', 'Jelesić', 'verka.jelesic@email.com', '$2b$12$G7mt.uB0qt7roGrk33eqLOBJGwugWY3oqRfZZ7YAfeYXZ1m3yGBwq', 'true', 'true');

--email = jadranka.ugresic@email.com password = 6879
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Jadranka', 'Ugrešić', 'jadranka.ugresic@email.com', '$2b$12$R4hRlKkw6bNXNyxYjOvmM.KhLgoiSDYb19xtv13SdZnEjxYYXNJtW', 'true', 'true');

--email = ljupka.bisercic@email.com password = 5187
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Ljupka', 'Biserčić', 'ljupka.bisercic@email.com', '$2b$12$bLoCCAYeiJBkSCfBnq52.OMBBquHRJYabJnhIEkdLrDF6LbfmlUBq', 'true', 'true');

--email = vujadinka.bozinic@email.com password = 3685
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Vujadinka', 'Božinić', 'vujadinka.bozinic@email.com', '$2b$12$5VEhTr40jcjIZ8TPJnmIlO0RSXUwOX35S9ErTBnfQ3hp0blt7dbFK', 'true', 'true');

--email = zeljka.bondzulic@email.com password = 7878
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Željka', 'Bondžulić', 'zeljka.bondzulic@email.com', '$2b$12$RftkLhqFXoq7BAq6GxTASuvdn3Ja.8MsRgWjOmtPel1uA7VVGdBca', 'true', 'true');

--email = randjel.raulic@email.com password = 2874
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Ranđel', 'Raulić', 'randjel.raulic@email.com', '$2b$12$seoE1u7biJBskODvZCf0GeiIY7/xCpqKBDLx.FzoQPkrrku0XRuUu', 'true', 'true');

--email = negoslav.bolic@email.com password = 6129
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Negoslav', 'Bolić', 'negoslav.bolic@email.com', '$2b$12$/KZSpJltkp2T00CC/.qH3efntjdY37OJmsigQHlM9s4xX8edACG52', 'true', 'true');

--email = cirka.pobulic@email.com password = 2861
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Ćirka', 'Pobulić', 'cirka.pobulic@email.com', '$2b$12$mVzXvNGsHifB91EE0KwUseNnrHjQ5SQxQV0wsJnhUAWX3MtdA.QBu', 'true', 'true');

--email = oliverka.nikolic@email.com password = 6874
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Oliverka', 'Nikolić', 'oliverka.nikolic@email.com', '$2b$12$yrF7B9DasheeRIV1M3M6YeFgbYuMXStHMBHf8eVrscXJNur8tF.oe', 'true', 'true');

--email = cirilo.stupic@email.com password = 8768
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Ćirilo', 'Stupić', 'cirilo.stupic@email.com', '$2b$12$eyRZl4ryXvsGbDHyVcyivuqWy1ZpboVWsdCQtDbkgC5K3ZLXTTcEO', 'true', 'true');

--email = dobrila.lupikic@email.com password = 9574
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Dobrila', 'Lupikić', 'dobrila.lupikic@email.com', '$2b$12$l6teVVOkKfnF.kg/qp1i..Ws7/DdRPCuxCFxrg6z.pN97O44bh9/u', 'true', 'true');

--email = ivo.sperlic@email.com password = 2897
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Ivo', 'Sperlić', 'ivo.sperlic@email.com', '$2b$12$TjJUxQQgqARN7kTHmhYVjO/QsTXzQ018/Z6kqs6z.9InLssGGgt5a', 'true', 'true');

--email = sisko.milic@email.com password = 3658
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Šiško', 'Milić', 'sisko.milic@email.com', '$2b$12$JkUbOwNIjNvJBeZZn6XZx.iCfJJVy5EqwgvVPcFpx6G4Q/8UXB5bC', 'true', 'true');

--email = bozidarka.radojkic@email.com password = 3392
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Božidarka', 'Radojkić', 'bozidarka.radojkic@email.com', '$2b$12$juNfHuJx7whgr/QDMIHDbOMIloezj9icCPRSTqmgCTf4OXaDZ3K86', 'true', 'true');

--email = radovan.djiknic@email.com password = 8546
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Radovan', 'Điknić', 'radovan.djiknic@email.com', '$2b$12$3x3zhgGdM1HnCvweBbNruuyTvSy2i6vpXWiwAV2GKrNYGLtKZwQgm', 'true', 'true');

--email = katica.aksentic@email.com password = 8408
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Katica', 'Aksentić', 'katica.aksentic@email.com', '$2b$12$GMh0UghvkfzcZvjjzdhaK.4am54theAhdj6lDggNuqLJi44gbT7Ya', 'true', 'true');

--email = sofronije.joketic@email.com password = 9928
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Sofronije', 'Joketić', 'sofronije.joketic@email.com', '$2b$12$OgtacJtAhLmeawiJDeSA4.6J9fOlyGRvsjehNPnPvuS6QVYmeprki', 'true', 'true');

--email = predrag.gmizic@email.com password = 3209
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Predrag', 'Gmizić', 'predrag.gmizic@email.com', '$2b$12$V.EU7ukrCP/D74N3JcfRoeQtpxjRsuGeMocH9PLZy9Dz2fPxexsOe', 'true', 'true');

--email = stanojka.buric@email.com password = 1054
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Stanojka', 'Burić', 'stanojka.buric@email.com', '$2b$12$Poao3ynPwz4tIP/mjN83BOpUm1Q8PWOp4mPH7D5ZDDXk97NsBUVXa', 'true', 'true');

--email = novka.stakic@email.com password = 8917
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Novka', 'Stakić', 'novka.stakic@email.com', '$2b$12$iw67Ll.VgGKWCJPJ06LDGOeezeissX0ptD0T.g6okVOLo7p/6/8V.', 'true', 'true');

--email = bratoljub.hristic@email.com password = 5621
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Bratoljub', 'Hristić', 'bratoljub.hristic@email.com', '$2b$12$cFToshforVGtEx4W0gz0o.hgAAJBV2vALqQcg2hQDN3G1IYsRLKou', 'true', 'true');

--email = zivoslavka.pimic@email.com password = 1485
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Živoslavka', 'Pimić', 'zivoslavka.pimic@email.com', '$2b$12$dCukk/UWyJyi5VRA9GHmqe0RU9RGvkXr4nbkED9Zt32hlwi0roWdC', 'true', 'true');

--email = daliborka.kolobaric@email.com password = 3775
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Daliborka', 'Kolobarić', 'daliborka.kolobaric@email.com', '$2b$12$4HIXCIoU2t0SVZRcWjDLXeOohC6oCeVpB/zyCUGHgMKbwd.HUSsqS', 'true', 'true');

--email = stanko.alavantic@email.com password = 6397
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Stanko', 'Alavantić', 'stanko.alavantic@email.com', '$2b$12$Fk/fv7UXMSz3kYGnpsiRNu6eorMFJDkS44HhOrRy67Twq4klHFqKS', 'true', 'true');

--email = filipinka.gligoric@email.com password = 8892
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Filipinka', 'Gligorić', 'filipinka.gligoric@email.com', '$2b$12$kaXTdOI5syBDPbB3zJmVK.vsKU.3DUJ2.1afS5zOfi7pDu1xwQPC2', 'true', 'true');

--email = vukadinka.vladicic@email.com password = 7200
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Vukadinka', 'Vladičić', 'vukadinka.vladicic@email.com', '$2b$12$UfZBC/ApKjtK6WQ.5OP6dOUY80jx8xQ7RR5h/BNnGtN5wayGWEzdW', 'true', 'true');

--email = milovan.milusic@email.com password = 3772
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Milovan', 'Milušić', 'milovan.milusic@email.com', '$2b$12$fTm9xQT4VAiBouBGMGKz7./KteP4kbx3Q.Ai99/UCzO0g4ODCop0G', 'true', 'true');

--email = dobrinka.subotic@email.com password = 1009
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Dobrinka', 'Subotić', 'dobrinka.subotic@email.com', '$2b$12$l5Nwr.tRwplmvlBsQr1EbeXbQcfXJ5AGZvzsaCK49i2qpvX4TDElu', 'true', 'true');

--email = bosiljka.kosprdic@email.com password = 1517
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Bosiljka', 'Košprdić', 'bosiljka.kosprdic@email.com', '$2b$12$YGSJJW/65Getb0gN0ecxXuuuIqgcqkdOeN48B4yzq6uiE6TTxecVe', 'true', 'true');

--email = milun.milajic@email.com password = 5852
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Milun', 'Milajić', 'milun.milajic@email.com', '$2b$12$fe0PPklrwCGNiTMX8MHNS.q6ghbn/pk7pAsjibC7cr6jRLKtF8wf6', 'true', 'true');

--email = zeljko.pleskonjic@email.com password = 8903
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Željko', 'Pleskonjić', 'zeljko.pleskonjic@email.com', '$2b$12$bwQwGBWVmNQB3tGRp.dvsOj/H69j8ceuQsveptvDO7.5spQrICv7q', 'true', 'true');

--email = kristina.ilanic@email.com password = 2732
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Kristina', 'Ilanić', 'kristina.ilanic@email.com', '$2b$12$zfHOR/n803erJVBU7YFQMOFsUX5Yx1MnGpUHB6vUhIK1aEfepEMXy', 'true', 'true');

--email = jovica.vujacic@email.com password = 2342
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Jovica', 'Vujačić', 'jovica.vujacic@email.com', '$2b$12$WeFErMPH1aXFmiSR7kr86ehQmQNJauhOIoku.piH8EAXNKrm2L.C2', 'true', 'true');

--email = ilinka.mirosavic@email.com password = 2869
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Ilinka', 'Mirosavić', 'ilinka.mirosavic@email.com', '$2b$12$Cls/WHpV8/oGs6zm2Agb0eEziEdvZ6voIVF.qBDOziVShMONloNcS', 'true', 'true');

--email = jana.milikic@email.com password = 4702
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Jana', 'Milikić', 'jana.milikic@email.com', '$2b$12$4oBqRiysdFUwyp83fgt4G.uPkJCPKZ3b0FCZQT5dQkq/aMrbhMaNe', 'true', 'true');

--email = antonina.blatesic@email.com password = 5003
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Antonina', 'Blatešić', 'antonina.blatesic@email.com', '$2b$12$ESPwx/VPsEwNmZmZ7fh6qeOMY75MkOBQCF/cKykWhRc/TNoieRaDS', 'true', 'true');

--email = svetoje.pop@email.com password = 8647
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Svetoje', 'Pop', 'svetoje.pop@email.com', '$2b$12$khjsD6DmLyCLe5EWgfKmfem4ctr3uE1B/1hHPL/XAlCxXN.hL4FRK', 'true', 'true');

--email = jovan.dzajic@email.com password = 4265
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Jovan', 'Džajić', 'jovan.dzajic@email.com', '$2b$12$H47pnzO9lgYoYtSfk/IfiuuesuVWe4y0I0SQdiAJX1Z8ivtJALTPK', 'true', 'true');

--email = georgije.lopicic@email.com password = 6277
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Georgije', 'Lopičić', 'georgije.lopicic@email.com', '$2b$12$pgkxqXAREztJChJuBgissuWS0RuEI3T6vEmxBmfHQo74JaIr8UNve', 'true', 'true');

--email = anastasija.cikaric@email.com password = 6985
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Anastasija', 'Čikarić', 'anastasija.cikaric@email.com', '$2b$12$66.GNitfwE7lmNpFm7RCSeyMHhJmF5h2AIbKcfgBpqj47HsGqw3di', 'true', 'true');

--email = blagomir.kazic@email.com password = 1037
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Blagomir', 'Kažić', 'blagomir.kazic@email.com', '$2b$12$Glbh5Xf0elhq0VvWst22X.NykAc/7caRTsNcSitycfEukwe8LfxUW', 'true', 'true');

--email = ljubomir.dzankic@email.com password = 4779
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Ljubomir', 'Džankić', 'ljubomir.dzankic@email.com', '$2b$12$n4xEQa1j16eGo00CBUERy.DdjfdyBPvedRU8p7t7zr/yyOvlWSVOq', 'true', 'true');

--email = cajka.misnic@email.com password = 1423
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Cajka', 'Mišnić', 'cajka.misnic@email.com', '$2b$12$r7EwpfQkgthKquOoxyNpCegBCmolV/eGMuCvnsrFYAHf4vSK8rAMe', 'true', 'true');

--email = spridon.komadinic@email.com password = 2074
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Spridon', 'Komadinić', 'spridon.komadinic@email.com', '$2b$12$gm3fnc6IfPuoQ2w/DCevAu2/dMqk1mLvTbMPHi8/dB5b6FoihbG7C', 'true', 'true');

--email = trifun.krazic@email.com password = 6277
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Trifun', 'Kražić', 'trifun.krazic@email.com', '$2b$12$7qYR8/gdEFWt12FCoQe12eQTaFsPkRy5hsVsbEt3GkKLLpu5lMoMq', 'true', 'true');

--email = stanimir.udovcic@email.com password = 7111
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Stanimir', 'Udovčić', 'stanimir.udovcic@email.com', '$2b$12$5p5yqLFB1TNqLDd5nqg7E.7mBn97yCfxhWjeUDyLcVbXdkmJKodu6', 'true', 'true');

--email = sreten.jankucic@email.com password = 5066
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Sreten', 'Jankucić', 'sreten.jankucic@email.com', '$2b$12$k7cjdMHjg8Mxdch0sqKgnO.odgcq34GOUgBeaEfx/eCq6doUEd29G', 'true', 'true');

--email = ivanka.tutic@email.com password = 2484
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Ivanka', 'Tutić', 'ivanka.tutic@email.com', '$2b$12$S8CqXl4rTTWQZJDrx2eJRezLRqOQKbvvTDgVJB91q9A6/F4C8nM7S', 'true', 'true');

--email = zaklina.borcic@email.com password = 3395
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Žaklina', 'Borčić', 'zaklina.borcic@email.com', '$2b$12$hvJLCjNEUrDaQZXOhTEC0ucDSexETFnfhzlFBlltnsXkWQMQQXuiK', 'true', 'true');

--email = tihomir.poljcic@email.com password = 4779
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Tihomir', 'Poljčić', 'tihomir.poljcic@email.com', '$2b$12$Iqym1gsiitgkCNwU7CJMGOZIKqhMiEWOUU8mgnI8wVr7.gG9BhDnq', 'true', 'true');

--email = makarije.cokic@email.com password = 8252
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Makarije', 'Čokić', 'makarije.cokic@email.com', '$2b$12$uVaXQvRue.kfBTPo.qh.TuAAMbgXoi.APCXOWifduFGFN5Hk/rQzK', 'true', 'true');

--email = agnija.grujanic@email.com password = 4265
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Agnija', 'Grujanić', 'agnija.grujanic@email.com', '$2b$12$PR.cHEduMJyspqRHqwOSoeIhPWYLoqO8vONE4jHtsv25oR4BMZUPy', 'true', 'true');

--email = valerija.garalejic@email.com password = 8698
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Valerija', 'Garalejić', 'valerija.garalejic@email.com', '$2b$12$9o44kiRUqkIqz/8dCS3ITeqXsWB5eYu5a5hCl6yOyrPB1ILHPALlq', 'true', 'true');

--email = sisko.markagic@email.com password = 2357
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Šiško', 'Markagić', 'sisko.markagic@email.com', '$2b$12$1bIBGEsItN81sAVzhM1XYuO7sztrjaF8YI/UtOWsWhoPpa3lOoE7G', 'true', 'true');

--email = selimir.stolic@email.com password = 9692
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Selimir', 'Stolić', 'selimir.stolic@email.com', '$2b$12$kPm1CiybD9KmkkuTAEO3J./oeoJJVTtYN8eu/8iPLkXEVB0aX7TPa', 'true', 'true');

--email = bogdan.vasalic@email.com password = 4668
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Bogdan', 'Vašalić', 'bogdan.vasalic@email.com', '$2b$12$Dpbkr5Vb.mZgBGh/YPgOzuL7xqMqyYk5OS/InMH3tW8gNgdJ4wHbe', 'true', 'true');

--email = cile.loncaric@email.com password = 7170
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Ćile', 'Lončarić', 'cile.loncaric@email.com', '$2b$12$AZ49a7F5wYStvFl.xAhsUOZF.93WzQmnAsKMboGBnTmBTA7OlD8dy', 'true', 'true');

--email = jelena.colic@email.com password = 3970
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Jelena', 'Colić', 'jelena.colic@email.com', '$2b$12$nRYMrrSpbPL18L96JlJPKOU4dYCHf0UfL/xze64czVmCKCoTRbUj6', 'true', 'true');

--email = ivona.boncic@email.com password = 5277
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Ivona', 'Bončić', 'ivona.boncic@email.com', '$2b$12$nLmfoVS6.d5jJ6ytjdYHlOoTrVG7LOWcwg1V1qw0t8LYi.axtlH9a', 'true', 'true');

--email = gvozden.buljugic@email.com password = 8643
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Gvozden', 'Buljugić', 'gvozden.buljugic@email.com', '$2b$12$NV7QsEfYFsAJBLRLPH2LEeA1kdHZPpBfmOvyNdksIb57DGHD/PB3u', 'true', 'true');

--email = julijana.senic@email.com password = 5495
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Julijana', 'Senić', 'julijana.senic@email.com', '$2b$12$zzMgi5GFyfEupgTz5T7CG.fwwc5ZMJWk5QSw9O2.AYtbxd2WHDnoO', 'true', 'true');

--email = kojadin.kutlesic@email.com password = 8010
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Kojadin', 'Kutlešić', 'kojadin.kutlesic@email.com', '$2b$12$ibkVCLqcAXRuG83oOJDqeubUA9uQjpG7g3Hg1Pm/44VbkJBp1iYbK', 'true', 'true');

--email = jerotije.krkotic@email.com password = 2069
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Jerotije', 'Krkotić', 'jerotije.krkotic@email.com', '$2b$12$7luBKedc56Y5zJP6TprxV.MC.OuBf5GY5jlYModdj4J48yL8IAbS6', 'true', 'true');

--email = mijat.kendrisic@email.com password = 6650
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Mijat', 'Kendrišić', 'mijat.kendrisic@email.com', '$2b$12$20gOcxxw7qXLWZtjTqEpFObe1/QuHmgRELU4MxXlDMZ4UCU.Qa6QS', 'true', 'true');

--email = veliborka.trivic@email.com password = 1639
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Veliborka', 'Trivić', 'veliborka.trivic@email.com', '$2b$12$9X10hSlRcXunkmdJwJFnu.tZoo2DISoBqel9B5YRHLwliJ0oG.mcG', 'true', 'true');

--email = milijana.jovcetic@email.com password = 2332
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Milijana', 'Jovčetić', 'milijana.jovcetic@email.com', '$2b$12$qDIqAN/YnXsZUr9RAVALHOiq32Q/oFpNdYDZrj9TFBYbCXjLl4Pn.', 'true', 'true');

--email = tomislav.patric@email.com password = 8216
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Tomislav', 'Patrić', 'tomislav.patric@email.com', '$2b$12$NmrrpDLOfro77YH6EdJ.4eeAj2qa.J50yTSafnrcvFcMsMAn9xC66', 'true', 'true');

--email = miomir.vasalic@email.com password = 3326
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Miomir', 'Vašalić', 'miomir.vasalic@email.com', '$2b$12$h1dPmvayDdoUuEcrR1k1k.glKE8yUiKz3gColNnwEUIyi08Jd2Iqi', 'true', 'true');

--email = nebojsa.vavic@email.com password = 2295
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Nebojša', 'Vavić', 'nebojsa.vavic@email.com', '$2b$12$6OiKWjulWbmUd66Q.iJIYO4eM.MSfEYFM1RUrlOIboCVENxdvLqUK', 'true', 'true');

--email = goran.savcic@email.com password = 6707
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Goran', 'Savčić', 'goran.savcic@email.com', '$2b$12$PLxuguaOCbs1mcR7O4afN.4gOH6kVZpWgkFRQA3Dabt5jlwM15uBW', 'true', 'true');

--email = tesman.sojic@email.com password = 6952
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Tešman', 'Šojić', 'tesman.sojic@email.com', '$2b$12$gjsZoHlUywf4k7jTZYlEmuMgFmMzK6ZmZlq6p71zaCoZ5GccV2TQK', 'true', 'true');

--email = draginja.trivuncic@email.com password = 8873
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Draginja', 'Trivunčić', 'draginja.trivuncic@email.com', '$2b$12$X9xAbmKm2kHPUUdgK58EhuPWFlFotASmX9lJ2rMOXkbCZ0fx3p18W', 'true', 'true');

--email = perunika.risimic@email.com password = 2718
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Perunika', 'Risimić', 'perunika.risimic@email.com', '$2b$12$Ao4xSyrUiPAXzXB0KwJyue9/bU.dKKtipPNHZQHvUpCIjbQPegcm2', 'true', 'true');

--email = ignjatije.ljotic@email.com password = 9813
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Ignjatije', 'Ljotić', 'ignjatije.ljotic@email.com', '$2b$12$fssomRqoiQLBVcVEUuZga.N.EQqmU5bAP1YsyM16Q8NO13yK/RcpW', 'true', 'true');

--email = ivko.zivankic@email.com password = 1805
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Ivko', 'Živankić', 'ivko.zivankic@email.com', '$2b$12$fWbJuv729sbGR5QArAOw2u3DwiIS9JUZFIbU.hUIgnpW87mwjGCa2', 'true', 'true');

--email = snezana.zambelic@email.com password = 2209
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Snežana', 'Zambelić', 'snezana.zambelic@email.com', '$2b$12$sYlMxA4I7TvBr518OGUrnubFnwE3HMoUU0fQnp0kMc/EJ4X/9WT2C', 'true', 'true');

--email = nada.dragoslavic@email.com password = 3844
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Nada', 'Dragoslavić', 'nada.dragoslavic@email.com', '$2b$12$YYb5mDf6j6uH3LQncfSPI.ygUEWRpsnMBFrio4sMYirObLDJZe50K', 'true', 'true');

--email = velislav.cusic@email.com password = 1795
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Velislav', 'Ćušić', 'velislav.cusic@email.com', '$2b$12$TXJQjT67R.I3.FCInWvf0ecbCxMDaEVA4JGNyA/PjPkF10Pft6RQi', 'true', 'true');

--email = cirilo.djuracic@email.com password = 8654
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Ćirilo', 'Đuračić', 'cirilo.djuracic@email.com', '$2b$12$lLgj7/lYpVXZOMa4KBnhk.cKarq4caEeqsLaCK/6uX7xI5/oduhK6', 'true', 'true');

--email = dobrivoj.trucic@email.com password = 7207
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Dobrivoj', 'Trucić', 'dobrivoj.trucic@email.com', '$2b$12$nyLVixmqpWlChTvbQ8UjF.OgV7qasiAa/9AYE/bmm/lY74VaUPdLq', 'true', 'true');

--email = stokan.kojanic@email.com password = 6583
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Stokan', 'Kojanić', 'stokan.kojanic@email.com', '$2b$12$h3UMTUd69wjDb5g.smGOj.vD6um5EANF.aPka1vCZzvhmppckmHHS', 'true', 'true');

--email = dragomir.arambasic@email.com password = 2878
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Dragomir', 'Arambašić', 'dragomir.arambasic@email.com', '$2b$12$ZEBqqadEef2n6LUN6kc47.pxVRQdIE.Mwa.26STebf/Hriw5C3fXW', 'true', 'true');

--email = vidosava.guskic@email.com password = 4501
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Vidosava', 'Guskić', 'vidosava.guskic@email.com', '$2b$12$E8kdiFbvCaCUJsuFVVAUV.5odlspOoWD06CxuOII6EcklHbDOD2Ju', 'true', 'true');

--email = suncica.rusalic@email.com password = 2100
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Suncica', 'Rusalić', 'suncica.rusalic@email.com', '$2b$12$Ytc6Rk7LJ4XLzzPFaagjne5vohkCrFA7c0luwPIOGtGaZSOSIPE22', 'true', 'true');

--email = stanka.gilic@email.com password = 7285
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Stanka', 'Gilić', 'stanka.gilic@email.com', '$2b$12$pxrRjoF/Twf1t6CeEMt/Q.8KGEal0.ubbH22GywaiizAEAqgGwhFi', 'true', 'true');

--email = zivanko.krivic@email.com password = 7690
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Živanko', 'Krivić', 'zivanko.krivic@email.com', '$2b$12$fa9FsnXnKdXMtXPnRNZcLOJZmJ.lvxjF21PqfCVxpivZ.V9XfxETC', 'true', 'true');

--email = ilinka.vracaric@email.com password = 3978
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Ilinka', 'Vračarić', 'ilinka.vracaric@email.com', '$2b$12$Ec8O.OOWwYMgWHJf0aogtumJ4sQqC/mkPoIP2hvodMGI4CECI/5P.', 'true', 'true');

--email = desimir.pasic@email.com password = 5709
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Desimir', 'Pašić', 'desimir.pasic@email.com', '$2b$12$rUjyutXcL523Rmu2qDdA/uIuMUL7/jV0HUZC1z6TJRXSRZLBOT27S', 'true', 'true');

--email = cvijo.lucic@email.com password = 1332
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Cvijo', 'Lučić', 'cvijo.lucic@email.com', '$2b$12$Q2/hmE5YijI3CuAMyRA6Kepwm5BKoTFpiw0t6rDCBLyzRTcdYLY8W', 'true', 'true');

--email = stanojla.stanacic@email.com password = 5216
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Stanojla', 'Stanačić', 'stanojla.stanacic@email.com', '$2b$12$0Iaora.HOxtGkQ2ePZ1cE.uL5BEZh0ViC1rEwk7sJgbZi1e1ye.uu', 'true', 'true');

--email = ljubo.gospic@email.com password = 1233
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Ljubo', 'Gospić', 'ljubo.gospic@email.com', '$2b$12$J2W4pttaRAVmRl8flaqYC.2FsgokmFVEOUHfLFW0nwmSBffmAzKKG', 'true', 'true');

--email = vukasin.bulbic@email.com password = 8378
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Vukašin', 'Bulbić', 'vukasin.bulbic@email.com', '$2b$12$J9WAFI4ZUuFQzbV9/IZJD.nLHhV0QPtP9nNf//MIUNGuK1lKI6xTC', 'true', 'true');

--email = djurdjina.katic@email.com password = 4970
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Đurđina', 'Katić', 'djurdjina.katic@email.com', '$2b$12$j2nHOb9HUnkBf/X59tMGAu3uMs6MIORolc7vHQoZBx6YTcWJMInBa', 'true', 'true');

--email = caja.balsic@email.com password = 4248
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Caja', 'Balšić', 'caja.balsic@email.com', '$2b$12$DoClAsQ.bp9yZdshpid0GOsaCMUTF5n.r2ZEU7L7UNuJJ34oMEJHW', 'true', 'true');

--email = zlata.davogic@email.com password = 3272
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Zlata', 'Davogić', 'zlata.davogic@email.com', '$2b$12$3xcFvckQDmjYLOONM3YPq.Oes4ULTdrvpiGBKQR43DmD8QVZ0epxS', 'true', 'true');

--email = anka.stambolic@email.com password = 7108
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Anka', 'Stambolić', 'anka.stambolic@email.com', '$2b$12$gkVBwcrNHxq41Re7BA8Y9eC7ANXpNhq9w..AP5hyQoxSYVeC28A2O', 'true', 'true');

--email = ilinka.miloradic@email.com password = 5302
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Ilinka', 'Miloradić', 'ilinka.miloradic@email.com', '$2b$12$r3w1D.xURw5u1AmAcrmtF.p6dwW8QPS4WO9Bhl7Wk4.kPWHu8mkKW', 'true', 'true');

--email = radoman.suleic@email.com password = 1271
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Radoman', 'Šuleić', 'radoman.suleic@email.com', '$2b$12$IJWaTXywpdT0ddlKhVBN2ulZ0CvPQ8QJ9MLciRXbyCayFAyl7tfz6', 'true', 'true');

--email = ugljesa.ceprnic@email.com password = 7816
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Uglješa', 'Čeprnić', 'ugljesa.ceprnic@email.com', '$2b$12$guMKq6nSV0tJ3Z7ITs2X6.AIowb3theAWCxZqW03CGfD4CXzyPxlS', 'true', 'true');

--email = hristivoje.brbaklic@email.com password = 9954
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Hristivoje', 'Brbaklić', 'hristivoje.brbaklic@email.com', '$2b$12$Ony4t0loi50LBrbu9ZPtN.cmZ.arYeWzt1xdb/ONzLaLWEF7eTo4G', 'true', 'true');

--email = naum.dzombic@email.com password = 8745
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Naum', 'Džombić', 'naum.dzombic@email.com', '$2b$12$gaDbsug41iQ44qGeywIOK.63XsZoQqzKIYA.sYwoLJTOfGOfo8ujC', 'true', 'true');

--email = lenka.rutonic@email.com password = 8041
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Lenka', 'Rutonić', 'lenka.rutonic@email.com', '$2b$12$XYL0HOubj9KOZfU/BlZihum/JEdImb4nptYJMa1xaWU2f70I9S/CC', 'true', 'true');

--email = dobrilo.bontic@email.com password = 7159
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Dobrilo', 'Bontić', 'dobrilo.bontic@email.com', '$2b$12$6hOdIQD4jhKrQsEHkuJiNeGQ.KUSsNLMfOyTLW3c6T3HiWtSeCXQi', 'true', 'true');

--email = sofronije.vuicic@email.com password = 5014
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Sofronije', 'Vuičić', 'sofronije.vuicic@email.com', '$2b$12$v9NqSO3vlryiy96KmGxICuJYyZgnV1Bo9PCWud0zuG9KBm85JQ6JW', 'true', 'true');

--email = vukica.maric@email.com password = 3919
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Vukica', 'Marić', 'vukica.maric@email.com', '$2b$12$uI0nL/VhdpzCaM3QozbxmOyB81TsR14qKgRrnSLoTEJ5kCtA9nhui', 'true', 'true');

--email = caka.stanovcic@email.com password = 5427
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Caka', 'Stanovčić', 'caka.stanovcic@email.com', '$2b$12$vNM/0rsYmAriu5j.pz4hsOHJVSK8/rqzzyqwZCm0vf4SNEVlQCb5i', 'true', 'true');

--email = caslav.floricikic@email.com password = 8253
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Časlav', 'Floričikić', 'caslav.floricikic@email.com', '$2b$12$YrSJXdnUvZ8GpGc5fQN82.57ZxHd1EFv.VSWCnZjfiN7Sm/1dUE8y', 'true', 'true');

--email = goran.vesnic@email.com password = 6185
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Goran', 'Vesnić', 'goran.vesnic@email.com', '$2b$12$o7a487cNd4srM5q4zfbeFusz1AcmTofEzbzG3arj0lwXaOqPrnkWi', 'true', 'true');

--email = viktor.ibric@email.com password = 5928
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Viktor', 'Ibrić', 'viktor.ibric@email.com', '$2b$12$N.nWA.OQqL5d7n/z/nvZyejhDjMVUT0ohxSBEyclI/bcraZtnPn2C', 'true', 'true');

--email = djulijana.dedic@email.com password = 6985
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Đulijana', 'Dedić', 'djulijana.dedic@email.com', '$2b$12$bDgwgjpZ.lp2rFw3jzCJ3upSyWER5lZ3ND9BRVAy6d0oyaUwx9b/q', 'true', 'true');

--email = bogdana.poznic@email.com password = 4015
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Bogdana', 'Poznić', 'bogdana.poznic@email.com', '$2b$12$AZXfGm3fOnhtJnZmarhJmurmdLBAgr0No6xFOnVqrYbGxxe7Htouq', 'true', 'true');

--email = svetislava.dragisic@email.com password = 4003
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Svetislava', 'Dragišić', 'svetislava.dragisic@email.com', '$2b$12$5LBVxgav8dkosFgPhu9oDer3/8fNJYG/4Lqz2Lkho.wfodt0J6DJW', 'true', 'true');

--email = natalija.diklic@email.com password = 5707
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Natalija', 'Diklić', 'natalija.diklic@email.com', '$2b$12$QYYghKpuvs2Q.1XPCFJM7u/KoDF4zO2QynPAwyDNx6Bqg6y2pg70a', 'true', 'true');

--email = mira.andjusic@email.com password = 8798
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Mira', 'Anđušić', 'mira.andjusic@email.com', '$2b$12$qs0IJSidAwQ7r4EQ91riUufETR1LrfHXMf3/pSFcV6w7udnHy2ihG', 'true', 'true');

--email = smiljana.macesic@email.com password = 2844
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Smiljana', 'Maćešić', 'smiljana.macesic@email.com', '$2b$12$MbmelVHtdO3Ri1ulKPTkFeQVQp7BC.W8/VNtQQupuydsz/flUSouO', 'true', 'true');

--email = gorica.jevric@email.com password = 6388
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Gorica', 'Jevrić', 'gorica.jevric@email.com', '$2b$12$AZakrxzXrkzfqYQgwaXdPevBgfrb9qtTsI7eFm4kTpyq2ftt3r6Z6', 'true', 'true');

--email = negomir.deletic@email.com password = 9675
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Negomir', 'Deletić', 'negomir.deletic@email.com', '$2b$12$k5XDpb8Vd7TqGM6Ia1wc2.f.EhRAJzeAhmBm2LkptTroV/MGRTAji', 'true', 'true');

--email = cajka.drmonjic@email.com password = 3448
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Cajka', 'Drmonjić', 'cajka.drmonjic@email.com', '$2b$12$9WREdC.47AZJnrcOm3hRmuyT5HUm/qfnS4B0DDSmM24oPUrwOUb9u', 'true', 'true');

--email = tatjana.covic@email.com password = 9375
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Tatjana', 'Čović', 'tatjana.covic@email.com', '$2b$12$zKZavkBDrVaNvq0qr7LZnOfLQMFHdivwy/13X5BWtCCcRWMBvXIPu', 'true', 'true');

--email = milojka.kalezic@email.com password = 2896
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Milojka', 'Kalezić', 'milojka.kalezic@email.com', '$2b$12$3jtCiaCDpJnE19khe1YV5eFwWaJiBOVsBGNzi0HgEZ4qRRtL7Xr.m', 'true', 'true');

--email = isailo.alagic@email.com password = 6560
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Isailo', 'Alagić', 'isailo.alagic@email.com', '$2b$12$/gUsj7mwYowNyHwKdcGYauJ7Bw69xDMGHlNYLELSU0/Wn16Zmyq7C', 'true', 'true');

--email = ozren.kusic@email.com password = 4522
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Ozren', 'Kušić', 'ozren.kusic@email.com', '$2b$12$K2Cx6dcduL.R9ByRikfgFuUedzYRXkXRI1KvzIhX0nPKVj2i3EWYe', 'true', 'true');

--email = aleksija.risancic@email.com password = 4340
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Aleksija', 'Risančić', 'aleksija.risancic@email.com', '$2b$12$2FmONYtvSGgiZlhDW0g.HecCIIPuX9vQqI2p5SkjZqCTjAiAXRDX6', 'true', 'true');

--email = varvara.maric@email.com password = 6484
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Varvara', 'Marić', 'varvara.maric@email.com', '$2b$12$MiATyRe1QRhICK1JdNG9J.somnN.GXndpWr33xdBJigCOnNNcAxhK', 'true', 'true');

--email = vera.povic@email.com password = 3892
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Vera', 'Pović', 'vera.povic@email.com', '$2b$12$d3JxQD/FNKT3Xn5lLYydm.EyxGBME1mmS.nZ1EWbW2L6voPe1OAsa', 'true', 'true');

--email = kostadinka.micic@email.com password = 6568
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Kostadinka', 'Mičić', 'kostadinka.micic@email.com', '$2b$12$LA13glnXABJDwqeNuxSEveeIn1zhlbAjO1wQ32vtNwIcDkARqAmdu', 'true', 'true');

--email = cveta.morokvasic@email.com password = 6180
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Cveta', 'Morokvašić', 'cveta.morokvasic@email.com', '$2b$12$nEUgvS1Qobb5pp8CXyESUOTXc9pkcCp/yZdaqFJkW9HEpqbVKL.im', 'true', 'true');

--email = metodije.puseljic@email.com password = 1045
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Metodije', 'Pušeljić', 'metodije.puseljic@email.com', '$2b$12$XdRd7rSWaVsQ1ZfpXUcGGOgQqFa.tjYIH5f/0zdcU.XjZ4CKCCdXK', 'true', 'true');

--email = milentije.comic@email.com password = 6611
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Milentije', 'Čomić', 'milentije.comic@email.com', '$2b$12$luE0HoA9vmNqYHt2K2MqrOw9xI1rSM0orhf36HMm3rC9vhDTB3gHW', 'true', 'true');

--email = zivanka.mrkonjic@email.com password = 2198
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Živanka', 'Mrkonjić', 'zivanka.mrkonjic@email.com', '$2b$12$/.BPYPc5D2pCgRVoJPjk8.Dj3yOcZm2cByQQjut9oide2LyJMO15.', 'true', 'true');

--email = nevenka.ekmedzic@email.com password = 5600
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Nevenka', 'Ekmedžić', 'nevenka.ekmedzic@email.com', '$2b$12$0V05Cez3bc9g2wMJJKWMyeviQRidrVMGiytHurBmSFzzORRW2Y/DS', 'true', 'true');

--email = slavica.loncic@email.com password = 4967
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Slavica', 'Loncić', 'slavica.loncic@email.com', '$2b$12$HjYJWc4kRtdQf.YP/1t9yOSw2mqdlwMaoSA.mC..iXaBMRKEeklCi', 'true', 'true');

--email = lepoje.garcic@email.com password = 1096
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Lepoje', 'Garčić', 'lepoje.garcic@email.com', '$2b$12$/nNK5CSMzByov0UIw5R2zOftFNLZiMV1W6u9o09YT3bI8eMDtCOJm', 'true', 'true');

--email = jovanka.glintic@email.com password = 2911
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Jovanka', 'Glintić', 'jovanka.glintic@email.com', '$2b$12$u.9KSwMWqN2nKFaYZAXg5OFKunCOe7yWec8Nkoo9ZUQ0IabgsULda', 'true', 'true');

--email = zivorad.radisic@email.com password = 8668
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Živorad', 'Radišić', 'zivorad.radisic@email.com', '$2b$12$d3ugFgijGePCFhtsrZGYJuM77y/KuOAUFjbuUAIx4fuP3kQgW24Ia', 'true', 'true');

--email = aleksija.stefkic@email.com password = 1058
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Aleksija', 'Štefkić', 'aleksija.stefkic@email.com', '$2b$12$DjLlgCdifsI1j8HMwoJFVecpnr7m6RxJ3WDTGb63eNuToL.hNYpFS', 'true', 'true');

--email = lidija.bugaric@email.com password = 7873
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Lidija', 'Bugarić', 'lidija.bugaric@email.com', '$2b$12$CrT0UFPpZc6fpIijIxA9nutmj/ZC2/X8Ls54.I6CgBdZ5F.m1omPu', 'true', 'true');

--email = danojlo.savurdic@email.com password = 6133
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Danojlo', 'Savurdić', 'danojlo.savurdic@email.com', '$2b$12$b.cYt1dpK.bK7oEqEnXNDeK5k152h30R6g7j5C/xRXp3CUSWDpNHu', 'true', 'true');

--email = ivica.sikanjic@email.com password = 3184
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Ivica', 'Šikanjić', 'ivica.sikanjic@email.com', '$2b$12$5J2NljjXM7Eq0JSjY2KeNehvaInL9gdqvi.HPryBAdN4E.X/gLj4m', 'true', 'true');

--email = stamenija.piskulic@email.com password = 1767
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Stamenija', 'Piskulić', 'stamenija.piskulic@email.com', '$2b$12$rqSGXJkAVGiOAmGahNQQ/uzNrvnl2pyfLlZNN87N0p3NilIJXG8bC', 'true', 'true');

--email = zivanka.kvrzic@email.com password = 3034
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Živanka', 'Kvržić', 'zivanka.kvrzic@email.com', '$2b$12$UfOXBKkTx2UvZZzihWiCF.xsznj.686CJbefy.3vHUVfAJ7.JOf6a', 'true', 'true');

--email = cvijetin.sodic@email.com password = 4701
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Cvijetin', 'Šodić', 'cvijetin.sodic@email.com', '$2b$12$/DM0Q4MaQeQ9JVeVz5ktIOZA9Fc6WB8X.VstG.pe8K0K5mqt5/Eo6', 'true', 'true');

--email = stole.picuric@email.com password = 1792
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Stole', 'Pićurić', 'stole.picuric@email.com', '$2b$12$9d5DLVQ2/rR6DY.OACYJS.XB.1ctWKjxiDmDQns0ZPoJQLGCh1H2W', 'true', 'true');

--email = cana.setencic@email.com password = 9650
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Ćana', 'Setenčić', 'cana.setencic@email.com', '$2b$12$lujjvnlw92wtLA4bJQkakOyasX8jClfL/k6aYnmmNA7hu01x.UMyC', 'true', 'true');

--email = suzana.lilic@email.com password = 7378
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Suzana', 'Lilić', 'suzana.lilic@email.com', '$2b$12$S5W55y7vrnks1QVyQR5U1e8djzWJh/nnbvbasF/5vDM96THThhdCG', 'true', 'true');

--email = aran|el.sekaric@email.com password = 8916
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Aran|el', 'Šekarić', 'aran|el.sekaric@email.com', '$2b$12$fK3GlUChc65iq7z5jkdgVeGRjcZgxpOhdw4ejbuJe0/zC2CNFHSz2', 'true', 'true');

--email = damjan.borisic@email.com password = 5117
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Damjan', 'Borišić', 'damjan.borisic@email.com', '$2b$12$Hj3PCNdtT5mwk0moFBNeKefssm4XTH2yUuHg5oC6TOegE.xjgSFCm', 'true', 'true');

--email = javorka.tontic@email.com password = 8344
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Javorka', 'Tontić', 'javorka.tontic@email.com', '$2b$12$5U/p0M.zDRW3czM9nc3Qv..ZtT6u2yAfyg.Hz2uGa9c0M9pPnpz6e', 'true', 'true');

--email = magdalena.brboric@email.com password = 2502
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Magdalena', 'Brborić', 'magdalena.brboric@email.com', '$2b$12$/aKVHynhniH3V7XEKyzqA.Kt.7.0cfWeUchBxmFuQbeiAMji.wV9K', 'true', 'true');

--email = dragomir.blesic@email.com password = 7340
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Dragomir', 'Blesić', 'dragomir.blesic@email.com', '$2b$12$wI3SB4wEAL.6vdNalrEtrO.yjHlYdYUmHRGVKx68rWNGj9qhhdfu6', 'true', 'true');

--email = milesa.zipancic@email.com password = 4101
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Milesa', 'Zipančić', 'milesa.zipancic@email.com', '$2b$12$V752HmFXwXuX/SKWt8st2.F/LdpIqyFMFs2OCOmi8L2nTvJ/PP2yK', 'true', 'true');

--email = lepoje.borokic@email.com password = 7357
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Lepoje', 'Borokić', 'lepoje.borokic@email.com', '$2b$12$leBiJuMsJdGzRlwuyVXGEOGAey3zh/TbjWG9vw4nLMoOmJxLAAK6a', 'true', 'true');

--email = momcilo.bolic@email.com password = 6671
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Momcilo', 'Bolić', 'momcilo.bolic@email.com', '$2b$12$joTdnMFh95QKi0AmBbAQqO/h7w4AYhLpCXVyTZgVNQTcGCGlhX1Eu', 'true', 'true');

--email = zdravko.mitrusic@email.com password = 7535
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Zdravko', 'Mitrušić', 'zdravko.mitrusic@email.com', '$2b$12$5TTb6oWivBMr5g/bHG2Jlem4n8kYU0YGgCrrSmtZRlB/3UATb7G7a', 'true', 'true');

--email = radenka.salajic@email.com password = 6508
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Radenka', 'Šalajić', 'radenka.salajic@email.com', '$2b$12$DneGngnXWb1ShwSly.RKOeDsBJsEWBh4ZxDOdFNfIUrCpcldyd7lC', 'true', 'true');

--email = ubavka.maricic@email.com password = 2275
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Ubavka', 'Maričić', 'ubavka.maricic@email.com', '$2b$12$65WNFZONUYGeAfFnC2UlkexHjL8ldtu3AsP2jWYdef6oUdsHMEHLm', 'true', 'true');

--email = mirko.kokeric@email.com password = 7367
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Mirko', 'Kokerić', 'mirko.kokeric@email.com', '$2b$12$ypuZuzhNuYittMa5dKkQhuBcDeZiHR/AjEVQ7DhJWdWVUsylY2WkS', 'true', 'true');

--email = stojna.vulikic@email.com password = 6909
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Stojna', 'Vulikić', 'stojna.vulikic@email.com', '$2b$12$xzCPXLJob3KKrJTLQe3fnOfso0LFlje1zLsL5nJ21vAJgd4bAo4tO', 'true', 'true');

--email = njegus.stakusic@email.com password = 9876
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Njeguš', 'Stakušić', 'njegus.stakusic@email.com', '$2b$12$m18cb2jgy/tjg6KRexUqWuHs.hmlcbGjoY6fCQWQG.lk7QLfSUHTi', 'true', 'true');

--email = gojko.conjagic@email.com password = 8534
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Gojko', 'Čonjagić', 'gojko.conjagic@email.com', '$2b$12$pWNd.RrNfeJyed/Yc6ubwel/dX40S9wY.bndVpA4kb3FOxGbSmyIq', 'true', 'true');

--email = marija.bernic@email.com password = 3167
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Marija', 'Bernić', 'marija.bernic@email.com', '$2b$12$gSJsVW4BhtGsjeFTIzdnN.MVqnmjz4Ltq94kF.avwKbfCB.j9rgRK', 'true', 'true');

--email = andjelko.saratlic@email.com password = 3156
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Anđelko', 'Saratlić', 'andjelko.saratlic@email.com', '$2b$12$Mr6wdNl8gvBymdp1WTdD8etjkcZaYB71HcazMFDHfr9xuMbnm.AZu', 'true', 'true');

--email = slavica.gambelic@email.com password = 3599
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Slavica', 'Gambelić', 'slavica.gambelic@email.com', '$2b$12$cA5sLsiDz3WajergOmcqzuv2nDH00rdSM4YN2P4Hj9AeQBcbxcAtG', 'true', 'true');

--email = kuzman.sebic@email.com password = 3484
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Kuzman', 'Sebić', 'kuzman.sebic@email.com', '$2b$12$Sb2uu4R/B3wuKkRyfC6IdOuss7SHvQNRbJsqZUzHzm2zG3moHa2aC', 'true', 'true');

--email = adam.crvendakic@email.com password = 2224
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Adam', 'Crvendakić', 'adam.crvendakic@email.com', '$2b$12$dbSh0MowpdEKm52h0SIbceo8/mV38OqJ78almFFNyNpygGHtdjldq', 'true', 'true');

--email = zvonka.sendric@email.com password = 3220
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Zvonka', 'Sendrić', 'zvonka.sendric@email.com', '$2b$12$m568fOHj5Rs2QZI8BwKcZ.j6r5P3RE8dh0T3HQrAv9TkapniqrhAO', 'true', 'true');

--email = radoslava.tancic@email.com password = 3179
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Radoslava', 'Tančić', 'radoslava.tancic@email.com', '$2b$12$PKrvzjisRxPp4l9MnUBOU.JVt8p2doFT7X9u08wlPVr57ipI2GBPy', 'true', 'true');

--email = radivojka.drmoncic@email.com password = 7498
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Radivojka', 'Drmončić', 'radivojka.drmoncic@email.com', '$2b$12$u8xn3Mf7F1qPQUqMKCs//.sFpKUB7jNjaygNRZKaEbubxo7ESgHOK', 'true', 'true');

--email = slavenka.ustic@email.com password = 6330
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Slavenka', 'Ustić', 'slavenka.ustic@email.com', '$2b$12$I5aewU0ywsLxnJVD4NbxW.hJt5nzh04mUXNrLN4CPqwyn.7OR0A9C', 'true', 'true');

--email = radmilo.dimkic@email.com password = 7846
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Radmilo', 'Dimkić', 'radmilo.dimkic@email.com', '$2b$12$VDSzqNLFT2ISRvKXojPW3eMCU0jm.jrZNrZnbLN0qkwbrWYO5sOCS', 'true', 'true');

--email = stevka.kolobaric@email.com password = 1552
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Stevka', 'Kolobarić', 'stevka.kolobaric@email.com', '$2b$12$ZAMzCoeApa1Al7HE/zWAIe.ieVHis.YogNzUGj25nrgLFoC7XcZg2', 'true', 'true');

--email = manojlo.bastajic@email.com password = 9226
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Manojlo', 'Bastajić', 'manojlo.bastajic@email.com', '$2b$12$g7Kx6XGAImlGYqG7L2v/O.wE4Pq8LYzB09Z1vqiX00fHTbcf7QWbG', 'true', 'true');

--email = trajan.sojkic@email.com password = 7578
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Trajan', 'Sojkić', 'trajan.sojkic@email.com', '$2b$12$HPbe.eEKOXb/zUKgprK.j.oFSMp54gcpu.HXTh9SvgE3BGdqruqdy', 'true', 'true');

--email = ognjen.drekic@email.com password = 4995
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Ognjen', 'Drekić', 'ognjen.drekic@email.com', '$2b$12$AyWUPJMaetaDgfMytS94JunMN1XH110dsNCKwX5WwL8WVKhrK6I/a', 'true', 'true');

--email = dusana.nakomcic@email.com password = 1423
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Dušana', 'Nakomčić', 'dusana.nakomcic@email.com', '$2b$12$Cs9qk3tOe8gNDyT/dKtP9uiYgx4hDziagEwgkw09l.LKZPV1cbrgK', 'true', 'true');

--email = mateja.kosprdic@email.com password = 5080
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Mateja', 'Košprdić', 'mateja.kosprdic@email.com', '$2b$12$qEBo4/3CFA2k2KSSHmsKDOuHaBbF8mLAJWg2R1rpkL3nxhXKhUKJm', 'true', 'true');

--email = savka.grabovcic@email.com password = 4977
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Savka', 'Grabovčić', 'savka.grabovcic@email.com', '$2b$12$cWYIaLY3ywLRl3BNdEhC4.KTXGdKNtV3jmQAshqtyu0pFWX2/eR3G', 'true', 'true');

--email = grozda.kondic@email.com password = 3354
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Grozda', 'Kondić', 'grozda.kondic@email.com', '$2b$12$zQrOatgFgsqQaQPFkWkxiuJLcmTwFQ97E69CCs80g57EH6VsDT4Qm', 'true', 'true');

--email = leonida.majkic@email.com password = 6698
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Leonida', 'Majkić', 'leonida.majkic@email.com', '$2b$12$inWTdJe8auwdjNw4X5oZ1.uQWg/VEElAvE5cArkupKtNbzyRWUYgO', 'true', 'true');

--email = borislav.vanucic@email.com password = 6775
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Borislav', 'Vanucić', 'borislav.vanucic@email.com', '$2b$12$wGlGE/eQY7EdrTuYXhSmauDR6qt7VI5MWGJUIsQTPAdnrTclL.rcG', 'true', 'true');

--email = dobrica.krekic@email.com password = 3355
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Dobrica', 'Krekić', 'dobrica.krekic@email.com', '$2b$12$AmiR02E4G.tNLs30v9AjGeVrEfzzhY8wdBEQ/pWPQ32rCTVBh3WOm', 'true', 'true');

--email = bozidarka.tanikic@email.com password = 9475
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Božidarka', 'Tanikić', 'bozidarka.tanikic@email.com', '$2b$12$CnUk7QYBFuO4oOZF3BnOsOJpzsKs5hy4gPwgKqlPcR3mkPDt8ri9q', 'true', 'true');

--email = sisko.tarabic@email.com password = 9501
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Šiško', 'Tarabić', 'sisko.tarabic@email.com', '$2b$12$wACBHsAjfJ3fjGvQinMDpOmbaU5OhrGm2jaQt4hEQ8/0jqFGybnWq', 'true', 'true');

--email = kosana.racic@email.com password = 3460
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Kosana', 'Racić', 'kosana.racic@email.com', '$2b$12$s7A0SIS.Pw.DVmIMTgax4.goS2wm6N/E8Tek7ialF/RJmsWpfvC9.', 'true', 'true');

--email = despot.vujcetic@email.com password = 1660
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Despot', 'Vujčetić', 'despot.vujcetic@email.com', '$2b$12$8J6mkNMdfnjuokpA6jqBSubHK7vtZpdaGSp9AGBKLHy6vir7rb7iW', 'true', 'true');

--email = blaginja.vlaketic@email.com password = 8175
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Blaginja', 'Vlaketić', 'blaginja.vlaketic@email.com', '$2b$12$x4a6PMZF1hXsfRtKsb/wmOo0R09Rxipd.4d6wIHTdPZbs6RfQCByi', 'true', 'true');

--email = cvetanka.dugajlic@email.com password = 5805
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Cvetanka', 'Dugajlić', 'cvetanka.dugajlic@email.com', '$2b$12$lIfjVIA2r.jFYtWpmGfzsOowmMW2ZpKHq3E7zw1WaRKQuvlJ7M5sq', 'true', 'true');

--email = teohar.bodirozic@email.com password = 9652
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Teohar', 'Bodirožić', 'teohar.bodirozic@email.com', '$2b$12$lzNvgNwqoUrjtzWiaKr9aefYc0MTAqESy1RpY2u1bGqE7pEtF.xMC', 'true', 'true');

--email = despot.brodic@email.com password = 7913
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Despot', 'Brodić', 'despot.brodic@email.com', '$2b$12$KWPRdqC/u70NSSlWTMYwmOP50Uxt6l5rCAv3WkTxb1JvMnKMDVIf.', 'true', 'true');

--email = ranka.varonic@email.com password = 1977
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Ranka', 'Varonić', 'ranka.varonic@email.com', '$2b$12$2LkcuXILLFri5BCtz32kGeEFgVqpBsSbdzDTCc4Ot.P.TD6JYUsjO', 'true', 'true');

--email = sinisa.prokopic@email.com password = 3394
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Siniša', 'Prokopić', 'sinisa.prokopic@email.com', '$2b$12$kOe4q9whHIcG.tIv.NjEaukx3SAw80kq26V085H1DVZT0h5c0.eJe', 'true', 'true');

--email = doroteja.kurcubic@email.com password = 5337
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Doroteja', 'Kurčubić', 'doroteja.kurcubic@email.com', '$2b$12$3l9hHcwNk0ioVLBYD2/O/u9nLdIdra6AparsdSbqMmBqmr95K3JIm', 'true', 'true');

--email = leposava.lazetic@email.com password = 4814
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Leposava', 'Lazetić', 'leposava.lazetic@email.com', '$2b$12$ZjlSLqfp6Y1LWJWFBuIt3eg85hSjfbW6B7HSdkhvvZQS1GVk9jht2', 'true', 'true');

--email = slobodanka.vladetic@email.com password = 4827
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Slobodanka', 'Vladetić', 'slobodanka.vladetic@email.com', '$2b$12$cSlPGLrWhtHQ1A/5627UVeTwBJ6QAPIrkbuCmClkxwXCHr3zoXkka', 'true', 'true');

--email = savka.kulisic@email.com password = 1934
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Savka', 'Kulišić', 'savka.kulisic@email.com', '$2b$12$otBOcqdq1iODO3j6HQX4Juochpgl60RTZWfHcj9NHf794Z11GCXJO', 'true', 'true');

--email = dobrivoj.lekanic@email.com password = 2313
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Dobrivoj', 'Lekanić', 'dobrivoj.lekanic@email.com', '$2b$12$YlZQgcvkops6CdOsBrDmauHy8xH3BrGfPYlhqmyxyPft1EDZ0LR9u', 'true', 'true');

--email = velinka.spanic@email.com password = 8609
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Velinka', 'Španić', 'velinka.spanic@email.com', '$2b$12$rRAmwa7hDvcSLQJatfUJ8.cKUOrlRld.UwCRoecCUmMt2m0/sF/2u', 'true', 'true');

--email = zivorad.dornic@email.com password = 7701
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Živorad', 'Dornić', 'zivorad.dornic@email.com', '$2b$12$NOu/B9l2TxBSaUGLXUGWO.Yf2KoSCo3.muyKVCyuYlNUEWR/CA4GO', 'true', 'true');

--email = veljko.zarkic@email.com password = 3322
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Veljko', 'Žarkić', 'veljko.zarkic@email.com', '$2b$12$ws6vhoY2zERr/XBOj/15FOtpoEKIOh0aWG5WKnNsVI3573gF8twqG', 'true', 'true');

--email = gradisa.tresnjic@email.com password = 7450
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Gradiša', 'Trešnjić', 'gradisa.tresnjic@email.com', '$2b$12$Q9oeElyAVROTKcgqBt.zQu00BsK5tUAyohfJqNNivMQifxQpZMN2O', 'true', 'true');

--email = aksentije.mandic@email.com password = 1286
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Aksentije', 'Mandić', 'aksentije.mandic@email.com', '$2b$12$jumz5LBZz52X6drcEOh0YuYVex/D7aPko8WzkM.CgzpU6rvP0IQ7O', 'true', 'true');

--email = anastasija.ujic@email.com password = 5489
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Anastasija', 'Ujić', 'anastasija.ujic@email.com', '$2b$12$ksoFtVPFVtvZYFswHmPvkesz7wYyJEMY6Nw6u/jkDxSMukky0vsF2', 'true', 'true');

--email = vasilija.sabeljic@email.com password = 5828
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Vasilija', 'Šabeljić', 'vasilija.sabeljic@email.com', '$2b$12$Abxn3xPamjKLW5iVnhXmouhe3NAVHKzK5oeAx.ql4kMm6Hbocvksa', 'true', 'true');

--email = prvoslav.koranjic@email.com password = 7083
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Prvoslav', 'Koranjić', 'prvoslav.koranjic@email.com', '$2b$12$NGMUDBP5D2cUrXMCo5ogiuuZA20I6ZaDcoIVzFi../K5o/Mazo92O', 'true', 'true');

--email = hariton.bulajic@email.com password = 8859
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Hariton', 'Bulajić', 'hariton.bulajic@email.com', '$2b$12$8xrhK00EmTpeytMF0IPK/uGQxsfQRnn0jMu4/Lm8wqmIhhYV8/NoK', 'true', 'true');

--email = tomka.mirnic@email.com password = 8791
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Tomka', 'Mirnić', 'tomka.mirnic@email.com', '$2b$12$nTqz8lsOFKp.eeZZId76Xu3uMDTUJRKziIN6lrbTvUO3VPKgKLxDG', 'true', 'true');

--email = prvoslavka.djenadic@email.com password = 2194
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Prvoslavka', 'Đenadić', 'prvoslavka.djenadic@email.com', '$2b$12$XhIy61abL27Fu4n5zbp64ujEdbSdU2K2ww/HhUehaKDHAhI3JfGFS', 'true', 'true');

--email = tina.trencic@email.com password = 4198
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Tina', 'Trenčić', 'tina.trencic@email.com', '$2b$12$kty/NOMAlq5iehkrfrbFLO8OyoyiRbx/9WgHHvVN1gnMBlqcZaPre', 'true', 'true');

--email = vidosava.prelic@email.com password = 1209
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Vidosava', 'Prelić', 'vidosava.prelic@email.com', '$2b$12$gYoAATnV3HFMx4Xf.Sx4JeL0YZ/pQYzfwAgDVSlQgBdezdzFZt3tm', 'true', 'true');

--email = slavoljub.saicic@email.com password = 9281
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Slavoljub', 'Saičić', 'slavoljub.saicic@email.com', '$2b$12$AurA6lQ9238uz/86XG7C2uIGWhUotgzc0EIGTE/rztL17WmsFFIUy', 'true', 'true');

--email = isailo.lakusic@email.com password = 9689
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Isailo', 'Lakušić', 'isailo.lakusic@email.com', '$2b$12$9k/MkG0Lnlid8hEk7J5gzew797eURM0d7e7ram64OT0VbJ0yypnty', 'true', 'true');

--email = selimir.jeftenic@email.com password = 9171
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Selimir', 'Jeftenić', 'selimir.jeftenic@email.com', '$2b$12$iq0HLbcSOlDWhtBjfmevheQlRUXQZoVUHtCxmWI86y63jfcvfvDpW', 'true', 'true');

--email = olja.milesic@email.com password = 2347
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Olja', 'Milešić', 'olja.milesic@email.com', '$2b$12$vVhkVmssBFy8ukxfOVpOCuzzoK6RlzyXF/oHrlh4.BiyGOhREiz52', 'true', 'true');

--email = teodosije.peric@email.com password = 7461
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Teodosije', 'Perić', 'teodosije.peric@email.com', '$2b$12$D0gzzdZJyCn8d4FZ7ShnKudk1Mf.msXiTpNR08IzAouPg6TkxBb..', 'true', 'true');

--email = punisa.bugarcic@email.com password = 1290
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Puniša', 'Bugarčić', 'punisa.bugarcic@email.com', '$2b$12$m07YkbiVSu9ULJBDpXOf0ez5DyyuZ/d0wXCzXvNzkh0uljPPouBpS', 'true', 'true');

--email = jordanka.malbasic@email.com password = 9571
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Jordanka', 'Malbašić', 'jordanka.malbasic@email.com', '$2b$12$WysMPOxz662.OE9amCB7W.5AGOoxPRXqgIgy5ps88szCLZzvfZiW6', 'true', 'true');

--email = dunja.ladicorbic@email.com password = 3762
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Dunja', 'Ladičorbić', 'dunja.ladicorbic@email.com', '$2b$12$7f4bz5PuG.RyyVHMqg3DFOw.KJf1f8ADrCRymYt69bSgxkUpOuHz2', 'true', 'true');

--email = sergije.piskulic@email.com password = 1597
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Sergije', 'Piskulić', 'sergije.piskulic@email.com', '$2b$12$YMGZvvue/4NeW/sySFHbTuvvyZVx9T4disBKdNEmoncssGiA/BUKe', 'true', 'true');

--email = dobroslavka.lungic@email.com password = 3262
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Dobroslavka', 'Lungić', 'dobroslavka.lungic@email.com', '$2b$12$ZZiagLRUE801rRYbv1JTKeNnYSYz0KR41EAAMbjhoA7pLQZHjax4W', 'true', 'true');

--email = stanija.skulic@email.com password = 1719
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Stanija', 'Škulić', 'stanija.skulic@email.com', '$2b$12$QYgPz9Us8uPI.Y8HsgRTj.j.pMWv4h4n8IAncl0Ah0AKCry/dnBSi', 'true', 'true');

--email = cirilo.ivic@email.com password = 2683
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Ćirilo', 'Ivić', 'cirilo.ivic@email.com', '$2b$12$1KRIAdFKB38jKrPQKaAE8.4xTLhJCThsNXO8ifA2Z6FStAaoSbApG', 'true', 'true');

--email = srbislava.sunaric@email.com password = 7149
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Srbislava', 'Sunarić', 'srbislava.sunaric@email.com', '$2b$12$tJGOmbuxSQj2zzTJ6KCMJ.bT5ihbKeYQULyWJbCk8t/2hVoDvN41K', 'true', 'true');

--email = ljiljana.kosanic@email.com password = 9995
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Ljiljana', 'Kosanić', 'ljiljana.kosanic@email.com', '$2b$12$rtiLkKnnZbfALJYeonP12.myjm/LL.ckn/g9iaJoXjRSE3Dv2VD5y', 'true', 'true');

--email = hariton.joksic@email.com password = 1256
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Hariton', 'Joksić', 'hariton.joksic@email.com', '$2b$12$8hBpx2Qy6w35zOrgU7VP4uOICsKpikBpor1t7E2Kn30tIEGXf6.vK', 'true', 'true');

--email = sajka.nenadic@email.com password = 9136
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Sajka', 'Nenadić', 'sajka.nenadic@email.com', '$2b$12$WMy501hmMGujnBNF055/Te7jlFCGJyVTEfyG1jS7QIZx8wvqyYVpe', 'true', 'true');

--email = njegosav.bosnic@email.com password = 8467
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Njegosav', 'Bosnić', 'njegosav.bosnic@email.com', '$2b$12$0pZXhxt/ExkV93GdBm2cCOZh/TrXJHUqNgOe2DvbC87RFdxFcE7Xi', 'true', 'true');

--email = igor.pejusic@email.com password = 6788
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Igor', 'Pejušić', 'igor.pejusic@email.com', '$2b$12$S0J4ccELLIR250fIFN82M.vhL6pcUz0AVp7erXrhZ3.IxO19ruDjW', 'true', 'true');

--email = filotej.brancic@email.com password = 7202
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Filotej', 'Brančić', 'filotej.brancic@email.com', '$2b$12$OyGazBcG2uONkyA.Cc1C5et3e55wMkPRDhFBdNF3A3mTMVR4.zUgq', 'true', 'true');

--email = bratislava.brezonic@email.com password = 5224
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Bratislava', 'Brezonić', 'bratislava.brezonic@email.com', '$2b$12$SHRcuPB5afZoTjWTri/CyuN9qkQPV2gu849ua7ZCehsvhwwnLX3su', 'true', 'true');

--email = mileva.hadzi@email.com password = 1474
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Mileva', 'Hadži', 'mileva.hadzi@email.com', '$2b$12$CDwvrSePPuucfjK6BkPz0.I/h5SAAqpLrte5g3D7Pps.LADMvNJh.', 'true', 'true');

--email = vukosava.laketic@email.com password = 5537
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Vukosava', 'Laketić', 'vukosava.laketic@email.com', '$2b$12$ghhdBFoeKCZmmpRkUhwrO.EoJtuThYJH0CKfYGbO3mWkJEPGcHoHy', 'true', 'true');

--email = radmilo.vidaric@email.com password = 4244
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Radmilo', 'Vidarić', 'radmilo.vidaric@email.com', '$2b$12$zkaOTI8/xwqS8gxUm9afBO/A12sU3hmciQ5k/1Gs6srAhGDiB1c/C', 'true', 'true');

--email = goran.matic@email.com password = 1118
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Goran', 'Matić', 'goran.matic@email.com', '$2b$12$5Rf.8bzlgpTH5kLgw4taX.QsJMChx5TyL3v7KPizfYu3RcFrxCIhu', 'true', 'true');

--email = trivun.krickic@email.com password = 2010
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Trivun', 'Kričkić', 'trivun.krickic@email.com', '$2b$12$z3k9mDzczAORKf5tNTiCxOyyHNIgopdpfse7FhpqUghqDqr1kxHNO', 'true', 'true');

--email = radoman.aljetic@email.com password = 6176
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Radoman', 'Aljetić', 'radoman.aljetic@email.com', '$2b$12$UUjCgstTRG4Q7EW8mFuMOeRhemrL6bfyLC6RTpZyAHsF8wmO9LCx.', 'true', 'true');

--email = toma.ordagic@email.com password = 6862
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Toma', 'Ordagić', 'toma.ordagic@email.com', '$2b$12$wvabEpjxBFORNlQus4Ul6ev8jn9uTF6AsLe8QUVTbl3IHQYOQCJUO', 'true', 'true');

--email = stracimir.acimic@email.com password = 2641
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Stracimir', 'Aćimić', 'stracimir.acimic@email.com', '$2b$12$401qd1yFtyM6qS742906huQdqpANglTduwRK5rMC/WZv.2hKPGTyG', 'true', 'true');

--email = oliver.rupic@email.com password = 8586
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Oliver', 'Rupić', 'oliver.rupic@email.com', '$2b$12$MCA/pxoR5uitPJUPyiaPbehygofYMCfUAGbON22SlhFsaezt2FaDm', 'true', 'true');

--email = bogosav.ivicic@email.com password = 2217
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Bogosav', 'Ivičić', 'bogosav.ivicic@email.com', '$2b$12$RUMH5tKX864xrwP1/wncuepzaswIGL/Fk9o8wjL.Tig/lqp9FBcZK', 'true', 'true');

--email = dimitrije.djurdjic@email.com password = 9463
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Dimitrije', 'Đurđić', 'dimitrije.djurdjic@email.com', '$2b$12$16Se1EYK/DrkStbbLEEkLeVYHgvMHsg4476azmazFCCJuc30lYCe.', 'true', 'true');

--email = dragomir.dacic@email.com password = 9380
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Dragomir', 'Dačić', 'dragomir.dacic@email.com', '$2b$12$.DIJPCcB.u3NtVOw0q0a8O0D.J0r3COu/DkXjGeQ6.qIiaeZHvw0W', 'true', 'true');

--email = prodan.djaletic@email.com password = 9391
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Prodan', 'Đaletić', 'prodan.djaletic@email.com', '$2b$12$L.xpDuWHDoCXGLY2LXJnnOZAqaURSvJSUolkCI6Wns4NZ5Vk0Z01C', 'true', 'true');

--email = kamenko.bacic@email.com password = 2795
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Kamenko', 'Bačić', 'kamenko.bacic@email.com', '$2b$12$GkMjYfeQdNzzyxJQ8eAMku6sIWpBmwh7koZUj3XnxB71BSUKQImRS', 'true', 'true');

--email = isidora.zunjic@email.com password = 7671
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Isidora', 'Žunjić', 'isidora.zunjic@email.com', '$2b$12$IO9u8a2LZxeGCkriFd1wi.J0BiLOfXvTO2srHXAEQkSg4a87Vl9XK', 'true', 'true');

--email = suncica.saronjic@email.com password = 1001
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Suncica', 'Šaronjić', 'suncica.saronjic@email.com', '$2b$12$onIbzxo6SweL6o0lG4tBQeje1IpZQ351iphimadZpC5HnoHMP.rcy', 'true', 'true');

--email = ozrenka.gilic@email.com password = 9917
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Ozrenka', 'Gilić', 'ozrenka.gilic@email.com', '$2b$12$4LtUhXAMdw2iSA5RHmL2DutQAvHH4nHtI.B5XybOaAbaQ0mVnqYV2', 'true', 'true');

--email = dragica.kedic@email.com password = 3242
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Dragica', 'Kedić', 'dragica.kedic@email.com', '$2b$12$Z5Xg7vU3zUo7w46bP2QNBec092Rwz41J5z5yL1pF3Eg31hFLBp6NW', 'true', 'true');

--email = milutin.danojlic@email.com password = 4502
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Milutin', 'Danojlić', 'milutin.danojlic@email.com', '$2b$12$qJCBRt2zhWSGTkqF5cTgqOwv5gTRwIAjrTEirdJ7eAGvjcuNxTjqS', 'true', 'true');

--email = kosana.anicic@email.com password = 8205
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Kosana', 'Aničić', 'kosana.anicic@email.com', '$2b$12$h47TNWaVw4//iAaG8qZpMOm08AJHHXb.PiYseLlxN.lJ00dyQeYqK', 'true', 'true');

--email = jaksa.mrkic@email.com password = 4525
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Jakša', 'Mrkić', 'jaksa.mrkic@email.com', '$2b$12$8os9ezf8OFmyJqsKAGaQzOMWEgj7xYfSz48BmxBMBwSaFELvCU1yu', 'true', 'true');

--email = kasija.vucendic@email.com password = 4765
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Kasija', 'Vučendić', 'kasija.vucendic@email.com', '$2b$12$JQy7ZgGCclY1gs06a5QyDOVZ3OSIcVmb1YojSJj1P1aS/BxoQ4BZe', 'true', 'true');

--email = prodana.bijanic@email.com password = 6224
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Prodana', 'Bijanić', 'prodana.bijanic@email.com', '$2b$12$eibcyRyUVbHmvQD8xNVLfuqB1ska6rlqhUFCRjGGlEiEh2pvoM7yq', 'true', 'true');

--email = milinko.gulic@email.com password = 8455
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Milinko', 'Gulić', 'milinko.gulic@email.com', '$2b$12$L6LE00cZ6uyTu7ot.wqODuJjmxRYRExxTnE5jwzbfiJfYd2/gV2EC', 'true', 'true');

--email = bogdana.bukazic@email.com password = 5869
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Bogdana', 'Bukazić', 'bogdana.bukazic@email.com', '$2b$12$OcOTQcSM3cqCkPZG3ZW6l.Ln4N4BoHAlBfjQtQ/ymVHayov6my9KO', 'true', 'true');

--email = strajin.sovtic@email.com password = 5546
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Strajin', 'Sovtić', 'strajin.sovtic@email.com', '$2b$12$t8KekqcbUKqdHGrPPvQcUu7I6JFpvLt01Q4tnq6SdlTnR5jUYlv/e', 'true', 'true');

--email = zaga.trific@email.com password = 3841
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Zaga', 'Trifić', 'zaga.trific@email.com', '$2b$12$2MGnrC4iPsWpgufCizZHtOg7eoQ2la0249/dFvPCWGEoSASJ0e9pu', 'true', 'true');

--email = trajan.nikic@email.com password = 8618
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Trajan', 'Nikić', 'trajan.nikic@email.com', '$2b$12$ofAtxUKDWvS2x9qs29CnKOwsEhNxmDZ4DEYsUCjnMmIzGpmYU0gya', 'true', 'true');

--email = tomanija.manjic@email.com password = 4680
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Tomanija', 'Manjić', 'tomanija.manjic@email.com', '$2b$12$5DW.B.gkpNc.EuJzwXBPouY/GM5/g6abp/.iG/7d9t6R9A5bq0Zem', 'true', 'true');

--email = dragoljub.vukanic@email.com password = 3617
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Dragoljub', 'Vukanić', 'dragoljub.vukanic@email.com', '$2b$12$mEiocdo5DV2/ilW2ZYJe.uFnRQnGG24jw/zzvUFbv2SNkafcd5HLW', 'true', 'true');

--email = bratislava.djurbabic@email.com password = 8132
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Bratislava', 'Đurbabić', 'bratislava.djurbabic@email.com', '$2b$12$OXvkDQLTtc4vNI0jb5Qn6OhSUd/6EJNRhORrr4rbuqVNh3yW7ObDK', 'true', 'true');

--email = dragoljub.juric@email.com password = 7337
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Dragoljub', 'Jurić', 'dragoljub.juric@email.com', '$2b$12$zjo6mVcgj.YBJ9xImeBDje3nNLYDSKTDkCP.kBMoskHbxlYRV9fL2', 'true', 'true');

--email = ugljesa.milenic@email.com password = 2619
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Uglješa', 'Milenić', 'ugljesa.milenic@email.com', '$2b$12$CSlXv4hfbu1YZPhNY113c.B/s6qGGzLKKduk6UGMf61.enFb4FP..', 'true', 'true');

--email = nebojsa.rusic@email.com password = 1561
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Nebojša', 'Rusić', 'nebojsa.rusic@email.com', '$2b$12$layTZ7fC0pHbffBzg8i5we1kpQVoH6RDTFSHrEAoPCKhIDrfwrJ9y', 'true', 'true');

--email = dragisa.puzic@email.com password = 6969
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Dragiša', 'Puzić', 'dragisa.puzic@email.com', '$2b$12$Icbu7h/T7KYd5wHPylL7XeHTqSD1VK/AdcmvVFumz2hqfAK6D.EAa', 'true', 'true');

--email = matija.grivic@email.com password = 7113
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Matija', 'Grivić', 'matija.grivic@email.com', '$2b$12$l3KhyBmtK2lqztI9sE4Guuar2D3gliwSL5okW.RCzfshr/31vft6u', 'true', 'true');

--email = kleopatra.rasljic@email.com password = 2894
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Kleopatra', 'Rašljić', 'kleopatra.rasljic@email.com', '$2b$12$/eViNiFLdwpEIB0T5184cO8aj2tmiCFlwdqn657iLg4s.dS0Y7bOi', 'true', 'true');

--email = ratislav.zorbic@email.com password = 4527
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Ratislav', 'Zorbić', 'ratislav.zorbic@email.com', '$2b$12$l3OIVASdOb5hdZApMP.LWO/0g6L/fsqftYyBXSgxU/FnzHCjE3nO.', 'true', 'true');

--email = radosav.kraljacic@email.com password = 8076
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Radosav', 'Kraljačić', 'radosav.kraljacic@email.com', '$2b$12$8W/RA3aOIPjL9ASpKxI7/eAb6jCDEivuy9R72r49F/4MyJWeJcCSu', 'true', 'true');

--email = buda.trsic@email.com password = 4595
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Buda', 'Tršić', 'buda.trsic@email.com', '$2b$12$WYoBzsT0NUNFmPKrfkk3ue5mlMwFvEWeCVsM/Qe6lFzy.v3JVnc3G', 'true', 'true');

--email = feodor.janikic@email.com password = 7228
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Feodor', 'Janikić', 'feodor.janikic@email.com', '$2b$12$tTrshN.tz.f0OGcx7wEhEeQiXB9FlzdmvTIihWbg6R/8UF6Vqwizq', 'true', 'true');

--email = ignjatije.pleskic@email.com password = 3063
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Ignjatije', 'Pleskić', 'ignjatije.pleskic@email.com', '$2b$12$Q8NoHGNNUhVQE6hxVf7Sve3kxWlxwndQL9pwEHJOG43LnFN0Vf2iS', 'true', 'true');

--email = slavisa.frusic@email.com password = 3918
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Slaviša', 'Frušić', 'slavisa.frusic@email.com', '$2b$12$IvQEIMT7KN6m9dJYTqdfkeng2hLxrqZvernoUagagA/izUDj65DI6', 'true', 'true');

--email = djurdja.bjelogrlic@email.com password = 7078
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Đurđa', 'Bjelogrlić', 'djurdja.bjelogrlic@email.com', '$2b$12$Shg1LHsfsZLZhJOQBB3dXuMLCxCeaOEcXzo.sL6OFgxgHS3M0o6xe', 'true', 'true');

--email = milica.kolicic@email.com password = 4162
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Milica', 'Količić', 'milica.kolicic@email.com', '$2b$12$dRqYLJ2Vj3.P.8rf/d8exeyBTAi6XJ1WXDhBCi3fuwHEVVqVg4Jhy', 'true', 'true');

--email = viseslav.visic@email.com password = 4024
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Višeslav', 'Višić', 'viseslav.visic@email.com', '$2b$12$lJawXPbEw/MwXJD76wAIgeQfrdTdJJM8L8Gry4Ts2luFlO9BECfUa', 'true', 'true');

--email = vitomir.pajkic@email.com password = 7987
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Vitomir', 'Pajkić', 'vitomir.pajkic@email.com', '$2b$12$sEsbmzTivsjWAac9Mz394ugg80FnJwpD644Zt75m.6sxK5Fo703bS', 'true', 'true');

--email = dragomir.bozikic@email.com password = 3704
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Dragomir', 'Božikić', 'dragomir.bozikic@email.com', '$2b$12$5PZsYDWegbHMgD0L8tn3cORYBHRS3vyXoNo4.bfKD88XFEzbNzezq', 'true', 'true');

--email = sajka.djurbabic@email.com password = 2803
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Sajka', 'Đurbabić', 'sajka.djurbabic@email.com', '$2b$12$SD.O0K39ZtyULoK80rBwZ.Lp05elIM9sUqlOun2XR1JikLfNERBPW', 'true', 'true');

--email = milorad.simisic@email.com password = 4704
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Milorad', 'Simišić', 'milorad.simisic@email.com', '$2b$12$0F.DqN6Evxk44bXdOwSi0uualjRQ/1iJE1Qvqva4U/TFeOBfzcIDK', 'true', 'true');

--email = negomir.despenic@email.com password = 9997
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Negomir', 'Despenić', 'negomir.despenic@email.com', '$2b$12$43nPLgNxHSbKKC7SgcCIXuxZ.n2MnR1GLAb0sSr44C55zjZB.op6W', 'true', 'true');

--email = kamenko.mladic@email.com password = 7803
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Kamenko', 'Mladić', 'kamenko.mladic@email.com', '$2b$12$4h.gmEbPlryelGZ842F1Jee2.J3iDfLTd.6FDBO7cBkCm6ZdkKUBO', 'true', 'true');

--email = blaginja.prsendic@email.com password = 4650
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Blaginja', 'Pršendić', 'blaginja.prsendic@email.com', '$2b$12$iZeuvjvGaPeic3IvLx3xTugSrVY1u34WKgrQ15IqEoibKLNz54mBS', 'true', 'true');

--email = nina.karatosic@email.com password = 4939
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Nina', 'Karatošić', 'nina.karatosic@email.com', '$2b$12$h/vdabXJHvn5WPBXWIefROLoJg6GbnmhF2yBK.F2.rmAHsdYiZ.Ja', 'true', 'true');

--email = vuksana.duletic@email.com password = 9072
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Vuksana', 'Duletić', 'vuksana.duletic@email.com', '$2b$12$ZkbnWNA2.N3LVtU9WUEuhObZrmw2x/S2huphgja1bk.eJZ99IBzN6', 'true', 'true');

--email = cubrilo.skrkic@email.com password = 1430
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Čubrilo', 'Škrkić', 'cubrilo.skrkic@email.com', '$2b$12$Pbr.gTGmo797nofKdTBkz.3llUk3tCL98jFHadZy5xJ2C56yDy0fW', 'true', 'true');

--email = miodrag.maslaric@email.com password = 4534
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Miodrag', 'Maslarić', 'miodrag.maslaric@email.com', '$2b$12$l.Ct/3tMwr4AhxjkK3c4Be4Iod7EB0RZcY4eOjtV5a4MWeinMRbIe', 'true', 'true');

--email = kasija.nevenkic@email.com password = 6479
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Kasija', 'Nevenkić', 'kasija.nevenkic@email.com', '$2b$12$1V./oEMRU.uAnUflNyCaOudJcqItMewixSGrnXOQP0t0wV41BvJJq', 'true', 'true');

--email = justin.hadzi@email.com password = 6554
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Justin', 'Hadži', 'justin.hadzi@email.com', '$2b$12$KVLCuBAIJIWdMxEmV3bCwu.JDLiAJBf1RIKtg5fmltZRcw4pNvqSi', 'true', 'true');

--email = grigorije.dovijanic@email.com password = 4931
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Grigorije', 'Dovijanić', 'grigorije.dovijanic@email.com', '$2b$12$7hcQVP.NQLT49KNNQbD3re7wXsSzWYkzUHRwyFAjkFUgUqlqsusGq', 'true', 'true');

--email = arsenije.takic@email.com password = 6338
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Arsenije', 'Takić', 'arsenije.takic@email.com', '$2b$12$BfbbrysQCecyGNLQUC3UBu/VVEjfJPjUZF3mJhw1TqFkUgrdTswfq', 'true', 'true');

--email = ljiljana.cvikic@email.com password = 6429
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Ljiljana', 'Cvikić', 'ljiljana.cvikic@email.com', '$2b$12$/5rUZmaRv/LqJKV4AbyNieBsu8PZIRGKdUlxyiCcRJ19rlQO0oEcK', 'true', 'true');

--email = bisenija.supic@email.com password = 9414
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Bisenija', 'Šupić', 'bisenija.supic@email.com', '$2b$12$eV6W0cfyb0/GfFIPRq6qtOQW0PEtl8PYW63d/CsYiILoKaejfbLXS', 'true', 'true');

--email = milija.zvizdic@email.com password = 5659
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Milija', 'Zvizdić', 'milija.zvizdic@email.com', '$2b$12$8R9A13XDzmN8CJEkOwQPyuKN8ZXO6H8gR8epGkoi/xJLVx.oHy4fS', 'true', 'true');

--email = lenka.skuletic@email.com password = 6332
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Lenka', 'Škuletić', 'lenka.skuletic@email.com', '$2b$12$b9qOc90zLny3imnsA50wr.FAaIk7bmy2wFGlvK81zLUI7/KB9DwJO', 'true', 'true');

--email = blagomir.surdic@email.com password = 4631
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Blagomir', 'Šurdić', 'blagomir.surdic@email.com', '$2b$12$H2ZatoVxOyi.46eiA/.ddO1B8MKNlXk8kYOY0i/jqGg8MEu5U8o5G', 'true', 'true');

--email = hristina.brdaric@email.com password = 3736
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Hristina', 'Brdarić', 'hristina.brdaric@email.com', '$2b$12$ICj8OB3kCu.QtiM3hYATVukWg/RND9Nm7TJwwzO.1BhWR0hudQxxC', 'true', 'true');

--email = petar.lemajic@email.com password = 5357
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Petar', 'Lemajić', 'petar.lemajic@email.com', '$2b$12$FQ85XkT6jM4iW3zcSZXf.u64S91zD7aWmcIPiJJmUty7OO7jSSG4u', 'true', 'true');

--email = lepoje.milosavic@email.com password = 9092
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Lepoje', 'Milosavić', 'lepoje.milosavic@email.com', '$2b$12$4pW4Tc6IFnWdmcXTEpSRrOceAf4vZbuptUEuWXqJGGUCMQEWdqVya', 'true', 'true');

--email = momir.trninic@email.com password = 1847
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Momir', 'Trninić', 'momir.trninic@email.com', '$2b$12$cSD8S.9P/R7Hy98P4T5RLeg./833HvpxgBwxmk7aZD4EoDNSF89i.', 'true', 'true');

--email = elena.golemic@email.com password = 9850
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Elena', 'Golemić', 'elena.golemic@email.com', '$2b$12$EUOJW3Qo8X4tK9L8r9akruyah882UNWiR9Tk/v995uZ2QQpo6p37q', 'true', 'true');

--email = ratimir.nakalamic@email.com password = 3671
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Ratimir', 'Nakalamić', 'ratimir.nakalamic@email.com', '$2b$12$e8CZBDEPWUsirC6618QElOScicaNAbhMwgfzMqT1ix8GxzWhrWl6C', 'true', 'true');

--email = rajko.djuretic@email.com password = 5794
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Rajko', 'Đuretić', 'rajko.djuretic@email.com', '$2b$12$QVIbuIdWp.OCPMJQwWj6RuMDznnMhIgu4810HfXfwnJJSQH4Sx482', 'true', 'true');

--email = slavka.okolic@email.com password = 6943
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Slavka', 'Okolić', 'slavka.okolic@email.com', '$2b$12$WPIfZZgSQlzKgK/XmePQoedMhJFc2WGqgrBMptTbT0aqhWz9LSvw2', 'true', 'true');

--email = randja.lepetic@email.com password = 2091
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Ranđa', 'Lepetić', 'randja.lepetic@email.com', '$2b$12$Ltzm/wAxwJYFibEViHEfh.ocCdx4WBlMOcD30yKgtM3dr0u3hZTPC', 'true', 'true');

--email = cedomir.sikanic@email.com password = 9883
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Čedomir', 'Šikanić', 'cedomir.sikanic@email.com', '$2b$12$gAWu0Rh9zdmi/i6rgnIJWunLbcOIZtQWA70DVJZXt5G35/p6Q4S9u', 'true', 'true');

--email = stojanka.vladicic@email.com password = 5509
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Stojanka', 'Vladičić', 'stojanka.vladicic@email.com', '$2b$12$84uXCYI1iOct5uQbroxysuXobDPPQh7igptgaUxdF.OrujeOYg6O2', 'true', 'true');

--email = vukosav.dunjic@email.com password = 1553
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Vukosav', 'Dunjić', 'vukosav.dunjic@email.com', '$2b$12$Y3EfquHgTmaZK1t6VyMjQOoR0gZU//iRB6h4ZZHSdlsPy9dJBBsSm', 'true', 'true');

--email = selena.knezic@email.com password = 4832
insert into users (type, name, surname, email, password, is_active, activated) values ('AuthenticatedUser', 'Selena', 'Knežić', 'selena.knezic@email.com', '$2b$12$u6A8Yz2q746dtbdNkt2If.zcer2wmSL89bSEGkEn3GJ9xzPWYyA4.', 'true', 'true');

