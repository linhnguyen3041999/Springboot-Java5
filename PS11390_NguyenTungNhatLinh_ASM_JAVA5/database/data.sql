
use db_asm_java5;
insert into category(name, code, isdeleted) values ( 'Điện thoại', 'dien-thoai', 0);
insert into category(name, code, isdeleted) values ( 'Laptop', 'lap-top', 0);
insert into category(name, code, isdeleted) values ( 'Máy tính bảng', 'may-tinh-bang', 0);
insert into category(name, code, isdeleted) values ( 'Phụ kiện', 'phu-kien', 0);
insert into category(name, code, isdeleted) values ( 'Đồng hồ', 'dong-ho', 0);

insert into product(code, description, imgurl, isdeleted, name, price, quantity, status, categoryid) 
				values (  'Acer-Predator-1', 'Được đưa vào phân khúc laptop gaming, vì thế trang bị vẻ ngoài cũng mang hơi hướng mạnh mẽ, cá tính, nhưng đủ tinh tế và rất sang trọng để người dùng có thể thoải mái mang theo sử dụng ở mọi nơi.', 'http://localhost:8080/archive/downloadFile/acerpredatorhelios300.jpg', 0, 'Acer Predator 1', '32000000', '20', 'còn hàng', '2' );
insert into product(code, description, imgurl, isdeleted, name, price, quantity, status, categoryid) 
				values ( 'Acer-Nitro', 'Được đưa vào phân khúc laptop gaming,  vì thế trang bị vẻ ngoài cũng mang hơi hướng mạnh mẽ, cá tính, nhưng đủ tinh tế và rất sang trọng để người dùng có thể thoải mái mang theo sử dụng ở mọi nơi.', 'http://localhost:8080/archive/downloadFile/acerpredatortriton500.jpg', 0, 'Acer Nitro', '23000000', '55', 'còn hàng', '2' );
insert into product(code, description, imgurl, isdeleted, name, price, quantity, status, categoryid) 
				values ( 'Lenovo-Ipad', 'Được đưa vào phân khúc laptop gaming,  vì thế trang bị vẻ ngoài cũng mang hơi hướng mạnh mẽ, cá tính, nhưng đủ tinh tế và rất sang trọng để người dùng có thể thoải mái mang theo sử dụng ở mọi nơi.', 'http://localhost:8080/archive/downloadFile/lenovoideapad3.jpg',0, 'Lenovo Ipad', '20000000', '98', 'còn hàng', '2');
insert into product(code, description, imgurl, isdeleted, name, price, quantity, status, categoryid) 
				values (  'Lenovo-Legion', 'Được đưa vào phân khúc laptop gaming,  vì thế trang bị vẻ ngoài cũng mang hơi hướng mạnh mẽ, cá tính, nhưng đủ tinh tế và rất sang trọng để người dùng có thể thoải mái mang theo sử dụng ở mọi nơi.', 'http://localhost:8080/archive/downloadFile/lenovolegion5.jpg',0, 'Lenovo Legion', '19000000', '20', 'còn hàng', '2');
insert into product(code, description, imgurl, isdeleted, name, price, quantity, status, categoryid) 
				values ( 'macbook-air', 'Được đưa vào phân khúc laptop gaming,  vì thế trang bị vẻ ngoài cũng mang hơi hướng mạnh mẽ, cá tính, nhưng đủ tinh tế và rất sang trọng để người dùng có thể thoải mái mang theo sử dụng ở mọi nơi.', 'http://localhost:8080/archive/downloadFile/macbookair.jpg',0, 'macbook air', '35000000', '21', 'còn hàng', '2');                
insert into product(code, description, imgurl, isdeleted, name, price, quantity, status, categoryid) 
				values (  'iphone', 'Được đưa vào phân khúc laptop gaming,  vì thế trang bị vẻ ngoài cũng mang hơi hướng mạnh mẽ, cá tính, nhưng đủ tinh tế và rất sang trọng để người dùng có thể thoải mái mang theo sử dụng ở mọi nơi.', 'http://localhost:8080/archive/downloadFile/iphone8plus.jpg', 0, 'Iphone 8', '32000000', '20', 'còn hàng', '1');
insert into product(code, description, imgurl, isdeleted, name, price, quantity, status, categoryid) 
				values ( 'iphone', 'Được đưa vào phân khúc laptop gaming,  vì thế trang bị vẻ ngoài cũng mang hơi hướng mạnh mẽ, cá tính, nhưng đủ tinh tế và rất sang trọng để người dùng có thể thoải mái mang theo sử dụng ở mọi nơi.', 'http://localhost:8080/archive/downloadFile/iphone11.jpg', 0, 'Iphone 11', '23000000', '20', 'còn hàng', '1');

insert into product(code, description, imgurl, isdeleted, name, price, quantity, status, categoryid) 
				values ( 'iphone', 'Được đưa vào phân khúc laptop gaming,  vì thế trang bị vẻ ngoài cũng mang hơi hướng mạnh mẽ, cá tính, nhưng đủ tinh tế và rất sang trọng để người dùng có thể thoải mái mang theo sử dụng ở mọi nơi.', 'http://localhost:8080/archive/downloadFile/iphone11.jpg', false, 'Iphone 11', '23000000', '20', 'còn hàng', '1');

insert into role(code, name) values ( 'admin', 'admin');
insert into role(code, name) values ( 'user', 'user');

insert into user(email, fullname, hashpassword, imgurl, isdeleted, username, roleid) 
				values ( 'linhnguyen3041999@gmail.com', 'Nguyễn Tùng Nhật Linh', '$2a$10$Mp52Cl6PmwSrRV2K/eGeauGXlphQ3fJKm.Wt5irgBW37Pt5BGRKAa', 'http://localhost:8080/archive/downloadFile/AnhDaiDien.jpg', 0, 'linh12', '1');

DELIMITER $$
CREATE PROCEDURE  sp_getTotalPriceOneMonth
(
   	month VARCHAR(2),
	year VARCHAR(4)
)
BEGIN
	DECLARE result VARCHAR(20); 
	SET @result = (select sum(totalprice)
		from orders where month(created_date) = month and year(created_date) = year);
	if @result is null then set result='0'; end if;
	SELECT @result;
END$$
DELIMITER ;
