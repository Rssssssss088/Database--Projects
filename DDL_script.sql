#drop and create database

create database library;
use library;

set global event_scheduler = ON;

#school_units create

create table school_units (
	school_id			char(8), 
	school_name			varchar(40) not null,
	street_name			varchar(20) not null,
	street_num			int not null,
	city				varchar(20) not null,
	phone				numeric(10,0) not null,
	email				varchar(40) not null,
	principal_first_name 		varchar(20) not null,
	principal_mid_name 		varchar(20),
principal_last_name 		varchar(20) not null, 

primary key (school_id),
constraint invalid_mail check (email like '%@%')
);

create table user (
	username			varchar(12),
	school_id			char(8),
	password			varchar(20) not null,
	first_name			varchar(20) not null,
	last_name			varchar(20) not null,
	email				varchar(40) not null,
	phone				numeric(10,0) not null,
	street_name			varchar(20) not null,
	street_num			int not null,
	birthdate			date not null,
	age				int,
	can_rent			int not null,
	can_reserve			int not null,
	penalty				boolean default false,
	approved_by_op		varchar(12),

primary key (username),
foreign key (school_id) references school_units(school_id),
constraint username_too_little check( length(username) >3 ),
constraint password_too_little check( length (password) >5) ,
	constraint invalid_mail check (email like '%@%')
);

create table students (
	username			varchar(12) unique,
	class_num			int not null,
	class_grade			varchar(20) not null,
	class_tier			varchar(20) not null,

foreign key (username) references user(username),
constraint invalid_class_num check (class_num>=0),
constraint invalid_class_tier check (class_tier in ('primary school', 'highschool', 'junior highschool'))
); 

create table professors (
username			varchar(12) unique,
specialty			varchar(20) not null,

foreign key (username) references user(username)
);

create table admins(
	username			varchar(12),
	password			varchar(20) not null,
	first_name			varchar(12) not null,
	last_name			varchar(12) not null,

primary key (username)
);

create table lib_ops (
	username			varchar(12),
	approved_by_admin		varchar(12),

foreign key (username) references professors(username),
foreign key (approved_by_admin) references admins(username)
);

ALTER TABLE user
ADD CONSTRAINT user_approved_by_foreign_lib_op
FOREIGN KEY (approved_by_op)
REFERENCES lib_ops(username);

create table books (
  isbn       	 char(13),
  title       	varchar(50) not null,
  publisher  	 VARCHAR(50) NOT NULL,
  pages       	INT,
  summary     	TEXT DEFAULT 'None available',
  image      	 varchar(10000),
  language    	VARCHAR(20),

  PRIMARY KEY (isbn)

);

create table books_category (
	isbn				char(13),
	category			varchar(20), 

primary key (isbn,category),
foreign key (isbn) references books(isbn) 
);

create table books_keyword (
	isbn				char(13),
	keyword			varchar(20),
primary key (isbn, keyword),
foreign key (isbn) references books(isbn) 
);

create table books_author (
	isbn				char(13),
	author_first_name		varchar(20) not null,
	author_middle_name		varchar(20),
	author_last_name		varchar(20) not null,
primary key(isbn,author_first_name,author_middle_name,author_last_name),
foreign key (isbn) references books(isbn) 
);

create table copies (
	copy_id			varchar(6), 
	school_id			char(8),
	isbn				char(13),
available			boolean default true, 

primary key(copy_id, school_id),
foreign key (isbn) references books(isbn) 
);

create table reviews (
	review_id			int auto_increment,
	username			varchar(12),
	isbn				char(13),
	comment			text not null,
	rating				int not null,
	date				date not null,
	approved_by_op		varchar(12),

primary key (review_id),
foreign key (username) references user(username),
foreign key (approved_by_op) references lib_ops(username),
foreign key (isbn) references books(isbn) 
);

create table rentals (
	rental_id			int auto_increment,
	username			varchar(12),
	copy_id			varchar(6),
	school_id			char(8),
	rental_date			date default curdate(),
	deadline_date			date,
	return_date			date,
	approved_by_op		varchar(12),
	
	primary key (rental_id),
	foreign key (username) references user(username),
foreign key (approved_by_op) references lib_ops(username),
	foreign key (copy_id, school_id) references copies(copy_id, school_id),
	constraint return_sooner_rent check (return_date>=rental_date)
);

create table reservations (
	reservation_id		int auto_increment,
	username			varchar(12),
	copy_id			varchar(6),
	school_id			char(8),
	reservation_date		date default curdate(),
	deadline_date			date,
	cancellation_date		date,

	primary key (reservation_id),
	foreign key (username) references user(username),
	foreign key (copy_id, school_id) references copies(copy_id, school_id),
	constraint cancellation_later_deadline check (deadline_date>=cancellation_date)
);

create index idx_books_title on books (title);
create index idx_rentals_rental_date on rentals (rental_date);
create index idx_rentals_deadline_date on rentals (deadline_date);
create index idx_rentals_return_date on rentals (return_date);
create index idx_user_first_name on user (first_name);
create index idx_user_last_name on user (last_name);
create index idx_reviews_rating on reviews (rating);
create index idx_school_units_name on school_units (school_name);
create index idx_copies_available on copies (available);
create index idx_user_age on user (age);

