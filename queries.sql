insert into customer(username,password,created_at) values
('dale1','pass1','2020-02-01'),('dale2','pass2','2020-02-02'),
('dale3','pass3','2020-02-03'),('dale4','pass4','2020-02-04'),('dale5','pass5','2020-02-05');

insert into item(name,price,description) values
('glasses','13','a sturdy pair of spectacles'),('glasses','23','a sturdy pair of spectacles'),
('glasses','33','a sturdy pair of spectacles'),('glasses','43','a sturdy pair of spectacles'),
('glasses','53','a sturdy pair of spectacles'),('glasses','53','a sturdy pair of spectacles'),
('glasses','63','a sturdy pair of spectacles'),('glasses','73','a sturdy pair of spectacles'),
('glasses','73','a sturdy pair of spectacles'),('glasses','73','a sturdy pair of spectacles'),
('glasses','73','a sturdy pair of spectacles'),;

insert into orders(created_at,customer_id) values
('2020-02-02 18:00:00','1'),('2020-02-02 18:00:00','2'),('2020-02-02 18:00:00','3'),
('2020-02-02 18:00:00','2'),('2020-02-02 18:00:00','5');

insert into order_item(order_id,item_id) values 
(1,1),(1,6),(1,11),(1,1),(2,2),(2,7),(2,2),(3,3),(3,8),
(3,3),(4,4),(4,9),(4,4),(5,5),(5,10);;

select o.created_at,c.username from `order` o  inner join customer c on c.id=o.customer_id order by o.created_at asc limit 5;

select c.username,count(o.customer_id) from customer c inner join `order` o on c.id=o.customer_id group by o.customer_id;

select sum(i.price)/count(distinct o.id) from order_item oi inner join item i on i.id=oi.item_id inner join `order`o on o.id=oi.order_id ; 

select c.username ,sum(i.price) from order_item oi inner join item i on i.id = oi.item_id 
inner join `order` o on o.id = oi.order_id inner join customer c on c.id=o.customer_id  group by oi.order_id order by sum(i.price) desc limit 1;
