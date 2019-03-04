/*
-- Query: SELECT * FROM webbanhang.user_role
LIMIT 0, 1000

-- Date: 2019-02-25 20:50
*/
INSERT INTO webbanhang.user_role (user_role_id,user_role_name) VALUES (1,'admin');
INSERT INTO webbanhang.user_role (user_role_id,user_role_name) VALUES (2,'user');


/*
-- Query: SELECT * FROM webbanhang.user
LIMIT 0, 1000

-- Date: 2019-02-25 20:51
*/
INSERT INTO webbanhang.user (user_id,username,password,email,user_role_user_role_id,address,phone) VALUES ('defe4bf4-38cc-11e9-97d5-20474704b06e','admin1','123456','admin1@gmail.com',1,'aaaaa','091234567');
INSERT INTO webbanhang.user (user_id,username,password,email,user_role_user_role_id,address,phone) VALUES ('defeae12-38cc-11e9-97d5-20474704b06e','admin2','123456','admin2@gmail.com',1,'asdf','09111111');
INSERT INTO webbanhang.user (user_id,username,password,email,user_role_user_role_id,address,phone) VALUES ('defec356-38cc-11e9-97d5-20474704b06e','user1','123456','user1@gmail.com',2,'lololo','09123456');


/*
-- Query: SELECT * FROM webbanhang.product_material
LIMIT 0, 1000

-- Date: 2019-02-25 20:52
*/
INSERT INTO webbanhang.product_material (product_material_id,product_material_name) VALUES (1,'oak');
INSERT INTO webbanhang.product_material (product_material_id,product_material_name) VALUES (2,'not oak');


/*
-- Query: SELECT * FROM webbanhang.product_origin
LIMIT 0, 1000

-- Date: 2019-02-25 20:52
*/
INSERT INTO webbanhang.product_origin (product_origin_id,product_origin_name) VALUES (1,'us');
INSERT INTO webbanhang.product_origin (product_origin_id,product_origin_name) VALUES (2,'china');
INSERT INTO webbanhang.product_origin (product_origin_id,product_origin_name) VALUES (3,'vn');


/*
-- Query: SELECT * FROM webbanhang.product_type
LIMIT 0, 1000

-- Date: 2019-02-25 20:53
*/
INSERT INTO webbanhang.product_type (product_type_id,product_type_name) VALUES (1,'chair');
INSERT INTO webbanhang.product_type (product_type_id,product_type_name) VALUES (2,'table');
INSERT INTO webbanhang.product_type (product_type_id,product_type_name) VALUES (3,'stairs');


/*
-- Query: SELECT * FROM webbanhang.product
LIMIT 0, 1000

-- Date: 2019-02-25 20:53
*/
INSERT INTO webbanhang.product (product_id,product_name,product_type_product_type_id,product_material_product_material_id,product_origin_product_origin_id, shortname,thumbnail,description,quantity,price) VALUES ('bc412cf0-3902-11e9-abcb-20474704b06e','Ambipur Air Freshener - 275 g',1,1,1,'Ambipur Air Freshener','m2.jpg','<p> <i class=\"fa fa-hand-o-right\" aria-hidden=\"true\"></i>Pantry Cashback Offer</p> <ul> <li> Doesn\'t just cover, Truly removes odours </li> <li> Ambi Pur is a brand of air freshener products available in the United States, Europe, Asia and Oceania. </li> <li> Their range of products may be used in the home or in the car with a variety of smells and properties such as odor neutralisation. </li> <li> Transforms your home from smelly to smiley </li> </ul> <p> <i class=\"fa fa-refresh\" aria-hidden=\"true\"></i>All food products are <label>returnable.</label> </p>',1000,299.99);
INSERT INTO webbanhang.product (product_id,product_name,product_type_product_type_id,product_material_product_material_id,product_origin_product_origin_id, shortname,thumbnail,description,quantity,price) VALUES ('bc423157-3902-11e9-abcb-20474704b06e','Zeeba Premium Basmati Rice - 5 KG',1,1,1,'Zeeba Premium Basmati Rice','k1.jpg','<p> <i class=\"fa fa-hand-o-right\" aria-hidden=\"true\"></i>This is a <label>Vegetarian</label> product.</p> <ul> <li> Best for Biryani and Pulao. </li> <li> After cooking, Zeeba Basmati rice grains attain an extra ordinary length of upto 2.4 cm/~1 inch. </li> <li> Zeeba Basmati rice adheres to the highest food afety standards as your health is paramount to us. </li> <li> Contains only the best and purest grade of basmati rice grain of Export quality. </li> </ul> <p> <i class=\"fa fa-refresh\" aria-hidden=\"true\"></i>All food products are <label>non-returnable.</label> </p>',1000,1299.99);


/*
-- Query: SELECT * FROM webbanhang.product_img
LIMIT 0, 1000

-- Date: 2019-02-25 20:53
*/
INSERT INTO webbanhang.product_img (product_product_id,img_name) VALUES ('bc412cf0-3902-11e9-abcb-20474704b06e','se1.jpg');
INSERT INTO webbanhang.product_img (product_product_id,img_name) VALUES ('bc412cf0-3902-11e9-abcb-20474704b06e','se2.jpg');
INSERT INTO webbanhang.product_img (product_product_id,img_name) VALUES ('bc412cf0-3902-11e9-abcb-20474704b06e','se3.jpg');
INSERT INTO webbanhang.product_img (product_product_id,img_name) VALUES ('bc423157-3902-11e9-abcb-20474704b06e','si.jpg');
INSERT INTO webbanhang.product_img (product_product_id,img_name) VALUES ('bc423157-3902-11e9-abcb-20474704b06e','si2.jpg');
INSERT INTO webbanhang.product_img (product_product_id,img_name) VALUES ('bc423157-3902-11e9-abcb-20474704b06e','si3.jpg');
