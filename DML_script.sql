
set global event_scheduler = ON;

#school_units populate

insert into school_units (school_id, school_name, street_name, street_num, city, phone, email, principal_first_name, principal_mid_name, principal_last_name) values ('cg4o9lmy', 'Jaxworks', 'Bartelt', 40931, 'Zapala', 8711749771, 'agent0@wired.com', 'Gustav', 'Adrienne', 'Gent');
insert into school_units (school_id, school_name, street_name, street_num, city, phone, email, principal_first_name, principal_mid_name, principal_last_name) values ('0p8ju3vq', 'Katz', 'Petterle', 26485, 'Kula', 7141442814, 'flotte1@list-manage.com', 'Vally', 'Felecia', 'Lotte');
insert into school_units (school_id, school_name, street_name, street_num, city, phone, email, principal_first_name, principal_mid_name, principal_last_name) values ('cbnx7ywj', 'Bubblemix', 'Packers', 13779, 'Lang Suan', 2381264382, 'vellett2@icq.com', 'Chelsey', 'Viv', 'Ellett');
insert into school_units (school_id, school_name, street_name, street_num, city, phone, email, principal_first_name, principal_mid_name, principal_last_name) values ('l0xrbdy6', 'Kwilith', 'Clemons', 72417, 'Voloka', 7603517186, 'ijantet3@technorati.com', 'Peggi', 'Ilene', 'Jantet');
insert into school_units (school_id, school_name, street_name, street_num, city, phone, email, principal_first_name, principal_mid_name, principal_last_name) values ('6e3w27za', 'Feedmix', 'Claremont', 64801, 'Valle de Angeles', 9054343772, 'ibordis4@addtoany.com', 'Anabel', 'Ingrim', 'Bordis');



#user triggers

create trigger set_initial_age
before insert on user
for each row
set new.age = timestampdiff(year, new.birthdate, curdate());


#user events

create event compute_age
on schedule every 1 day do
update user set age = timestampdiff (year, birthdate, curdate());

#user populate

insert into user (username, school_id, password, first_name, last_name, email, phone, street_name, street_num, birthdate) values ('oscar', 'cbnx7ywj', 'kqSyfbHU', 'Domeniga', 'Derycot', 'dderycot0@naver.com', 7679411979, 'Sherman', 99, '1999-03-03');
insert into user (username, school_id, password, first_name, last_name, email, phone, street_name, street_num, birthdate) values ('laura', '0p8ju3vq', 'oJcQSnrF', 'Coriss', 'Garrard', 'cgarrard1@xinhuanet.com', 3470025784, 'Reinke', 69, '2018-01-14');
insert into user (username, school_id, password, first_name, last_name, email, phone, street_name, street_num, birthdate) values ('peter', 'cg4o9lmy', 'CE0XVCON', 'Delphinia', 'Ateggart', 'dateggart2@hc360.com', 5599912309, 'Menomonie', 11, '1933-05-15');
insert into user (username, school_id, password, first_name, last_name, email, phone, street_name, street_num, birthdate) values ('johndoe', 'l0xrbdy6', 'LKOaZ6LbVWib', 'Sibel', 'Filshin', 'sfilshin4@hud.gov', 6715325232, 'Sage', 38, '1983-06-27');
insert into user (username, school_id, password, first_name, last_name, email, phone, street_name, street_num, birthdate) values ('mark', 'l0xrbdy6', 'GP1A4Pyk0k', 'Keelia', 'Witcombe', 'kwitcombe5@comcast.net', 5135203725, 'Kedzie', 51, '1999-10-19');
insert into user (username, school_id, password, first_name, last_name, email, phone, street_name, street_num, birthdate) values ('johndore', 'cg4o9lmy', 'BHXRd5r', 'Alleyn', 'McCrillis', 'amccrillis6@ameblo.jp', 8984187322, 'Debra', 45, '1971-02-10');
insert into user (username, school_id, password, first_name, last_name, email, phone, street_name, street_num, birthdate) values ('leah', 'cg4o9lmy', 'NPe5NRJTi', 'Florance', 'Smitham', 'fsmitham7@shinystat.com', 4547709223, '3rd', 99, '2003-05-10');
insert into user (username, school_id, password, first_name, last_name, email, phone, street_name, street_num, birthdate) values ('rachel', 'l0xrbdy6', '7x8G2KjwmYL8', 'Otha', 'Karet', 'okaret8@uiuc.edu', 2162231408, 'Sheridan', 55, '1958-06-27');
insert into user (username, school_id, password, first_name, last_name, email, phone, street_name, street_num, birthdate) values ('kimberly', 'cg4o9lmy', 'MfrqrGv', 'Brod', 'Twiname', 'btwiname9@toplist.cz', 3823271359, 'Kensington', 27, '2022-01-16');
insert into user (username, school_id, password, first_name, last_name, email, phone, street_name, street_num, birthdate) values ('robert', '0p8ju3vq', 'knTud0JD3', 'Raven', 'Gillson', 'rgillsona@virginia.edu', 9329006606, 'Clyde Gallagher', 65, '1992-07-14');
insert into user (username, school_id, password, first_name, last_name, email, phone, street_name, street_num, birthdate) values ('nathan', '6e3w27za', 'sFT7KpmAkB', 'Derby', 'Andreini', 'dandreinib@bloglovin.com', 8835087903, 'Bayside', 20, '1973-02-11');
insert into user (username, school_id, password, first_name, last_name, email, phone, street_name, street_num, birthdate) values ('michael', '6e3w27za', 'A3QFzjmlr', 'Lissie', 'MacQuaker', 'lmacquakerc@smugmug.com', 8582205580, 'Crownhardt', 51, '2005-06-17');
insert into user (username, school_id, password, first_name, last_name, email, phone, street_name, street_num, birthdate) values ('celly', 'l0xrbdy6', 'RdnbkQf', 'Nissie', 'Laker', 'nlakerd@cnbc.com', 1181229052, 'Messerschmidt', 43, '2013-10-18');
insert into user (username, school_id, password, first_name, last_name, email, phone, street_name, street_num, birthdate) values ('jackson', 'l0xrbdy6', 'yEMdo0', 'Elizabet', 'Shoebotham', 'eshoebothame@whitehouse.gov', 8142355349, 'Gateway', 11, '2018-02-02');
insert into user (username, school_id, password, first_name, last_name, email, phone, street_name, street_num, birthdate) values ('markos', 'l0xrbdy6', '049y2tUUrA', 'Bobby', 'Tirte', 'btirtef@nytimes.com', 7874358480, 'Michigan', 11, '1935-10-11');
insert into user (username, school_id, password, first_name, last_name, email, phone, street_name, street_num, birthdate) values ('janedoe', '6e3w27za', 'tqFDUohXb', 'Robin', 'Gerish', 'rgerishg@marriott.com', 5631319099, 'Loomis', 69, '1952-09-29');
insert into user (username, school_id, password, first_name, last_name, email, phone, street_name, street_num, birthdate) values ('matthew', 'cg4o9lmy', 'YEleKAOi', 'Angel', 'Vasyukov', 'avasyukovh@pen.io', 1722916993, 'Petterle', 49, '1957-08-21');
insert into user (username, school_id, password, first_name, last_name, email, phone, street_name, street_num, birthdate) values ('rachell', 'l0xrbdy6', 'eyIOtR8', 'Tabbie', 'Sans', 'tsansi@ow.ly', 4656544750, 'Fairview', 90, '1976-04-30');
insert into user (username, school_id, password, first_name, last_name, email, phone, street_name, street_num, birthdate) values ('natallie', 'cbnx7ywj', 'IG0FfDUC3sZC', 'Juditha', 'Cosens', 'jcosensj@google.com', 7999081947, 'Blaine', 15, '2016-06-01');
insert into user (username, school_id, password, first_name, last_name, email, phone, street_name, street_num, birthdate) values ('lissa', '0p8ju3vq', 'wOy1IP', 'Dallas', 'Lourenco', 'dlourencok@ycombinator.com', 5566013965, 'Oak Valley', 74, '1903-07-05');
insert into user (username, school_id, password, first_name, last_name, email, phone, street_name, street_num, birthdate) values ('rebecca', 'cbnx7ywj', 'b40tb6', 'Emmalyn', 'Haythorn', 'ehaythornl@archive.org', 3081636031, 'Bashford', 15, '1909-05-25');
insert into user (username, school_id, password, first_name, last_name, email, phone, street_name, street_num, birthdate) values ('logan', 'cbnx7ywj', 'GC0jJDCy8b', 'Magdaia', 'Bage', 'mbagem@dion.ne.jp', 4024488308, 'Vidon', 8, '1920-03-22');
insert into user (username, school_id, password, first_name, last_name, email, phone, street_name, street_num, birthdate) values ('migel', 'cbnx7ywj', 'ul3f6F', 'Zahara', 'Unitt', 'zunittn@quantcast.com', 7978319532, 'West', 57, '1989-05-18');
insert into user (username, school_id, password, first_name, last_name, email, phone, street_name, street_num, birthdate) values ('lance', 'cbnx7ywj', 'Kxpbzu', 'Tuckie', 'Dabels', 'tdabelso@networkadvertising.org', 3079770716, 'Norway Maple', 6, '1976-03-05');
insert into user (username, school_id, password, first_name, last_name, email, phone, street_name, street_num, birthdate) values ('oscar69', '6e3w27za', 'oJsWyY2', 'Ruben', 'Dunlop', 'rdunlopp@webnode.com', 7652164516, 'Walton', 96, '1917-10-11');
insert into user (username, school_id, password, first_name, last_name, email, phone, street_name, street_num, birthdate) values ('laurel', 'l0xrbdy6', 'DF6IkIKfHVAq', 'Belita', 'Green', 'bgreenq@delicious.com', 9995662095, 'Fulton', 80, '1964-8-11');
insert into user (username, school_id, password, first_name, last_name, email, phone, street_name, street_num, birthdate) values ('natalie', '0p8ju3vq', 'e90lED', 'Darnell', 'Esposita', 'despositar@ifeng.com', 9086783439, 'Lien', 59, '1924-11-02');
insert into user (username, school_id, password, first_name, last_name, email, phone, street_name, street_num, birthdate) values ('donkeykong', '0p8ju3vq', 'Hq3XubK', 'Rudolf', 'Bursnoll', 'rbursnolls@dedecms.com', 8286635508, 'Meadow Vale', 58, '1956-03-22');
insert into user (username, school_id, password, first_name, last_name, email, phone, street_name, street_num, birthdate) values ('kattie', '6e3w27za', 'XyVfx5D', 'Baxy', 'Backes', 'bbackest@comsenz.com', 3033855436, 'Crest Line', 67, '1950-07-30');
insert into user (username, school_id, password, first_name, last_name, email, phone, street_name, street_num, birthdate) values ('lucas', 'cg4o9lmy', 'ZIRSoGhS', 'Rasla', 'Keilloh', 'rkeillohu@cocolog-nifty.com', 1463445254, 'Tennessee', 7, '1962-04-06');
insert into user (username, school_id, password, first_name, last_name, email, phone, street_name, street_num, birthdate) values ('karla', 'l0xrbdy6', 'cFwayZFShc8A', 'Roarke', 'Awde', 'rawdev@blog.com', 3152972097, 'Bowman', 36, '1956-07-02');
insert into user (username, school_id, password, first_name, last_name, email, phone, street_name, street_num, birthdate) values ('jessicca', '0p8ju3vq', '84Vkk8gqsY', 'Mel', 'Offiler', 'moffilerw@dyndns.org', 5129605009, 'Namekagon', 76, '1941-09-20');
insert into user (username, school_id, password, first_name, last_name, email, phone, street_name, street_num, birthdate) values ('oliver', '0p8ju3vq', 'eX79YIU', 'Darbee', 'Minnock', 'dminnockx@wikimedia.org', 4770954791, 'Russell', 47, '1959-07-05');
insert into user (username, school_id, password, first_name, last_name, email, phone, street_name, street_num, birthdate) values ('olivia', 'cg4o9lmy', '3mgFBih7sSk6', 'Micaela', 'Loseby', 'mlosebyy@newsvine.com', 1864120277, 'Warbler', 51, '1933-12-20');
insert into user (username, school_id, password, first_name, last_name, email, phone, street_name, street_num, birthdate) values ('melissa', 'cg4o9lmy', 'b0IT8JL', 'Guinevere', 'Deville', 'gdevillez@macromedia.com', 8234183393, 'Monica', 73, '1910-05-16');
insert into user (username, school_id, password, first_name, last_name, email, phone, street_name, street_num, birthdate) values ('kimber', '6e3w27za', '13PpTpyr9j', 'Linda', 'Swatton', 'lswatton10@mlb.com', 7604942616, 'Springview', 80, '1938-03-15');
insert into user (username, school_id, password, first_name, last_name, email, phone, street_name, street_num, birthdate) values ('nick', 'cg4o9lmy', 'tMdnsPbELU', 'Yorke', 'Dwane', 'ydwane11@mac.com', 8046944622, 'Surrey', 10, '1943-08-17');
insert into user (username, school_id, password, first_name, last_name, email, phone, street_name, street_num, birthdate) values ('user123', 'cg4o9lmy', 'CUvMd7mc', 'Luise', 'Praton', 'lpraton12@hc360.com', 6941753171, 'Bashford', 79, '2008-04-07');
insert into user (username, school_id, password, first_name, last_name, email, phone, street_name, street_num, birthdate) values ('patrick', 'cg4o9lmy', 'EUz5TgK5rjd', 'Isidore', 'Stainton', 'istainton13@t-online.de', 7903334726, 'Springview', 93, '1920-09-16');
insert into user (username, school_id, password, first_name, last_name, email, phone, street_name, street_num, birthdate) values ('lisasa', 'cbnx7ywj', '3zXzbxO3y', 'Marion', 'O''Kielt', 'mokielt14@ning.com', 9172872132, 'Westridge', 86, '1901-12-10');
insert into user (username, school_id, password, first_name, last_name, email, phone, street_name, street_num, birthdate) values ('ryan', '0p8ju3vq', 'LdwLJXXky', 'Victoir', 'Crookston', 'vcrookston15@bizjournals.com', 2684928143, 'Tennyson', 57, '1967-10-12');
insert into user (username, school_id, password, first_name, last_name, email, phone, street_name, street_num, birthdate) values ('rebbecca', '0p8ju3vq', 'LhX9XGZzmnUC', 'Sidney', 'Whales', 'swhales16@opensource.org', 1676026885, 'Bluestem', 27, '2017-08-29');
insert into user (username, school_id, password, first_name, last_name, email, phone, street_name, street_num, birthdate) values ('kati', '0p8ju3vq', 'Pymx1oj0Z', 'Lauritz', 'Veness', 'lveness17@berkeley.edu', 9860198079, 'Oak', 81, '1982-11-15');
insert into user (username, school_id, password, first_name, last_name, email, phone, street_name, street_num, birthdate) values ('just_in', 'cbnx7ywj', 'wZ0rOzsvh', 'Jilleen', 'Daveran', 'jdaveran18@xinhuanet.com', 1556666046, 'Eagan', 6, '1926-11-01');
insert into user (username, school_id, password, first_name, last_name, email, phone, street_name, street_num, birthdate) values ('roberto', 'cbnx7ywj', 'Uz2VaEPGXXr', 'Reinald', 'Lehrahan', 'rlehrahan19@comcast.net', 5378720137, 'Northridge', 23, '2009-06-29');
insert into user (username, school_id, password, first_name, last_name, email, phone, street_name, street_num, birthdate) values ('janedore', '6e3w27za', 'WHfIOTMSPC', 'Warde', 'Lapslie', 'wlapslie1a@telegraph.co.uk', 3728897494, 'Hermina', 19, '2000-06-17');
insert into user (username, school_id, password, first_name, last_name, email, phone, street_name, street_num, birthdate) values ('jessica_p', 'cg4o9lmy', 'CWdpdV0quy', 'Germayne', 'Rubenfeld', 'grubenfeld1b@sina.com.cn', 1926246097, 'Cottonwood', 17, '2001-12-22');
insert into user (username, school_id, password, first_name, last_name, email, phone, street_name, street_num, birthdate) values ('jimy', 'cg4o9lmy', 'UMDvxKf', 'Henrie', 'Clousley', 'hclousley1c@slashdot.org', 7789343389, 'Butterfield', 10, '1937-06-21');
insert into user (username, school_id, password, first_name, last_name, email, phone, street_name, street_num, birthdate) values ('liza', 'cg4o9lmy', 'B3LTVBRSz6g', 'Jule', 'Yarwood', 'jyarwood1d@nih.gov', 9438519725, 'Fisk', 97, '2015-08-10');
insert into user (username, school_id, password, first_name, last_name, email, phone, street_name, street_num, birthdate) values ('nathan_drake', 'l0xrbdy6', 'trpCG5G', 'Gard', 'Bonellie', 'gbonellie1e@newyorker.com', 2008364042, 'Cordelia', 76, '1984-05-16');
insert into user (username, school_id, password, first_name, last_name, email, phone, street_name, street_num, birthdate) values ('jasson', '6e3w27za', 'XwbBJXcxaKj', 'Hercule', 'Handlin', 'hhandlin1f@meetup.com', 7874119894, 'Amoth', 1, '1996-11-12');
insert into user (username, school_id, password, first_name, last_name, email, phone, street_name, street_num, birthdate) values ('paulaner', 'cg4o9lmy', '2tv0hZAbCi', 'Dickie', 'Winn', 'dwinn1g@booking.com', 6954868686, 'Pearson', 39, '1965-08-22');
insert into user (username, school_id, password, first_name, last_name, email, phone, street_name, street_num, birthdate) values ('luke', '6e3w27za', 'qYla2py', 'Anna', 'Sanger', 'asanger1j@bloglovin.com', 7102265071, 'Merchant', 22, '1956-10-16');
insert into user (username, school_id, password, first_name, last_name, email, phone, street_name, street_num, birthdate) values ('paige', 'cbnx7ywj', 'pp4kga', 'Estel', 'Danes', 'edanes1l@sohu.com', 8255511626, 'Del Mar', 96, '1920-06-11');
insert into user (username, school_id, password, first_name, last_name, email, phone, street_name, street_num, birthdate) values ('nicko', '6e3w27za', '5upVSBxBrK', 'Babette', 'Windress', 'bwindress1o@yandex.ru', 9915484704, 'Maywood', 90, '1946-05-05');
insert into user (username, school_id, password, first_name, last_name, email, phone, street_name, street_num, birthdate) values ('jenny', 'l0xrbdy6', 'M1IlWAxBs', 'Miran', 'Allabush', 'mallabush1p@reuters.com', 4871677839, 'Lerdahl', 29, '1985-11-18');
insert into user (username, school_id, password, first_name, last_name, email, phone, street_name, street_num, birthdate) values ('larry', '6e3w27za', 'v2xUR0g8eHx', 'Marianne', 'Lucken', 'mlucken1q@europa.eu', 6598197065, 'Shoshone', 68, '1983-05-08');
insert into user (username, school_id, password, first_name, last_name, email, phone, street_name, street_num, birthdate) values ('kevin', '6e3w27za', 'ObDrM96YVADS', 'Mord', 'Witch', 'mwitch1r@acquirethisname.com', 5781450804, 'Corben', 37, '1987-02-12');
insert into user (username, school_id, password, first_name, last_name, email, phone, street_name, street_num, birthdate) values ('megan', 'l0xrbdy6', 'pAz4ueupwQu', 'Chad', 'Faltin', 'cfaltin1t@japanpost.jp', 6354065639, 'Surrey', 68, '1966-05-08');
insert into user (username, school_id, password, first_name, last_name, email, phone, street_name, street_num, birthdate) values ('paul', '0p8ju3vq', 'QiE7gY', 'Krishnah', 'Thraves', 'kthraves1v@tumblr.com', 9330945133, 'Birchwood', 60, '1956-09-22');
insert into user (username, school_id, password, first_name, last_name, email, phone, street_name, street_num, birthdate) values ('jason', 'cbnx7ywj', 'KBU0Gp8Bih', 'Mauricio', 'Latter', 'mlatter1w@cnn.com', 8062839684, 'Harper', 47, '1949-08-16');
insert into user (username, school_id, password, first_name, last_name, email, phone, street_name, street_num, birthdate) values ('kelly', '0p8ju3vq', '4G9zFm18Eut', 'Gustavo', 'Butteris', 'gbutteris1x@disqus.com', 6028382335, 'Talisman', 44, '2011-05-21');
insert into user (username, school_id, password, first_name, last_name, email, phone, street_name, street_num, birthdate) values ('linda', 'cg4o9lmy' , 'bjf9Xnfg', 'Michal', 'Penritt', 'mpenritt1y@histats.com', 9648929178, 'Stuart', 24, '1966-03-28');


#students triggers

delimiter //
create trigger set_student_can_rent_and_can_reserve
after insert on students
for each row
begin
update user set can_rent = 2 where username=new.username;
update user set can_reserve = 2 where username=new.username;
end
//
delimiter ;

#students events

create event update_can_rent_and_reserve_students
on schedule every 7 day starts current_timestamp do
update user u join students s on s.username = u.username set u.can_rent = 2, u.can_reserve=2;

#students populate

insert into students (username, class_num, class_grade, class_tier) values ('oscar', 3, 3, 'highschool');
insert into students (username, class_num, class_grade, class_tier) values ('laura', 1, 2, 'primary school');
insert into students (username, class_num, class_grade, class_tier) values ('peter', 1, 2, 'primary school');
insert into students (username, class_num, class_grade, class_tier) values ('mark', 4, 2, 'highschool');
insert into students (username, class_num, class_grade, class_tier) values ('leah', 2, 2, 'primary school');
insert into students (username, class_num, class_grade, class_tier) values ('rachel', 5, 3, 'primary school');
insert into students (username, class_num, class_grade, class_tier) values ('kimberly', 2, 3, 'primary school');
insert into students (username, class_num, class_grade, class_tier) values ('robert', 4, 3, 'highschool');
insert into students (username, class_num, class_grade, class_tier) values ('nathan', 1, 2, 'junior highschool');
insert into students (username, class_num, class_grade, class_tier) values ('michael', 3, 2, 'junior highschool');
insert into students (username, class_num, class_grade, class_tier) values ('celly', 1, 3, 'highschool');
insert into students (username, class_num, class_grade, class_tier) values ('jackson', 4, 2, 'primary school');
insert into students (username, class_num, class_grade, class_tier) values ('janedoe', 3, 3, 'highschool');
insert into students (username, class_num, class_grade, class_tier) values ('matthew', 5, 3, 'primary school');
insert into students (username, class_num, class_grade, class_tier) values ('rachell', 2, 1, 'primary school');
insert into students (username, class_num, class_grade, class_tier) values ('natallie', 4, 3, 'highschool');
insert into students (username, class_num, class_grade, class_tier) values ('lissa', 5, 2, 'highschool');
insert into students (username, class_num, class_grade, class_tier) values ('rebecca', 2, 1, 'primary school');
insert into students (username, class_num, class_grade, class_tier) values ('logan', 3, 1, 'highschool');
insert into students (username, class_num, class_grade, class_tier) values ('migel', 2, 1, 'primary school');
insert into students (username, class_num, class_grade, class_tier) values ('lance', 5, 1, 'primary school');
insert into students (username, class_num, class_grade, class_tier) values ('oscar69', 2, 1, 'highschool');
insert into students (username, class_num, class_grade, class_tier) values ('laurel', 4, 2, 'primary school');
insert into students (username, class_num, class_grade, class_tier) values ('natalie', 4, 3, 'highschool');
insert into students (username, class_num, class_grade, class_tier) values ('donkeykong', 4, 3, 'primary school');
insert into students (username, class_num, class_grade, class_tier) values ('lucas', 3, 2, 'primary school');
insert into students (username, class_num, class_grade, class_tier) values ('jessicca', 1, 1, 'junior highschool');
insert into students (username, class_num, class_grade, class_tier) values ('oliver', 3, 1, 'junior highschool');
insert into students (username, class_num, class_grade, class_tier) values ('olivia', 3, 1, 'primary school');
insert into students (username, class_num, class_grade, class_tier) values ('melissa', 4, 1, 'junior highschool');
insert into students (username, class_num, class_grade, class_tier) values ('kimber', 2, 3, 'junior highschool');
insert into students (username, class_num, class_grade, class_tier) values ('nick', 5, 1, 'junior highschool');
insert into students (username, class_num, class_grade, class_tier) values ('user123', 1, 3, 'highschool');
insert into students (username, class_num, class_grade, class_tier) values ('patrick', 4, 2, 'junior highschool');
insert into students (username, class_num, class_grade, class_tier) values ('lisasa', 3, 3, 'junior highschool');
insert into students (username, class_num, class_grade, class_tier) values ('ryan', 5, 2, 'primary school');
insert into students (username, class_num, class_grade, class_tier) values ('rebbecca', 5, 3, 'primary school');
insert into students (username, class_num, class_grade, class_tier) values ('kati', 1, 3, 'junior highschool');
insert into students (username, class_num, class_grade, class_tier) values ('roberto', 2, 2, 'junior highschool');
insert into students (username, class_num, class_grade, class_tier) values ('janedore', 4, 1, 'junior highschool');
insert into students (username, class_num, class_grade, class_tier) values ('jimy', 4, 2, 'primary school');
insert into students (username, class_num, class_grade, class_tier) values ('liza', 1, 1, 'highschool');
insert into students (username, class_num, class_grade, class_tier) values ('nathan_drake', 2, 1, 'junior highschool');
insert into students (username, class_num, class_grade, class_tier) values ('jasson', 1, 2, 'junior highschool');
insert into students (username, class_num, class_grade, class_tier) values ('paulaner', 3, 2, 'highschool');
insert into students (username, class_num, class_grade, class_tier) values ('luke', 2, 3, 'junior highschool');
insert into students (username, class_num, class_grade, class_tier) values ('paige', 3, 2, 'junior highschool');
insert into students (username, class_num, class_grade, class_tier) values ('nicko', 5, 3, 'primary school');
insert into students (username, class_num, class_grade, class_tier) values ('jenny', 4, 1, 'highschool');
insert into students (username, class_num, class_grade, class_tier) values ('larry', 4, 3, 'primary school');
insert into students (username, class_num, class_grade, class_tier) values ('kevin', 2, 3, 'junior highschool');
insert into students (username, class_num, class_grade, class_tier) values ('paul', 2, 1, 'primary school');
insert into students (username, class_num, class_grade, class_tier) values ('jason', 4, 3, 'junior highschool');

#professors create



#professors triggers


delimiter //
create trigger set_professor_can_rent_and_can_reserve
after insert on professors
for each row
if (select can_rent from user where username = new.username) = 0 then
update user set can_rent = 1 where username=new.username;
update user set can_reserve = 1 where username=new.username;
end if;
//
delimiter ;

#professors events

create event update_can_rent_and_reserve_professors
on schedule every 7 day starts current_timestamp do
update user u join professors p on p.username = u.username set u.can_rent = 1, u.can_reserve=1;

#professors populate

insert into professors (username, specialty) values ('kattie', 'physics');
insert into professors (username, specialty) values ('karla', 'history');
insert into professors (username, specialty) values ('just_in', 'history');
insert into professors (username, specialty) values ('kattie', 'arts');
insert into professors (username, specialty) values ('jessica_p', 'gymnast');
insert into professors (username, specialty) values ('jessica_p', 'linguistics');
insert into professors (username, specialty) values ('kattie', 'linguistics');
insert into professors (username, specialty) values ('johndoe', 'physics');
insert into professors (username, specialty) values ('johndore', 'maths');
insert into professors (username, specialty) values ('markos', 'arts');
insert into professors (username, specialty) values ('karla', 'maths');
insert into professors (username, specialty) values ('linda', 'physics');
insert into professors (username, specialty) values ('kelly', 'physics');
insert into professors (username, specialty) values ('megan', 'linguistics');


#books populate

insert into books (isbn, title, publisher, pages, summary, language) values ('2708534695379', 'Profit-focused background circuit', 'Babbleopia', 2351, 'Praesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio.', 'Portuguese');
insert into books (isbn, title, publisher, pages, summary, language) values ('1384775782469', 'Expanded optimal methodology', 'Twimbo', 1985, 'In quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.', 'Thai');
insert into books (isbn, title, publisher, pages, summary, language) values ('9966242290758', 'Exclusive real-time utilisation', 'Blogspan', 3372, 'Nulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi.', 'Persian');
insert into books (isbn, title, publisher, pages, summary, language) values ('0809784979155', 'Up-sized needs-based hub', 'Yambee', 465, 'Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque.', 'Tsonga');
insert into books (isbn, title, publisher, pages, summary, language) values ('9401496029041', 'Robust disintermediate time-frame', 'Oyoyo', 4438, 'Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros.', 'Tswana');
insert into books (isbn, title, publisher, pages, summary, language) values ('3023607894971', 'Managed maximized matrices', 'Photobean', 1645, 'In quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.', 'Italian');
insert into books (isbn, title, publisher, pages, summary, language) values ('5637151250435', 'Re-contextualized next generation software', 'Ntags', 1288, 'Nulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi.', 'Guarani');
insert into books (isbn, title, publisher, pages, summary, language) values ('3801803376307', 'Fundamental methodical open architecture', 'Kare', 2770, 'Nulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi.', 'Indonesian');
insert into books (isbn, title, publisher, pages, summary, language) values ('0311999229072', 'Customizable bottom-line attitude', 'Edgepulse', 425, 'Nullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris.', 'Zulu');
insert into books (isbn, title, publisher, pages, summary, language) values ('6886890911303', 'Right-sized bottom-line attitude', 'Centimia', 898, 'Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl.', 'Thai');
insert into books (isbn, title, publisher, pages, summary, language) values ('1880989916727', 'Realigned zero administration emulation', 'Demizz', 2700, 'In sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.', 'Zulu');
insert into books (isbn, title, publisher, pages, summary, language) values ('0674909573292', 'Intuitive executive moderator', 'Riffwire', 2164, 'Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat.', 'Dhivehi');
insert into books (isbn, title, publisher, pages, summary, language) values ('3497871017792', 'Innovative grid-enabled matrix', 'Minyx', 3374, 'Morbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis.', 'Assamese');
insert into books (isbn, title, publisher, pages, summary, language) values ('4337174964178', 'Enhanced maximized leverage', 'Dazzlesphere', 2760, 'Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat.', 'Telugu');
insert into books (isbn, title, publisher, pages, summary, language) values ('3233359903008', 'Managed intermediate attitude', 'Omba', 4692, 'Fusce consequat. Nulla nisl. Nunc nisl.', 'Maori');
insert into books (isbn, title, publisher, pages, summary, language) values ('1849562027959', 'Implemented content-based analyzer', 'Zoomzone', 2377, 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin risus. Praesent lectus.', 'Marathi');
insert into books (isbn, title, publisher, pages, summary, language) values ('2605933464940', 'Configurable value-added artificial intelligence', 'Zoovu', 1929, 'Praesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio.', 'Swahili');
insert into books (isbn, title, publisher, pages, summary, language) values ('6665316998471', 'Centralized zero defect contingency', 'Thoughtblab', 3161, 'Proin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.', 'Hiri Motu');
insert into books (isbn, title, publisher, pages, summary, language) values ('3434457249094', 'Horizontal 4th generation model', 'Tambee', 567, 'Fusce consequat. Nulla nisl. Nunc nisl.', 'Catalan');
insert into books (isbn, title, publisher, pages, summary, language) values ('9401079679717', 'Cross-group value-added instruction set', 'Linkbridge', 976, 'Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est.', 'Papiamento');
insert into books (isbn, title, publisher, pages, summary, language) values ('6282535018808', 'Re-contextualized zero administration process improvement', 'Skimia', 241, 'In hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo.', 'Dzongkha');
insert into books (isbn, title, publisher, pages, summary, language) values ('9512116594361', 'Ergonomic client-server system engine', 'Myworks', 4249, 'Sed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus.', 'Malayalam');
insert into books (isbn, title, publisher, pages, summary, language) values ('0307793378720', 'User-centric 24 hour service-desk', 'Thoughtmix', 1458, 'Proin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.', 'Haitian Creole');
insert into books (isbn, title, publisher, pages, summary, language) values ('6088775503660', 'Team-oriented object-oriented algorithm', 'Devshare', 4054, 'Sed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus.', 'Luxembourgish');
insert into books (isbn, title, publisher, pages, summary, language) values ('4825391130222', 'Compatible tangible strategy', 'Shufflebeat', 1931, 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin risus. Praesent lectus.', 'Hebrew');
insert into books (isbn, title, publisher, pages, summary, language) values ('4531472543465', 'Persevering 3rd generation access', 'Skalith', 400, 'Morbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis.', 'Mongolian');
insert into books (isbn, title, publisher, pages, summary, language) values ('8630212258348', 'Fully-configurable asymmetric software', 'Youbridge', 358, 'Fusce consequat. Nulla nisl. Nunc nisl.', 'Finnish');
insert into books (isbn, title, publisher, pages, summary, language) values ('3054755583226', 'Integrated coherent protocol', 'Twitterwire', 3089, 'Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque.', 'Tswana');
insert into books (isbn, title, publisher, pages, summary, language) values ('6424359997295', 'Realigned eco-centric infrastructure', 'Yadel', 445, 'Maecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem. Quisque ut erat.', 'Telugu');
insert into books (isbn, title, publisher, pages, summary, language) values ('6941503348774', 'Extended tertiary core', 'Plajo', 804, 'Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum.', 'Khmer');
insert into books (isbn, title, publisher, pages, summary, language) values ('4157469723312', 'Virtual high-level groupware', 'Eare', 3513, 'Phasellus in felis. Donec semper sapien a libero. Nam dui.', 'Armenian');
insert into books (isbn, title, publisher, pages, summary, language) values ('5453558852834', 'Persistent holistic policy', 'Fivebridge', 3835, 'Fusce consequat. Nulla nisl. Nunc nisl.', 'Lithuanian');
insert into books (isbn, title, publisher, pages, summary, language) values ('5674805785564', 'Down-sized content-based secured line', 'Minyx', 1159, 'Suspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst.', 'Japanese');
insert into books (isbn, title, publisher, pages, summary, language) values ('5998893066103', 'Progressive static function', 'Twimm', 4121, 'Pellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus.', 'Guaraní');
insert into books (isbn, title, publisher, pages, summary, language) values ('5624524684158', 'Mandatory multi-state function', 'Dynabox', 3440, 'Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque.', 'French');
insert into books (isbn, title, publisher, pages, summary, language) values ('5340523327623', 'Optional tertiary installation', 'Meeveo', 1358, 'Integer ac leo. Pellentesque ultrices mattis odio. Donec vitae nisi.', 'Filipino');
insert into books (isbn, title, publisher, pages, summary, language) values ('9271162786673', 'Open-source systemic encoding', 'Edgeify', 2336, 'Nullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris.', 'Quechua');
insert into books (isbn, title, publisher, pages, summary, language) values ('6520474320230', 'Pre-emptive national superstructure', 'Pixope', 4292, 'Integer ac leo. Pellentesque ultrices mattis odio. Donec vitae nisi.', 'Italian');
insert into books (isbn, title, publisher, pages, summary, language) values ('2041197881464', 'Synergized value-added hardware', 'Eayo', 3452, 'Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti.', 'Chinese');
insert into books (isbn, title, publisher, pages, summary, language) values ('4551192150404', 'Switchable motivating model', 'Jabbersphere', 4139, 'Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem.', 'Bosnian');
insert into books (isbn, title, publisher, pages, summary, language) values ('2102821942056', 'Visionary radical archive', 'Youtags', 3163, 'Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus.', 'Romanian');
insert into books (isbn, title, publisher, pages, summary, language) values ('1887823406832', 'Integrated asymmetric capacity', 'Zoomlounge', 3984, 'Fusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem.', 'Swedish');
insert into books (isbn, title, publisher, pages, summary, language) values ('0597909047825', 'Open-source human-resource circuit', 'Lajo', 1121, 'Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti.', 'Macedonian');
insert into books (isbn, title, publisher, pages, summary, language) values ('3646938530520', 'Networked reciprocal analyzer', 'Oodoo', 4221, 'Cras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque.', 'Bislama');
insert into books (isbn, title, publisher, pages, summary, language) values ('1089728812164', 'Optimized full-range framework', 'Ailane', 3230, 'Nam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla. Sed vel enim sit amet nunc viverra dapibus. Nulla suscipit ligula in lacus.', 'Sotho');
insert into books (isbn, title, publisher, pages, summary, language) values ('7355800064865', 'Programmable client-driven interface', 'Feednation', 4277, 'Pellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus.', 'Dhivehi');
insert into books (isbn, title, publisher, pages, summary, language) values ('4409786147582', 'Profound 3rd generation time-frame', 'Linklinks', 1131, 'Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl.', 'Kyrgyz');
insert into books (isbn, title, publisher, pages, summary, language) values ('3697186816645', 'Mandatory static process improvement', 'Yakidoo', 134, 'Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat.', 'Thai');
insert into books (isbn, title, publisher, pages, summary, language) values ('5775360868585', 'Versatile upward-trending process improvement', 'Kwideo', 3456, 'Phasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum.', 'Pashto');
insert into books (isbn, title, publisher, pages, summary, language) values ('5258929471531', 'Optimized well-modulated moderator', 'Brainsphere', 1563, 'Sed ante. Vivamus tortor. Duis mattis egestas metus.', 'Tetum');
insert into books (isbn, title, publisher, pages, summary, language) values ('0647432491033', 'Innovative real-time leverage', 'Dynabox', 1402, 'Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit.', 'Gujarati');
insert into books (isbn, title, publisher, pages, summary, language) values ('7615837417331', 'Function-based directional model', 'Mynte', 1583, 'Proin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.', 'Arabic');
insert into books (isbn, title, publisher, pages, summary, language) values ('0277636020622', 'Compatible cohesive artificial intelligence', 'Agivu', 2597, 'Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl.', 'Māori');
insert into books (isbn, title, publisher, pages, summary, language) values ('7801913419425', 'Robust web-enabled system engine', 'Yotz', 1316, 'Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti.', 'Estonian');
insert into books (isbn, title, publisher, pages, summary, language) values ('3920489958474', 'Streamlined context-sensitive contingency', 'Feedfish', 180, 'Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.', 'Macedonian');
insert into books (isbn, title, publisher, pages, summary, language) values ('0413566995950', 'Open-architected fresh-thinking support', 'Blogtags', 985, 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin risus. Praesent lectus.', 'Dari');
insert into books (isbn, title, publisher, pages, summary, language) values ('4674500211287', 'Monitored asynchronous project', 'Flipstorm', 1096, 'Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit.', 'Punjabi');
insert into books (isbn, title, publisher, pages, summary, language) values ('1969663551731', 'Programmable regional product', 'Wordtune', 1521, 'Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus.', 'Kurdish');
insert into books (isbn, title, publisher, pages, summary, language) values ('1187226705882', 'Programmable holistic productivity', 'Flashpoint', 1900, 'Etiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem.', 'Finnish');
insert into books (isbn, title, publisher, pages, summary, language) values ('9129284454744', 'Re-engineered logistical website', 'Yambee', 4704, 'In quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.', 'Sotho');
insert into books (isbn, title, publisher, pages, summary, language) values ('5741523753966', 'Enterprise-wide scalable framework', 'Kazu', 4450, 'Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit.', 'Tok Pisin');
insert into books (isbn, title, publisher, pages, summary, language) values ('4958732096270', 'Open-architected disintermediate frame', 'Twinte', 1927, 'Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl.', 'Kashmiri');
insert into books (isbn, title, publisher, pages, summary, language) values ('6518563396192', 'Diverse holistic hardware', 'Avavee', 387, 'In hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus.', 'Macedonian');
insert into books (isbn, title, publisher, pages, summary, language) values ('0170792598877', 'Ergonomic encompassing benchmark', 'Kazio', 439, 'Vestibulum quam sapien, varius ut, blandit non, interdum in, ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio. Curabitur convallis.', 'Malagasy');
insert into books (isbn, title, publisher, pages, summary, language) values ('6602753809677', 'Multi-lateral composite task-force', 'Ainyx', 2986, 'Nulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi.', 'Somali');
insert into books (isbn, title, publisher, pages, summary, language) values ('4044884221391', 'Streamlined neutral conglomeration', 'Ntag', 3007, 'Phasellus in felis. Donec semper sapien a libero. Nam dui.', 'Yiddish');
insert into books (isbn, title, publisher, pages, summary, language) values ('0625623177253', 'Mandatory homogeneous matrices', 'Kwimbee', 1516, 'Curabitur at ipsum ac tellus semper interdum. Mauris ullamcorper purus sit amet nulla. Quisque arcu libero, rutrum ac, lobortis vel, dapibus at, diam.', 'Papiamento');
insert into books (isbn, title, publisher, pages, summary, language) values ('7466845973946', 'Cloned transitional groupware', 'Yozio', 2006, 'Suspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst.', 'Japanese');
insert into books (isbn, title, publisher, pages, summary, language) values ('5125208224630', 'Extended homogeneous website', 'Quatz', 1165, 'Integer ac leo. Pellentesque ultrices mattis odio. Donec vitae nisi.', 'Zulu');
insert into books (isbn, title, publisher, pages, summary, language) values ('8562425840137', 'Secured optimizing hierarchy', 'Wordpedia', 1206, 'Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque.', 'Ndebele');
insert into books (isbn, title, publisher, pages, summary, language) values ('9690878171501', 'Ergonomic reciprocal methodology', 'Gigashots', 1556, 'Praesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio.', 'Papiamento');
insert into books (isbn, title, publisher, pages, summary, language) values ('9864251582965', 'Progressive dedicated ability', 'Tazzy', 596, 'Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl.', 'Bosnian');
insert into books (isbn, title, publisher, pages, summary, language) values ('7525461191200', 'Total 24/7 encryption', 'Twimm', 3220, 'Nulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi.', 'Swedish');
insert into books (isbn, title, publisher, pages, summary, language) values ('0299456389217', 'Networked user-facing open architecture', 'Linktype', 145, 'Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit.', 'Romanian');
insert into books (isbn, title, publisher, pages, summary, language) values ('4350773692254', 'Realigned asynchronous support', 'Yodel', 4794, 'Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl.', 'Lao');
insert into books (isbn, title, publisher, pages, summary, language) values ('3927140461349', 'Progressive zero defect policy', 'Bluezoom', 1061, 'Fusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem.', 'Guaraní');
insert into books (isbn, title, publisher, pages, summary, language) values ('9989690093308', 'Front-line 24/7 Graphic Interface', 'Trudoo', 487, 'Phasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum.', 'Tamil');
insert into books (isbn, title, publisher, pages, summary, language) values ('8647069209643', 'Intuitive foreground intranet', 'Divape', 1997, 'Fusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem.', 'Assamese');
insert into books (isbn, title, publisher, pages, summary, language) values ('1531312766975', 'Object-based directional open system', 'Topiczoom', 4543, 'Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.', 'Fijian');
insert into books (isbn, title, publisher, pages, summary, language) values ('6273014587602', 'Digitized client-server process improvement', 'Meezzy', 2298, 'Praesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio.', 'Kurdish');
insert into books (isbn, title, publisher, pages, summary, language) values ('1365767471714', 'Ameliorated modular challenge', 'Photobean', 2970, 'In sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.', 'Dzongkha');
insert into books (isbn, title, publisher, pages, summary, language) values ('9773223347634', 'Intuitive clear-thinking moderator', 'LiveZ', 1085, 'Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.', 'Amharic');
insert into books (isbn, title, publisher, pages, summary, language) values ('2946838396846', 'Organized composite contingency', 'Skibox', 2293, 'Sed ante. Vivamus tortor. Duis mattis egestas metus.', 'Oriya');
insert into books (isbn, title, publisher, pages, summary, language) values ('9109476387742', 'Optional non-volatile concept', 'Meejo', 3133, 'Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti.', 'Hiri Motu');
insert into books (isbn, title, publisher, pages, summary, language) values ('2239429838032', 'Expanded leading edge analyzer', 'Jabbercube', 1638, 'Suspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst.', 'West Frisian');
insert into books (isbn, title, publisher, pages, summary, language) values ('8498808515852', 'Optimized intermediate Graphical User Interface', 'Flipbug', 1467, 'Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum.', 'Latvian');
insert into books (isbn, title, publisher, pages, summary, language) values ('0895604179995', 'Phased transitional open system', 'Skimia', 558, 'Phasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum.', 'Persian');
insert into books (isbn, title, publisher, pages, summary, language) values ('1377503859248', 'Fundamental bandwidth-monitored benchmark', 'Shuffletag', 3548, 'Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit.', 'Thai');
insert into books (isbn, title, publisher, pages, summary, language) values ('3559809039053', 'Cloned object-oriented encryption', 'Skimia', 1851, 'Nulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi.', 'New Zealand Sign Language');
insert into books (isbn, title, publisher, pages, summary, language) values ('7182435079906', 'Virtual uniform hardware', 'Zoozzy', 2390, 'Sed ante. Vivamus tortor. Duis mattis egestas metus.', 'Armenian');
insert into books (isbn, title, publisher, pages, summary, language) values ('7835367353251', 'Fundamental optimal synergy', 'Jamia', 2977, 'Sed ante. Vivamus tortor. Duis mattis egestas metus.', 'Pashto');
insert into books (isbn, title, publisher, pages, summary, language) values ('9164284517909', 'Robust background migration', 'Shufflebeat', 1301, 'Aenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.', 'Swati');
insert into books (isbn, title, publisher, pages, summary, language) values ('7264167440543', 'Open-architected logistical flexibility', 'Skipfire', 3522, 'In sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.', 'Spanish');
insert into books (isbn, title, publisher, pages, summary, language) values ('6827739070212', 'Multi-tiered leading edge moderator', 'DabZ', 4900, 'Sed ante. Vivamus tortor. Duis mattis egestas metus.', 'Albanian');
insert into books (isbn, title, publisher, pages, summary, language) values ('6413864068205', 'Business-focused bifurcated portal', 'Linklinks', 3398, 'Phasellus in felis. Donec semper sapien a libero. Nam dui.', 'Pashto');
insert into books (isbn, title, publisher, pages, summary, language) values ('5965782931947', 'Robust systemic info-mediaries', 'Skibox', 623, 'Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum.', 'Haitian Creole');
insert into books (isbn, title, publisher, pages, summary, language) values ('9675749676736', 'Progressive methodical open system', 'Quamba', 2597, 'Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus.', 'Northern Sotho');
insert into books (isbn, title, publisher, pages, summary, language) values ('1513750247136', 'Fully-configurable heuristic orchestration', 'Quinu', 285, 'In quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.', 'Yiddish');
insert into books (isbn, title, publisher, pages, summary, language) values ('8759116382848', 'Persevering next generation synergy', 'Avaveo', 175, 'Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.', 'Dzongkha');
insert into books (isbn, title, publisher, pages, summary, language) values ('0698870960726', 'Networked uniform website', 'Jetwire', 2726, 'In sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.', 'Tok Pisin');
insert into books (isbn, title, publisher, pages, summary, language) values ('5861743523626', 'platea dictumst maecenas ut', 'Veum-Cassin', 2394, 'Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero. Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh. In quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.', 'Thai');
insert into books (isbn, title, publisher, pages, summary, language) values ('0829699543148', 'proin', 'Boyer and Sons', 1135, 'Integer ac leo. Pellentesque ultrices mattis odio. Donec vitae nisi. Nam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla. Sed vel enim sit amet nunc viverra dapibus. Nulla suscipit ligula in lacus. Curabitur at ipsum ac tellus semper interdum. Mauris ullamcorper purus sit amet nulla. Quisque arcu libero, rutrum ac, lobortis vel, dapibus at, diam.', 'Sotho');
insert into books (isbn, title, publisher, pages, summary, language) values ('1038187673218', 'eget', 'Mraz, Feeney and Weissnat', 2831, 'Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque. Quisque porta volutpat erat.', 'Tok Pisin');
insert into books (isbn, title, publisher, pages, summary, language) values ('9795278987571', 'sit amet sapien', 'Wuckert Inc', 174, 'Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero. Nullam sit amet turpis elementum ligula vehicula consequat.', 'Malay');
insert into books (isbn, title, publisher, pages, summary, language) values ('8850267946453', 'magnis', 'Daniel Group', 2269, 'In quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.', 'Hindi');
insert into books (isbn, title, publisher, pages, summary, language) values ('9759345048100', 'quam', 'Bashirian, Bailey and Skiles', 4909, 'Nulla tempus. Vivamus in felis eu sapien cursus vestibulum. Proin eu mi. Nulla ac enim.', 'Malayalam');
insert into books (isbn, title, publisher, pages, summary, language) values ('6347097825249', 'leo pellentesque ultrices mattis odio', 'Grant, Schroeder and Dibbert', 3844, 'Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros. Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat.', 'Irish Gaelic');
insert into books (isbn, title, publisher, pages, summary, language) values ('9387577078018', 'bibendum morbi non quam', 'Cole LLC', 4823, 'Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero. Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh. In quis justo.', 'Dari');
insert into books (isbn, title, publisher, pages, summary, language) values ('8664568623869', 'sapien in sapien iaculis congue', 'King Group', 1747, 'Nulla facilisi. Cras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque. Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus. Phasellus in felis.', 'Estonian');
insert into books (isbn, title, publisher, pages, summary, language) values ('5487578195084', 'platea dictumst etiam', 'Homenick-Toy', 1942, 'Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti. Nullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris. Morbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis. Fusce posuere felis sed lacus.', 'Tsonga');
insert into books (isbn, title, publisher, pages, summary, language) values ('1734123385747', 'luctus ultricies eu nibh', 'Osinski-Jerde', 1025, 'Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl. Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum. Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est. Phasellus sit amet erat.', 'Spanish');
insert into books (isbn, title, publisher, pages, summary, language) values ('5317456889143', 'eget tempus vel', 'Klocko-Marvin', 399, 'Vestibulum quam sapien, varius ut, blandit non, interdum in, ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio. Curabitur convallis. Duis consequat dui nec nisi volutpat eleifend. Donec ut dolor. Morbi vel lectus in quam fringilla rhoncus. Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero.', 'Burmese');
insert into books (isbn, title, publisher, pages, summary, language) values ('1559123232579', 'sit amet sem', 'Boyle-Glover', 2255, 'Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est. Phasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum. Proin eu mi.', 'Somali');
insert into books (isbn, title, publisher, pages, summary, language) values ('0375989720378', 'dolor sit amet consectetuer adipiscing', 'Jenkins-Russel', 1002, 'Pellentesque ultrices mattis odio. Donec vitae nisi. Nam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla. Sed vel enim sit amet nunc viverra dapibus. Nulla suscipit ligula in lacus. Curabitur at ipsum ac tellus semper interdum. Mauris ullamcorper purus sit amet nulla. Quisque arcu libero, rutrum ac, lobortis vel, dapibus at, diam.', 'Persian');
insert into books (isbn, title, publisher, pages, summary, language) values ('6045660870888', 'ante', 'Simonis-Schaden', 143, 'Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat. Praesent blandit.', 'Malayalam');
insert into books (isbn, title, publisher, pages, summary, language) values ('1102082303420', 'quis turpis sed', 'Koelpin Group', 852, 'Donec posuere metus vitae ipsum. Aliquam non mauris. Morbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis.', 'Japanese');
insert into books (isbn, title, publisher, pages, summary, language) values ('1465674268159', 'quisque porta volutpat erat quisque', 'Rau-Stark', 2546, 'Quisque ut erat. Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem. Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat. Praesent blandit.', 'Punjabi');
insert into books (isbn, title, publisher, pages, summary, language) values ('5752558607210', 'in felis', 'Morar, Franecki and Parisian', 2694, 'Aliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis. Sed ante. Vivamus tortor. Duis mattis egestas metus. Aenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh. Quisque id justo sit amet sapien dignissim vestibulum.', 'Northern Sotho');
insert into books (isbn, title, publisher, pages, summary, language) values ('0314499954903', 'nulla nisl nunc', 'Hodkiewicz, Upton and Beier', 1463, 'Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat. In congue.', 'Arabic');
insert into books (isbn, title, publisher, pages, summary, language) values ('6410851116606', 'dictumst maecenas ut', 'Boyer-Wisoky', 1853, 'Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh. In quis justo.', 'Punjabi');
update books set image='https://static-cse.canva.com/blob/921475/PinkandBlackGrungeCreativeWattpadBookCover.jpg';  


#books_category populate

insert into books_category (isbn, category) values ('2708534695379', 'history');
insert into books_category (isbn, category) values ('1384775782469', 'biography');
insert into books_category (isbn, category) values ('9966242290758', 'scifi');
insert into books_category (isbn, category) values ('0809784979155', 'horror');
insert into books_category (isbn, category) values ('9401496029041', 'comic');
insert into books_category (isbn, category) values ('3023607894971', 'scientific');
insert into books_category (isbn, category) values ('5637151250435', 'poetry');
insert into books_category (isbn, category) values ('3801803376307', 'romantic');
insert into books_category (isbn, category) values ('0311999229072', 'novel');
insert into books_category (isbn, category) values ('6886890911303', 'drama');
insert into books_category (isbn, category) values ('1880989916727', 'comedy');
insert into books_category (isbn, category) values ('0674909573292', 'history');
insert into books_category (isbn, category) values ('3497871017792', 'biography');
insert into books_category (isbn, category) values ('4337174964178', 'scifi');
insert into books_category (isbn, category) values ('3233359903008', 'horror');
insert into books_category (isbn, category) values ('1849562027959', 'comic');
insert into books_category (isbn, category) values ('2605933464940', 'scientific');
insert into books_category (isbn, category) values ('6665316998471', 'poetry');
insert into books_category (isbn, category) values ('3434457249094', 'romantic');
insert into books_category (isbn, category) values ('9401079679717', 'novel');
insert into books_category (isbn, category) values ('6282535018808', 'drama');
insert into books_category (isbn, category) values ('9512116594361', 'comedy');
insert into books_category (isbn, category) values ('0307793378720', 'history');
insert into books_category (isbn, category) values ('6088775503660', 'biography');
insert into books_category (isbn, category) values ('4825391130222', 'scifi');
insert into books_category (isbn, category) values ('4531472543465', 'horror');
insert into books_category (isbn, category) values ('8630212258348', 'comic');
insert into books_category (isbn, category) values ('3054755583226', 'scientific');
insert into books_category (isbn, category) values ('6424359997295', 'poetry');
insert into books_category (isbn, category) values ('6941503348774', 'romantic');
insert into books_category (isbn, category) values ('4157469723312', 'novel');
insert into books_category (isbn, category) values ('5453558852834', 'drama');
insert into books_category (isbn, category) values ('5674805785564', 'comedy');
insert into books_category (isbn, category) values ('5998893066103', 'history');
insert into books_category (isbn, category) values ('5624524684158', 'biography');
insert into books_category (isbn, category) values ('5340523327623', 'scifi');
insert into books_category (isbn, category) values ('9271162786673', 'horror');
insert into books_category (isbn, category) values ('6520474320230', 'comic');
insert into books_category (isbn, category) values ('2041197881464', 'scientific');
insert into books_category (isbn, category) values ('4551192150404', 'poetry');
insert into books_category (isbn, category) values ('2102821942056', 'romantic');
insert into books_category (isbn, category) values ('1887823406832', 'novel');
insert into books_category (isbn, category) values ('0597909047825', 'drama');
insert into books_category (isbn, category) values ('3646938530520', 'comedy');
insert into books_category (isbn, category) values ('1089728812164', 'history');
insert into books_category (isbn, category) values ('7355800064865', 'biography');
insert into books_category (isbn, category) values ('4409786147582', 'scifi');
insert into books_category (isbn, category) values ('3697186816645', 'horror');
insert into books_category (isbn, category) values ('5775360868585', 'comic');
insert into books_category (isbn, category) values ('5258929471531', 'scientific');
insert into books_category (isbn, category) values ('0647432491033', 'poetry');
insert into books_category (isbn, category) values ('7615837417331', 'romantic');
insert into books_category (isbn, category) values ('0277636020622', 'novel');
insert into books_category (isbn, category) values ('7801913419425', 'drama');
insert into books_category (isbn, category) values ('3920489958474', 'comedy');
insert into books_category (isbn, category) values ('0413566995950', 'history');
insert into books_category (isbn, category) values ('4674500211287', 'biography');
insert into books_category (isbn, category) values ('1969663551731', 'scifi');
insert into books_category (isbn, category) values ('1187226705882', 'horror');
insert into books_category (isbn, category) values ('9129284454744', 'comic');
insert into books_category (isbn, category) values ('5741523753966', 'scientific');
insert into books_category (isbn, category) values ('4958732096270', 'poetry');
insert into books_category (isbn, category) values ('6518563396192', 'romantic');
insert into books_category (isbn, category) values ('0170792598877', 'novel');
insert into books_category (isbn, category) values ('6602753809677', 'drama');
insert into books_category (isbn, category) values ('4044884221391', 'comedy');
insert into books_category (isbn, category) values ('0625623177253', 'history');
insert into books_category (isbn, category) values ('7466845973946', 'biography');
insert into books_category (isbn, category) values ('5125208224630', 'scifi');
insert into books_category (isbn, category) values ('8562425840137', 'horror');
insert into books_category (isbn, category) values ('9690878171501', 'comic');
insert into books_category (isbn, category) values ('9864251582965', 'scientific');
insert into books_category (isbn, category) values ('7525461191200', 'poetry');
insert into books_category (isbn, category) values ('0299456389217', 'romantic');
insert into books_category (isbn, category) values ('4350773692254', 'novel');
insert into books_category (isbn, category) values ('3927140461349', 'drama');
insert into books_category (isbn, category) values ('9989690093308', 'comedy');
insert into books_category (isbn, category) values ('8647069209643', 'history');
insert into books_category (isbn, category) values ('1531312766975', 'biography');
insert into books_category (isbn, category) values ('6273014587602', 'scifi');
insert into books_category (isbn, category) values ('1365767471714', 'horror');
insert into books_category (isbn, category) values ('9773223347634', 'comic');
insert into books_category (isbn, category) values ('2946838396846', 'scientific');
insert into books_category (isbn, category) values ('9109476387742', 'poetry');
insert into books_category (isbn, category) values ('2239429838032', 'romantic');
insert into books_category (isbn, category) values ('8498808515852', 'novel');
insert into books_category (isbn, category) values ('0895604179995', 'drama');
insert into books_category (isbn, category) values ('1377503859248', 'comedy');
insert into books_category (isbn, category) values ('3559809039053', 'history');
insert into books_category (isbn, category) values ('7182435079906', 'biography');
insert into books_category (isbn, category) values ('7835367353251', 'scifi');
insert into books_category (isbn, category) values ('9164284517909', 'horror');
insert into books_category (isbn, category) values ('7264167440543', 'comic');
insert into books_category (isbn, category) values ('6827739070212', 'scientific');
insert into books_category (isbn, category) values ('6413864068205', 'poetry');
insert into books_category (isbn, category) values ('5965782931947', 'romantic');
insert into books_category (isbn, category) values ('9675749676736', 'novel');
insert into books_category (isbn, category) values ('1513750247136', 'drama');
insert into books_category (isbn, category) values ('8759116382848', 'comedy');
insert into books_category (isbn, category) values ('0698870960726', 'history');
insert into books_category (isbn, category) values ('5861743523626', 'biography');
insert into books_category (isbn, category) values ('0829699543148', 'scifi');
insert into books_category (isbn, category) values ('1038187673218', 'horror');
insert into books_category (isbn, category) values ('9795278987571', 'comic');
insert into books_category (isbn, category) values ('8850267946453', 'scientific');
insert into books_category (isbn, category) values ('9759345048100', 'poetry');
insert into books_category (isbn, category) values ('6347097825249', 'romantic');
insert into books_category (isbn, category) values ('9387577078018', 'novel');
insert into books_category (isbn, category) values ('8664568623869', 'drama');
insert into books_category (isbn, category) values ('5487578195084', 'comedy');
insert into books_category (isbn, category) values ('1734123385747', 'history');
insert into books_category (isbn, category) values ('5317456889143', 'biography');
insert into books_category (isbn, category) values ('1559123232579', 'scifi');
insert into books_category (isbn, category) values ('0375989720378', 'horror');
insert into books_category (isbn, category) values ('6045660870888', 'comic');
insert into books_category (isbn, category) values ('1102082303420', 'scientific');
insert into books_category (isbn, category) values ('1465674268159', 'poetry');
insert into books_category (isbn, category) values ('5752558607210', 'romantic');
insert into books_category (isbn, category) values ('0314499954903', 'novel');
insert into books_category (isbn, category) values ('6410851116606', 'drama');
insert into books_category (isbn, category) values ('2708534695379', 'comedy');
insert into books_category (isbn, category) values ('1384775782469', 'history');
insert into books_category (isbn, category) values ('9966242290758', 'biography');
insert into books_category (isbn, category) values ('0809784979155', 'scifi');
insert into books_category (isbn, category) values ('9401496029041', 'horror');
insert into books_category (isbn, category) values ('3023607894971', 'comic');
insert into books_category (isbn, category) values ('5637151250435', 'scientific');
insert into books_category (isbn, category) values ('3801803376307', 'poetry');
insert into books_category (isbn, category) values ('0311999229072', 'romantic');
insert into books_category (isbn, category) values ('6886890911303', 'novel');
insert into books_category (isbn, category) values ('1880989916727', 'drama');
insert into books_category (isbn, category) values ('0674909573292', 'comedy');
insert into books_category (isbn, category) values ('3497871017792', 'history');
insert into books_category (isbn, category) values ('4337174964178', 'biography');
insert into books_category (isbn, category) values ('3233359903008', 'scifi');
insert into books_category (isbn, category) values ('1849562027959', 'horror');
insert into books_category (isbn, category) values ('2605933464940', 'comic');
insert into books_category (isbn, category) values ('6665316998471', 'scientific');
insert into books_category (isbn, category) values ('3434457249094', 'poetry');
insert into books_category (isbn, category) values ('9401079679717', 'romantic');
insert into books_category (isbn, category) values ('6282535018808', 'novel');
insert into books_category (isbn, category) values ('9512116594361', 'drama');
insert into books_category (isbn, category) values ('0307793378720', 'comedy');
insert into books_category (isbn, category) values ('6088775503660', 'history');
insert into books_category (isbn, category) values ('4825391130222', 'biography');
insert into books_category (isbn, category) values ('4531472543465', 'scifi');
insert into books_category (isbn, category) values ('8630212258348', 'horror');
insert into books_category (isbn, category) values ('3054755583226', 'comic');
insert into books_category (isbn, category) values ('6424359997295', 'scientific');
insert into books_category (isbn, category) values ('6941503348774', 'poetry');
insert into books_category (isbn, category) values ('4157469723312', 'romantic');
insert into books_category (isbn, category) values ('5453558852834', 'novel');
insert into books_category (isbn, category) values ('5674805785564', 'drama');
insert into books_category (isbn, category) values ('5998893066103', 'comedy');
insert into books_category (isbn, category) values ('5624524684158', 'history');
insert into books_category (isbn, category) values ('5340523327623', 'biography');
insert into books_category (isbn, category) values ('9271162786673', 'scifi');
insert into books_category (isbn, category) values ('6520474320230', 'horror');
insert into books_category (isbn, category) values ('2041197881464', 'comic');
insert into books_category (isbn, category) values ('4551192150404', 'scientific');
insert into books_category (isbn, category) values ('2102821942056', 'poetry');
insert into books_category (isbn, category) values ('1887823406832', 'romantic');
insert into books_category (isbn, category) values ('0597909047825', 'novel');
insert into books_category (isbn, category) values ('3646938530520', 'drama');
insert into books_category (isbn, category) values ('1089728812164', 'comedy');
insert into books_category (isbn, category) values ('7355800064865', 'history');
insert into books_category (isbn, category) values ('4409786147582', 'biography');
insert into books_category (isbn, category) values ('3697186816645', 'scifi');
insert into books_category (isbn, category) values ('5775360868585', 'horror');
insert into books_category (isbn, category) values ('5258929471531', 'comic');
insert into books_category (isbn, category) values ('0647432491033', 'scientific');
insert into books_category (isbn, category) values ('7615837417331', 'poetry');
insert into books_category (isbn, category) values ('0277636020622', 'romantic');
insert into books_category (isbn, category) values ('7801913419425', 'novel');
insert into books_category (isbn, category) values ('3920489958474', 'drama');
insert into books_category (isbn, category) values ('0413566995950', 'comedy');
insert into books_category (isbn, category) values ('4674500211287', 'history');
insert into books_category (isbn, category) values ('1969663551731', 'biography');
insert into books_category (isbn, category) values ('1187226705882', 'scifi');
insert into books_category (isbn, category) values ('9129284454744', 'horror');
insert into books_category (isbn, category) values ('5741523753966', 'comic');
insert into books_category (isbn, category) values ('4958732096270', 'scientific');
insert into books_category (isbn, category) values ('6518563396192', 'poetry');
insert into books_category (isbn, category) values ('0170792598877', 'romantic');
insert into books_category (isbn, category) values ('6602753809677', 'novel');
insert into books_category (isbn, category) values ('4044884221391', 'drama');
insert into books_category (isbn, category) values ('0625623177253', 'comedy');
insert into books_category (isbn, category) values ('7466845973946', 'history');
insert into books_category (isbn, category) values ('5125208224630', 'biography');
insert into books_category (isbn, category) values ('8562425840137', 'scifi');
insert into books_category (isbn, category) values ('9690878171501', 'horror');
insert into books_category (isbn, category) values ('9864251582965', 'comic');
insert into books_category (isbn, category) values ('7525461191200', 'scientific');
insert into books_category (isbn, category) values ('0299456389217', 'poetry');
insert into books_category (isbn, category) values ('4350773692254', 'romantic');
insert into books_category (isbn, category) values ('3927140461349', 'novel');
insert into books_category (isbn, category) values ('9989690093308', 'drama');
insert into books_category (isbn, category) values ('8647069209643', 'comedy');
insert into books_category (isbn, category) values ('1531312766975', 'history');
insert into books_category (isbn, category) values ('6273014587602', 'biography');
insert into books_category (isbn, category) values ('1365767471714', 'scifi');
insert into books_category (isbn, category) values ('9773223347634', 'horror');
insert into books_category (isbn, category) values ('2946838396846', 'comic');
insert into books_category (isbn, category) values ('9109476387742', 'scientific');
insert into books_category (isbn, category) values ('2239429838032', 'poetry');
insert into books_category (isbn, category) values ('8498808515852', 'romantic');
insert into books_category (isbn, category) values ('0895604179995', 'novel');
insert into books_category (isbn, category) values ('1377503859248', 'drama');
insert into books_category (isbn, category) values ('3559809039053', 'comedy');
insert into books_category (isbn, category) values ('7182435079906', 'history');
insert into books_category (isbn, category) values ('7835367353251', 'biography');
insert into books_category (isbn, category) values ('9164284517909', 'scifi');
insert into books_category (isbn, category) values ('7264167440543', 'horror');
insert into books_category (isbn, category) values ('6827739070212', 'comic');
insert into books_category (isbn, category) values ('6413864068205', 'scientific');
insert into books_category (isbn, category) values ('5965782931947', 'poetry');
insert into books_category (isbn, category) values ('9675749676736', 'romantic');
insert into books_category (isbn, category) values ('1513750247136', 'novel');
insert into books_category (isbn, category) values ('8759116382848', 'drama');
insert into books_category (isbn, category) values ('0698870960726', 'comedy');
insert into books_category (isbn, category) values ('5861743523626', 'history');
insert into books_category (isbn, category) values ('0829699543148', 'biography');
insert into books_category (isbn, category) values ('1038187673218', 'scifi');
insert into books_category (isbn, category) values ('9795278987571', 'horror');
insert into books_category (isbn, category) values ('8850267946453', 'comic');
insert into books_category (isbn, category) values ('9759345048100', 'scientific');
insert into books_category (isbn, category) values ('6347097825249', 'poetry');
insert into books_category (isbn, category) values ('9387577078018', 'romantic');
insert into books_category (isbn, category) values ('8664568623869', 'novel');
insert into books_category (isbn, category) values ('5487578195084', 'drama');
insert into books_category (isbn, category) values ('1734123385747', 'comedy');
insert into books_category (isbn, category) values ('5317456889143', 'history');
insert into books_category (isbn, category) values ('1559123232579', 'biography');
insert into books_category (isbn, category) values ('0375989720378', 'scifi');
insert into books_category (isbn, category) values ('6045660870888', 'horror');
insert into books_category (isbn, category) values ('1102082303420', 'comic');
insert into books_category (isbn, category) values ('1465674268159', 'scientific');
insert into books_category (isbn, category) values ('5752558607210', 'poetry');
insert into books_category (isbn, category) values ('0314499954903', 'romantic');
insert into books_category (isbn, category) values ('6410851116606', 'novel');
insert into books_category (isbn, category) values ('2708534695379', 'drama');
insert into books_category (isbn, category) values ('1384775782469', 'comedy');
insert into books_category (isbn, category) values ('9966242290758', 'history');
insert into books_category (isbn, category) values ('0809784979155', 'biography');
insert into books_category (isbn, category) values ('9401496029041', 'scifi');
insert into books_category (isbn, category) values ('3023607894971', 'horror');
insert into books_category (isbn, category) values ('5637151250435', 'comic');
insert into books_category (isbn, category) values ('3801803376307', 'scientific');
insert into books_category (isbn, category) values ('0311999229072', 'poetry');
insert into books_category (isbn, category) values ('6886890911303', 'romantic');
insert into books_category (isbn, category) values ('1880989916727', 'novel');
insert into books_category (isbn, category) values ('0674909573292', 'drama');
insert into books_category (isbn, category) values ('3497871017792', 'comedy');
insert into books_category (isbn, category) values ('4337174964178', 'history');
insert into books_category (isbn, category) values ('3233359903008', 'biography');
insert into books_category (isbn, category) values ('1849562027959', 'scifi');
insert into books_category (isbn, category) values ('2605933464940', 'horror');
insert into books_category (isbn, category) values ('6665316998471', 'comic');
insert into books_category (isbn, category) values ('3434457249094', 'scientific');
insert into books_category (isbn, category) values ('9401079679717', 'poetry');
insert into books_category (isbn, category) values ('6282535018808', 'romantic');
insert into books_category (isbn, category) values ('9512116594361', 'novel');
insert into books_category (isbn, category) values ('0307793378720', 'drama');
insert into books_category (isbn, category) values ('6088775503660', 'comedy');
insert into books_category (isbn, category) values ('4825391130222', 'history');
insert into books_category (isbn, category) values ('4531472543465', 'biography');
insert into books_category (isbn, category) values ('8630212258348', 'scifi');
insert into books_category (isbn, category) values ('3054755583226', 'horror');
insert into books_category (isbn, category) values ('6424359997295', 'comic');
insert into books_category (isbn, category) values ('6941503348774', 'scientific');
insert into books_category (isbn, category) values ('4157469723312', 'poetry');
insert into books_category (isbn, category) values ('5453558852834', 'romantic');
insert into books_category (isbn, category) values ('5674805785564', 'novel');
insert into books_category (isbn, category) values ('5998893066103', 'drama');
insert into books_category (isbn, category) values ('5624524684158', 'comedy');
insert into books_category (isbn, category) values ('5340523327623', 'history');
insert into books_category (isbn, category) values ('9271162786673', 'biography');
insert into books_category (isbn, category) values ('6520474320230', 'scifi');
insert into books_category (isbn, category) values ('2041197881464', 'horror');
insert into books_category (isbn, category) values ('4551192150404', 'comic');
insert into books_category (isbn, category) values ('2102821942056', 'scientific');
insert into books_category (isbn, category) values ('1887823406832', 'poetry');
insert into books_category (isbn, category) values ('0597909047825', 'romantic');
insert into books_category (isbn, category) values ('3646938530520', 'novel');
insert into books_category (isbn, category) values ('1089728812164', 'drama');
insert into books_category (isbn, category) values ('7355800064865', 'comedy');
insert into books_category (isbn, category) values ('4409786147582', 'history');
insert into books_category (isbn, category) values ('3697186816645', 'biography');
insert into books_category (isbn, category) values ('5775360868585', 'scifi');
insert into books_category (isbn, category) values ('5258929471531', 'horror');
insert into books_category (isbn, category) values ('0647432491033', 'comic');
insert into books_category (isbn, category) values ('7615837417331', 'scientific');
insert into books_category (isbn, category) values ('0277636020622', 'poetry');
insert into books_category (isbn, category) values ('7801913419425', 'romantic');
insert into books_category (isbn, category) values ('3920489958474', 'novel');
insert into books_category (isbn, category) values ('0413566995950', 'drama');
insert into books_category (isbn, category) values ('4674500211287', 'comedy');
insert into books_category (isbn, category) values ('1969663551731', 'history');
insert into books_category (isbn, category) values ('1187226705882', 'biography');
insert into books_category (isbn, category) values ('9129284454744', 'scifi');


#books_keyword populate

insert into books_keyword (isbn, keyword) values ('2708534695379', 'eget');
insert into books_keyword (isbn, keyword) values ('1384775782469', 'est');
insert into books_keyword (isbn, keyword) values ('9966242290758', 'volutpat');
insert into books_keyword (isbn, keyword) values ('0809784979155', 'amet');
insert into books_keyword (isbn, keyword) values ('9401496029041', 'nulla');
insert into books_keyword (isbn, keyword) values ('3023607894971', 'amet');
insert into books_keyword (isbn, keyword) values ('5637151250435', 'lobortis');
insert into books_keyword (isbn, keyword) values ('3801803376307', 'nibh');
insert into books_keyword (isbn, keyword) values ('0311999229072', 'sed');
insert into books_keyword (isbn, keyword) values ('6886890911303', 'posuere');
insert into books_keyword (isbn, keyword) values ('1880989916727', 'sapien');
insert into books_keyword (isbn, keyword) values ('0674909573292', 'purus');
insert into books_keyword (isbn, keyword) values ('3497871017792', 'id');
insert into books_keyword (isbn, keyword) values ('4337174964178', 'sociis');
insert into books_keyword (isbn, keyword) values ('3233359903008', 'tincidunt');
insert into books_keyword (isbn, keyword) values ('1849562027959', 'tortor');
insert into books_keyword (isbn, keyword) values ('2605933464940', 'pede');
insert into books_keyword (isbn, keyword) values ('6665316998471', 'potenti');
insert into books_keyword (isbn, keyword) values ('3434457249094', 'ridiculus');
insert into books_keyword (isbn, keyword) values ('9401079679717', 'primis');
insert into books_keyword (isbn, keyword) values ('6282535018808', 'justo');
insert into books_keyword (isbn, keyword) values ('9512116594361', 'sapien');
insert into books_keyword (isbn, keyword) values ('0307793378720', 'amet');
insert into books_keyword (isbn, keyword) values ('6088775503660', 'morbi');
insert into books_keyword (isbn, keyword) values ('4825391130222', 'dictumst');
insert into books_keyword (isbn, keyword) values ('4531472543465', 'cubilia');
insert into books_keyword (isbn, keyword) values ('8630212258348', 'at');
insert into books_keyword (isbn, keyword) values ('3054755583226', 'rutrum');
insert into books_keyword (isbn, keyword) values ('6424359997295', 'natoque');
insert into books_keyword (isbn, keyword) values ('6941503348774', 'lacus');
insert into books_keyword (isbn, keyword) values ('4157469723312', 'nulla');
insert into books_keyword (isbn, keyword) values ('5453558852834', 'rhoncus');
insert into books_keyword (isbn, keyword) values ('5674805785564', 'nunc');
insert into books_keyword (isbn, keyword) values ('5998893066103', 'justo');
insert into books_keyword (isbn, keyword) values ('5624524684158', 'ligula');
insert into books_keyword (isbn, keyword) values ('5340523327623', 'id');
insert into books_keyword (isbn, keyword) values ('9271162786673', 'integer');
insert into books_keyword (isbn, keyword) values ('6520474320230', 'congue');
insert into books_keyword (isbn, keyword) values ('2041197881464', 'accumsan');
insert into books_keyword (isbn, keyword) values ('4551192150404', 'odio');
insert into books_keyword (isbn, keyword) values ('2102821942056', 'vel');
insert into books_keyword (isbn, keyword) values ('1887823406832', 'pretium');
insert into books_keyword (isbn, keyword) values ('0597909047825', 'etiam');
insert into books_keyword (isbn, keyword) values ('3646938530520', 'penatibus');
insert into books_keyword (isbn, keyword) values ('1089728812164', 'nulla');
insert into books_keyword (isbn, keyword) values ('7355800064865', 'convallis');
insert into books_keyword (isbn, keyword) values ('4409786147582', 'maecenas');
insert into books_keyword (isbn, keyword) values ('3697186816645', 'nulla');
insert into books_keyword (isbn, keyword) values ('5775360868585', 'nibh');
insert into books_keyword (isbn, keyword) values ('5258929471531', 'neque');
insert into books_keyword (isbn, keyword) values ('0647432491033', 'tincidunt');
insert into books_keyword (isbn, keyword) values ('7615837417331', 'ante');
insert into books_keyword (isbn, keyword) values ('0277636020622', 'lectus');
insert into books_keyword (isbn, keyword) values ('7801913419425', 'erat');
insert into books_keyword (isbn, keyword) values ('3920489958474', 'ac');
insert into books_keyword (isbn, keyword) values ('0413566995950', 'luctus');
insert into books_keyword (isbn, keyword) values ('4674500211287', 'elit');
insert into books_keyword (isbn, keyword) values ('1969663551731', 'odio');
insert into books_keyword (isbn, keyword) values ('1187226705882', 'tortor');
insert into books_keyword (isbn, keyword) values ('9129284454744', 'neque');
insert into books_keyword (isbn, keyword) values ('5741523753966', 'primis');
insert into books_keyword (isbn, keyword) values ('4958732096270', 'enim');
insert into books_keyword (isbn, keyword) values ('6518563396192', 'fermentum');
insert into books_keyword (isbn, keyword) values ('0170792598877', 'praesent');
insert into books_keyword (isbn, keyword) values ('6602753809677', 'urna');
insert into books_keyword (isbn, keyword) values ('4044884221391', 'ultrices');
insert into books_keyword (isbn, keyword) values ('0625623177253', 'duis');
insert into books_keyword (isbn, keyword) values ('7466845973946', 'pellentesque');
insert into books_keyword (isbn, keyword) values ('5125208224630', 'luctus');
insert into books_keyword (isbn, keyword) values ('8562425840137', 'nunc');
insert into books_keyword (isbn, keyword) values ('9690878171501', 'ante');
insert into books_keyword (isbn, keyword) values ('9864251582965', 'enim');
insert into books_keyword (isbn, keyword) values ('7525461191200', 'posuere');
insert into books_keyword (isbn, keyword) values ('0299456389217', 'semper');
insert into books_keyword (isbn, keyword) values ('4350773692254', 'sit');
insert into books_keyword (isbn, keyword) values ('3927140461349', 'dapibus');
insert into books_keyword (isbn, keyword) values ('9989690093308', 'vestibulum');
insert into books_keyword (isbn, keyword) values ('8647069209643', 'posuere');
insert into books_keyword (isbn, keyword) values ('1531312766975', 'faucibus');
insert into books_keyword (isbn, keyword) values ('6273014587602', 'sed');
insert into books_keyword (isbn, keyword) values ('1365767471714', 'lobortis');
insert into books_keyword (isbn, keyword) values ('9773223347634', 'quis');
insert into books_keyword (isbn, keyword) values ('2946838396846', 'blandit');
insert into books_keyword (isbn, keyword) values ('9109476387742', 'duis');
insert into books_keyword (isbn, keyword) values ('2239429838032', 'in');
insert into books_keyword (isbn, keyword) values ('8498808515852', 'id');
insert into books_keyword (isbn, keyword) values ('0895604179995', 'purus');
insert into books_keyword (isbn, keyword) values ('1377503859248', 'in');
insert into books_keyword (isbn, keyword) values ('3559809039053', 'pede');
insert into books_keyword (isbn, keyword) values ('7182435079906', 'elementum');
insert into books_keyword (isbn, keyword) values ('7835367353251', 'orci');
insert into books_keyword (isbn, keyword) values ('9164284517909', 'sapien');
insert into books_keyword (isbn, keyword) values ('7264167440543', 'ipsum');
insert into books_keyword (isbn, keyword) values ('6827739070212', 'volutpat');
insert into books_keyword (isbn, keyword) values ('6413864068205', 'nullam');
insert into books_keyword (isbn, keyword) values ('5965782931947', 'magna');
insert into books_keyword (isbn, keyword) values ('9675749676736', 'accumsan');
insert into books_keyword (isbn, keyword) values ('1513750247136', 'volutpat');
insert into books_keyword (isbn, keyword) values ('8759116382848', 'nulla');
insert into books_keyword (isbn, keyword) values ('0698870960726', 'ut');
insert into books_keyword (isbn, keyword) values ('5861743523626', 'urna');
insert into books_keyword (isbn, keyword) values ('0829699543148', 'sit');
insert into books_keyword (isbn, keyword) values ('1038187673218', 'sit');
insert into books_keyword (isbn, keyword) values ('9795278987571', 'in');
insert into books_keyword (isbn, keyword) values ('8850267946453', 'elit');
insert into books_keyword (isbn, keyword) values ('9759345048100', 'viverra');
insert into books_keyword (isbn, keyword) values ('6347097825249', 'porttitor');
insert into books_keyword (isbn, keyword) values ('9387577078018', 'lectus');
insert into books_keyword (isbn, keyword) values ('8664568623869', 'eget');
insert into books_keyword (isbn, keyword) values ('5487578195084', 'vulputate');
insert into books_keyword (isbn, keyword) values ('1734123385747', 'molestie');
insert into books_keyword (isbn, keyword) values ('5317456889143', 'sed');
insert into books_keyword (isbn, keyword) values ('1559123232579', 'at');
insert into books_keyword (isbn, keyword) values ('0375989720378', 'ornare');
insert into books_keyword (isbn, keyword) values ('6045660870888', 'venenatis');
insert into books_keyword (isbn, keyword) values ('1102082303420', 'luctus');
insert into books_keyword (isbn, keyword) values ('1465674268159', 'justo');
insert into books_keyword (isbn, keyword) values ('5752558607210', 'amet');
insert into books_keyword (isbn, keyword) values ('0314499954903', 'cras');
insert into books_keyword (isbn, keyword) values ('6410851116606', 'eget');
insert into books_keyword (isbn, keyword) values ('2708534695379', 'rhoncus');
insert into books_keyword (isbn, keyword) values ('1384775782469', 'congue');
insert into books_keyword (isbn, keyword) values ('9966242290758', 'rutrum');
insert into books_keyword (isbn, keyword) values ('0809784979155', 'ipsum');
insert into books_keyword (isbn, keyword) values ('9401496029041', 'adipiscing');
insert into books_keyword (isbn, keyword) values ('3023607894971', 'sapien');
insert into books_keyword (isbn, keyword) values ('5637151250435', 'vestibulum');
insert into books_keyword (isbn, keyword) values ('3801803376307', 'turpis');
insert into books_keyword (isbn, keyword) values ('0311999229072', 'id');
insert into books_keyword (isbn, keyword) values ('1880989916727', 'id');
insert into books_keyword (isbn, keyword) values ('0674909573292', 'iaculis');
insert into books_keyword (isbn, keyword) values ('3497871017792', 'integer');
insert into books_keyword (isbn, keyword) values ('4337174964178', 'amet');
insert into books_keyword (isbn, keyword) values ('3233359903008', 'elit');
insert into books_keyword (isbn, keyword) values ('1849562027959', 'in');
insert into books_keyword (isbn, keyword) values ('2605933464940', 'mauris');
insert into books_keyword (isbn, keyword) values ('6665316998471', 'sapien');
insert into books_keyword (isbn, keyword) values ('3434457249094', 'convallis');
insert into books_keyword (isbn, keyword) values ('9401079679717', 'ultrices');
insert into books_keyword (isbn, keyword) values ('6282535018808', 'leo');
insert into books_keyword (isbn, keyword) values ('9512116594361', 'morbi');
insert into books_keyword (isbn, keyword) values ('0307793378720', 'justo');
insert into books_keyword (isbn, keyword) values ('6088775503660', 'vulputate');
insert into books_keyword (isbn, keyword) values ('4825391130222', 'nulla');
insert into books_keyword (isbn, keyword) values ('4531472543465', 'purus');
insert into books_keyword (isbn, keyword) values ('8630212258348', 'id');
insert into books_keyword (isbn, keyword) values ('3054755583226', 'aenean');
insert into books_keyword (isbn, keyword) values ('6424359997295', 'at');
insert into books_keyword (isbn, keyword) values ('6941503348774', 'odio');
insert into books_keyword (isbn, keyword) values ('4157469723312', 'felis');
insert into books_keyword (isbn, keyword) values ('5453558852834', 'in');
insert into books_keyword (isbn, keyword) values ('5674805785564', 'ac');
insert into books_keyword (isbn, keyword) values ('5998893066103', 'in');
insert into books_keyword (isbn, keyword) values ('5624524684158', 'turpis');
insert into books_keyword (isbn, keyword) values ('5340523327623', 'aenean');
insert into books_keyword (isbn, keyword) values ('9271162786673', 'vulputate');
insert into books_keyword (isbn, keyword) values ('6520474320230', 'metus');
insert into books_keyword (isbn, keyword) values ('2041197881464', 'pretium');
insert into books_keyword (isbn, keyword) values ('4551192150404', 'quam');
insert into books_keyword (isbn, keyword) values ('2102821942056', 'erat');
insert into books_keyword (isbn, keyword) values ('1887823406832', 'quam');
insert into books_keyword (isbn, keyword) values ('0597909047825', 'non');
insert into books_keyword (isbn, keyword) values ('3646938530520', 'sapien');
insert into books_keyword (isbn, keyword) values ('1089728812164', 'vestibulum');
insert into books_keyword (isbn, keyword) values ('7355800064865', 'amet');
insert into books_keyword (isbn, keyword) values ('4409786147582', 'massa');
insert into books_keyword (isbn, keyword) values ('3697186816645', 'eget');
insert into books_keyword (isbn, keyword) values ('5775360868585', 'consequat');
insert into books_keyword (isbn, keyword) values ('5258929471531', 'lorem');
insert into books_keyword (isbn, keyword) values ('0647432491033', 'ipsum');
insert into books_keyword (isbn, keyword) values ('7615837417331', 'consectetuer');
insert into books_keyword (isbn, keyword) values ('0277636020622', 'primis');
insert into books_keyword (isbn, keyword) values ('7801913419425', 'nibh');
insert into books_keyword (isbn, keyword) values ('3920489958474', 'nunc');
insert into books_keyword (isbn, keyword) values ('0413566995950', 'ut');
insert into books_keyword (isbn, keyword) values ('4674500211287', 'sagittis');
insert into books_keyword (isbn, keyword) values ('1969663551731', 'nulla');
insert into books_keyword (isbn, keyword) values ('1187226705882', 'ac');
insert into books_keyword (isbn, keyword) values ('9129284454744', 'primis');
insert into books_keyword (isbn, keyword) values ('5741523753966', 'nulla');
insert into books_keyword (isbn, keyword) values ('4958732096270', 'molestie');
insert into books_keyword (isbn, keyword) values ('6518563396192', 'scelerisque');
insert into books_keyword (isbn, keyword) values ('0170792598877', 'consequat');
insert into books_keyword (isbn, keyword) values ('6602753809677', 'ut');
insert into books_keyword (isbn, keyword) values ('4044884221391', 'sapien');
insert into books_keyword (isbn, keyword) values ('0625623177253', 'lobortis');
insert into books_keyword (isbn, keyword) values ('7466845973946', 'posuere');
insert into books_keyword (isbn, keyword) values ('5125208224630', 'erat');
insert into books_keyword (isbn, keyword) values ('8562425840137', 'nulla');
insert into books_keyword (isbn, keyword) values ('9690878171501', 'odio');
insert into books_keyword (isbn, keyword) values ('9864251582965', 'dapibus');
insert into books_keyword (isbn, keyword) values ('7525461191200', 'mauris');
insert into books_keyword (isbn, keyword) values ('0299456389217', 'nonummy');
insert into books_keyword (isbn, keyword) values ('4350773692254', 'non');
insert into books_keyword (isbn, keyword) values ('3927140461349', 'rutrum');
insert into books_keyword (isbn, keyword) values ('9989690093308', 'dui');
insert into books_keyword (isbn, keyword) values ('8647069209643', 'quis');
insert into books_keyword (isbn, keyword) values ('1531312766975', 'molestie');
insert into books_keyword (isbn, keyword) values ('6273014587602', 'feugiat');
insert into books_keyword (isbn, keyword) values ('1365767471714', 'nec');
insert into books_keyword (isbn, keyword) values ('9773223347634', 'metus');
insert into books_keyword (isbn, keyword) values ('2946838396846', 'quis');
insert into books_keyword (isbn, keyword) values ('9109476387742', 'potenti');
insert into books_keyword (isbn, keyword) values ('2239429838032', 'amet');
insert into books_keyword (isbn, keyword) values ('8498808515852', 'in');
insert into books_keyword (isbn, keyword) values ('0895604179995', 'volutpat');
insert into books_keyword (isbn, keyword) values ('1377503859248', 'et');
insert into books_keyword (isbn, keyword) values ('3559809039053', 'non');
insert into books_keyword (isbn, keyword) values ('7182435079906', 'natoque');
insert into books_keyword (isbn, keyword) values ('7835367353251', 'libero');
insert into books_keyword (isbn, keyword) values ('9164284517909', 'at');
insert into books_keyword (isbn, keyword) values ('7264167440543', 'aenean');
insert into books_keyword (isbn, keyword) values ('6827739070212', 'turpis');
insert into books_keyword (isbn, keyword) values ('6413864068205', 'tincidunt');
insert into books_keyword (isbn, keyword) values ('5965782931947', 'orci');
insert into books_keyword (isbn, keyword) values ('9675749676736', 'viverra');
insert into books_keyword (isbn, keyword) values ('1513750247136', 'duis');
insert into books_keyword (isbn, keyword) values ('8759116382848', 'turpis');
insert into books_keyword (isbn, keyword) values ('0698870960726', 'libero');
insert into books_keyword (isbn, keyword) values ('5861743523626', 'lorem');
insert into books_keyword (isbn, keyword) values ('0829699543148', 'dictumst');
insert into books_keyword (isbn, keyword) values ('1038187673218', 'mi');
insert into books_keyword (isbn, keyword) values ('9795278987571', 'semper');
insert into books_keyword (isbn, keyword) values ('8850267946453', 'nulla');
insert into books_keyword (isbn, keyword) values ('9759345048100', 'nulla');
insert into books_keyword (isbn, keyword) values ('6347097825249', 'eget');
insert into books_keyword (isbn, keyword) values ('9387577078018', 'nulla');
insert into books_keyword (isbn, keyword) values ('8664568623869', 'primis');
insert into books_keyword (isbn, keyword) values ('5487578195084', 'amet');
insert into books_keyword (isbn, keyword) values ('1734123385747', 'venenatis');
insert into books_keyword (isbn, keyword) values ('5317456889143', 'non');
insert into books_keyword (isbn, keyword) values ('1559123232579', 'ut');
insert into books_keyword (isbn, keyword) values ('0375989720378', 'at');
insert into books_keyword (isbn, keyword) values ('6045660870888', 'rutrum');
insert into books_keyword (isbn, keyword) values ('1102082303420', 'orci');
insert into books_keyword (isbn, keyword) values ('1465674268159', 'primis');
insert into books_keyword (isbn, keyword) values ('5752558607210', 'pede');
insert into books_keyword (isbn, keyword) values ('0314499954903', 'elementum');
insert into books_keyword (isbn, keyword) values ('6410851116606', 'cursus');
insert into books_keyword (isbn, keyword) values ('2708534695379', 'nulla');
insert into books_keyword (isbn, keyword) values ('1384775782469', 'phasellus');
insert into books_keyword (isbn, keyword) values ('9966242290758', 'dapibus');
insert into books_keyword (isbn, keyword) values ('0809784979155', 'interdum');
insert into books_keyword (isbn, keyword) values ('9401496029041', 'non');
insert into books_keyword (isbn, keyword) values ('3023607894971', 'eros');
insert into books_keyword (isbn, keyword) values ('5637151250435', 'augue');
insert into books_keyword (isbn, keyword) values ('3801803376307', 'aliquet');
insert into books_keyword (isbn, keyword) values ('0311999229072', 'nunc');
insert into books_keyword (isbn, keyword) values ('6886890911303', 'pellentesque');
insert into books_keyword (isbn, keyword) values ('1880989916727', 'et');
insert into books_keyword (isbn, keyword) values ('0674909573292', 'tortor');
insert into books_keyword (isbn, keyword) values ('3497871017792', 'sapien');
insert into books_keyword (isbn, keyword) values ('4337174964178', 'justo');
insert into books_keyword (isbn, keyword) values ('3233359903008', 'quisque');
insert into books_keyword (isbn, keyword) values ('1849562027959', 'est');
insert into books_keyword (isbn, keyword) values ('2605933464940', 'dictumst');
insert into books_keyword (isbn, keyword) values ('6665316998471', 'erat');
insert into books_keyword (isbn, keyword) values ('3434457249094', 'elementum');
insert into books_keyword (isbn, keyword) values ('6282535018808', 'molestie');
insert into books_keyword (isbn, keyword) values ('9512116594361', 'sagittis');
insert into books_keyword (isbn, keyword) values ('0307793378720', 'neque');
insert into books_keyword (isbn, keyword) values ('6088775503660', 'id');
insert into books_keyword (isbn, keyword) values ('4825391130222', 'interdum');
insert into books_keyword (isbn, keyword) values ('4531472543465', 'volutpat');
insert into books_keyword (isbn, keyword) values ('8630212258348', 'lorem');
insert into books_keyword (isbn, keyword) values ('3054755583226', 'sit');
insert into books_keyword (isbn, keyword) values ('6424359997295', 'id');
insert into books_keyword (isbn, keyword) values ('6941503348774', 'duis');
insert into books_keyword (isbn, keyword) values ('4157469723312', 'integer');
insert into books_keyword (isbn, keyword) values ('5453558852834', 'neque');
insert into books_keyword (isbn, keyword) values ('5674805785564', 'lacinia');
insert into books_keyword (isbn, keyword) values ('5998893066103', 'habitasse');
insert into books_keyword (isbn, keyword) values ('5624524684158', 'potenti');
insert into books_keyword (isbn, keyword) values ('5340523327623', 'viverra');
insert into books_keyword (isbn, keyword) values ('9271162786673', 'sapien');
insert into books_keyword (isbn, keyword) values ('6520474320230', 'lorem');
insert into books_keyword (isbn, keyword) values ('2041197881464', 'sed');
insert into books_keyword (isbn, keyword) values ('4551192150404', 'pretium');
insert into books_keyword (isbn, keyword) values ('2102821942056', 'tristique');
insert into books_keyword (isbn, keyword) values ('1887823406832', 'risus');
insert into books_keyword (isbn, keyword) values ('0597909047825', 'et');
insert into books_keyword (isbn, keyword) values ('3646938530520', 'praesent');
insert into books_keyword (isbn, keyword) values ('1089728812164', 'posuere');
insert into books_keyword (isbn, keyword) values ('7355800064865', 'in');
insert into books_keyword (isbn, keyword) values ('4409786147582', 'at');
insert into books_keyword (isbn, keyword) values ('3697186816645', 'praesent');
insert into books_keyword (isbn, keyword) values ('5775360868585', 'eu');
insert into books_keyword (isbn, keyword) values ('5258929471531', 'lacinia');
insert into books_keyword (isbn, keyword) values ('0647432491033', 'etiam');
insert into books_keyword (isbn, keyword) values ('7615837417331', 'ac');
insert into books_keyword (isbn, keyword) values ('0277636020622', 'aenean');
insert into books_keyword (isbn, keyword) values ('7801913419425', 'vivamus');
insert into books_keyword (isbn, keyword) values ('3920489958474', 'porta');
insert into books_keyword (isbn, keyword) values ('0413566995950', 'natoque');
insert into books_keyword (isbn, keyword) values ('4674500211287', 'et');
insert into books_keyword (isbn, keyword) values ('1969663551731', 'libero');
insert into books_keyword (isbn, keyword) values ('1187226705882', 'aliquam');
insert into books_keyword (isbn, keyword) values ('9129284454744', 'tristique');


#books_author populate

insert into books_author (isbn, author_first_name, author_middle_name, author_last_name) values ('2708534695379', 'Lydie', 'Hedvige', 'Mournian');
insert into books_author (isbn, author_first_name, author_middle_name, author_last_name) values ('1384775782469', 'Aleen', 'Mabelle', 'Arkow');
insert into books_author (isbn, author_first_name, author_middle_name, author_last_name) values ('9966242290758', 'Francine', 'Winona', 'Atherton');
insert into books_author (isbn, author_first_name, author_middle_name, author_last_name) values ('2708534695379', 'Carmine', 'Riva', 'Jorioz');
insert into books_author (isbn, author_first_name, author_middle_name, author_last_name) values ('9401496029041', 'Davidson', 'Eddi', 'Shervil');
insert into books_author (isbn, author_first_name, author_middle_name, author_last_name) values ('3023607894971', 'Kacey', 'Amye', 'Acott');
insert into books_author (isbn, author_first_name, author_middle_name, author_last_name) values ('5637151250435', 'Corette', 'Bernie', 'Kermath');
insert into books_author (isbn, author_first_name, author_middle_name, author_last_name) values ('2708534695379', 'Pennie', 'Jelene', 'Dombrell');
insert into books_author (isbn, author_first_name, author_middle_name, author_last_name) values ('9966242290758', 'Pierre', 'Drucy', 'Kenwin');
insert into books_author (isbn, author_first_name, author_middle_name, author_last_name) values ('6886890911303', 'Jennifer', 'Gladys', 'Thurlow');
insert into books_author (isbn, author_first_name, author_middle_name, author_last_name) values ('9966242290758', 'Clotilda', 'Calla', 'Rathborne');
insert into books_author (isbn, author_first_name, author_middle_name, author_last_name) values ('0674909573292', 'Tully', 'Salaidh', 'Foxwell');
insert into books_author (isbn, author_first_name, author_middle_name, author_last_name) values ('3497871017792', 'Giles', 'Carlin', 'MacKniely');
insert into books_author (isbn, author_first_name, author_middle_name, author_last_name) values ('4337174964178', 'Byrann', 'Allyce', 'Blint');
insert into books_author (isbn, author_first_name, author_middle_name, author_last_name) values ('3233359903008', 'Jeffy', 'Rivalee', 'Jelkes');
insert into books_author (isbn, author_first_name, author_middle_name, author_last_name) values ('1849562027959', 'Ajay', 'Jacinta', 'Steutly');
insert into books_author (isbn, author_first_name, author_middle_name, author_last_name) values ('2605933464940', 'Pennie', 'Jelene', 'Dombrell');
insert into books_author (isbn, author_first_name, author_middle_name, author_last_name) values ('6665316998471', 'Stephi', 'Emlyn', 'Mensler');
insert into books_author (isbn, author_first_name, author_middle_name, author_last_name) values ('3434457249094', 'Jewelle', 'Audy', 'Clackers');
insert into books_author (isbn, author_first_name, author_middle_name, author_last_name) values ('9401079679717', 'Jewelle', 'Audy', 'Clackers');
insert into books_author (isbn, author_first_name, author_middle_name, author_last_name) values ('6282535018808','Pennie', 'Jelene', 'Dombrell');
insert into books_author (isbn, author_first_name, author_middle_name, author_last_name) values ('9512116594361', 'Pennie', 'Jelene', 'Dombrell');
insert into books_author (isbn, author_first_name, author_middle_name, author_last_name) values ('0307793378720', 'Jewelle', 'Audy', 'Clackers');
insert into books_author (isbn, author_first_name, author_middle_name, author_last_name) values ('6088775503660', 'Kellia', 'Eleonore', 'Muckeen');
insert into books_author (isbn, author_first_name, author_middle_name, author_last_name) values ('4825391130222', 'Pete', 'Alaine', 'Dobbings');
insert into books_author (isbn, author_first_name, author_middle_name, author_last_name) values ('4531472543465', 'Garald', 'Marna', 'Camble');
insert into books_author (isbn, author_first_name, author_middle_name, author_last_name) values ('8630212258348', 'Abner', 'Mignonne', 'Castledine');
insert into books_author (isbn, author_first_name, author_middle_name, author_last_name) values ('3054755583226', 'Felix', 'Morissa', 'Kluss');
insert into books_author (isbn, author_first_name, author_middle_name, author_last_name) values ('6424359997295', 'Freddy', 'Cammi', 'Byre');
insert into books_author (isbn, author_first_name, author_middle_name, author_last_name) values ('6941503348774', 'Eustacia', 'Kary', 'Alvey');
insert into books_author (isbn, author_first_name, author_middle_name, author_last_name) values ('4157469723312', 'Beck', 'Alexandra', 'Eastgate');
insert into books_author (isbn, author_first_name, author_middle_name, author_last_name) values ('5453558852834', 'Joyce', 'Cal', 'Woodson');
insert into books_author (isbn, author_first_name, author_middle_name, author_last_name) values ('5674805785564', 'Averil', 'Hildy', 'Provis');
insert into books_author (isbn, author_first_name, author_middle_name, author_last_name) values ('5998893066103', 'Fleur', 'Gabbey', 'Baudinelli');
insert into books_author (isbn, author_first_name, author_middle_name, author_last_name) values ('5624524684158', 'Irwin', 'Belva', 'Sickamore');
insert into books_author (isbn, author_first_name, author_middle_name, author_last_name) values ('5340523327623', 'Walt', 'Maddy', 'Tembridge');
insert into books_author (isbn, author_first_name, author_middle_name, author_last_name) values ('9271162786673', 'Zaccaria', 'Gaynor', 'Roma');
insert into books_author (isbn, author_first_name, author_middle_name, author_last_name) values ('6520474320230', 'Ddene', 'Grace', 'Greenslade');
insert into books_author (isbn, author_first_name, author_middle_name, author_last_name) values ('2041197881464', 'Francoise', 'Fayina', 'Sandeman');
insert into books_author (isbn, author_first_name, author_middle_name, author_last_name) values ('4551192150404', 'Trudie', 'Cynthea', 'Cleere');
insert into books_author (isbn, author_first_name, author_middle_name, author_last_name) values ('2102821942056', 'Alick', 'Bidget', 'Carnall');
insert into books_author (isbn, author_first_name, author_middle_name, author_last_name) values ('1887823406832', 'Silvia', 'Nomi', 'Noad');
insert into books_author (isbn, author_first_name, author_middle_name, author_last_name) values ('0597909047825', 'Toiboid', 'Nadya', 'Hardisty');
insert into books_author (isbn, author_first_name, author_middle_name, author_last_name) values ('3646938530520', 'Stavro', 'Ruth', 'Loghan');
insert into books_author (isbn, author_first_name, author_middle_name, author_last_name) values ('1089728812164', 'Igor', 'Denys', 'Ockland');
insert into books_author (isbn, author_first_name, author_middle_name, author_last_name) values ('7355800064865', 'Wallie', 'Kassi', 'Tessyman');
insert into books_author (isbn, author_first_name, author_middle_name, author_last_name) values ('4409786147582', 'Ashby', 'Marrissa', 'Mees');
insert into books_author (isbn, author_first_name, author_middle_name, author_last_name) values ('3697186816645', 'Buddy', 'Benetta', 'Tesche');
insert into books_author (isbn, author_first_name, author_middle_name, author_last_name) values ('5775360868585', 'Morton', 'Maxi', 'Purdom');
insert into books_author (isbn, author_first_name, author_middle_name, author_last_name) values ('5258929471531', 'Hillery', 'Yettie', 'Whatson');
insert into books_author (isbn, author_first_name, author_middle_name, author_last_name) values ('0647432491033', 'Paco', 'Jolyn', 'Barents');
insert into books_author (isbn, author_first_name, author_middle_name, author_last_name) values ('7615837417331', 'Camella', 'Dale', 'Cadore');
insert into books_author (isbn, author_first_name, author_middle_name, author_last_name) values ('0277636020622', 'Zebadiah', 'Carolee', 'Bodocs');
insert into books_author (isbn, author_first_name, author_middle_name, author_last_name) values ('7801913419425', 'Ronni', 'Kerrie', 'Baltrushaitis');
insert into books_author (isbn, author_first_name, author_middle_name, author_last_name) values ('3920489958474', 'Conn', 'Florry', 'Hayselden');
insert into books_author (isbn, author_first_name, author_middle_name, author_last_name) values ('0413566995950', 'Bobbie', 'Annemarie', 'Hamon');
insert into books_author (isbn, author_first_name, author_middle_name, author_last_name) values ('4674500211287', 'Wilmar', 'Korella', 'Girdler');
insert into books_author (isbn, author_first_name, author_middle_name, author_last_name) values ('1969663551731', 'Jemmy', 'Selinda', 'Selland');
insert into books_author (isbn, author_first_name, author_middle_name, author_last_name) values ('1187226705882', 'Drusie', 'Belicia', 'Gringley');
insert into books_author (isbn, author_first_name, author_middle_name, author_last_name) values ('9129284454744', 'Constantine', 'Rafaelia', 'Senecaux');
insert into books_author (isbn, author_first_name, author_middle_name, author_last_name) values ('5741523753966', 'Erina', 'Vivienne', 'Rothon');
insert into books_author (isbn, author_first_name, author_middle_name, author_last_name) values ('4958732096270', 'Gerta', 'Adore', 'Howship');
insert into books_author (isbn, author_first_name, author_middle_name, author_last_name) values ('6518563396192', 'Lennard', 'Shelly', 'Castanaga');
insert into books_author (isbn, author_first_name, author_middle_name, author_last_name) values ('0170792598877', 'Patricia', 'Nanci', 'Kingcott');
insert into books_author (isbn, author_first_name, author_middle_name, author_last_name) values ('6602753809677', 'Suzi', 'Carri', 'Radloff');
insert into books_author (isbn, author_first_name, author_middle_name, author_last_name) values ('4044884221391', 'Perren', 'Krissy', 'Landor');
insert into books_author (isbn, author_first_name, author_middle_name, author_last_name) values ('0625623177253', 'Romeo', 'Rycca', 'Gaspero');
insert into books_author (isbn, author_first_name, author_middle_name, author_last_name) values ('7466845973946', 'Rebekah', 'Conny', 'Dickie');
insert into books_author (isbn, author_first_name, author_middle_name, author_last_name) values ('5125208224630', 'Luisa', 'Rhianon', 'Thickpenny');
insert into books_author (isbn, author_first_name, author_middle_name, author_last_name) values ('8562425840137', 'Kylie', 'Fredra', 'Iban');
insert into books_author (isbn, author_first_name, author_middle_name, author_last_name) values ('9690878171501', 'Kennett', 'Shellie', 'Searston');
insert into books_author (isbn, author_first_name, author_middle_name, author_last_name) values ('9864251582965', 'Alejoa', 'Devondra', 'Parriss');
insert into books_author (isbn, author_first_name, author_middle_name, author_last_name) values ('7525461191200', 'Rriocard', 'Carita', 'Roseman');
insert into books_author (isbn, author_first_name, author_middle_name, author_last_name) values ('0299456389217', 'Jobina', 'Emelyne', 'Sybry');
insert into books_author (isbn, author_first_name, author_middle_name, author_last_name) values ('4350773692254', 'Bee', 'Norina', 'Pragnell');
insert into books_author (isbn, author_first_name, author_middle_name, author_last_name) values ('3927140461349', 'Wilek', 'Millicent', 'Moir');
insert into books_author (isbn, author_first_name, author_middle_name, author_last_name) values ('9989690093308', 'Rivy', 'Bernadine', 'Jahnel');
insert into books_author (isbn, author_first_name, author_middle_name, author_last_name) values ('8647069209643', 'Estrella', 'Amata', 'Barten');
insert into books_author (isbn, author_first_name, author_middle_name, author_last_name) values ('1531312766975', 'Abie', 'Averyl', 'Coslett');
insert into books_author (isbn, author_first_name, author_middle_name, author_last_name) values ('6273014587602', 'Lib', 'Hedda', 'Perkinson');
insert into books_author (isbn, author_first_name, author_middle_name, author_last_name) values ('1365767471714', 'Everett', 'Elsinore', 'Sperwell');
insert into books_author (isbn, author_first_name, author_middle_name, author_last_name) values ('9773223347634', 'Tine', 'Raf', 'Cridlan');
insert into books_author (isbn, author_first_name, author_middle_name, author_last_name) values ('2946838396846', 'Cherilynn', 'Hettie', 'Moss');
insert into books_author (isbn, author_first_name, author_middle_name, author_last_name) values ('9109476387742', 'Titus', 'Jori', 'Haycox');
insert into books_author (isbn, author_first_name, author_middle_name, author_last_name) values ('2239429838032', 'Twila', 'Calla', 'McGeouch');
insert into books_author (isbn, author_first_name, author_middle_name, author_last_name) values ('8498808515852', 'Sela', 'Loretta', 'Britcher');
insert into books_author (isbn, author_first_name, author_middle_name, author_last_name) values ('0895604179995', 'Tootsie', 'Rhiamon', 'Barrabeale');
insert into books_author (isbn, author_first_name, author_middle_name, author_last_name) values ('1377503859248', 'Elga', 'Brina', 'Shorbrook');
insert into books_author (isbn, author_first_name, author_middle_name, author_last_name) values ('3559809039053', 'Shaun', 'Marti', 'Lazarus');
insert into books_author (isbn, author_first_name, author_middle_name, author_last_name) values ('7182435079906', 'Dix', 'Dorri', 'Chazette');
insert into books_author (isbn, author_first_name, author_middle_name, author_last_name) values ('7835367353251', 'Siana', 'Evita', 'Sibbit');
insert into books_author (isbn, author_first_name, author_middle_name, author_last_name) values ('9164284517909', 'Renault', 'Lina', 'Douthwaite');
insert into books_author (isbn, author_first_name, author_middle_name, author_last_name) values ('7264167440543', 'Wald', 'Linzy', 'Carnihan');
insert into books_author (isbn, author_first_name, author_middle_name, author_last_name) values ('6827739070212', 'Tymon', 'Helena', 'Greenhalgh');
insert into books_author (isbn, author_first_name, author_middle_name, author_last_name) values ('6413864068205', 'Teresa', 'Domini', 'Klima');
insert into books_author (isbn, author_first_name, author_middle_name, author_last_name) values ('5965782931947', 'Seymour', 'Bonnee', 'Boggers');
insert into books_author (isbn, author_first_name, author_middle_name, author_last_name) values ('9675749676736', 'Roseann', 'Tiffani', 'Whissell');
insert into books_author (isbn, author_first_name, author_middle_name, author_last_name) values ('1513750247136', 'Grier', 'Nichol', 'Seer');
insert into books_author (isbn, author_first_name, author_middle_name, author_last_name) values ('8759116382848', 'Melisent', 'Linnea', 'Hatwell');
insert into books_author (isbn, author_first_name, author_middle_name, author_last_name) values ('0698870960726', 'Liam', 'Jeanelle', 'Baudic');
insert into books_author (isbn, author_first_name, author_middle_name, author_last_name) values ('5861743523626', 'Dahlia', 'Winnifred', 'Vedekhov');
insert into books_author (isbn, author_first_name, author_middle_name, author_last_name) values ('0829699543148', 'Shepperd', 'Miranda', 'Slayny');
insert into books_author (isbn, author_first_name, author_middle_name, author_last_name) values ('1038187673218', 'Kaine', 'Fiann', 'Napoli');
insert into books_author (isbn, author_first_name, author_middle_name, author_last_name) values ('9795278987571', 'Bealle', 'Angie', 'Paver');
insert into books_author (isbn, author_first_name, author_middle_name, author_last_name) values ('8850267946453', 'Ado', 'Alexa', 'Marcinkus');
insert into books_author (isbn, author_first_name, author_middle_name, author_last_name) values ('9759345048100', 'Kele', 'Korella', 'Keoghan');
insert into books_author (isbn, author_first_name, author_middle_name, author_last_name) values ('6347097825249', 'Cayla', 'Lynn', 'Georgeot');
insert into books_author (isbn, author_first_name, author_middle_name, author_last_name) values ('9387577078018', 'Guendolen', 'Stacee', 'Crebbin');
insert into books_author (isbn, author_first_name, author_middle_name, author_last_name) values ('8664568623869', 'Ravid', 'Johnette', 'Redihough');
insert into books_author (isbn, author_first_name, author_middle_name, author_last_name) values ('5487578195084', 'Guilbert', 'Ariella', 'Bride');
insert into books_author (isbn, author_first_name, author_middle_name, author_last_name) values ('1734123385747', 'Fredi', 'Georgiana', 'Newson');
insert into books_author (isbn, author_first_name, author_middle_name, author_last_name) values ('5317456889143', 'Rozella', 'Shelly', 'Fideler');
insert into books_author (isbn, author_first_name, author_middle_name, author_last_name) values ('1559123232579', 'Neron', 'Dorian', 'Cordero');
insert into books_author (isbn, author_first_name, author_middle_name, author_last_name) values ('0375989720378', 'Matty', 'Rachel', 'Papps');
insert into books_author (isbn, author_first_name, author_middle_name, author_last_name) values ('6045660870888', 'Gwenneth', 'Ardis', 'Fludgate');
insert into books_author (isbn, author_first_name, author_middle_name, author_last_name) values ('1102082303420', 'Kenton', 'Tonya', 'Matiebe');
insert into books_author (isbn, author_first_name, author_middle_name, author_last_name) values ('1465674268159', 'Prisca', 'Maggy', 'Brambell');
insert into books_author (isbn, author_first_name, author_middle_name, author_last_name) values ('5752558607210', 'Tiffy', 'Mary', 'Chazier');
insert into books_author (isbn, author_first_name, author_middle_name, author_last_name) values ('0314499954903', 'Helaine', 'Korney', 'Pendered');
insert into books_author (isbn, author_first_name, author_middle_name, author_last_name) values ('6410851116606', 'Clementia', 'Goldy', 'Tomkys');
insert into books_author (isbn, author_first_name, author_middle_name, author_last_name) values ('2708534695379', 'Darcee', 'Hanny', 'Dudny');
insert into books_author (isbn, author_first_name, author_middle_name, author_last_name) values ('1384775782469', 'Corilla', 'Roxana', 'Skerme');
insert into books_author (isbn, author_first_name, author_middle_name, author_last_name) values ('9966242290758', 'Beverly', 'Ema', 'Lamblin');
insert into books_author (isbn, author_first_name, author_middle_name, author_last_name) values ('0809784979155', 'Tricia', 'Hilliary', 'Bouttell');
insert into books_author (isbn, author_first_name, author_middle_name, author_last_name) values ('9401496029041', 'Shelagh', 'Kathi', 'Fyldes');
insert into books_author (isbn, author_first_name, author_middle_name, author_last_name) values ('3023607894971', 'Tiff', 'Laure', 'Lackham');
insert into books_author (isbn, author_first_name, author_middle_name, author_last_name) values ('5637151250435', 'Jefferey', 'Clare', 'Goodhand');
insert into books_author (isbn, author_first_name, author_middle_name, author_last_name) values ('3801803376307', 'Lauraine', 'Kirsteni', 'Grishanov');
insert into books_author (isbn, author_first_name, author_middle_name, author_last_name) values ('0311999229072', 'Louisa', 'Dareen', 'Phythian');
insert into books_author (isbn, author_first_name, author_middle_name, author_last_name) values ('6886890911303', 'Falkner', 'Kameko', 'Ochterlony');
insert into books_author (isbn, author_first_name, author_middle_name, author_last_name) values ('1880989916727', 'Sinclare', 'Halette', 'Dumini');
insert into books_author (isbn, author_first_name, author_middle_name, author_last_name) values ('0674909573292', 'Omero', 'Babb', 'Carlon');
insert into books_author (isbn, author_first_name, author_middle_name, author_last_name) values ('3497871017792', 'Amble', 'Ronna', 'Frow');
insert into books_author (isbn, author_first_name, author_middle_name, author_last_name) values ('4337174964178', 'Regine', 'Audry', 'Carletto');
insert into books_author (isbn, author_first_name, author_middle_name, author_last_name) values ('3233359903008', 'Fabian', 'Diena', 'Giller');
insert into books_author (isbn, author_first_name, author_middle_name, author_last_name) values ('1849562027959', 'Electra', 'Kathrine', 'Dyer');
insert into books_author (isbn, author_first_name, author_middle_name, author_last_name) values ('2605933464940', 'Giraldo', 'Allx', 'MacCaughen');
insert into books_author (isbn, author_first_name, author_middle_name, author_last_name) values ('6665316998471', 'Wilmette', 'Zorine', 'Baglow');
insert into books_author (isbn, author_first_name, author_middle_name, author_last_name) values ('3434457249094', 'Christoper', 'Marcy', 'Maybery');
insert into books_author (isbn, author_first_name, author_middle_name, author_last_name) values ('9401079679717', 'Van', 'Agatha', 'Ben-Aharon');
insert into books_author (isbn, author_first_name, author_middle_name, author_last_name) values ('6282535018808', 'Nessie', 'Lauraine', 'Cattellion');
insert into books_author (isbn, author_first_name, author_middle_name, author_last_name) values ('9512116594361', 'Glenden', 'Harriette', 'Doherty');
insert into books_author (isbn, author_first_name, author_middle_name, author_last_name) values ('0307793378720', 'Bevon', 'Jennilee', 'Stanbra');
insert into books_author (isbn, author_first_name, author_middle_name, author_last_name) values ('6088775503660', 'Rube', 'Gwen', 'Peperell');
insert into books_author (isbn, author_first_name, author_middle_name, author_last_name) values ('4825391130222', 'Garvin', 'Teddie', 'Guinery');
insert into books_author (isbn, author_first_name, author_middle_name, author_last_name) values ('4531472543465', 'Willy', 'Heloise', 'Bompass');
insert into books_author (isbn, author_first_name, author_middle_name, author_last_name) values ('8630212258348', 'Thorny', 'Abagael', 'Antonijevic');
insert into books_author (isbn, author_first_name, author_middle_name, author_last_name) values ('3054755583226', 'Kirsteni', 'Ronnie', 'Scrogges');
insert into books_author (isbn, author_first_name, author_middle_name, author_last_name) values ('6424359997295', 'Jeramey', 'Carie', 'Donald');
insert into books_author (isbn, author_first_name, author_middle_name, author_last_name) values ('6941503348774', 'Andras', 'Rosemarie', 'Larkcum');
insert into books_author (isbn, author_first_name, author_middle_name, author_last_name) values ('4157469723312', 'Nanon', 'Brinna', 'Sambath');
insert into books_author (isbn, author_first_name, author_middle_name, author_last_name) values ('5453558852834', 'Livvie', 'Glen', 'Whitmell');
insert into books_author (isbn, author_first_name, author_middle_name, author_last_name) values ('5674805785564', 'Adam', 'Saudra', 'Gager');
insert into books_author (isbn, author_first_name, author_middle_name, author_last_name) values ('5998893066103', 'Brande', 'Sarita', 'Ville');
insert into books_author (isbn, author_first_name, author_middle_name, author_last_name) values ('5624524684158', 'Ardella', 'Elie', 'Fitchew');
insert into books_author (isbn, author_first_name, author_middle_name, author_last_name) values ('5340523327623', 'Torrance', 'Lesley', 'Matuschek');
insert into books_author (isbn, author_first_name, author_middle_name, author_last_name) values ('9271162786673', 'Kristi', 'Bee', 'Heams');
insert into books_author (isbn, author_first_name, author_middle_name, author_last_name) values ('6520474320230', 'Jessie', 'Domeniga', 'Amorts');
insert into books_author (isbn, author_first_name, author_middle_name, author_last_name) values ('2041197881464', 'Regen', 'Wilona', 'O''Suaird');
insert into books_author (isbn, author_first_name, author_middle_name, author_last_name) values ('4551192150404', 'Gary', 'Mariya', 'Bullman');
insert into books_author (isbn, author_first_name, author_middle_name, author_last_name) values ('2102821942056', 'Leona', 'Meta', 'Nunson');
insert into books_author (isbn, author_first_name, author_middle_name, author_last_name) values ('1887823406832', 'Blancha', 'Sheba', 'Hunston');
insert into books_author (isbn, author_first_name, author_middle_name, author_last_name) values ('0597909047825', 'Ardene', 'Hermine', 'Wilfing');
insert into books_author (isbn, author_first_name, author_middle_name, author_last_name) values ('3646938530520', 'Jeniece', 'Leola', 'Rushmere');
insert into books_author (isbn, author_first_name, author_middle_name, author_last_name) values ('1089728812164', 'Garner', 'Margalo', 'Backson');
insert into books_author (isbn, author_first_name, author_middle_name, author_last_name) values ('7355800064865', 'Gwen', 'Lynnette', 'Collyns');
insert into books_author (isbn, author_first_name, author_middle_name, author_last_name) values ('4409786147582', 'Dorie', 'Estell', 'Broddle');
insert into books_author (isbn, author_first_name, author_middle_name, author_last_name) values ('3697186816645', 'Audy', 'Reba', 'Larvent');
insert into books_author (isbn, author_first_name, author_middle_name, author_last_name) values ('5775360868585', 'Charmion', 'Vonny', 'Hebdon');
insert into books_author (isbn, author_first_name, author_middle_name, author_last_name) values ('5258929471531', 'Josh', 'Kirbee', 'Machen');
insert into books_author (isbn, author_first_name, author_middle_name, author_last_name) values ('0647432491033', 'Trudy', 'Zitella', 'Georges');
insert into books_author (isbn, author_first_name, author_middle_name, author_last_name) values ('7615837417331', 'Zebulon', 'Yolanda', 'Ochterlony');
insert into books_author (isbn, author_first_name, author_middle_name, author_last_name) values ('0277636020622', 'Eimile', 'Ladonna', 'Arthy');
insert into books_author (isbn, author_first_name, author_middle_name, author_last_name) values ('7801913419425', 'Marcelo', 'Adora', 'Scrane');
insert into books_author (isbn, author_first_name, author_middle_name, author_last_name) values ('3920489958474', 'Dee dee', 'Sadella', 'Rawlison');
insert into books_author (isbn, author_first_name, author_middle_name, author_last_name) values ('0413566995950', 'Wittie', 'Dayna', 'Whale');
insert into books_author (isbn, author_first_name, author_middle_name, author_last_name) values ('4674500211287', 'Filia', 'Suellen', 'Kilcoyne');
insert into books_author (isbn, author_first_name, author_middle_name, author_last_name) values ('1969663551731', 'Theodor', 'Sabrina', 'Whalebelly');
insert into books_author (isbn, author_first_name, author_middle_name, author_last_name) values ('1187226705882', 'Sauveur', 'Daile', 'Trustrie');
insert into books_author (isbn, author_first_name, author_middle_name, author_last_name) values ('9129284454744', 'Maribelle', 'Rosalynd', 'Darell');
insert into books_author (isbn, author_first_name, author_middle_name, author_last_name) values ('5741523753966', 'Cora', 'Consuelo', 'McCraw');
insert into books_author (isbn, author_first_name, author_middle_name, author_last_name) values ('4958732096270', 'Tatiania', 'Elora', 'Pook');
insert into books_author (isbn, author_first_name, author_middle_name, author_last_name) values ('6518563396192', 'Amabel', 'Nikoletta', 'Petegre');
insert into books_author (isbn, author_first_name, author_middle_name, author_last_name) values ('0170792598877', 'Auberta', 'Cherrita', 'O''Currane');
insert into books_author (isbn, author_first_name, author_middle_name, author_last_name) values ('6602753809677', 'Sidney', 'Angele', 'Zarfat');
insert into books_author (isbn, author_first_name, author_middle_name, author_last_name) values ('4044884221391', 'Alvy', 'Lilly', 'Sherburn');
insert into books_author (isbn, author_first_name, author_middle_name, author_last_name) values ('0625623177253', 'Zeb', 'Dyan', 'Holsey');
insert into books_author (isbn, author_first_name, author_middle_name, author_last_name) values ('7466845973946', 'Julianna', 'Bernete', 'Jenner');
insert into books_author (isbn, author_first_name, author_middle_name, author_last_name) values ('5125208224630', 'Larine', 'Giacinta', 'Beddows');
insert into books_author (isbn, author_first_name, author_middle_name, author_last_name) values ('8562425840137', 'Amye', 'Thalia', 'Mariette');
insert into books_author (isbn, author_first_name, author_middle_name, author_last_name) values ('9690878171501', 'Romain', 'Kari', 'Behan');
insert into books_author (isbn, author_first_name, author_middle_name, author_last_name) values ('9864251582965', 'Kessiah', 'Shana', 'Pedder');
insert into books_author (isbn, author_first_name, author_middle_name, author_last_name) values ('7525461191200', 'Hermia', 'Caitlin', 'Boays');
insert into books_author (isbn, author_first_name, author_middle_name, author_last_name) values ('0299456389217', 'Kellen', 'Minne', 'Galvin');
insert into books_author (isbn, author_first_name, author_middle_name, author_last_name) values ('4350773692254', 'Consolata', 'Catherine', 'Gillham');
insert into books_author (isbn, author_first_name, author_middle_name, author_last_name) values ('3927140461349', 'Sheryl', 'Michaelina', 'Banner');
insert into books_author (isbn, author_first_name, author_middle_name, author_last_name) values ('9989690093308', 'Ailee', 'Sharai', 'Northcliffe');
insert into books_author (isbn, author_first_name, author_middle_name, author_last_name) values ('8647069209643', 'Jeri', 'Nikki', 'Fensome');
insert into books_author (isbn, author_first_name, author_middle_name, author_last_name) values ('1531312766975', 'Cherye', 'Modestine', 'Togher');
insert into books_author (isbn, author_first_name, author_middle_name, author_last_name) values ('6273014587602', 'Berti', 'Marilin', 'Stanborough');
insert into books_author (isbn, author_first_name, author_middle_name, author_last_name) values ('1365767471714', 'Brig', 'Mandie', 'Liddicoat');
insert into books_author (isbn, author_first_name, author_middle_name, author_last_name) values ('9773223347634', 'Marylou', 'Melva', 'Kleinstein');
insert into books_author (isbn, author_first_name, author_middle_name, author_last_name) values ('2946838396846', 'Michele', 'Penny', 'Plante');
insert into books_author (isbn, author_first_name, author_middle_name, author_last_name) values ('9109476387742', 'Dede', 'Jojo', 'Chase');
insert into books_author (isbn, author_first_name, author_middle_name, author_last_name) values ('2239429838032', 'Woodie', 'Myrle', 'Venables');
insert into books_author (isbn, author_first_name, author_middle_name, author_last_name) values ('8498808515852', 'Roland', 'Vallie', 'Kingsbury');
insert into books_author (isbn, author_first_name, author_middle_name, author_last_name) values ('0895604179995', 'Jervis', 'Phaedra', 'Jennick');
insert into books_author (isbn, author_first_name, author_middle_name, author_last_name) values ('1377503859248', 'Colman', 'Mariquilla', 'Southernwood');
insert into books_author (isbn, author_first_name, author_middle_name, author_last_name) values ('3559809039053', 'Jarrad', 'Jobi', 'Osboldstone');
insert into books_author (isbn, author_first_name, author_middle_name, author_last_name) values ('7182435079906', 'Rodrique', 'Kiele', 'Yellowlea');
insert into books_author (isbn, author_first_name, author_middle_name, author_last_name) values ('7835367353251', 'Deane', 'Allina', 'Stathor');
insert into books_author (isbn, author_first_name, author_middle_name, author_last_name) values ('9164284517909', 'Job', 'Josey', 'Bilverstone');
insert into books_author (isbn, author_first_name, author_middle_name, author_last_name) values ('7264167440543', 'Christie', 'Emalee', 'Thwaites');
insert into books_author (isbn, author_first_name, author_middle_name, author_last_name) values ('6827739070212', 'Mortie', 'Maxy', 'Matteau');
insert into books_author (isbn, author_first_name, author_middle_name, author_last_name) values ('6413864068205', 'Karina', 'Lanita', 'Diano');
insert into books_author (isbn, author_first_name, author_middle_name, author_last_name) values ('5965782931947', 'Cicely', 'Julienne', 'Maving');
insert into books_author (isbn, author_first_name, author_middle_name, author_last_name) values ('9675749676736', 'Aurelia', 'Oralia', 'Tyne');
insert into books_author (isbn, author_first_name, author_middle_name, author_last_name) values ('1513750247136', 'Dorry', 'Maurita', 'Patley');
insert into books_author (isbn, author_first_name, author_middle_name, author_last_name) values ('8759116382848', 'Marty', 'Edwina', 'Burgis');
insert into books_author (isbn, author_first_name, author_middle_name, author_last_name) values ('0698870960726', 'Lonee', 'Trudy', 'Gare');
insert into books_author (isbn, author_first_name, author_middle_name, author_last_name) values ('5861743523626', 'Sheelah', 'Lani', 'Matyashev');
insert into books_author (isbn, author_first_name, author_middle_name, author_last_name) values ('0829699543148', 'Floyd', 'Eve', 'Myott');
insert into books_author (isbn, author_first_name, author_middle_name, author_last_name) values ('1038187673218', 'Cariotta', 'Anthia', 'Mulles');
insert into books_author (isbn, author_first_name, author_middle_name, author_last_name) values ('9795278987571', 'Margarette', 'Cristen', 'Walkington');
insert into books_author (isbn, author_first_name, author_middle_name, author_last_name) values ('8850267946453', 'Wilmer', 'Carin', 'Flori');
insert into books_author (isbn, author_first_name, author_middle_name, author_last_name) values ('9759345048100', 'Beniamino', 'Erika', 'MacKaile');
insert into books_author (isbn, author_first_name, author_middle_name, author_last_name) values ('6347097825249', 'Catha', 'Audry', 'Cookman');
insert into books_author (isbn, author_first_name, author_middle_name, author_last_name) values ('9387577078018', 'Alyssa', 'Lyndsey', 'Andrin');
insert into books_author (isbn, author_first_name, author_middle_name, author_last_name) values ('8664568623869', 'Curr', 'Judith', 'Marquot');
insert into books_author (isbn, author_first_name, author_middle_name, author_last_name) values ('5487578195084', 'Petronella', 'Sally', 'Batham');
insert into books_author (isbn, author_first_name, author_middle_name, author_last_name) values ('1734123385747', 'Bent', 'Katee', 'Filer');
insert into books_author (isbn, author_first_name, author_middle_name, author_last_name) values ('5317456889143', 'Ottilie', 'Grata', 'Myrtle');
insert into books_author (isbn, author_first_name, author_middle_name, author_last_name) values ('1559123232579', 'Peterus', 'Hedy', 'Meco');
insert into books_author (isbn, author_first_name, author_middle_name, author_last_name) values ('0375989720378', 'Ritchie', 'Meridel', 'Niece');
insert into books_author (isbn, author_first_name, author_middle_name, author_last_name) values ('6045660870888', 'Benoite', 'Tomasine', 'Ring');
insert into books_author (isbn, author_first_name, author_middle_name, author_last_name) values ('1102082303420', 'Adriena', 'Kacie', 'Meldon');
insert into books_author (isbn, author_first_name, author_middle_name, author_last_name) values ('1465674268159', 'Alethea', 'Johna', 'Drever');
insert into books_author (isbn, author_first_name, author_middle_name, author_last_name) values ('5752558607210', 'Hastie', 'Latrina', 'Spiller');
insert into books_author (isbn, author_first_name, author_middle_name, author_last_name) values ('0314499954903', 'Opaline', 'Cathee', 'Clarke-Williams');
insert into books_author (isbn, author_first_name, author_middle_name, author_last_name) values ('6410851116606', 'Gearard', 'Catina', 'Mushawe');
insert into books_author (isbn, author_first_name, author_middle_name, author_last_name) values ('2708534695379', 'Lisbeth', 'Francene', 'Shill');
insert into books_author (isbn, author_first_name, author_middle_name, author_last_name) values ('1384775782469', 'Eva', 'Abagael', 'Garfoot');
insert into books_author (isbn, author_first_name, author_middle_name, author_last_name) values ('9966242290758', 'Currey', 'Berta', 'Extil');
insert into books_author (isbn, author_first_name, author_middle_name, author_last_name) values ('0809784979155', 'Odetta', 'Nadya', 'Kubecka');
insert into books_author (isbn, author_first_name, author_middle_name, author_last_name) values ('9401496029041', 'Cordy', 'Daune', 'Southernwood');
insert into books_author (isbn, author_first_name, author_middle_name, author_last_name) values ('3023607894971', 'Shandie', 'Liv', 'Born');
insert into books_author (isbn, author_first_name, author_middle_name, author_last_name) values ('5637151250435', 'Florinda', 'Myrah', 'Francillo');
insert into books_author (isbn, author_first_name, author_middle_name, author_last_name) values ('3801803376307', 'Adrianne', 'Lilian', 'Gothliff');
insert into books_author (isbn, author_first_name, author_middle_name, author_last_name) values ('0311999229072', 'Revkah', 'Dorisa', 'Fielding');
insert into books_author (isbn, author_first_name, author_middle_name, author_last_name) values ('6886890911303', 'Perl', 'Danice', 'Spendley');
insert into books_author (isbn, author_first_name, author_middle_name, author_last_name) values ('1880989916727', 'Nancy', 'Dana', 'Kitcat');
insert into books_author (isbn, author_first_name, author_middle_name, author_last_name) values ('0674909573292', 'Ddene', 'Louise', 'Demageard');
insert into books_author (isbn, author_first_name, author_middle_name, author_last_name) values ('3497871017792', 'Wrennie', 'Romy', 'Crowne');
insert into books_author (isbn, author_first_name, author_middle_name, author_last_name) values ('4337174964178', 'Candy', 'Hyacinth', 'Veck');
insert into books_author (isbn, author_first_name, author_middle_name, author_last_name) values ('3233359903008', 'Ruprecht', 'Amalie', 'Selvester');
insert into books_author (isbn, author_first_name, author_middle_name, author_last_name) values ('1849562027959', 'Concettina', 'Sandy', 'Marchington');
insert into books_author (isbn, author_first_name, author_middle_name, author_last_name) values ('2605933464940', 'Ryun', 'Grethel', 'Cockill');
insert into books_author (isbn, author_first_name, author_middle_name, author_last_name) values ('6665316998471', 'Marven', 'Desiree', 'Eastabrook');
insert into books_author (isbn, author_first_name, author_middle_name, author_last_name) values ('3434457249094', 'Ryley', 'Miran', 'Luckham');
insert into books_author (isbn, author_first_name, author_middle_name, author_last_name) values ('9401079679717', 'Mirabelle', 'Jolene', 'Cawthorn');
insert into books_author (isbn, author_first_name, author_middle_name, author_last_name) values ('6282535018808', 'Clarice', 'Carlene', 'Beastall');
insert into books_author (isbn, author_first_name, author_middle_name, author_last_name) values ('9512116594361', 'Wandie', 'Maighdiln', 'Charette');
insert into books_author (isbn, author_first_name, author_middle_name, author_last_name) values ('0307793378720', 'Cobby', 'Nanete', 'Dumberell');
insert into books_author (isbn, author_first_name, author_middle_name, author_last_name) values ('6088775503660', 'Abdel', 'Maia', 'Aitkin');
insert into books_author (isbn, author_first_name, author_middle_name, author_last_name) values ('4825391130222', 'Culver', 'Tedi', 'Ead');
insert into books_author (isbn, author_first_name, author_middle_name, author_last_name) values ('4531472543465', 'Marcelia', 'Selestina', 'Wisker');
insert into books_author (isbn, author_first_name, author_middle_name, author_last_name) values ('8630212258348', 'Tristan', 'Jennilee', 'Olenichev');
insert into books_author (isbn, author_first_name, author_middle_name, author_last_name) values ('3054755583226', 'Rosene', 'Alleen', 'Frere');
insert into books_author (isbn, author_first_name, author_middle_name, author_last_name) values ('6424359997295', 'Carline', 'Adela', 'Kleen');
insert into books_author (isbn, author_first_name, author_middle_name, author_last_name) values ('6941503348774', 'Melodie', 'Julianne', 'Podmore');
insert into books_author (isbn, author_first_name, author_middle_name, author_last_name) values ('4157469723312', 'Ramonda', 'Marjory', 'Milner');
insert into books_author (isbn, author_first_name, author_middle_name, author_last_name) values ('5453558852834', 'Stefa', 'Thomasine', 'Argrave');
insert into books_author (isbn, author_first_name, author_middle_name, author_last_name) values ('5674805785564', 'Lindsay', 'Susette', 'Cortez');
insert into books_author (isbn, author_first_name, author_middle_name, author_last_name) values ('5998893066103', 'Worth', 'Meta', 'Sheals');
insert into books_author (isbn, author_first_name, author_middle_name, author_last_name) values ('5624524684158', 'Flossie', 'Murial', 'Ratledge');
insert into books_author (isbn, author_first_name, author_middle_name, author_last_name) values ('5340523327623', 'Hartwell', 'Rhiamon', 'Kimber');
insert into books_author (isbn, author_first_name, author_middle_name, author_last_name) values ('9271162786673', 'Brittany', 'Silvia', 'Schubart');
insert into books_author (isbn, author_first_name, author_middle_name, author_last_name) values ('6520474320230', 'Sampson', 'Claresta', 'Bainbridge');

#copies populate

insert into copies (copy_id, isbn, school_id) values (127, '2708534695379', 'cg4o9lmy');
insert into copies (copy_id, isbn, school_id) values (807, '1384775782469', '0p8ju3vq');
insert into copies (copy_id, isbn, school_id) values (314, '9966242290758', 'cbnx7ywj');
insert into copies (copy_id, isbn, school_id) values (138, '0809784979155', 'l0xrbdy6');
insert into copies (copy_id, isbn, school_id) values (389, '9401496029041', '6e3w27za');
insert into copies (copy_id, isbn, school_id) values (363, '3023607894971', 'cg4o9lmy');
insert into copies (copy_id, isbn, school_id) values (650, '5637151250435', '0p8ju3vq');
insert into copies (copy_id, isbn, school_id) values (305, '3801803376307', 'cbnx7ywj');
insert into copies (copy_id, isbn, school_id) values (723, '0311999229072', 'l0xrbdy6');
insert into copies (copy_id, isbn, school_id) values (552, '6886890911303', '6e3w27za');
insert into copies (copy_id, isbn, school_id) values (984, '1880989916727', 'cg4o9lmy');
insert into copies (copy_id, isbn, school_id) values (746, '0674909573292', '0p8ju3vq');
insert into copies (copy_id, isbn, school_id) values (518, '3497871017792', 'cbnx7ywj');
insert into copies (copy_id, isbn, school_id) values (595, '4337174964178', 'l0xrbdy6');
insert into copies (copy_id, isbn, school_id) values (554, '3233359903008', '6e3w27za');
insert into copies (copy_id, isbn, school_id) values (887, '1849562027959', 'cg4o9lmy');
insert into copies (copy_id, isbn, school_id) values (694, '2605933464940', '0p8ju3vq');
insert into copies (copy_id, isbn, school_id) values (177, '6665316998471', 'cbnx7ywj');
insert into copies (copy_id, isbn, school_id) values (240, '3434457249094', 'l0xrbdy6');
insert into copies (copy_id, isbn, school_id) values (254, '6282535018808', 'cg4o9lmy');
insert into copies (copy_id, isbn, school_id) values (663, '9512116594361', '0p8ju3vq');
insert into copies (copy_id, isbn, school_id) values (767, '0307793378720', 'cbnx7ywj');
insert into copies (copy_id, isbn, school_id) values (140, '6088775503660', 'l0xrbdy6');
insert into copies (copy_id, isbn, school_id) values (646, '4825391130222', '6e3w27za');
insert into copies (copy_id, isbn, school_id) values (993, '4531472543465', 'cg4o9lmy');
insert into copies (copy_id, isbn, school_id) values (255, '8630212258348', '0p8ju3vq');
insert into copies (copy_id, isbn, school_id) values (321, '3054755583226', 'cbnx7ywj');
insert into copies (copy_id, isbn, school_id) values (839, '6424359997295', 'l0xrbdy6');
insert into copies (copy_id, isbn, school_id) values (501, '6941503348774', '6e3w27za');
insert into copies (copy_id, isbn, school_id) values (713, '4157469723312', 'cg4o9lmy');
insert into copies (copy_id, isbn, school_id) values (242, '5453558852834', '0p8ju3vq');
insert into copies (copy_id, isbn, school_id) values (105, '5674805785564', 'cbnx7ywj');
insert into copies (copy_id, isbn, school_id) values (219, '5998893066103', 'l0xrbdy6');
insert into copies (copy_id, isbn, school_id) values (518, '5624524684158', '6e3w27za');
insert into copies (copy_id, isbn, school_id) values (806, '5340523327623', 'cg4o9lmy');
insert into copies (copy_id, isbn, school_id) values (224, '9271162786673', '0p8ju3vq');
insert into copies (copy_id, isbn, school_id) values (939, '6520474320230', 'cbnx7ywj');
insert into copies (copy_id, isbn, school_id) values (494, '2041197881464', 'l0xrbdy6');
insert into copies (copy_id, isbn, school_id) values (456, '4551192150404', '6e3w27za');
insert into copies (copy_id, isbn, school_id) values (356, '2102821942056', 'cg4o9lmy');
insert into copies (copy_id, isbn, school_id) values (289, '1887823406832', '0p8ju3vq');
insert into copies (copy_id, isbn, school_id) values (925, '0597909047825', 'cbnx7ywj');
insert into copies (copy_id, isbn, school_id) values (553, '3646938530520', 'l0xrbdy6');
insert into copies (copy_id, isbn, school_id) values (684, '1089728812164', '6e3w27za');
insert into copies (copy_id, isbn, school_id) values (990, '7355800064865', 'cg4o9lmy');
insert into copies (copy_id, isbn, school_id) values (401, '4409786147582', '0p8ju3vq');
insert into copies (copy_id, isbn, school_id) values (283, '3697186816645', 'cbnx7ywj');
insert into copies (copy_id, isbn, school_id) values (473, '5775360868585', 'l0xrbdy6');
insert into copies (copy_id, isbn, school_id) values (292, '5258929471531', '6e3w27za');
insert into copies (copy_id, isbn, school_id) values (216, '0647432491033', 'cg4o9lmy');
insert into copies (copy_id, isbn, school_id) values (212, '7615837417331', '0p8ju3vq');
insert into copies (copy_id, isbn, school_id) values (609, '0277636020622', 'cbnx7ywj');
insert into copies (copy_id, isbn, school_id) values (331, '7801913419425', 'l0xrbdy6');
insert into copies (copy_id, isbn, school_id) values (302, '3920489958474', '6e3w27za');
insert into copies (copy_id, isbn, school_id) values (528, '0413566995950', 'cg4o9lmy');
insert into copies (copy_id, isbn, school_id) values (409, '4674500211287', '0p8ju3vq');
insert into copies (copy_id, isbn, school_id) values (749, '1969663551731', 'cbnx7ywj');
insert into copies (copy_id, isbn, school_id) values (273, '1187226705882', 'l0xrbdy6');
insert into copies (copy_id, isbn, school_id) values (853, '9129284454744', '6e3w27za');
insert into copies (copy_id, isbn, school_id) values (531, '5741523753966', 'cg4o9lmy');
insert into copies (copy_id, isbn, school_id) values (174, '4958732096270', '0p8ju3vq');
insert into copies (copy_id, isbn, school_id) values (573, '6518563396192', 'cbnx7ywj');
insert into copies (copy_id, isbn, school_id) values (592, '0170792598877', 'l0xrbdy6');
insert into copies (copy_id, isbn, school_id) values (568, '6602753809677', '6e3w27za');
insert into copies (copy_id, isbn, school_id) values (534, '4044884221391', 'cg4o9lmy');
insert into copies (copy_id, isbn, school_id) values (466, '0625623177253', '0p8ju3vq');
insert into copies (copy_id, isbn, school_id) values (591, '7466845973946', 'cbnx7ywj');
insert into copies (copy_id, isbn, school_id) values (511, '5125208224630', 'l0xrbdy6');
insert into copies (copy_id, isbn, school_id) values (393, '8562425840137', '6e3w27za');
insert into copies (copy_id, isbn, school_id) values (891, '9690878171501', 'cg4o9lmy');
insert into copies (copy_id, isbn, school_id) values (194, '9864251582965', '0p8ju3vq');
insert into copies (copy_id, isbn, school_id) values (145, '7525461191200', 'cbnx7ywj');
insert into copies (copy_id, isbn, school_id) values (578, '0299456389217', 'l0xrbdy6');
insert into copies (copy_id, isbn, school_id) values (968, '4350773692254', '6e3w27za');
insert into copies (copy_id, isbn, school_id) values (799, '3927140461349', 'cg4o9lmy');
insert into copies (copy_id, isbn, school_id) values (400, '9989690093308', '0p8ju3vq');
insert into copies (copy_id, isbn, school_id) values (192, '8647069209643', 'cbnx7ywj');
insert into copies (copy_id, isbn, school_id) values (168, '1531312766975', 'l0xrbdy6');
insert into copies (copy_id, isbn, school_id) values (304, '6273014587602', '6e3w27za');
insert into copies (copy_id, isbn, school_id) values (755, '1365767471714', 'cg4o9lmy');
insert into copies (copy_id, isbn, school_id) values (271, '9773223347634', '0p8ju3vq');
insert into copies (copy_id, isbn, school_id) values (594, '2946838396846', 'cbnx7ywj');
insert into copies (copy_id, isbn, school_id) values (872, '9109476387742', 'l0xrbdy6');
insert into copies (copy_id, isbn, school_id) values (708, '2239429838032', '6e3w27za');
insert into copies (copy_id, isbn, school_id) values (232, '8498808515852', 'cg4o9lmy');
insert into copies (copy_id, isbn, school_id) values (108, '0895604179995', '0p8ju3vq');
insert into copies (copy_id, isbn, school_id) values (102, '1377503859248', 'cbnx7ywj');
insert into copies (copy_id, isbn, school_id) values (343, '3559809039053', 'l0xrbdy6');
insert into copies (copy_id, isbn, school_id) values (816, '7182435079906', '6e3w27za');
insert into copies (copy_id, isbn, school_id) values (618, '7835367353251', 'cg4o9lmy');
insert into copies (copy_id, isbn, school_id) values (281, '9164284517909', '0p8ju3vq');
insert into copies (copy_id, isbn, school_id) values (567, '7264167440543', 'cbnx7ywj');
insert into copies (copy_id, isbn, school_id) values (899, '6827739070212', 'l0xrbdy6');
insert into copies (copy_id, isbn, school_id) values (382, '6413864068205', '6e3w27za');
insert into copies (copy_id, isbn, school_id) values (960, '5965782931947', 'cg4o9lmy');
insert into copies (copy_id, isbn, school_id) values (160, '9675749676736', '0p8ju3vq');
insert into copies (copy_id, isbn, school_id) values (747, '1513750247136', 'cbnx7ywj');
insert into copies (copy_id, isbn, school_id) values (570, '8759116382848', 'l0xrbdy6');
insert into copies (copy_id, isbn, school_id) values (562, '0698870960726', '6e3w27za');
insert into copies (copy_id, isbn, school_id) values (785, '5861743523626', 'cg4o9lmy');
insert into copies (copy_id, isbn, school_id) values (339, '0829699543148', '0p8ju3vq');
insert into copies (copy_id, isbn, school_id) values (652, '1038187673218', 'cbnx7ywj');
insert into copies (copy_id, isbn, school_id) values (941, '9795278987571', 'l0xrbdy6');
insert into copies (copy_id, isbn, school_id) values (880, '8850267946453', '6e3w27za');
insert into copies (copy_id, isbn, school_id) values (187, '9759345048100', 'cg4o9lmy');
insert into copies (copy_id, isbn, school_id) values (320, '6347097825249', '0p8ju3vq');
insert into copies (copy_id, isbn, school_id) values (542, '9387577078018', 'cbnx7ywj');
insert into copies (copy_id, isbn, school_id) values (933, '8664568623869', 'l0xrbdy6');
insert into copies (copy_id, isbn, school_id) values (125, '5487578195084', '6e3w27za');
insert into copies (copy_id, isbn, school_id) values (721, '1734123385747', 'cg4o9lmy');
insert into copies (copy_id, isbn, school_id) values (587, '5317456889143', '0p8ju3vq');
insert into copies (copy_id, isbn, school_id) values (872, '1559123232579', 'cbnx7ywj');
insert into copies (copy_id, isbn, school_id) values (265, '0375989720378', 'l0xrbdy6');
insert into copies (copy_id, isbn, school_id) values (739, '6045660870888', '6e3w27za');
insert into copies (copy_id, isbn, school_id) values (838, '1102082303420', 'cg4o9lmy');
insert into copies (copy_id, isbn, school_id) values (706, '1465674268159', '0p8ju3vq');
insert into copies (copy_id, isbn, school_id) values (265, '5752558607210', 'cbnx7ywj');
insert into copies (copy_id, isbn, school_id) values (790, '0314499954903', 'l0xrbdy6');
insert into copies (copy_id, isbn, school_id) values (971, '6410851116606', '6e3w27za');
insert into copies (copy_id, isbn, school_id) values (768, '2708534695379', 'cg4o9lmy');
insert into copies (copy_id, isbn, school_id) values (659, '1384775782469', '0p8ju3vq');
insert into copies (copy_id, isbn, school_id) values (294, '9966242290758', 'cbnx7ywj');
insert into copies (copy_id, isbn, school_id) values (222, '0809784979155', 'l0xrbdy6');
insert into copies (copy_id, isbn, school_id) values (998, '9401496029041', '6e3w27za');
insert into copies (copy_id, isbn, school_id) values (494, '3023607894971', 'cg4o9lmy');
insert into copies (copy_id, isbn, school_id) values (562, '5637151250435', '0p8ju3vq');
insert into copies (copy_id, isbn, school_id) values (427, '3801803376307', 'cbnx7ywj');
insert into copies (copy_id, isbn, school_id) values (662, '0311999229072', 'l0xrbdy6');
insert into copies (copy_id, isbn, school_id) values (478, '6886890911303', '6e3w27za');
insert into copies (copy_id, isbn, school_id) values (757, '1880989916727', 'cg4o9lmy');
insert into copies (copy_id, isbn, school_id) values (726, '0674909573292', '0p8ju3vq');
insert into copies (copy_id, isbn, school_id) values (918, '3497871017792', 'cbnx7ywj');
insert into copies (copy_id, isbn, school_id) values (451, '4337174964178', 'l0xrbdy6');
insert into copies (copy_id, isbn, school_id) values (199, '3233359903008', '6e3w27za');
insert into copies (copy_id, isbn, school_id) values (771, '1849562027959', 'cg4o9lmy');
insert into copies (copy_id, isbn, school_id) values (633, '2605933464940', '0p8ju3vq');
insert into copies (copy_id, isbn, school_id) values (458, '6665316998471', 'cbnx7ywj');
insert into copies (copy_id, isbn, school_id) values (664, '3434457249094', 'l0xrbdy6');
insert into copies (copy_id, isbn, school_id) values (963, '9401079679717', '6e3w27za');
insert into copies (copy_id, isbn, school_id) values (194, '6282535018808', 'cg4o9lmy');
insert into copies (copy_id, isbn, school_id) values (362, '9512116594361', '0p8ju3vq');
insert into copies (copy_id, isbn, school_id) values (604, '0307793378720', 'cbnx7ywj');
insert into copies (copy_id, isbn, school_id) values (460, '6088775503660', 'l0xrbdy6');
insert into copies (copy_id, isbn, school_id) values (283, '4825391130222', '6e3w27za');
insert into copies (copy_id, isbn, school_id) values (360, '4531472543465', 'cg4o9lmy');
insert into copies (copy_id, isbn, school_id) values (444, '8630212258348', '0p8ju3vq');
insert into copies (copy_id, isbn, school_id) values (664, '3054755583226', 'cbnx7ywj');
insert into copies (copy_id, isbn, school_id) values (444, '6424359997295', 'l0xrbdy6');
insert into copies (copy_id, isbn, school_id) values (499, '6941503348774', '6e3w27za');
insert into copies (copy_id, isbn, school_id) values (252, '4157469723312', 'cg4o9lmy');
insert into copies (copy_id, isbn, school_id) values (248, '5453558852834', '0p8ju3vq');
insert into copies (copy_id, isbn, school_id) values (717, '5674805785564', 'cbnx7ywj');
insert into copies (copy_id, isbn, school_id) values (950, '5998893066103', 'l0xrbdy6');
insert into copies (copy_id, isbn, school_id) values (768, '5624524684158', '6e3w27za');
insert into copies (copy_id, isbn, school_id) values (720, '5340523327623', 'cg4o9lmy');
insert into copies (copy_id, isbn, school_id) values (438, '9271162786673', '0p8ju3vq');
insert into copies (copy_id, isbn, school_id) values (820, '6520474320230', 'cbnx7ywj');
insert into copies (copy_id, isbn, school_id) values (483, '2041197881464', 'l0xrbdy6');
insert into copies (copy_id, isbn, school_id) values (632, '4551192150404', '6e3w27za');
insert into copies (copy_id, isbn, school_id) values (452, '2102821942056', 'cg4o9lmy');
insert into copies (copy_id, isbn, school_id) values (480, '1887823406832', '0p8ju3vq');
insert into copies (copy_id, isbn, school_id) values (748, '0597909047825', 'cbnx7ywj');
insert into copies (copy_id, isbn, school_id) values (178, '3646938530520', 'l0xrbdy6');
insert into copies (copy_id, isbn, school_id) values (434, '1089728812164', '6e3w27za');
insert into copies (copy_id, isbn, school_id) values (962, '7355800064865', 'cg4o9lmy');
insert into copies (copy_id, isbn, school_id) values (657, '4409786147582', '0p8ju3vq');
insert into copies (copy_id, isbn, school_id) values (731, '3697186816645', 'cbnx7ywj');
insert into copies (copy_id, isbn, school_id) values (480, '5775360868585', 'l0xrbdy6');
insert into copies (copy_id, isbn, school_id) values (823, '5258929471531', '6e3w27za');
insert into copies (copy_id, isbn, school_id) values (542, '0647432491033', 'cg4o9lmy');
insert into copies (copy_id, isbn, school_id) values (614, '7615837417331', '0p8ju3vq');
insert into copies (copy_id, isbn, school_id) values (162, '0277636020622', 'cbnx7ywj');
insert into copies (copy_id, isbn, school_id) values (487, '7801913419425', 'l0xrbdy6');
insert into copies (copy_id, isbn, school_id) values (230, '3920489958474', '6e3w27za');
insert into copies (copy_id, isbn, school_id) values (519, '0413566995950', 'cg4o9lmy');
insert into copies (copy_id, isbn, school_id) values (488, '4674500211287', '0p8ju3vq');
insert into copies (copy_id, isbn, school_id) values (786, '1969663551731', 'cbnx7ywj');
insert into copies (copy_id, isbn, school_id) values (107, '1187226705882', 'l0xrbdy6');
insert into copies (copy_id, isbn, school_id) values (158, '9129284454744', '6e3w27za');
insert into copies (copy_id, isbn, school_id) values (892, '5741523753966', 'cg4o9lmy');
insert into copies (copy_id, isbn, school_id) values (268, '4958732096270', '0p8ju3vq');
insert into copies (copy_id, isbn, school_id) values (416, '6518563396192', 'cbnx7ywj');
insert into copies (copy_id, isbn, school_id) values (217, '0170792598877', 'l0xrbdy6');
insert into copies (copy_id, isbn, school_id) values (686, '6602753809677', '6e3w27za');
insert into copies (copy_id, isbn, school_id) values (769, '4044884221391', 'cg4o9lmy');
insert into copies (copy_id, isbn, school_id) values (278, '0625623177253', '0p8ju3vq');
insert into copies (copy_id, isbn, school_id) values (916, '7466845973946', 'cbnx7ywj');
insert into copies (copy_id, isbn, school_id) values (180, '5125208224630', 'l0xrbdy6');
insert into copies (copy_id, isbn, school_id) values (744, '8562425840137', '6e3w27za');
insert into copies (copy_id, isbn, school_id) values (344, '9690878171501', 'cg4o9lmy');
insert into copies (copy_id, isbn, school_id) values (457, '9864251582965', '0p8ju3vq');
insert into copies (copy_id, isbn, school_id) values (695, '7525461191200', 'cbnx7ywj');
insert into copies (copy_id, isbn, school_id) values (582, '0299456389217', 'l0xrbdy6');
insert into copies (copy_id, isbn, school_id) values (650, '4350773692254', '6e3w27za');
insert into copies (copy_id, isbn, school_id) values (787, '3927140461349', 'cg4o9lmy');
insert into copies (copy_id, isbn, school_id) values (126, '9989690093308', '0p8ju3vq');
insert into copies (copy_id, isbn, school_id) values (347, '8647069209643', 'cbnx7ywj');
insert into copies (copy_id, isbn, school_id) values (669, '1531312766975', 'l0xrbdy6');
insert into copies (copy_id, isbn, school_id) values (325, '6273014587602', '6e3w27za');
insert into copies (copy_id, isbn, school_id) values (111, '1365767471714', 'cg4o9lmy');
insert into copies (copy_id, isbn, school_id) values (617, '9773223347634', '0p8ju3vq');
insert into copies (copy_id, isbn, school_id) values (961, '2946838396846', 'cbnx7ywj');
insert into copies (copy_id, isbn, school_id) values (810, '9109476387742', 'l0xrbdy6');
insert into copies (copy_id, isbn, school_id) values (832, '2239429838032', '6e3w27za');
insert into copies (copy_id, isbn, school_id) values (679, '8498808515852', 'cg4o9lmy');
insert into copies (copy_id, isbn, school_id) values (830, '0895604179995', '0p8ju3vq');
insert into copies (copy_id, isbn, school_id) values (823, '1377503859248', 'cbnx7ywj');
insert into copies (copy_id, isbn, school_id) values (927, '3559809039053', 'l0xrbdy6');
insert into copies (copy_id, isbn, school_id) values (448, '7182435079906', '6e3w27za');
insert into copies (copy_id, isbn, school_id) values (545, '7835367353251', 'cg4o9lmy');
insert into copies (copy_id, isbn, school_id) values (447, '9164284517909', '0p8ju3vq');
insert into copies (copy_id, isbn, school_id) values (880, '7264167440543', 'cbnx7ywj');
insert into copies (copy_id, isbn, school_id) values (838, '6827739070212', 'l0xrbdy6');
insert into copies (copy_id, isbn, school_id) values (432, '6413864068205', '6e3w27za');
insert into copies (copy_id, isbn, school_id) values (885, '5965782931947', 'cg4o9lmy');
insert into copies (copy_id, isbn, school_id) values (853, '9675749676736', '0p8ju3vq');
insert into copies (copy_id, isbn, school_id) values (686, '1513750247136', 'cbnx7ywj');
insert into copies (copy_id, isbn, school_id) values (465, '8759116382848', 'l0xrbdy6');
insert into copies (copy_id, isbn, school_id) values (422, '0698870960726', '6e3w27za');

#reviews populate

insert into reviews (isbn, username, comment, rating, date) values ('2708534695379', 'donkeykong', 'Sed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus.', 2, '2022-5-11');
insert into reviews (isbn, username, comment, rating, date) values ('1384775782469', 'jessicca', 'Etiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem.', 5, '2022-5-12');
insert into reviews (isbn, username, comment, rating, date) values ('9966242290758', 'kati', 'Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat.', 5, '2022-5-15');
insert into reviews (isbn, username, comment, rating, date) values ('0809784979155', 'laura', 'Cras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque.', 5, '2022-5-12');
insert into reviews (isbn, username, comment, rating, date) values ('9401496029041', 'lissa', 'Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat.', 5, '2022-5-11');
insert into reviews (isbn, username, comment, rating, date) values ('3023607894971', 'natalie', 'Fusce consequat. Nulla nisl. Nunc nisl.', 3, '2022-5-12');
insert into reviews (isbn, username, comment, rating, date) values ('5637151250435', 'oliver', 'Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum.', 1, '2022-5-12');
insert into reviews (isbn, username, comment, rating, date) values ('3801803376307', 'paul', 'Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat.', 2, '2022-5-12');
insert into reviews (isbn, username, comment, rating, date) values ('0311999229072', 'rebbecca', 'Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros.', 2, '2022-5-11');
insert into reviews (isbn, username, comment, rating, date) values ('6886890911303', 'robert', 'Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit.', 4, '2022-5-12');
insert into reviews (isbn, username, comment, rating, date) values ('1880989916727', 'ryan', 'Duis consequat dui nec nisi volutpat eleifend. Donec ut dolor. Morbi vel lectus in quam fringilla rhoncus.', 4, '2022-5-12');
insert into reviews (isbn, username, comment, rating, date) values ('0674909573292', 'janedoe', 'Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat.', 4, '2022-5-12');
insert into reviews (isbn, username, comment, rating, date) values ('3497871017792', 'janedore', 'In sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.', 4, '2022-5-12');
insert into reviews (isbn, username, comment, rating, date) values ('4337174964178', 'jasson', 'In sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.', 3, '2022-5-11');
insert into reviews (isbn, username, comment, rating, date) values ('3233359903008', 'kattie', 'In congue. Etiam justo. Etiam pretium iaculis justo.', 2, '2022-5-12');
insert into reviews (isbn, username, comment, rating, date) values ('1849562027959', 'kevin', 'In hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo.', 1, '2022-5-12');
insert into reviews (isbn, username, comment, rating, date) values ('2605933464940', 'kimber', 'Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh.', 2, '2022-5-13');
insert into reviews (isbn, username, comment, rating, date) values ('6665316998471', 'larry', 'Proin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.', 5, '2022-5-12');
insert into reviews (isbn, username, comment, rating, date) values ('3434457249094', 'luke', 'In quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.', 4, '2022-5-13');
insert into reviews (isbn, username, comment, rating, date) values ('9401079679717', 'michael', 'Pellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus.', 3, '2022-5-12');
insert into reviews (isbn, username, comment, rating, date) values ('6282535018808', 'nathan', 'Nullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris.', 2, '2022-5-11');
insert into reviews (isbn, username, comment, rating, date) values ('9512116594361', 'nicko', 'In congue. Etiam justo. Etiam pretium iaculis justo.', 3, '2022-5-12');
insert into reviews (isbn, username, comment, rating, date) values ('0307793378720', 'oscar69', 'Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus.', 1, '2022-5-12');
insert into reviews (isbn, username, comment, rating, date) values ('6088775503660', 'jason', 'In sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.', 4, '2022-5-13');
insert into reviews (isbn, username, comment, rating, date) values ('4825391130222', 'just_in', 'Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.', 3, '2022-5-12');
insert into reviews (isbn, username, comment, rating, date) values ('4531472543465', 'kelly', 'Phasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum.', 1, '2022-5-12');
insert into reviews (isbn, username, comment, rating, date) values ('8630212258348', 'lance', 'Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero.', 4, '2022-5-12');
insert into reviews (isbn, username, comment, rating, date) values ('3054755583226', 'linda', 'Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem.', 3, '2022-5-11');
insert into reviews (isbn, username, comment, rating, date) values ('6424359997295', 'lisasa', 'Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque.', 4, '2022-5-12');
insert into reviews (isbn, username, comment, rating, date) values ('6941503348774', 'logan', 'Proin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.', 3, '2022-5-13');
insert into reviews (isbn, username, comment, rating, date) values ('4157469723312', 'migel', 'Proin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius.', 4, '2022-5-12');
insert into reviews (isbn, username, comment, rating, date) values ('5453558852834', 'natallie', 'Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh.', 5, '2022-5-12');
insert into reviews (isbn, username, comment, rating, date) values ('5674805785564', 'oscar', 'Pellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus.', 2, '2022-5-12');
insert into reviews (isbn, username, comment, rating, date) values ('5998893066103', 'paige', 'Morbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis.', 1, '2022-5-13');
insert into reviews (isbn, username, comment, rating, date) values ('5624524684158', 'rebecca', 'Proin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius.', 4, '2022-5-12');
insert into reviews (isbn, username, comment, rating, date) values ('5340523327623', 'roberto', 'Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit.', 4, '2022-5-12');
insert into reviews (isbn, username, comment, rating, date) values ('9271162786673', 'jessica_p', 'Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti.', 1, '2022-5-12');
insert into reviews (isbn, username, comment, rating, date) values ('6520474320230', 'jimy', 'Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est.', 5, '2022-5-15');
insert into reviews (isbn, username, comment, rating, date) values ('2041197881464', 'johndore', 'Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est.', 1, '2022-5-12');
insert into reviews (isbn, username, comment, rating, date) values ('4551192150404', 'kimberly', 'Morbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis.', 1, '2022-5-15');
insert into reviews (isbn, username, comment, rating, date) values ('2102821942056', 'leah', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin risus. Praesent lectus.', 3, '2022-5-12');
insert into reviews (isbn, username, comment, rating, date) values ('1887823406832', 'liza', 'Praesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede.', 1, '2022-5-12');
insert into reviews (isbn, username, comment, rating, date) values ('0597909047825', 'lucas', 'Cras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque.', 3, '2022-5-15');
insert into reviews (isbn, username, comment, rating, date) values ('3646938530520', 'matthew', 'Nullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris.', 3, '2022-5-12');
insert into reviews (isbn, username, comment, rating, date) values ('1089728812164', 'melissa', 'In congue. Etiam justo. Etiam pretium iaculis justo.', 1, '2022-5-12');
insert into reviews (isbn, username, comment, rating, date) values ('7355800064865', 'nick', 'In sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.', 3, '2022-5-12');
insert into reviews (isbn, username, comment, rating, date) values ('4409786147582', 'olivia', 'Sed ante. Vivamus tortor. Duis mattis egestas metus.', 4, '2022-5-15');
insert into reviews (isbn, username, comment, rating, date) values ('3697186816645', 'patrick', 'Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum.', 3, '2022-5-12');

#reservation triggers

#rentals triggers

delimiter //
create trigger rental_check_availability
before insert on rentals
for each row
begin
    if (select can_rent from user where username = new.username) = 0 or (select penalty from user where username=new.username) = true then
        signal sqlstate '45000' set message_text = 'The user cannot rent any copies.';
elseif not exists (select school_id from user where username=new.username and school_id in (select school_id from copies where copy_id=new.copy_id) )
then
        signal sqlstate '45000' set message_text = 'The selected copy is not available in the users school';
    elseif exists (select username from reservations where username=new.username and cancellation_date is NULL and copy_id=new.copy_id and school_id=new.school_id) 
then
update reservations set cancellation_date = curdate() where username = new.username and copy_id = new.copy_id and school_id = new.school_id;	
elseif ((select available from copies where copy_id = new.copy_id and school_id = new.school_id)=false) 
then
        signal sqlstate '45000' set message_text = 'The selected copy is not available for rental.';
    end if;
end
//
delimiter ;

create trigger compute_rentals_deadline_date
before insert on rentals
for each row
set new.deadline_date = date_add(new.rental_date, interval 7 day);

delimiter //
create trigger rental_check_title
before insert on rentals
for each row
begin
if exists (select * from copies where copy_id = new.copy_id and isbn in (select b.isbn from books b join copies c on c.isbn = b.isbn join reservations r on r.copy_id = c.copy_id where r.username = new.username and r.cancellation_date is null union all select b.isbn from books b join copies c on c.isbn = b.isbn join rentals l on l.copy_id = c.copy_id where l.username = new.username and return_date is null)) then
	signal sqlstate '45000' set message_text = 'The user cannot rent any more copies from the same book he has already rented';
end if;
end
//
delimiter ;

delimiter //
create trigger rental_set_availability_and_can_rent
after insert on rentals
for each row
begin
update copies set available=false
where copy_id=new.copy_id and school_id=new.school_id;
update user set can_rent=can_rent-1 where username=new.username;
end
//
delimiter ;



delimiter //
create trigger copy_returned_change_availability
after update on rentals
for each row
begin
if new.return_date is not null then
update copies set available=true
where copy_id=new.copy_id and school_id=new.school_id;
end if;
end
//
delimiter ;

#reservations triggers (continuation)

delimiter //
create trigger reservation_check
before insert on reservations
for each row
begin
    if (select can_reserve from user where username = new.username) = 0 or (select penalty from user where username=new.username) = true
then
        signal sqlstate '45000' set message_text = 'The user cannot reserve any copies.';
elseif not exists (select school_id from user where username=new.username and school_id in (select school_id from copies where copy_id=new.copy_id) )
then
        signal sqlstate '45000' set message_text = 'The selected copy is not available in the users school';
    end if;
end
//
delimiter ;

delimiter //
create trigger reservation_check_title
before insert on reservations
for each row
begin
if exists (select * from copies where copy_id = new.copy_id and isbn in (select b.isbn from books b join copies c on c.isbn = b.isbn join reservations r on r.copy_id = c.copy_id where r.username = new.username and r.cancellation_date is null union all select b.isbn from books b join copies c on c.isbn = b.isbn join rentals l on l.copy_id = c.copy_id where l.username = new.username and return_date is null)) then
	signal sqlstate '45000' set message_text = 'The user cannot rent any more copies from the same book he has already rented';
end if;
end
//
delimiter ;

create trigger compute_reservation_deadline_date
before insert on reservations
for each row
set new.deadline_date = date_add(new.reservation_date, interval 7 day);

delimiter //
create trigger change_cancellation_date
before insert on reservations
for each row
if new.cancellation_date > new.deadline_date then
	set new.cancellation_date = new.deadline_date;
end if;
//
delimiter ;

delimiter //
create trigger reservation_set_availability_and_can_reserve
after insert on reservations
for each row
begin
update copies set available=false where copy_id=new.copy_id and school_id=new.school_id;
update user set can_reserve=can_reserve-1 where username=new.username;
end
//
delimiter ;

delimiter //
create trigger copy_cancelled_change_availability
after update on reservations
for each row
begin
if new.cancellation_date is not null then
update copies set available=true
where copy_id=new.copy_id and school_id=new.school_id;
end if;
end
//
delimiter ;

delimiter //
create trigger reset_penalty
after update on rentals
for each row
if (select count(*) from rentals where username = new.username and return_date is null and timestampdiff(day, rental_date, curdate())>7)=0 then
update user u join rentals l on u.username = l.username set u.penalty = false where u.penalty = true and l.return_date is not null;
end if;
//
delimiter ;

#rentals events

insert into admins(username, password, first_name, last_name) values ( 'sreppas', '12345678', 'Stratos', 'Reppas' ); 



insert into lib_ops (username, approved_by_admin) values ('jessica_p', 'sreppas' );
insert into lib_ops (username, approved_by_admin) values ('johndoe', 'sreppas' ); 
insert into lib_ops (username, approved_by_admin) values ('just_in', 'sreppas' ); 
insert into lib_ops (username, approved_by_admin) values ('kelly', 'sreppas' ); 
insert into lib_ops (username, approved_by_admin) values ('kattie', 'sreppas' ); 

#rentals populate

insert into rentals (username, copy_id, school_id, rental_date, approved_by_op) values ('liza', 127, 'cg4o9lmy', '2023-04-25', 'jessica_p');
insert into rentals (username, copy_id, school_id, rental_date, approved_by_op) values ('laura', 807, '0p8ju3vq', '2023-05-16', 'kelly');
insert into rentals (username, copy_id, school_id, rental_date, approved_by_op) values ('jason', 314, 'cbnx7ywj', '2023-05-18', 'just_in');
insert into rentals (username, copy_id, school_id, rental_date, return_date, approved_by_op) values ('jackson', 138, 'l0xrbdy6', '2023-04-29', null, 'johndoe');
insert into rentals (username, copy_id, school_id, rental_date, approved_by_op) values ('michael', 389, '6e3w27za', '2023-04-27', 'kattie');
insert into rentals (username, copy_id, school_id, rental_date, approved_by_op) values ('paulaner', 363, 'cg4o9lmy', '2023-04-24', 'jessica_p');
insert into rentals (username, copy_id, school_id, rental_date, return_date, approved_by_op) values ('robert', 650, '0p8ju3vq', '2023-04-29', null, 'kelly');
insert into rentals (username, copy_id, school_id, rental_date, approved_by_op) values ('paige', 305, 'cbnx7ywj', '2023-04-28', 'just_in');
insert into rentals (username, copy_id, school_id, rental_date, approved_by_op) values ('nathan_drake', 723, 'l0xrbdy6', '2023-04-26', 'johndoe');
insert into rentals (username, copy_id, school_id, rental_date, approved_by_op) values ('luke', 552, '6e3w27za', '2023-04-29', 'kattie');
insert into rentals (username, copy_id, school_id, rental_date, approved_by_op) values ('melissa', 984, 'cg4o9lmy', '2023-04-24', 'jessica_p');
insert into rentals (username, copy_id, school_id, rental_date, approved_by_op) values ('natalie', 746, '0p8ju3vq', '2023-04-23', 'kelly');
insert into rentals (username, copy_id, school_id, rental_date, approved_by_op) values ('natalie', 518, 'cbnx7ywj', '2023-04-27', 'just_in');
insert into rentals (username, copy_id, school_id, rental_date, approved_by_op) values ('laurel', 595, 'l0xrbdy6', '2023-04-24', 'johndoe');
insert into rentals (username, copy_id, school_id, rental_date, approved_by_op) values ('kevin', 554, '6e3w27za', '2023-04-28', 'kattie');
insert into rentals (username, copy_id, school_id, rental_date, approved_by_op) values ('kimberly', 887, 'cg4o9lmy', '2023-04-27', 'jessica_p');
insert into rentals (username, copy_id, school_id, rental_date, return_date, approved_by_op) values ('kati', 694, '0p8ju3vq', '2023-04-29', '2023-04-30', 'kelly');
insert into rentals (username, copy_id, school_id, rental_date, approved_by_op) values ('kelly', 177, 'cbnx7ywj', '2023-04-24', 'just_in');
insert into rentals (username, copy_id, school_id, rental_date, approved_by_op) values ('jenny', 240, 'l0xrbdy6', '2023-04-24', 'johndoe');
insert into rentals (username, copy_id, school_id, rental_date, return_date, approved_by_op) values ('jimy', 254, 'cg4o9lmy', '2023-04-24', null, 'jessica_p');
insert into rentals (username, copy_id, school_id, rental_date, approved_by_op) values ('donkeykong', 663, '0p8ju3vq', '2023-04-23', 'kelly');
insert into rentals (username, copy_id, school_id, rental_date, approved_by_op) values ('jason', 767, 'cbnx7ywj', '2023-04-25', 'just_in');
insert into rentals (username, copy_id, school_id, rental_date, approved_by_op) values ('johndoe', 140, 'l0xrbdy6', '2023-05-15', 'johndoe');
insert into rentals (username, copy_id, school_id, rental_date, approved_by_op) values ('nathan', 646, '6e3w27za', '2023-04-25', 'kattie');
insert into rentals (username, copy_id, school_id, rental_date, approved_by_op) values ('liza', 993, 'cg4o9lmy', '2023-04-25, 'jessica_p'');
insert into rentals (username, copy_id, school_id, rental_date, approved_by_op) values ('paul', 255, '0p8ju3vq', '2023-04-28', 'kelly');
insert into rentals (username, copy_id, school_id, rental_date, approved_by_op) values ('karla', 321, 'cbnx7ywj', '2023-04-25', 'just_in');
insert into rentals (username, copy_id, school_id, rental_date, approved_by_op) values ('janedore', 839, 'l0xrbdy6', '2023-04-29', 'johndoe');
insert into rentals (username, copy_id, school_id, rental_date, approved_by_op) values ('natalie', 501, '6e3w27za', '2023-04-24', 'kattie');
insert into rentals (username, copy_id, school_id, rental_date, approved_by_op) values ('rachell', 713, 'cg4o9lmy', '2023-04-28', 'jessica_p');
insert into rentals (username, copy_id, school_id, rental_date, return_date, approved_by_op) values ('celly', 242, '0p8ju3vq', '2023-04-29', '2023-04-30', 'kelly');
insert into rentals (username, copy_id, school_id, rental_date, return_date, approved_by_op) values ('kimberly', 105, 'cbnx7ywj', '2023-04-26', '2023-04-30', 'just_in');
insert into rentals (username, copy_id, school_id, rental_date, approved_by_op) values ('kelly', 219, 'l0xrbdy6', '2023-04-25', 'johndoe');
insert into rentals (username, copy_id, school_id, rental_date, return_date, approved_by_op) values ('jessica_p', 518, '6e3w27za', '2023-04-28', '2023-04-30', 'kattie');
insert into rentals (username, copy_id, school_id, rental_date, approved_by_op) values ('megan', 806, 'cg4o9lmy', '2023-04-23', 'jessica_p');
insert into rentals (username, copy_id, school_id, rental_date, approved_by_op) values ('kimber', 224, '0p8ju3vq', '2023-04-24', 'kelly');
insert into rentals (username, copy_id, school_id, rental_date, return_date, approved_by_op) values ('jason', 939, 'cbnx7ywj', '2023-04-24', '2023-04-30', 'just_in');
insert into rentals (username, copy_id, school_id, rental_date, approved_by_op) values ('jason', 494, 'l0xrbdy6', '2023-04-27', 'johndoe');
insert into rentals (username, copy_id, school_id, rental_date, approved_by_op) values ('jimy', 456, '6e3w27za', '2023-04-28', 'kattie');
insert into rentals (username, copy_id, school_id, rental_date, approved_by_op) values ('karla', 356, 'cg4o9lmy', '2023-04-27', 'jessica_p');
insert into rentals (username, copy_id, school_id, rental_date, approved_by_op) values ('laura', 289, '0p8ju3vq', '2023-04-26', 'kelly');
insert into rentals (username, copy_id, school_id, rental_date, approved_by_op) values ('paulaner', 925, 'cbnx7ywj', '2023-04-25', 'just_in');
insert into rentals (username, copy_id, school_id, rental_date, approved_by_op) values ('migel', 553, 'l0xrbdy6', '2023-04-24', 'johndoe');
insert into rentals (username, copy_id, school_id, rental_date, approved_by_op) values ('melissa', 684, '6e3w27za', '2023-04-28', 'kattie');
insert into rentals (username, copy_id, school_id, rental_date, return_date, approved_by_op) values ('paige', 990, 'cg4o9lmy', '2023-04-23', null, 'jessica_p');
insert into rentals (username, copy_id, school_id, rental_date, return_date, approved_by_op) values ('donkeykong', 401, '0p8ju3vq', '2023-04-24', null, 'kelly');
insert into rentals (username, copy_id, school_id, rental_date, approved_by_op) values ('mark', 283, 'cbnx7ywj', '2023-04-28', 'just_in');
insert into rentals (username, copy_id, school_id, rental_date, approved_by_op) values ('nicko', 473, 'l0xrbdy6', '2023-04-26', 'johndoe');
insert into rentals (username, copy_id, school_id, rental_date, return_date, approved_by_op) values ('jenny', 292, '6e3w27za', '2023-04-24', '2023-04-30', 'kattie');
insert into rentals (username, copy_id, school_id, rental_date, approved_by_op) values ('rachel', 216, 'cg4o9lmy', '2023-04-24', 'jessica_p');
insert into rentals (username, copy_id, school_id, rental_date, approved_by_op) values ('rebecca', 212, '0p8ju3vq', '2023-04-28', 'kelly');
insert into rentals (username, copy_id, school_id, rental_date, approved_by_op) values ('migel', 609, 'cbnx7ywj', '2023-04-25', 'just_in');
insert into rentals (username, copy_id, school_id, rental_date, approved_by_op) values ('mark', 331, 'l0xrbdy6', '2023-04-23', 'johndoe');
insert into rentals (username, copy_id, school_id, rental_date, approved_by_op) values ('nicko', 302, '6e3w27za', '2023-04-27', 'kattie');
insert into rentals (username, copy_id, school_id, rental_date, approved_by_op) values ('patrick', 528, 'cg4o9lmy', '2023-04-27', 'jessica_p');
insert into rentals (username, copy_id, school_id, rental_date, approved_by_op) values ('oliver', 409, '0p8ju3vq', '2023-04-28', 'kelly');
insert into rentals (username, copy_id, school_id, rental_date, return_date, approved_by_op) values ('lance', 749, 'cbnx7ywj', '2023-04-23', '2023-04-30', 'just_in');
insert into rentals (username, copy_id, school_id, rental_date, approved_by_op) values ('karla', 273, 'l0xrbdy6', '2023-04-27', 'johndoe');
insert into rentals (username, copy_id, school_id, rental_date, approved_by_op) values ('janedore', 853, '6e3w27za', '2023-04-24', 'kattie');
insert into rentals (username, copy_id, school_id, rental_date, approved_by_op) values ('jessica_p', 531, 'cg4o9lmy', '2023-04-27', 'jessica_p');
insert into rentals (username, copy_id, school_id, rental_date, approved_by_op) values ('matthew', 174, '0p8ju3vq', '2023-04-24', 'kelly');
insert into rentals (username, copy_id, school_id, rental_date, approved_by_op) values ('nathan_drake', 573, 'cbnx7ywj', '2023-04-26', 'just_in');
insert into rentals (username, copy_id, school_id, rental_date, approved_by_op) values ('celly', 592, 'l0xrbdy6', '2023-04-27', 'johndoe');
insert into rentals (username, copy_id, school_id, rental_date, approved_by_op) values ('jasson', 568, '6e3w27za', '2023-04-29', 'kattie');
insert into rentals (username, copy_id, school_id, rental_date, return_date, approved_by_op) values ('oscar69', 534, 'cg4o9lmy', '2023-04-23', null, 'jessica_p');
insert into rentals (username, copy_id, school_id, rental_date, approved_by_op) values ('michael', 466, '0p8ju3vq', '2023-04-23', 'kelly');
insert into rentals (username, copy_id, school_id, rental_date, return_date, approved_by_op) values ('rachel', 591, 'cbnx7ywj', '2023-04-25', null, 'just_in');
insert into rentals (username, copy_id, school_id, rental_date, approved_by_op) values ('user123', 511, 'l0xrbdy6', '2023-04-28', 'johndoe');
insert into rentals (username, copy_id, school_id, rental_date, approved_by_op) values ('paige', 393, '6e3w27za', '2023-04-23', 'kattie');
insert into rentals (username, copy_id, school_id, rental_date, approved_by_op) values ('lisasa', 891, 'cg4o9lmy', '2023-04-23', 'jessica_p');
insert into rentals (username, copy_id, school_id, rental_date, approved_by_op) values ('johndore', 194, '0p8ju3vq', '2023-04-27', 'kelly');
insert into rentals (username, copy_id, school_id, rental_date, approved_by_op) values ('rachel', 145, 'cbnx7ywj', '2023-04-26', 'just_in');
insert into rentals (username, copy_id, school_id, rental_date, return_date, approved_by_op) values ('lissa', 578, 'l0xrbdy6', '2023-04-27', null, 'johndoe');
insert into rentals (username, copy_id, school_id, rental_date, approved_by_op) values ('kevin', 968, '6e3w27za', '2023-04-27', 'kattie');
insert into rentals (username, copy_id, school_id, rental_date, approved_by_op) values ('jenny', 799, 'cg4o9lmy', '2023-04-29', 'jessica_p');
insert into rentals (username, copy_id, school_id, rental_date, approved_by_op) values ('ryan', 400, '0p8ju3vq', '2023-04-25', 'kelly');
insert into rentals (username, copy_id, school_id, rental_date, approved_by_op) values ('lance', 192, 'cbnx7ywj', '2023-04-29', 'just_in');
insert into rentals (username, copy_id, school_id, rental_date, return_date, approved_by_op) values ('rachell', 168, 'l0xrbdy6', '2023-04-24', null, 'johndoe');
insert into rentals (username, copy_id, school_id, rental_date, return_date, approved_by_op) values ('rachel', 304, '6e3w27za', '2023-04-25', '2023-04-30', 'kattie');
insert into rentals (username, copy_id, school_id, rental_date, return_date, approved_by_op) values ('rachell', 755, 'cg4o9lmy', '2023-04-29', null, 'jessica_p');
insert into rentals (username, copy_id, school_id, rental_date, approved_by_op) values ('ryan', 271, '0p8ju3vq', '2023-04-26', 'kelly');
insert into rentals (username, copy_id, school_id, rental_date, return_date, approved_by_op) values ('janedoe', 594, 'cbnx7ywj', '2023-04-25', '2023-04-30', 'just_in');
insert into rentals (username, copy_id, school_id, rental_date, return_date, approved_by_op) values ('jackson', 872, 'l0xrbdy6', '2023-04-27', '2023-04-30', 'johndoe');
insert into rentals (username, copy_id, school_id, rental_date, approved_by_op) values ('jackson', 708, '6e3w27za', '2023-04-25', 'kattie');
insert into rentals (username, copy_id, school_id, rental_date, return_date, approved_by_op) values ('paulaner', 232, 'cg4o9lmy', '2023-04-23', null, 'jessica_p');
insert into rentals (username, copy_id, school_id, rental_date, return_date, approved_by_op) values ('jason', 108, '0p8ju3vq', '2023-04-25', '2023-04-30', 'kelly');
insert into rentals (username, copy_id, school_id, rental_date, approved_by_op) values ('lisasa', 102, 'cbnx7ywj', '2023-04-26', 'just_in');
insert into rentals (username, copy_id, school_id, rental_date, approved_by_op) values ('celly', 343, 'l0xrbdy6', '2023-04-24', 'johndoe');
insert into rentals (username, copy_id, school_id, rental_date, approved_by_op) values ('larry', 816, '6e3w27za', '2023-04-29', 'kattie');
insert into rentals (username, copy_id, school_id, rental_date, approved_by_op) values ('kimberly', 618, 'cg4o9lmy', '2023-04-29', 'jessica_p');
insert into rentals (username, copy_id, school_id, rental_date, approved_by_op) values ('user123', 111, 'cg4o9lmy', '2023-04-24', 'jessica_p');
insert into rentals (username, copy_id, school_id, rental_date, approved_by_op) values ('user123', 769, 'cg4o9lmy', '2023-04-24', 'jessica_p');


#reservations populate

insert into reservations (username, copy_id, school_id, reservation_date) values ('roberto', 400, '0p8ju3vq', '2023-04-24' );
insert into reservations (username, copy_id, school_id, reservation_date) values ('paige', 192, 'cbnx7ywj', '2023-04-27');
insert into reservations (username, copy_id, school_id, reservation_date) values ('celly', 168, 'l0xrbdy6', '2023-04-23');
insert into reservations (username, copy_id, school_id, reservation_date) values ('user123', 304, '6e3w27za', '2023-04-27');
insert into reservations (username, copy_id, school_id, reservation_date) values ('jimy', 755, 'cg4o9lmy', '2023-04-29');
insert into reservations (username, copy_id, school_id, reservation_date) values ('kattie', 271, '0p8ju3vq', '2023-04-24');
insert into reservations (username, copy_id, school_id, reservation_date) values ('lance', 594, 'cbnx7ywj', '2023-04-24');
insert into reservations (username, copy_id, school_id, reservation_date) values ('celly', 872, 'l0xrbdy6', '2023-04-26');
insert into reservations (username, copy_id, school_id, reservation_date) values ('natallie', 708, '6e3w27za', '2023-04-25');
insert into reservations (username, copy_id, school_id, reservation_date) values ('liza', 232, 'cg4o9lmy', '2023-04-23');
insert into reservations (username, copy_id, school_id) values ('linda', 494, 'cg4o9lmy');
insert into reservations (username, copy_id, school_id, reservation_date) values ('larry', 108, '0p8ju3vq', '2023-04-28');
insert into reservations (username, copy_id, school_id, reservation_date) values ('jason', 102, 'cbnx7ywj', '2023-04-27');
insert into reservations (username, copy_id, school_id, reservation_date) values ('megan', 343, 'l0xrbdy6', '2023-04-28');
insert into reservations (username, copy_id, school_id, reservation_date) values ('oliver', 816, '6e3w27za', '2023-04-25');
insert into reservations (username, copy_id, school_id, reservation_date) values ('leah', 618, 'cg4o9lmy', '2023-04-28');
insert into reservations (username, copy_id, school_id, reservation_date) values ('kelly', 281, '0p8ju3vq', '2023-04-26');
insert into reservations (username, copy_id, school_id, reservation_date) values ('jason', 567, 'cbnx7ywj', '2023-04-26');
insert into reservations (username, copy_id, school_id, reservation_date) values ('megan', 899, 'l0xrbdy6', '2023-04-23');
insert into reservations (username, copy_id, school_id, reservation_date) values ('kimber', 382, '6e3w27za', '2023-04-28');
insert into reservations (username, copy_id, school_id, reservation_date) values ('olivia', 960, 'cg4o9lmy', '2023-04-26');
insert into reservations (username, copy_id, school_id, reservation_date) values ('kattie', 160, '0p8ju3vq', '2023-04-23');
insert into reservations (username, copy_id, school_id, reservation_date) values ('just_in', 747, 'cbnx7ywj', '2023-04-25');
insert into reservations (username, copy_id, school_id, reservation_date) values ('laurel', 570, 'l0xrbdy6', '2023-04-23');
insert into reservations (username, copy_id, school_id, reservation_date) values ('kattie', 562, '6e3w27za', '2023-04-26');
insert into reservations (username, copy_id, school_id, reservation_date) values ('olivia', 785, 'cg4o9lmy', '2023-04-29');
insert into reservations (username, copy_id, school_id, reservation_date) values ('luke', 339, '0p8ju3vq', '2023-04-24');
insert into reservations (username, copy_id, school_id, reservation_date) values ('lance', 652, 'cbnx7ywj', '2023-04-23');
insert into reservations (username, copy_id, school_id, reservation_date) values ('rachel', 941, 'l0xrbdy6', '2023-04-25');
insert into reservations (username, copy_id, school_id, reservation_date) values ('olivia', 880, '6e3w27za', '2023-04-24');
insert into reservations (username, copy_id, school_id, reservation_date) values ('patrick', 187, 'cg4o9lmy', '2023-04-23');
insert into reservations (username, copy_id, school_id, reservation_date) values ('jimy', 320, '0p8ju3vq', '2023-04-23');
insert into reservations (username, copy_id, school_id, reservation_date) values ('lance', 542, 'cbnx7ywj', '2023-04-24');
insert into reservations (username, copy_id, school_id, reservation_date) values ('rachell', 933, 'l0xrbdy6', '2023-04-23');
insert into reservations (username, copy_id, school_id, reservation_date) values ('leah', 125, '6e3w27za', '2023-04-23');
insert into reservations (username, copy_id, school_id, reservation_date, cancellation_date) values ('user123', 721, 'cg4o9lmy', '2023-04-26', '2023-04-30');
insert into reservations (username, copy_id, school_id, reservation_date) values ('paulaner', 587, '0p8ju3vq', '2023-04-28');
insert into reservations (username, copy_id, school_id, reservation_date, cancellation_date) values ('logan', 872, 'cbnx7ywj', '2023-04-29', null);
insert into reservations (username, copy_id, school_id, reservation_date, cancellation_date) values ('rachell', 265, 'l0xrbdy6', '2023-04-26', '2023-04-30');
insert into reservations (username, copy_id, school_id, reservation_date) values ('jenny', 739, '6e3w27za', '2023-04-25');
insert into reservations (username, copy_id, school_id, reservation_date) values ('user123', 838, 'cg4o9lmy', '2023-04-23');
insert into reservations (username, copy_id, school_id, reservation_date) values ('olivia', 706, '0p8ju3vq', '2023-04-29');
insert into reservations (username, copy_id, school_id, reservation_date) values ('logan', 265, 'cbnx7ywj', '2023-04-24');
insert into reservations (username, copy_id, school_id, reservation_date) values ('rachel', 790, 'l0xrbdy6', '2023-04-23');
insert into reservations (username, copy_id, school_id, reservation_date) values ('lucas', 971, '6e3w27za', '2023-04-23');
insert into reservations (username, copy_id, school_id, reservation_date) values ('nick', 768, 'cg4o9lmy', '2023-04-29');
insert into reservations (username, copy_id, school_id, reservation_date) values ('jenny', 659, '0p8ju3vq', '2023-04-24');
insert into reservations (username, copy_id, school_id, reservation_date) values ('lisasa', 294, 'cbnx7ywj', '2023-04-28');
insert into reservations (username, copy_id, school_id, reservation_date) values ('jasson', 222, 'l0xrbdy6', '2023-04-29');
insert into reservations (username, copy_id, school_id, reservation_date) values ('laurel', 998, '6e3w27za', '2023-04-24');
insert into reservations (username, copy_id, school_id, reservation_date, cancellation_date) values ('johndore', 494, 'cg4o9lmy', '2023-04-25', '2023-04-30');
insert into reservations (username, copy_id, school_id, reservation_date) values ('luke', 562, '0p8ju3vq', '2023-04-29');
insert into reservations (username, copy_id, school_id, reservation_date) values ('oscar', 427, 'cbnx7ywj', '2023-04-26');
insert into reservations (username, copy_id, school_id, reservation_date, cancellation_date) values ('laurel', 662, 'l0xrbdy6', '2023-04-27', '2023-04-30');
insert into reservations (username, copy_id, school_id, reservation_date) values ('oliver', 478, '6e3w27za', '2023-04-29');
insert into reservations (username, copy_id, school_id, reservation_date) values ('melissa', 757, 'cg4o9lmy', '2023-04-29');
insert into reservations (username, copy_id, school_id, reservation_date) values ('jessica_p', 726, '0p8ju3vq', '2023-04-28');
insert into reservations (username, copy_id, school_id, reservation_date) values ('oscar', 918, 'cbnx7ywj', '2023-04-24');
insert into reservations (username, copy_id, school_id, reservation_date) values ('ryan', 451, 'l0xrbdy6', '2023-04-25');
insert into reservations (username, copy_id, school_id, reservation_date) values ('lissa', 199, '6e3w27za', '2023-04-25');
insert into reservations (username, copy_id, school_id, reservation_date) values ('melissa', 771, 'cg4o9lmy', '2023-04-26');
insert into reservations (username, copy_id, school_id, reservation_date) values ('johndore', 633, '0p8ju3vq', '2023-04-27');
insert into reservations (username, copy_id, school_id, reservation_date) values ('migel', 458, 'cbnx7ywj', '2023-04-24');
insert into reservations (username, copy_id, school_id, reservation_date) values ('patrick', 664, 'l0xrbdy6', '2023-04-25');
insert into reservations (username, copy_id, school_id, reservation_date, cancellation_date) values ('megan', 963, '6e3w27za', '2023-04-27', '2023-04-30');
insert into reservations (username, copy_id, school_id, reservation_date) values ('lucas', 194, 'cg4o9lmy', '2023-04-27');
insert into reservations (username, copy_id, school_id, reservation_date) values ('jasson', 362, '0p8ju3vq', '2023-04-25');
insert into reservations (username, copy_id, school_id, reservation_date) values ('migel', 604, 'cbnx7ywj', '2023-04-26');
insert into reservations (username, copy_id, school_id, reservation_date) values ('patrick', 460, 'l0xrbdy6', '2023-04-23');
insert into reservations (username, copy_id, school_id, reservation_date) values ('jackson', 283, '6e3w27za', '2023-04-24');
insert into reservations (username, copy_id, school_id, reservation_date) values ('lucas', 360, 'cg4o9lmy', '2023-04-27');
insert into reservations (username, copy_id, school_id, reservation_date) values ('linda', 444, '0p8ju3vq', '2023-04-26');
insert into reservations (username, copy_id, school_id, reservation_date, cancellation_date) values ('roberto', 664, 'cbnx7ywj', '2023-04-27', '2023-04-30');
insert into reservations (username, copy_id, school_id, reservation_date, cancellation_date) values ('natallie', 444, 'l0xrbdy6', '2023-04-29', '2023-04-30');
insert into reservations (username, copy_id, school_id, reservation_date) values ('nathan_drake', 499, '6e3w27za', '2023-04-24');
insert into reservations (username, copy_id, school_id, reservation_date) values ('peter', 252, 'cg4o9lmy', '2023-04-25');
insert into reservations (username, copy_id, school_id, reservation_date) values ('leah', 248, '0p8ju3vq', '2023-04-28');
insert into reservations (username, copy_id, school_id, reservation_date) values ('roberto', 717, 'cbnx7ywj', '2023-04-24');
insert into reservations (username, copy_id, school_id, reservation_date) values ('paul', 950, 'l0xrbdy6', '2023-04-25');
insert into reservations (username, copy_id, school_id, reservation_date) values ('jessicca', 768, '6e3w27za', '2023-04-26');

create event check_reservation_deadline
on schedule every 1 day starts current_timestamp do
update reservations set cancellation_date = deadline_date where cancellation_date is null and deadline_date <= curdate();

create event check_penalty
on schedule every 1 day starts current_timestamp do
update user u join rentals l on u.username = l.username set u.penalty = true where l.return_date is null and l.deadline_date <= curdate();


Create view counts_approves (username, first_name, last_name, count) as
select lo.username, u.first_name, u.last_name, count(l.approved_by_op) from user u join lib_ops lo on u.username = lo.username left join rentals l on l.approved_by_op = lo.username where timestampdiff(year, l.rental_date, curdate())<1 group by u.first_name, u.last_name having count(l.approved_by_op)>20;

create view coincidence (username, count) as
select ca1.username, ca1.count from counts_approves ca1 join counts_approves ca2 on ca1.username <> ca2.username and ca1.count = ca2.count group by ca1.username order by ca1.count desc;

Create view category_pairs
(category1, category2, rental_count)
as
select category1, category2, rental_count from (select bc1.category as category1, bc2.category as category2, count(*) as rental_count from books_category bc1 join books_category bc2 on bc1.isbn = bc2.isbn join copies c on c.isbn = bc1.isbn or c.isbn = bc2.isbn join rentals l on l.copy_id = c.copy_id and l.school_id = c.school_id where bc1.category < bc2.category group by bc1.category, bc2.category order by rental_count desc limit 3) as subquery;

Create view authors_less_than_5
(first_name, middle_name, last_name, number_of_books)
As
select author_first_name, author_middle_name, author_last_name, count(isbn) from books_author group by author_first_name, author_middle_name, author_last_name having count(isbn) <= (select max(book_count) as max_count from (select count(isbn) as book_count from books_author group by author_first_name, author_middle_name, author_last_name) as counts)-5;

Create view bad_rentals
(username, first_name, last_name, school_id, rental_id, rental_date, days_delayed)
as
select u.username, u.first_name, u.last_name, u.school_id, r.rental_id, min(r.rental_date), timestampdiff (day, min(deadline_date), curdate())  as days_delayed from user u join rentals r on u.username = r.username where u.penalty=true and r.return_date is null group by username
order by days_delayed asc;

create view avg_rating_user
(username, average_rating)
as
Select username, avg(rating) as average_rating from reviews group by username order by average_rating desc ; 

create view avg_rating_category
(category, average_rating)
as
Select c.category, avg(r.rating) as average_rating from reviews r join books_category c on c.isbn = r.isbn group by c.category order by average_rating desc; 

Create view young_users
(username, first_name, last_name, age, total_rentals)
as
Select p.username, u.first_name, u.last_name, u.age, count(r.rental_id) as total_rentals from professors p join user u on u.username=p.username left join rentals r on r.username = u.username where u.age<40 group by p.username, u.age order by total_rentals desc;

Create view lame_authors
(first_name, middle_name,last_name, total_rentals)
as
select ba.author_first_name, ba.author_middle_name, ba.author_last_name, count(r.rental_id) as rental_counter from books_author ba join copies c on ba.isbn = c.isbn left join rentals r on c.copy_id = r.copy_id and r.school_id= c.school_id group by ba.author_first_name, ba.author_middle_name, ba.author_last_name having rental_counter = 0;

Create view 312a
(author_first_name, author_middle_name, author_last_name, category)
as
Select a.author_first_name, a.author_middle_name, a.author_last_name, c.category
From books_author a join books_category c on a.isbn=c.isbn;

Create view 312b
(username, first_name, last_name, category)
as
Select p.username, u.first_name, u.last_name, c.category
From professors p join rentals r on r.username=p.username join copies cop on cop.copy_id=r.copy_id and cop.school_id = r.school_id join books_category c on cop.isbn=c.isbn join user u on u.username=p.username
Where year(r.rental_date)=year(curdate());

create view book_availability (isbn, school_id, availability) as
select b.isbn, school_id, count(c.available) as availability
from books b
Left join copies c on c.isbn = b.isbn and c.available = true group by b.isbn;
Select * from book_availability;

create view lib_op_approvals_rentals (username, first_name, last_name, school_name, approved_by_admin) as
select lo.username, u.first_name, u.last_name, s.school_name, lo.approved_by_admin from lib_ops lo join user u on u.username = lo.username join school_units s on s.school_id = u.school_id;











 





