insert into users (type, name, surname, email, password) values ('AuthenticatedUser',
        'Ksenija', 'Prcic', 'neki_email', 'neki_password');

insert into cultural_category (name) values ('Institucija');

insert into category_type (name, category_id) values ('Biblioteka', 1);

insert into cultural_site (name, lat, lng, address, city, description, rating, type_id, category_id)
values ('Biblioteka šabačka', 44.7556269,19.6923025, 'Masarikova 18', 'Šabac',
'Библиотека шабачка је матична установа за све библиотеке на подручју осам општина Мачванског округа.', 4.5,1,1);

insert into cultural_site (name, lat, lng, address, city, description, rating, type_id, category_id)
values ('Novi Sad breee', 44.7556269,19.6923025, 'Masarikova 18', 'Šabac',
'Библиотека шабачка је матична установа за све библиотеке на подручју осам општина Мачванског округа.', 4.5,1,1);

insert into comment (text, approved, user_id, site_id)
            values ('Bas je super biblioteka', false, 1, 1);

insert into comment (text, approved, user_id, site_id)
            values ('Sranje breee', true, 1, 2);