Show databases;

-- create a database name as tech_roadmap

Create database tech_roadmap;

use tech_roadmap;

-- created a table named as user 

Create table user(
id INT auto_increment,
name VARCHAR(500) NOT NULL ,
email VARCHAR(500) NOT NULL,
password VARCHAR(500) NOT NULL,
gender VARCHAR(10) NOT NULL,
about VARCHAR(1000) DEFAULT 'Hey ! I am using Tech-Roadmap',
registration_date TIMESTAMP NOT NULL DEFAULT now(),
profile VARCHAR(500) NOT NULL DEFAULT 'default.png',
UNIQUE (email),
PRIMARY KEY(id)
);

-- created a table named as categories

Create table categories(
cid INT auto_increment,
name VARCHAR(100) NOT null,
description VARCHAR(250),
cimg VARCHAR(500),
primary key(cid)
);

-- created a table named as post

Create table post(
pid INT auto_increment,
pTitle varchar(200) NOT NULL,
pContent longtext NOT NULL ,
pCode longtext,
pPic varchar(500) default 'default_post.jpg',
pDate timestamp default now(),
cid_ref INT NOT NULL,
uid_ref INT NOT NULL,
primary key(pid),
foreign key(cid_ref) references tech_roadmap.categories(cid) 
on delete cascade 
on update cascade,
foreign key(uid_ref) references tech_roadmap.user(id)
on delete cascade
on update cascade
);

-- created a table named as like_post

Create table like_post(
lid INT auto_increment,
pid_ref INT not null,
uid_ref INT not null,
primary key(lid),
foreign key(pid_ref) references tech_roadmap.post(pid)
on delete cascade
on update cascade,
foreign key(uid_ref) references tech_roadmap.user(id)
on delete cascade
on update cascade
);