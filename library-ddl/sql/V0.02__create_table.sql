create table library.user
(
    id varchar(16) not null,
    name varchar(30) not null,
    standard varchar(10),
    role varchar(10) not null,
    phone varchar(10),
    username varchar(50) not null,
    password varchar(200) not null,
    active boolean not null,
    token varchar(300),
    primary key (username)
);

create table library.book_type
(
    id varchar(16) not null,
    type varchar(20) not null,
    primary key (id)
);

create table library.author
(
    id varchar(16) not null,
    name varchar(30) not null,
    pen_name varchar(30),
    primary key (id)
);

create table library.book
(
    id varchar(16) not null,
    name varchar(30) not null,
    author varchar(8) references library.author(id) not null,
    rack varchar(10) not null,
    publication varchar(50),
    language varchar(20) not null,
    price int not null,
    purchased timestamp not null,
    category varchar(20) references library.book_type(id) not null,
    primary key (id)
);

create table book_owned_users
(
    book_id varchar(255) not null,
    username varchar(255) not null,
    purchased timestamp not null
);
