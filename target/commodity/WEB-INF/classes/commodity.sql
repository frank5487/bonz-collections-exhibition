/*========================================*/
/* DMBS name:  MySQL 8.0.28               */
/* Created on: 3/20/2022                  */
/*========================================*/

set names utf8;

drop table if exists tab_user;
drop table if exists tab_category;
drop table if exists tab_favorite;
drop table if exists tab_commodity;
drop table if exists tab_commodity_img;
drop table if exists tab_seller;

/*========================================*/
/* Table: tab_user                        */
/*========================================*/

create table tab_user(
    uid int not null auto_increment,
    username varchar(50) not null,
    password varchar(32) not null,
    name varchar(100),
    birthday date,
    sex varchar(10),
    telephone varchar(20),
    email varchar(50),
    status char(1),
    code varchar(50),

    primary key (uid),
    constraint uq_username unique(username),
    constraint uq_code unique(code)
);

/*========================================*/
/* Table: tab_category                    */
/*========================================*/
create table tab_category(
                             cid int not null auto_increment,
                             cname varchar(50) not null,
                             primary key (cid),
                             constraint uq_cname unique(cname)
);

/*========================================*/
/* Table: tab_favorite                    */
/*========================================*/
create table tab_favorite(
                             mid int not null,
                             date date not null,
                             uid int not null,
                             primary key (mid, uid)
);

/*========================================*/
/* Table: tab_commodity                   */
/*========================================*/
create table tab_commodity(
                              mid int not null auto_increment,
                              mname varchar(70) not null,
                              price double not null,
                              commodityIntroduce varchar(200),
                              mdate date,
                              count int default 0,
                              cid int not null,
                              mimage varchar(100),
                              sid int,
                              primary key (mid)
);

/*========================================*/
/* Table: tab_commodity_img               */
/*========================================*/
create table tab_commodity_img(
                                  mgid int not null auto_increment,
                                  mid int not null,
                                  bigPic varchar(100) not null,
                                  smallPic varchar(100) not null,
                                  primary key (mgid)
);

/*========================================*/
/* Table: tab_seller                      */
/*========================================*/
create table tab_seller(
                           sid int not null auto_increment,
                           sname varchar(50) not null,
                           contactphone varchar(20) not null,
                           address varchar(100),
                           primary key (sid),
                           constraint uq_sname unique (sname)
);


alter table tab_favorite add constraint fk_commodity_favorite
    foreign key (mid) references tab_commodity(mid) on delete restrict on update restrict;

alter table tab_favorite add constraint fk_user_favorite
    foreign key (uid) references tab_user(uid) on delete restrict on update restrict;

alter table tab_commodity add constraint fk_category_commodity
    foreign key (cid) references tab_category(cid) on delete restrict on update restrict;

alter table tab_commodity add constraint fk_seller_commodity
    foreign key (sid) references tab_seller(sid) on delete restrict on update restrict;

alter table tab_commodity_img add constraint fk_commodity_commodityimg
    foreign key (mid) references tab_commodity(mid) on delete restrict on update restrict;

insert into tab_category values(1, "NFT"),(2, "Car"),(3, "Shoes");
insert into tab_seller values(1, "projectE", "0900123456", "MetaUniverse"),(2, "Audi", "22255889", "Future"),(3, "Nike", "123456789", "Factory");

/* data for tab_commodity*/
insert into tab_commodity(mid, mname, price, commodityIntroduce, mdate, count, cid, mimage, sid) values(null, "Smoking Virtual Man", 0.99, "This is an example of showing how to present the picture in the website.", "2022-03-23", 0, 1, "img/display/NFT/NFT_1.jpg", 1), (null, "Monkey With Colorful Hat", 0.88, "More detail on this NFT_2...", "2022-03-23", 0, 1, "img/display/NFT/NFT_2.jpg", 1), (null, "Iron Monkey!", 0.92, "More detail on NFT_3...", "2022-03-23", 0, 1, "img/display/NFT/NFT_3.jpg", 1),(null, "Rich Monkey!", 0.72, "More detail on NFT_4...", "2022-03-23", 0, 1, "img/display/NFT/NFT_4.jpg", 1),(null, "Cloud Boy Laughing", 0.66, "More detail on NFT_5...", "2022-03-23", 0, 1, "img/display/NFT/NFT_5.jpg", 1),(null, "DJ Got the beat!", 0.80, "More detail on NFT_6...", "2022-03-23", 0, 1, "img/display/NFT/NFT_6.jpg", 1),
                                                                                                       (null, "Smoking Virtual Man", 0.99, "This is an example of showing how to present the picture in the website.", "2022-03-23", 0, 1, "img/display/NFT/NFT_1.jpg", 1), (null, "Monkey With Colorful Hat", 0.88, "More detail on this NFT_2...", "2022-03-23", 0, 1, "img/display/NFT/NFT_2.jpg", 1), (null, "Iron Monkey!", 0.92, "More detail on NFT_3...", "2022-03-23", 0, 1, "img/display/NFT/NFT_3.jpg", 1),(null, "Rich Monkey!", 0.72, "More detail on NFT_4...", "2022-03-23", 0, 1, "img/display/NFT/NFT_4.jpg", 1),(null, "Cloud Boy Laughing", 0.66, "More detail on NFT_5...", "2022-03-23", 0, 1, "img/display/NFT/NFT_5.jpg", 1),(null, "DJ Got the beat!", 0.80, "More detail on NFT_6...", "2022-03-23", 0, 1, "img/display/NFT/NFT_6.jpg", 1),
                                                                                                       (null, "Smoking Virtual Man", 0.99, "This is an example of showing how to present the picture in the website.", "2022-03-23", 0, 1, "img/display/NFT/NFT_1.jpg", 1), (null, "Monkey With Colorful Hat", 0.88, "More detail on this NFT_2...", "2022-03-23", 0, 1, "img/display/NFT/NFT_2.jpg", 1), (null, "Iron Monkey!", 0.92, "More detail on NFT_3...", "2022-03-23", 0, 1, "img/display/NFT/NFT_3.jpg", 1),(null, "Rich Monkey!", 0.72, "More detail on NFT_4...", "2022-03-23", 0, 1, "img/display/NFT/NFT_4.jpg", 1),(null, "Cloud Boy Laughing", 0.66, "More detail on NFT_5...", "2022-03-23", 0, 1, "img/display/NFT/NFT_5.jpg", 1),(null, "DJ Got the beat!", 0.80, "More detail on NFT_6...", "2022-03-23", 0, 1, "img/display/NFT/NFT_6.jpg", 1),
                                                                                                       (null, "Smoking Virtual Man", 0.99, "This is an example of showing how to present the picture in the website.", "2022-03-23", 0, 1, "img/display/NFT/NFT_1.jpg", 1), (null, "Monkey With Colorful Hat", 0.88, "More detail on this NFT_2...", "2022-03-23", 0, 1, "img/display/NFT/NFT_2.jpg", 1), (null, "Iron Monkey!", 0.92, "More detail on NFT_3...", "2022-03-23", 0, 1, "img/display/NFT/NFT_3.jpg", 1),(null, "Rich Monkey!", 0.72, "More detail on NFT_4...", "2022-03-23", 0, 1, "img/display/NFT/NFT_4.jpg", 1),(null, "Cloud Boy Laughing", 0.66, "More detail on NFT_5...", "2022-03-23", 0, 1, "img/display/NFT/NFT_5.jpg", 1),(null, "DJ Got the beat!", 0.80, "More detail on NFT_6...", "2022-03-23", 0, 1, "img/display/NFT/NFT_6.jpg", 1),
                                                                                                       (null, "Smoking Virtual Man", 0.99, "This is an example of showing how to present the picture in the website.", "2022-03-23", 0, 1, "img/display/NFT/NFT_1.jpg", 1), (null, "Monkey With Colorful Hat", 0.88, "More detail on this NFT_2...", "2022-03-23", 0, 1, "img/display/NFT/NFT_2.jpg", 1), (null, "Iron Monkey!", 0.92, "More detail on NFT_3...", "2022-03-23", 0, 1, "img/display/NFT/NFT_3.jpg", 1),(null, "Rich Monkey!", 0.72, "More detail on NFT_4...", "2022-03-23", 0, 1, "img/display/NFT/NFT_4.jpg", 1),(null, "Cloud Boy Laughing", 0.66, "More detail on NFT_5...", "2022-03-23", 0, 1, "img/display/NFT/NFT_5.jpg", 1),(null, "DJ Got the beat!", 0.80, "More detail on NFT_6...", "2022-03-23", 0, 1, "img/display/NFT/NFT_6.jpg", 1),
                                                                                                       (null, "Smoking Virtual Man", 0.99, "This is an example of showing how to present the picture in the website.", "2022-03-23", 0, 1, "img/display/NFT/NFT_1.jpg", 1), (null, "Monkey With Colorful Hat", 0.88, "More detail on this NFT_2...", "2022-03-23", 0, 1, "img/display/NFT/NFT_2.jpg", 1), (null, "Iron Monkey!", 0.92, "More detail on NFT_3...", "2022-03-23", 0, 1, "img/display/NFT/NFT_3.jpg", 1),(null, "Rich Monkey!", 0.72, "More detail on NFT_4...", "2022-03-23", 0, 1, "img/display/NFT/NFT_4.jpg", 1),(null, "Cloud Boy Laughing", 0.66, "More detail on NFT_5...", "2022-03-23", 0, 1, "img/display/NFT/NFT_5.jpg", 1),(null, "DJ Got the beat!", 0.80, "More detail on NFT_6...", "2022-03-23", 0, 1, "img/display/NFT/NFT_6.jpg", 1),
                                                                                                       (null, "Smoking Virtual Man", 0.99, "This is an example of showing how to present the picture in the website.", "2022-03-23", 0, 1, "img/display/NFT/NFT_1.jpg", 1), (null, "Monkey With Colorful Hat", 0.88, "More detail on this NFT_2...", "2022-03-23", 0, 1, "img/display/NFT/NFT_2.jpg", 1), (null, "Iron Monkey!", 0.92, "More detail on NFT_3...", "2022-03-23", 0, 1, "img/display/NFT/NFT_3.jpg", 1),(null, "Rich Monkey!", 0.72, "More detail on NFT_4...", "2022-03-23", 0, 1, "img/display/NFT/NFT_4.jpg", 1),(null, "Cloud Boy Laughing", 0.66, "More detail on NFT_5...", "2022-03-23", 0, 1, "img/display/NFT/NFT_5.jpg", 1),(null, "DJ Got the beat!", 0.80, "More detail on NFT_6...", "2022-03-23", 0, 1, "img/display/NFT/NFT_6.jpg", 1),
                                                                                                       (null, "Smoking Virtual Man", 0.99, "This is an example of showing how to present the picture in the website.", "2022-03-23", 0, 1, "img/display/NFT/NFT_1.jpg", 1), (null, "Monkey With Colorful Hat", 0.88, "More detail on this NFT_2...", "2022-03-23", 0, 1, "img/display/NFT/NFT_2.jpg", 1), (null, "Iron Monkey!", 0.92, "More detail on NFT_3...", "2022-03-23", 0, 1, "img/display/NFT/NFT_3.jpg", 1),(null, "Rich Monkey!", 0.72, "More detail on NFT_4...", "2022-03-23", 0, 1, "img/display/NFT/NFT_4.jpg", 1),(null, "Cloud Boy Laughing", 0.66, "More detail on NFT_5...", "2022-03-23", 0, 1, "img/display/NFT/NFT_5.jpg", 1),(null, "DJ Got the beat!", 0.80, "More detail on NFT_6...", "2022-03-23", 0, 1, "img/display/NFT/NFT_6.jpg", 1),
                                                                                                       (null, "Smoking Virtual Man", 0.99, "This is an example of showing how to present the picture in the website.", "2022-03-23", 0, 1, "img/display/NFT/NFT_1.jpg", 1), (null, "Monkey With Colorful Hat", 0.88, "More detail on this NFT_2...", "2022-03-23", 0, 1, "img/display/NFT/NFT_2.jpg", 1), (null, "Iron Monkey!", 0.92, "More detail on NFT_3...", "2022-03-23", 0, 1, "img/display/NFT/NFT_3.jpg", 1),(null, "Rich Monkey!", 0.72, "More detail on NFT_4...", "2022-03-23", 0, 1, "img/display/NFT/NFT_4.jpg", 1),(null, "Cloud Boy Laughing", 0.66, "More detail on NFT_5...", "2022-03-23", 0, 1, "img/display/NFT/NFT_5.jpg", 1),(null, "DJ Got the beat!", 0.80, "More detail on NFT_6...", "2022-03-23", 0, 1, "img/display/NFT/NFT_6.jpg", 1),
                                                                                                       (null, "Smoking Virtual Man", 0.99, "This is an example of showing how to present the picture in the website.", "2022-03-23", 0, 1, "img/display/NFT/NFT_1.jpg", 1), (null, "Monkey With Colorful Hat", 0.88, "More detail on this NFT_2...", "2022-03-23", 0, 1, "img/display/NFT/NFT_2.jpg", 1), (null, "Iron Monkey!", 0.92, "More detail on NFT_3...", "2022-03-23", 0, 1, "img/display/NFT/NFT_3.jpg", 1),(null, "Rich Monkey!", 0.72, "More detail on NFT_4...", "2022-03-23", 0, 1, "img/display/NFT/NFT_4.jpg", 1),(null, "Cloud Boy Laughing", 0.66, "More detail on NFT_5...", "2022-03-23", 0, 1, "img/display/NFT/NFT_5.jpg", 1),(null, "DJ Got the beat!", 0.80, "More detail on NFT_6...", "2022-03-23", 0, 1, "img/display/NFT/NFT_6.jpg", 1),
                                                                                                       (null, "Smoking Virtual Man", 0.99, "This is an example of showing how to present the picture in the website.", "2022-03-23", 0, 1, "img/display/NFT/NFT_1.jpg", 1), (null, "Monkey With Colorful Hat", 0.88, "More detail on this NFT_2...", "2022-03-23", 0, 1, "img/display/NFT/NFT_2.jpg", 1), (null, "Iron Monkey!", 0.92, "More detail on NFT_3...", "2022-03-23", 0, 1, "img/display/NFT/NFT_3.jpg", 1),(null, "Rich Monkey!", 0.72, "More detail on NFT_4...", "2022-03-23", 0, 1, "img/display/NFT/NFT_4.jpg", 1),(null, "Cloud Boy Laughing", 0.66, "More detail on NFT_5...", "2022-03-23", 0, 1, "img/display/NFT/NFT_5.jpg", 1),(null, "DJ Got the beat!", 0.80, "More detail on NFT_6...", "2022-03-23", 0, 1, "img/display/NFT/NFT_6.jpg", 1),
                                                                                                       (null, "Smoking Virtual Man", 0.99, "This is an example of showing how to present the picture in the website.", "2022-03-23", 0, 1, "img/display/NFT/NFT_1.jpg", 1), (null, "Monkey With Colorful Hat", 0.88, "More detail on this NFT_2...", "2022-03-23", 0, 1, "img/display/NFT/NFT_2.jpg", 1), (null, "Iron Monkey!", 0.92, "More detail on NFT_3...", "2022-03-23", 0, 1, "img/display/NFT/NFT_3.jpg", 1),(null, "Rich Monkey!", 0.72, "More detail on NFT_4...", "2022-03-23", 0, 1, "img/display/NFT/NFT_4.jpg", 1),(null, "Cloud Boy Laughing", 0.66, "More detail on NFT_5...", "2022-03-23", 0, 1, "img/display/NFT/NFT_5.jpg", 1),(null, "DJ Got the beat!", 0.80, "More detail on NFT_6...", "2022-03-23", 0, 1, "img/display/NFT/NFT_6.jpg", 1),
                                                                                                       (null, "Smoking Virtual Man", 0.99, "This is an example of showing how to present the picture in the website.", "2022-03-23", 0, 1, "img/display/NFT/NFT_1.jpg", 1), (null, "Monkey With Colorful Hat", 0.88, "More detail on this NFT_2...", "2022-03-23", 0, 1, "img/display/NFT/NFT_2.jpg", 1), (null, "Iron Monkey!", 0.92, "More detail on NFT_3...", "2022-03-23", 0, 1, "img/display/NFT/NFT_3.jpg", 1),(null, "Rich Monkey!", 0.72, "More detail on NFT_4...", "2022-03-23", 0, 1, "img/display/NFT/NFT_4.jpg", 1),(null, "Cloud Boy Laughing", 0.66, "More detail on NFT_5...", "2022-03-23", 0, 1, "img/display/NFT/NFT_5.jpg", 1),(null, "DJ Got the beat!", 0.80, "More detail on NFT_6...", "2022-03-23", 0, 1, "img/display/NFT/NFT_6.jpg", 1),
                                                                                                       (null, "Smoking Virtual Man", 0.99, "This is an example of showing how to present the picture in the website.", "2022-03-23", 0, 1, "img/display/NFT/NFT_1.jpg", 1), (null, "Monkey With Colorful Hat", 0.88, "More detail on this NFT_2...", "2022-03-23", 0, 1, "img/display/NFT/NFT_2.jpg", 1), (null, "Iron Monkey!", 0.92, "More detail on NFT_3...", "2022-03-23", 0, 1, "img/display/NFT/NFT_3.jpg", 1),(null, "Rich Monkey!", 0.72, "More detail on NFT_4...", "2022-03-23", 0, 1, "img/display/NFT/NFT_4.jpg", 1),(null, "Cloud Boy Laughing", 0.66, "More detail on NFT_5...", "2022-03-23", 0, 1, "img/display/NFT/NFT_5.jpg", 1),(null, "DJ Got the beat!", 0.80, "More detail on NFT_6...", "2022-03-23", 0, 1, "img/display/NFT/NFT_6.jpg", 1),
                                                                                                       (null, "Smoking Virtual Man", 0.99, "This is an example of showing how to present the picture in the website.", "2022-03-23", 0, 1, "img/display/NFT/NFT_1.jpg", 1), (null, "Monkey With Colorful Hat", 0.88, "More detail on this NFT_2...", "2022-03-23", 0, 1, "img/display/NFT/NFT_2.jpg", 1), (null, "Iron Monkey!", 0.92, "More detail on NFT_3...", "2022-03-23", 0, 1, "img/display/NFT/NFT_3.jpg", 1),(null, "Rich Monkey!", 0.72, "More detail on NFT_4...", "2022-03-23", 0, 1, "img/display/NFT/NFT_4.jpg", 1),(null, "Cloud Boy Laughing", 0.66, "More detail on NFT_5...", "2022-03-23", 0, 1, "img/display/NFT/NFT_5.jpg", 1),(null, "DJ Got the beat!", 0.80, "More detail on NFT_6...", "2022-03-23", 0, 1, "img/display/NFT/NFT_6.jpg", 1),
                                                                                                       (null, "Red La Ferarri...", 50, "More detail on car_1...", "2022-03-23", 0, 2, "img/display/car/car_1.jpg", 2), (null, "Red Wine La Fa", 48, "More detail on car_2...", "2022-03-23", 0, 2, "img/display/car/car_2.jpg", 2),(null, "Yellow Lambo", 45, "More detail on car_3...", "2022-03-23", 0, 2, "img/display/car/car_3.jpg", 2),(null, "BigV", 49, "More detail on car_4...", "2022-03-23", 0, 2, "img/display/car/car_4.jpg", 2),
                                                                                                       (null, "Red La Ferarri...", 50, "More detail on car_1...", "2022-03-23", 0, 2, "img/display/car/car_1.jpg", 2), (null, "Red Wine La Fa", 48, "More detail on car_2...", "2022-03-23", 0, 2, "img/display/car/car_2.jpg", 2),(null, "Yellow Lambo", 45, "More detail on car_3...", "2022-03-23", 0, 2, "img/display/car/car_3.jpg", 2),(null, "BigV", 49, "More detail on car_4...", "2022-03-23", 0, 2, "img/display/car/car_4.jpg", 2),
                                                                                                       (null, "Red La Ferarri...", 50, "More detail on car_1...", "2022-03-23", 0, 2, "img/display/car/car_1.jpg", 2), (null, "Red Wine La Fa", 48, "More detail on car_2...", "2022-03-23", 0, 2, "img/display/car/car_2.jpg", 2),(null, "Yellow Lambo", 45, "More detail on car_3...", "2022-03-23", 0, 2, "img/display/car/car_3.jpg", 2),(null, "BigV", 49, "More detail on car_4...", "2022-03-23", 0, 2, "img/display/car/car_4.jpg", 2),
                                                                                                       (null, "Red La Ferarri...", 50, "More detail on car_1...", "2022-03-23", 0, 2, "img/display/car/car_1.jpg", 2), (null, "Red Wine La Fa", 48, "More detail on car_2...", "2022-03-23", 0, 2, "img/display/car/car_2.jpg", 2),(null, "Yellow Lambo", 45, "More detail on car_3...", "2022-03-23", 0, 2, "img/display/car/car_3.jpg", 2),(null, "BigV", 49, "More detail on car_4...", "2022-03-23", 0, 2, "img/display/car/car_4.jpg", 2),
                                                                                                       (null, "Red La Ferarri...", 50, "More detail on car_1...", "2022-03-23", 0, 2, "img/display/car/car_1.jpg", 2), (null, "Red Wine La Fa", 48, "More detail on car_2...", "2022-03-23", 0, 2, "img/display/car/car_2.jpg", 2),(null, "Yellow Lambo", 45, "More detail on car_3...", "2022-03-23", 0, 2, "img/display/car/car_3.jpg", 2),(null, "BigV", 49, "More detail on car_4...", "2022-03-23", 0, 2, "img/display/car/car_4.jpg", 2),
                                                                                                       (null, "Red La Ferarri...", 50, "More detail on car_1...", "2022-03-23", 0, 2, "img/display/car/car_1.jpg", 2), (null, "Red Wine La Fa", 48, "More detail on car_2...", "2022-03-23", 0, 2, "img/display/car/car_2.jpg", 2),(null, "Yellow Lambo", 45, "More detail on car_3...", "2022-03-23", 0, 2, "img/display/car/car_3.jpg", 2),(null, "BigV", 49, "More detail on car_4...", "2022-03-23", 0, 2, "img/display/car/car_4.jpg", 2),
                                                                                                       (null, "Red La Ferarri...", 50, "More detail on car_1...", "2022-03-23", 0, 2, "img/display/car/car_1.jpg", 2), (null, "Red Wine La Fa", 48, "More detail on car_2...", "2022-03-23", 0, 2, "img/display/car/car_2.jpg", 2),(null, "Yellow Lambo", 45, "More detail on car_3...", "2022-03-23", 0, 2, "img/display/car/car_3.jpg", 2),(null, "BigV", 49, "More detail on car_4...", "2022-03-23", 0, 2, "img/display/car/car_4.jpg", 2),
                                                                                                       (null, "Red La Ferarri...", 50, "More detail on car_1...", "2022-03-23", 0, 2, "img/display/car/car_1.jpg", 2), (null, "Red Wine La Fa", 48, "More detail on car_2...", "2022-03-23", 0, 2, "img/display/car/car_2.jpg", 2),(null, "Yellow Lambo", 45, "More detail on car_3...", "2022-03-23", 0, 2, "img/display/car/car_3.jpg", 2),(null, "BigV", 49, "More detail on car_4...", "2022-03-23", 0, 2, "img/display/car/car_4.jpg", 2),
                                                                                                       (null, "Red La Ferarri...", 50, "More detail on car_1...", "2022-03-23", 0, 2, "img/display/car/car_1.jpg", 2), (null, "Red Wine La Fa", 48, "More detail on car_2...", "2022-03-23", 0, 2, "img/display/car/car_2.jpg", 2),(null, "Yellow Lambo", 45, "More detail on car_3...", "2022-03-23", 0, 2, "img/display/car/car_3.jpg", 2),(null, "BigV", 49, "More detail on car_4...", "2022-03-23", 0, 2, "img/display/car/car_4.jpg", 2),
                                                                                                       (null, "Red La Ferarri...", 50, "More detail on car_1...", "2022-03-23", 0, 2, "img/display/car/car_1.jpg", 2), (null, "Red Wine La Fa", 48, "More detail on car_2...", "2022-03-23", 0, 2, "img/display/car/car_2.jpg", 2),(null, "Yellow Lambo", 45, "More detail on car_3...", "2022-03-23", 0, 2, "img/display/car/car_3.jpg", 2),(null, "BigV", 49, "More detail on car_4...", "2022-03-23", 0, 2, "img/display/car/car_4.jpg", 2),
                                                                                                       (null, "Red La Ferarri...", 50, "More detail on car_1...", "2022-03-23", 0, 2, "img/display/car/car_1.jpg", 2), (null, "Red Wine La Fa", 48, "More detail on car_2...", "2022-03-23", 0, 2, "img/display/car/car_2.jpg", 2),(null, "Yellow Lambo", 45, "More detail on car_3...", "2022-03-23", 0, 2, "img/display/car/car_3.jpg", 2),(null, "BigV", 49, "More detail on car_4...", "2022-03-23", 0, 2, "img/display/car/car_4.jpg", 2),
                                                                                                       (null, "Colorful Kyrie 7", 0.03, "More detail on shoe_1...", "2022-03-23", 0, 3, "img/display/shoe/shoe_1.jpg", 3),(null, "Golden LBJX", 0.04, "More detail on shoe_2...", "2022-03-23", 0, 3, "img/display/shoe/shoe_2.jpg", 3),(null, "KD!", 0.02, "More detail on shoe_3...", "2022-03-23", 0, 3, "img/display/shoe/shoe_3.jpg", 3),
                                                                                                       (null, "Colorful Kyrie 7", 0.03, "More detail on shoe_1...", "2022-03-23", 0, 3, "img/display/shoe/shoe_1.jpg", 3),(null, "Golden LBJX", 0.04, "More detail on shoe_2...", "2022-03-23", 0, 3, "img/display/shoe/shoe_2.jpg", 3),(null, "KD!", 0.02, "More detail on shoe_3...", "2022-03-23", 0, 3, "img/display/shoe/shoe_3.jpg", 3),
                                                                                                       (null, "Colorful Kyrie 7", 0.03, "More detail on shoe_1...", "2022-03-23", 0, 3, "img/display/shoe/shoe_1.jpg", 3),(null, "Golden LBJX", 0.04, "More detail on shoe_2...", "2022-03-23", 0, 3, "img/display/shoe/shoe_2.jpg", 3),(null, "KD!", 0.02, "More detail on shoe_3...", "2022-03-23", 0, 3, "img/display/shoe/shoe_3.jpg", 3),
                                                                                                       (null, "Colorful Kyrie 7", 0.03, "More detail on shoe_1...", "2022-03-23", 0, 3, "img/display/shoe/shoe_1.jpg", 3),(null, "Golden LBJX", 0.04, "More detail on shoe_2...", "2022-03-23", 0, 3, "img/display/shoe/shoe_2.jpg", 3),(null, "KD!", 0.02, "More detail on shoe_3...", "2022-03-23", 0, 3, "img/display/shoe/shoe_3.jpg", 3),
                                                                                                       (null, "Colorful Kyrie 7", 0.03, "More detail on shoe_1...", "2022-03-23", 0, 3, "img/display/shoe/shoe_1.jpg", 3),(null, "Golden LBJX", 0.04, "More detail on shoe_2...", "2022-03-23", 0, 3, "img/display/shoe/shoe_2.jpg", 3),(null, "KD!", 0.02, "More detail on shoe_3...", "2022-03-23", 0, 3, "img/display/shoe/shoe_3.jpg", 3),
                                                                                                       (null, "Colorful Kyrie 7", 0.03, "More detail on shoe_1...", "2022-03-23", 0, 3, "img/display/shoe/shoe_1.jpg", 3),(null, "Golden LBJX", 0.04, "More detail on shoe_2...", "2022-03-23", 0, 3, "img/display/shoe/shoe_2.jpg", 3),(null, "KD!", 0.02, "More detail on shoe_3...", "2022-03-23", 0, 3, "img/display/shoe/shoe_3.jpg", 3),
                                                                                                       (null, "Colorful Kyrie 7", 0.03, "More detail on shoe_1...", "2022-03-23", 0, 3, "img/display/shoe/shoe_1.jpg", 3),(null, "Golden LBJX", 0.04, "More detail on shoe_2...", "2022-03-23", 0, 3, "img/display/shoe/shoe_2.jpg", 3),(null, "KD!", 0.02, "More detail on shoe_3...", "2022-03-23", 0, 3, "img/display/shoe/shoe_3.jpg", 3),
                                                                                                       (null, "Colorful Kyrie 7", 0.03, "More detail on shoe_1...", "2022-03-23", 0, 3, "img/display/shoe/shoe_1.jpg", 3),(null, "Golden LBJX", 0.04, "More detail on shoe_2...", "2022-03-23", 0, 3, "img/display/shoe/shoe_2.jpg", 3),(null, "KD!", 0.02, "More detail on shoe_3...", "2022-03-23", 0, 3, "img/display/shoe/shoe_3.jpg", 3),
                                                                                                       (null, "Colorful Kyrie 7", 0.03, "More detail on shoe_1...", "2022-03-23", 0, 3, "img/display/shoe/shoe_1.jpg", 3),(null, "Golden LBJX", 0.04, "More detail on shoe_2...", "2022-03-23", 0, 3, "img/display/shoe/shoe_2.jpg", 3),(null, "KD!", 0.02, "More detail on shoe_3...", "2022-03-23", 0, 3, "img/display/shoe/shoe_3.jpg", 3),
                                                                                                       (null, "Colorful Kyrie 7", 0.03, "More detail on shoe_1...", "2022-03-23", 0, 3, "img/display/shoe/shoe_1.jpg", 3),(null, "Golden LBJX", 0.04, "More detail on shoe_2...", "2022-03-23", 0, 3, "img/display/shoe/shoe_2.jpg", 3),(null, "KD!", 0.02, "More detail on shoe_3...", "2022-03-23", 0, 3, "img/display/shoe/shoe_3.jpg", 3),
                                                                                                       (null, "Colorful Kyrie 7", 0.03, "More detail on shoe_1...", "2022-03-23", 0, 3, "img/display/shoe/shoe_1.jpg", 3),(null, "Golden LBJX", 0.04, "More detail on shoe_2...", "2022-03-23", 0, 3, "img/display/shoe/shoe_2.jpg", 3),(null, "KD!", 0.02, "More detail on shoe_3...", "2022-03-23", 0, 3, "img/display/shoe/shoe_3.jpg", 3),
                                                                                                       (null, "Colorful Kyrie 7", 0.03, "More detail on shoe_1...", "2022-03-23", 0, 3, "img/display/shoe/shoe_1.jpg", 3),(null, "Golden LBJX", 0.04, "More detail on shoe_2...", "2022-03-23", 0, 3, "img/display/shoe/shoe_2.jpg", 3),(null, "KD!", 0.02, "More detail on shoe_3...", "2022-03-23", 0, 3, "img/display/shoe/shoe_3.jpg", 3),
                                                                                                       (null, "Colorful Kyrie 7", 0.03, "More detail on shoe_1...", "2022-03-23", 0, 3, "img/display/shoe/shoe_1.jpg", 3),(null, "Golden LBJX", 0.04, "More detail on shoe_2...", "2022-03-23", 0, 3, "img/display/shoe/shoe_2.jpg", 3),(null, "KD!", 0.02, "More detail on shoe_3...", "2022-03-23", 0, 3, "img/display/shoe/shoe_3.jpg", 3),
                                                                                                       (null, "Colorful Kyrie 7", 0.03, "More detail on shoe_1...", "2022-03-23", 0, 3, "img/display/shoe/shoe_1.jpg", 3),(null, "Golden LBJX", 0.04, "More detail on shoe_2...", "2022-03-23", 0, 3, "img/display/shoe/shoe_2.jpg", 3),(null, "KD!", 0.02, "More detail on shoe_3...", "2022-03-23", 0, 3, "img/display/shoe/shoe_3.jpg", 3),
                                                                                                       (null, "Colorful Kyrie 7", 0.03, "More detail on shoe_1...", "2022-03-23", 0, 3, "img/display/shoe/shoe_1.jpg", 3),(null, "Golden LBJX", 0.04, "More detail on shoe_2...", "2022-03-23", 0, 3, "img/display/shoe/shoe_2.jpg", 3),(null, "KD!", 0.02, "More detail on shoe_3...", "2022-03-23", 0, 3, "img/display/shoe/shoe_3.jpg", 3),
                                                                                                       (null, "Colorful Kyrie 7", 0.03, "More detail on shoe_1...", "2022-03-23", 0, 3, "img/display/shoe/shoe_1.jpg", 3),(null, "Golden LBJX", 0.04, "More detail on shoe_2...", "2022-03-23", 0, 3, "img/display/shoe/shoe_2.jpg", 3),(null, "KD!", 0.02, "More detail on shoe_3...", "2022-03-23", 0, 3, "img/display/shoe/shoe_3.jpg", 3);

/* data for tab_commodityimg*/
insert into tab_commodity_img(mgid, mid, bigPic, smallPic) values (null, 1, "img/big/NFT/NFT_1.jpg", "img/small/NFT/NFT_1.jpg"),(null, 1, "img/big/NFT/NFT_2.jpg", "img/small/NFT/NFT_2.jpg"),(null, 1, "img/big/NFT/NFT_3.jpg", "img/small/NFT/NFT_3.jpg"),(null, 1, "img/big/NFT/NFT_4.jpg", "img/small/NFT/NFT_4.jpg"),(null, 1, "img/big/NFT/NFT_5.jpg", "img/small/NFT/NFT_5.jpg"),(null, 1, "img/big/NFT/NFT_6.jpg", "img/small/NFT/NFT_6.jpg"),
                                                                  (null, 2, "img/big/NFT/NFT_2.jpg", "img/small/NFT/NFT_2.jpg"),(null, 2, "img/big/NFT/NFT_1.jpg", "img/small/NFT/NFT_1.jpg"),(null, 2, "img/big/NFT/NFT_3.jpg", "img/small/NFT/NFT_3.jpg"),(null, 2, "img/big/NFT/NFT_4.jpg", "img/small/NFT/NFT_4.jpg"),(null, 2, "img/big/NFT/NFT_6.jpg", "img/small/NFT/NFT_6.jpg"),(null, 2, "img/big/NFT/NFT_5.jpg", "img/small/NFT/NFT_5.jpg"),
                                                                  (null, 3, "img/big/NFT/NFT_3.jpg", "img/small/NFT/NFT_3.jpg"),(null, 3, "img/big/NFT/NFT_4.jpg", "img/small/NFT/NFT_4.jpg"),(null, 3, "img/big/NFT/NFT_2.jpg", "img/small/NFT/NFT_2.jpg"),(null, 3, "img/big/NFT/NFT_1.jpg", "img/small/NFT/NFT_1.jpg"),(null, 3, "img/big/NFT/NFT_6.jpg", "img/small/NFT/NFT_6.jpg"),(null, 3, "img/big/NFT/NFT_5.jpg", "img/small/NFT/NFT_5.jpg"),
                                                                  (null, 4, "img/big/NFT/NFT_4.jpg", "img/small/NFT/NFT_4.jpg"),(null, 4, "img/big/NFT/NFT_1.jpg", "img/small/NFT/NFT_1.jpg"),(null, 4, "img/big/NFT/NFT_2.jpg", "img/small/NFT/NFT_2.jpg"),(null, 4, "img/big/NFT/NFT_3.jpg", "img/small/NFT/NFT_3.jpg"),(null, 4, "img/big/NFT/NFT_5.jpg", "img/small/NFT/NFT_5.jpg"),(null, 4, "img/big/NFT/NFT_6.jpg", "img/small/NFT/NFT_6.jpg"),
                                                                  (null, 5, "img/big/NFT/NFT_5.jpg", "img/small/NFT/NFT_5.jpg"),(null, 5, "img/big/NFT/NFT_1.jpg", "img/small/NFT/NFT_1.jpg"),(null, 5, "img/big/NFT/NFT_2.jpg", "img/small/NFT/NFT_2.jpg"),(null, 5, "img/big/NFT/NFT_3.jpg", "img/small/NFT/NFT_3.jpg"),(null, 5, "img/big/NFT/NFT_5.jpg", "img/small/NFT/NFT_5.jpg"),(null, 5, "img/big/NFT/NFT_6.jpg", "img/small/NFT/NFT_6.jpg"),
                                                                  (null, 6, "img/big/NFT/NFT_6.jpg", "img/small/NFT/NFT_6.jpg"),(null, 6, "img/big/NFT/NFT_1.jpg", "img/small/NFT/NFT_1.jpg"),(null, 6, "img/big/NFT/NFT_2.jpg", "img/small/NFT/NFT_2.jpg"),(null, 6, "img/big/NFT/NFT_3.jpg", "img/small/NFT/NFT_3.jpg"),(null, 6, "img/big/NFT/NFT_5.jpg", "img/small/NFT/NFT_5.jpg"),(null, 6, "img/big/NFT/NFT_6.jpg", "img/small/NFT/NFT_6.jpg"),
                                                                  (null, 91, "img/big/car/car_1.jpg", "img/small/car/car_1.jpg"),(null, 91, "img/big/car/car_2.jpg", "img/small/car/car_2.jpg"),(null, 91, "img/big/car/car_3.jpg", "img/small/car/car_3.jpg"),(null, 91, "img/big/car/car_4.jpg", "img/small/car/car_4.jpg"),(null, 91, "img/big/car/car_1.jpg", "img/small/car/car_1.jpg"),(null, 91, "img/big/car/car_2.jpg", "img/small/car/car_2.jpg"),(null, 91, "img/big/car/car_3.jpg", "img/small/car/car_3.jpg"),(null, 91, "img/big/car/car_4.jpg", "img/small/car/car_4.jpg"),
                                                                  (null, 92, "img/big/car/car_2.jpg", "img/small/car/car_2.jpg"),(null, 92, "img/big/car/car_1.jpg", "img/small/car/car_1.jpg"),(null, 92, "img/big/car/car_4.jpg", "img/small/car/car_4.jpg"),(null, 92, "img/big/car/car_3.jpg", "img/small/car/car_3.jpg"),(null, 92, "img/big/car/car_2.jpg", "img/small/car/car_2.jpg"),(null, 92, "img/big/car/car_1.jpg", "img/small/car/car_1.jpg"),(null, 92, "img/big/car/car_4.jpg", "img/small/car/car_4.jpg"),(null, 92, "img/big/car/car_3.jpg", "img/small/car/car_3.jpg"),
                                                                  (null, 93, "img/big/car/car_3.jpg", "img/small/car/car_3.jpg"),(null, 93, "img/big/car/car_2.jpg", "img/small/car/car_2.jpg"),(null, 93, "img/big/car/car_3.jpg", "img/small/car/car_3.jpg"),(null, 93, "img/big/car/car_4.jpg", "img/small/car/car_4.jpg"),(null, 93, "img/big/car/car_3.jpg", "img/small/car/car_3.jpg"),(null, 93, "img/big/car/car_2.jpg", "img/small/car/car_2.jpg"),(null, 93, "img/big/car/car_3.jpg", "img/small/car/car_3.jpg"),(null, 93, "img/big/car/car_4.jpg", "img/small/car/car_4.jpg"),
                                                                  (null, 94, "img/big/car/car_4.jpg", "img/small/car/car_4.jpg"),(null, 94, "img/big/car/car_2.jpg", "img/small/car/car_2.jpg"),(null, 94, "img/big/car/car_3.jpg", "img/small/car/car_3.jpg"),(null, 94, "img/big/car/car_4.jpg", "img/small/car/car_4.jpg"),(null, 94, "img/big/car/car_4.jpg", "img/small/car/car_4.jpg"),(null, 94, "img/big/car/car_2.jpg", "img/small/car/car_2.jpg"),(null, 94, "img/big/car/car_3.jpg", "img/small/car/car_3.jpg"),(null, 94, "img/big/car/car_4.jpg", "img/small/car/car_4.jpg"),
                                                                  (null, 135, "img/big/shoe/shoe_1.jpg", "img/small/shoe/shoe_1.jpg"),(null, 135, "img/big/shoe/shoe_2.jpg", "img/small/shoe/shoe_2.jpg"),(null, 135, "img/big/shoe/shoe_3.jpg", "img/small/shoe/shoe_3.jpg"),(null, 135, "img/big/shoe/shoe_1.jpg", "img/small/shoe/shoe_1.jpg"),(null, 135, "img/big/shoe/shoe_1.jpg", "img/small/shoe/shoe_1.jpg"),(null, 135, "img/big/shoe/shoe_2.jpg", "img/small/shoe/shoe_2.jpg"),(null, 135, "img/big/shoe/shoe_3.jpg", "img/small/shoe/shoe_3.jpg"),(null, 135, "img/big/shoe/shoe_1.jpg", "img/small/shoe/shoe_1.jpg"),
                                                                  (null, 136, "img/big/shoe/shoe_2.jpg", "img/small/shoe/shoe_2.jpg"),(null, 136, "img/big/shoe/shoe_1.jpg", "img/small/shoe/shoe_1.jpg"),(null, 136, "img/big/shoe/shoe_3.jpg", "img/small/shoe/shoe_3.jpg"),(null, 136, "img/big/shoe/shoe_3.jpg", "img/small/shoe/shoe_3.jpg"),(null, 136, "img/big/shoe/shoe_2.jpg", "img/small/shoe/shoe_2.jpg"),(null, 136, "img/big/shoe/shoe_1.jpg", "img/small/shoe/shoe_1.jpg"),(null, 136, "img/big/shoe/shoe_3.jpg", "img/small/shoe/shoe_3.jpg"),(null, 136, "img/big/shoe/shoe_3.jpg", "img/small/shoe/shoe_3.jpg"),
                                                                  (null, 137, "img/big/shoe/shoe_3.jpg", "img/small/shoe/shoe_3.jpg"),(null, 137, "img/big/shoe/shoe_2.jpg", "img/small/shoe/shoe_2.jpg"),(null, 137, "img/big/shoe/shoe_1.jpg", "img/small/shoe/shoe_1.jpg"),(null, 137, "img/big/shoe/shoe_3.jpg", "img/small/shoe/shoe_3.jpg"),(null, 137, "img/big/shoe/shoe_3.jpg", "img/small/shoe/shoe_3.jpg"),(null, 137, "img/big/shoe/shoe_2.jpg", "img/small/shoe/shoe_2.jpg"),(null, 137, "img/big/shoe/shoe_1.jpg", "img/small/shoe/shoe_1.jpg"),(null, 137, "img/big/shoe/shoe_3.jpg", "img/small/shoe/shoe_3.jpg");