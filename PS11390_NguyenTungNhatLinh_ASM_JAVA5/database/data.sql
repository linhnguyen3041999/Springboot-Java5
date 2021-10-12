
use db_asm_java5;
insert into category(name, code, isdeleted) values ( 'Điện thoại', 'dien-thoai', 1);
insert into category(name, code, isdeleted) values ( 'Laptop', 'lap-top', 1);
insert into category(name, code, isdeleted) values ( 'Máy tính bảng', 'may-tinh-bang', 1);

insert into product(code, description, imgurl, isdeleted, name, price, quantity, status, categoryid) 
				values ( 'iphone-12', 'điện thoại iphone 12', 'iphone12.jpg', 1, "iphone12", 12000000, 12, "còn hàng", 1 );
insert into product(code, description, imgurl, isdeleted, name, price, quantity, status, categoryid) 
				values ( 'samsung-note-10', 'điện thoại samsung note 10', 'samsungnote10.jpg', 1, "samsung note 10", 10000000, 15, "còn hàng", 1 );
insert into product(code, description, imgurl, isdeleted, name, price, quantity, status, categoryid) 
				values ( 'laptop-dell', 'laptop dell xps', 'laptopdell.jpg', 1, "laptop dell xps", 21000000, 5, "còn hàng", 2 );
insert into product(code, description, imgurl, isdeleted, name, price, quantity, status, categoryid) 
				values ( 'Ipad-mini-3', 'Ipad mini 3', 'ipadmini3.jpg', 1, "ipad mini 3", 19000000, 8, "còn hàng", 3);
