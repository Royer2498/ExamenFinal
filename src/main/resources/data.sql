delete from comment;
delete from restaurant_category;
delete from user_like;
delete from restaurant;
delete from category;
delete from user;
delete from city;
delete from level_restaurant;

insert into Category(id,name) values(1,'Familiar');
insert into Category(id,name) values(2,'Bar');
insert into Category(id,name) values(3,'Buffet');
insert into Category(id,name) values(4,'Comida rapida');

insert into city(id,name) values(1,'Cochabamba');
insert into city(id,name) values(2,'Santa Cruz');
insert into city(id,name) values(3,'Pando');
insert into city(id,name) values(4,'Beni');
insert into city(id,name) values(5,'Chuquisaca');
insert into city(id,name) values(6,'Tarija');
insert into city(id,name) values(7,'Oruro');
insert into city(id,name) values(8,'Potosi');
insert into city(id,name) values(9,'Sucre');


insert into level_restaurant(id,name,rating) values(1,'Impopular',1);
insert into level_restaurant(id,name,rating) values(2,'Poco Popular',2);
insert into level_restaurant(id,name,rating) values(3,'Intermedio',3);
insert into level_restaurant(id,name,rating) values(4,'Popular',4);
insert into level_restaurant(id,name,rating) values(5,'Muy Popular',5);

insert into Restaurant(id,description,latitude,likes,longitude,name,city_id,level_restaurant_id) values(1,'Bonito lugar, con un ambiente bastante relajado',-17.385822,0,-66.151074,'ChillBar',1,3);
insert into Restaurant(id,description,latitude,likes,longitude,name,city_id,level_restaurant_id) values(2,'Hermoso restaurante, con todas las comodidades que el cliente necesita para probar la mejor comida del pais',-17.782898,0,-63.177353,'Cambinga',2,2);
insert into Restaurant(id,description,latitude,likes,longitude,name,city_id,level_restaurant_id) values(3,'Excelente restaurante con vistas al rio',-11.104799,0,-67.553445,'Pando',3,1);
insert into Restaurant(id,description,latitude,likes,longitude,name,city_id,level_restaurant_id) values(4,'El mejor restaurante de toda Tarija',-21.531609,0,-64.739764,'Tarijenta',6,4);
insert into Restaurant(id,description,latitude,likes,longitude,name,city_id,level_restaurant_id) values(5,'El mejor lugar para que tu y tu paladar puedan disfrutar de Chuquisaca',-19.351747,0,-64.477114,'Chuquisacon',5,5);
insert into Restaurant(id,description,latitude,likes,longitude,name,city_id,level_restaurant_id) values(6,'Bonito restaurante con todas las comodidades',-17.968924,0,-67.106445,'La Orurenia',7,2);
insert into Restaurant(id,description,latitude,likes,longitude,name,city_id,level_restaurant_id) values(7,'Hermoso restaurante con gran variedad de comida',-14.830854,0,-64.904666,'Beniano',4,3);
insert into Restaurant(id,description,latitude,likes,longitude,name,city_id,level_restaurant_id) values(8,'El mejor restaurante de la ciudad de la capital de Bolivia',-19.018268,0,-65.263559,'Sucremanta',9,5);
insert into Restaurant(id,description,latitude,likes,longitude,name,city_id,level_restaurant_id) values(9,'Restaurante agradable con buena musica y buena comida',-19.558913,0,-65.761375,'Potosina',8,5);
insert into Restaurant(id,description,latitude,likes,longitude,name,city_id,level_restaurant_id) values(10,'Restarante con gran variedad de comida cochala',-17.389631,0, -66.143657,'Cochalita',1,2);
insert into Restaurant(id,description,latitude,likes,longitude,name,city_id,level_restaurant_id) values(11,'Restaurante donde predomina la mejor carne asada del pais',-17.375413,0,-66.153654,'Kansas',1,3);
insert into Restaurant(id,description,latitude,likes,longitude,name,city_id,level_restaurant_id) values(12,'El mejor lugar para compartir con quien mas quieres',-17.370659,0,-66.148369,'Cayena',1,4);
insert into Restaurant(id,description,latitude,likes,longitude,name,city_id,level_restaurant_id) values(13,'La mejor polleria del pais, ubicado en una de las mejores zonas de cochabamba',-17.378834,0,-66.159269,'Kingdom',1,3);
insert into Restaurant(id,description,latitude,likes,longitude,name,city_id,level_restaurant_id) values(14,'Restaurante para compartir con la familia',-17.376768,0,-66.156887,'Globos',1,1);

insert into restaurant_category(restaurant_id,category_id) values(1,2);
insert into restaurant_category(restaurant_id,category_id) values(2,3);
insert into restaurant_category(restaurant_id,category_id) values(3,2);
insert into restaurant_category(restaurant_id,category_id) values(4,2);
insert into restaurant_category(restaurant_id,category_id) values(5,1);
insert into restaurant_category(restaurant_id,category_id) values(6,2);
insert into restaurant_category(restaurant_id,category_id) values(7,3);
insert into restaurant_category(restaurant_id,category_id) values(8,4);
insert into restaurant_category(restaurant_id,category_id) values(9,4);
insert into restaurant_category(restaurant_id,category_id) values(10,2);
insert into restaurant_category(restaurant_id,category_id) values(11,1);
insert into restaurant_category(restaurant_id,category_id) values(12,1);
insert into restaurant_category(restaurant_id,category_id) values(13,1);
insert into restaurant_category(restaurant_id,category_id) values(14,1);

--User1 (ADMIN): jose Password: jose
insert into user(id,email,first_name,last_name,password,password_confirm,role,username,city_id) values (1,'josesito_342@gmail.com','Jose','Camacho Torres','$2a$10$E3mPpXqUnA5R9G4eFlpXgOx4vUobLl5c8TN1m0g5LBapxFmy51VyK','$2a$10$E3mPpXqUnA5R9G4eFlpXgOx4vUobLl5c8TN1m0g5LBapxFmy51VyK','ADMIN','jose',1);
--User2 (USER): pedro Password: pedro
insert into user(id,email,first_name,last_name,password,password_confirm,role,username,city_id) values (2,'pedro_gonzales09@hotmail.com','Pedro','Gonzales Galarza','$2a$10$OlC5.NndbrT4mY8V9L/BgOufzU3E9fomAEjaG5KCLephdCdrMqUbi','$2a$10$OlC5.NndbrT4mY8V9L/BgOufzU3E9fomAEjaG5KCLephdCdrMqUbi','user','pedro',2);
--User3 (USER): mario Password: mario
insert into user(id,email,first_name,last_name,password,password_confirm,role,username,city_id) values (3,'mario_bros24@hotmail.com','Mario','Meneces Fernandez','$2a$10$9gLFsGHRKJOFfYPRVgsJbePPSlmtiROK13yQzDrWZ3Vy78cRpPFh6','$2a$10$9gLFsGHRKJOFfYPRVgsJbePPSlmtiROK13yQzDrWZ3Vy78cRpPFh6','user','mario',3);
--User4 (USER): antonio Password: antonio
insert into user(id,email,first_name,last_name,password,password_confirm,role,username,city_id) values (4,'antonio_23123@hotmail.com','Antonio','Zambrana Hinojosa','$2a$10$YKbkG0iIZYl.6qtwBrPPB.MBqJEwcEKfawpjQ5WfGjBVetz7bnfKe','$2a$10$YKbkG0iIZYl.6qtwBrPPB.MBqJEwcEKfawpjQ5WfGjBVetz7bnfKe','user','antonio',4);
--User5 (USER): laura Password: laura
insert into user(id,email,first_name,last_name,password,password_confirm,role,username,city_id) values (5,'laura_mejia21@hotmail.com','Laura','Mejia Gutierrez','$2a$10$ZkJMSOxJqzfWA36Dco18nOQwgXqn/bOrRqebnEBhICwOSkUEm2FU2','$2a$10$ZkJMSOxJqzfWA36Dco18nOQwgXqn/bOrRqebnEBhICwOSkUEm2FU2','user','laura',1);

insert into user_like(id,restaurant_id,user_id) values (1,1,3);
insert into user_like(id,restaurant_id,user_id) values (2,11,3);
insert into user_like(id,restaurant_id,user_id) values (3,12,3);
insert into user_like(id,restaurant_id,user_id) values (4,13,3);
insert into user_like(id,restaurant_id,user_id) values (5,14,3);
insert into user_like(id,restaurant_id,user_id) values (6,6,3);
insert into user_like(id,restaurant_id,user_id) values (7,8,3);

insert into user_like(id,restaurant_id,user_id) values (8,1,4);
insert into user_like(id,restaurant_id,user_id) values (9,11,4);
insert into user_like(id,restaurant_id,user_id) values (10,12,4);
insert into user_like(id,restaurant_id,user_id) values (11,13,4);
insert into user_like(id,restaurant_id,user_id) values (12,14,4);
insert into user_like(id,restaurant_id,user_id) values (13,6,4);
insert into user_like(id,restaurant_id,user_id) values (14,8,4);
insert into user_like(id,restaurant_id,user_id) values (15,2,4);
insert into user_like(id,restaurant_id,user_id) values (16,3,4);

insert into user_like(id,restaurant_id,user_id) values (17,1,5);
insert into user_like(id,restaurant_id,user_id) values (18,11,5);
insert into user_like(id,restaurant_id,user_id) values (19,12,5);
insert into user_like(id,restaurant_id,user_id) values (20,13,5);
insert into user_like(id,restaurant_id,user_id) values (21,14,5);
insert into user_like(id,restaurant_id,user_id) values (22,6,5);
insert into user_like(id,restaurant_id,user_id) values (23,8,5);
insert into user_like(id,restaurant_id,user_id) values (24,2,5);
insert into user_like(id,restaurant_id,user_id) values (25,3,5);

insert into user_like(id,restaurant_id,user_id) values (26,1,2);
insert into user_like(id,restaurant_id,user_id) values (27,11,2);
insert into user_like(id,restaurant_id,user_id) values (28,12,2);
insert into user_like(id,restaurant_id,user_id) values (29,13,2);
insert into user_like(id,restaurant_id,user_id) values (30,14,2);
insert into user_like(id,restaurant_id,user_id) values (31,6,2);
insert into user_like(id,restaurant_id,user_id) values (32,8,2);
insert into user_like(id,restaurant_id,user_id) values (33,2,2);
insert into user_like(id,restaurant_id,user_id) values (34,3,2);
insert into user_like(id,restaurant_id,user_id) values (35,10,2);
insert into user_like(id,restaurant_id,user_id) values (36,9,2);

insert into comment(id,likes,score,text,restaurant_id,user_id) values(1,0,4,'Me parecio un muy buen lugar para compartir con la familia. Definitivamente me fui muy satisfecho.',1,2);
insert into comment(id,likes,score,text,restaurant_id,user_id) values(2,0,2,'No me quedo muy contento, pues la atencion me parecio muy penosa. No obstante, la comida me parecio excelente.',13,2);
insert into comment(id,likes,score,text,restaurant_id,user_id) values(3,0,1,'No me gusto para nada este lugar. La atencion fue pesima. El chef malisimo. Muy mal.',14,2);
insert into comment(id,likes,score,text,restaurant_id,user_id) values(4,0,3,'Muy bonito el lugar.',10,2);
insert into comment(id,likes,score,text,restaurant_id,user_id) values(5,0,3,'Que gran comida me sirvieron en este lugar. Si no fuera por la grosera camarera que me atendio le pondria un 5.',8,2);

insert into comment(id,likes,score,text,restaurant_id,user_id) values(6,0,4,'Simplemente una genialidad!',1,3);
insert into comment(id,likes,score,text,restaurant_id,user_id) values(7,0,4,'Un lugar bastante agradable. Se lo recomiendo a quienes deseen pasar un buen rato con su pareja.',13,3);
insert into comment(id,likes,score,text,restaurant_id,user_id) values(8,0,1,'Pesimo lugar. Mi plato estaba terriblemente mal servido, sin contar el largo tiempo que me hicieron esperar. No se lo recomiendo a nadie. Espero que mejoren y que puedan solucionar estos porblemas.',14,3);
insert into comment(id,likes,score,text,restaurant_id,user_id) values(9,0,2,'Muy bonito el lugar, la comida y el personal. Sin embargo, el precio de sus platos es exageradamente elevado. Deberian pensar en economizar estos platos si quieren que los clientes no no asustemos',11,3);

insert into comment(id,likes,score,text,restaurant_id,user_id) values(10,0,1,'Realmente, que lugar mas desagradable.',1,4);
insert into comment(id,likes,score,text,restaurant_id,user_id) values(11,0,1,'La comida en este lugar es demasiado cara. Tampoco ofrece servicio de parqueo a sus clientes!!',10,4);
insert into comment(id,likes,score,text,restaurant_id,user_id) values(12,0,1,'PESIMO lugar. Espero mejoren.',11,4);

insert into comment(id,likes,score,text,restaurant_id,user_id) values(13,0,2,'No me gusto mucho el hecho de que solamente pongan musicas rancheras. Me gustaria que pongan todo tipo de generos musicales',4,5);
insert into comment(id,likes,score,text,restaurant_id,user_id) values(14,0,3,'Me encanto su comida, muy deliciosa la verdad. No obstante, espere demasiado por mi hamburguesa y eso deberia cambiar.',5,5);
insert into comment(id,likes,score,text,restaurant_id,user_id) values(15,0,1,'Mi comida me llego muy fria, parece como si no fuera del dia.',7,5);
insert into comment(id,likes,score,text,restaurant_id,user_id) values(16,0,4,'Que buen restaurante!, realmente me encanto. Buena musica, buena atencion y sobre todo una comida muy deliciosa. Nada mas esperaria que implementen servicio de parqueo.',12,5);
insert into comment(id,likes,score,text,restaurant_id,user_id) values(17,0,4,'Quede encantadisimo con el lugar, se ve que invirtieron bastante. La comida me gusto tambien. Lo unico que me molesto fue tener que pedir mi comida en caja. Es mucho mas comodo pedirla desde la mesa a traves de un menu.',3,5);

