create table Product(
    id smallint not null auto_increment,
    name varchar(50) not null,
    brand varchar(50) not null,
    description varchar(255) not null,
    price float not null,

    primary key(id)

);