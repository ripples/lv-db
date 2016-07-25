DROP TABLE IF EXISTS lkp_course_users;
DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS courses;
DROP TABLE IF EXISTS lkp_user_type;
DROP TABLE IF EXISTS semesters;

CREATE TABLE lkp_user_type (
  user_type_id INTEGER NOT NULL AUTO_INCREMENT,
  name VARCHAR(60) NOT NULL,
  PRIMARY KEY (user_type_id)
);

CREATE TABLE users (
  id VARCHAR(60) NOT NULL,
  password VARCHAR(60) NOT NULL,
  email VARCHAR(255) NOT NULL,
  fname VARCHAR(60) NOT NULL,
  lname VARCHAR(60) NOT NULL,
  user_type_id INTEGER NOT NULL DEFAULT 2,
  update_dtm TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  last_login_dtm TIMESTAMP NULL,
  verified BIT NOT NULL DEFAULT 0,
  PRIMARY KEY (id),
  FOREIGN KEY (user_type_id) REFERENCES lkp_user_type (user_type_id)
);

CREATE TABLE semesters (
  id VARCHAR(60) NOT NULL,
  start_dtm TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  end_dtm TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (id)
);

CREATE TABLE courses (
  id VARCHAR(60) NOT NULL,
  name VARCHAR(60) NOT NULL,
  description VARCHAR(1000) DEFAULT NULL,
  semester_id VARCHAR(60) NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (semester_id) REFERENCES semesters (id)
);

CREATE TABLE lkp_course_users (
  id INTEGER NOT NULL AUTO_INCREMENT,
  course_id VARCHAR(60) NOT NULL,
  user_id VARCHAR(60) NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (course_id) REFERENCES courses (id),
  FOREIGN KEY (user_id) REFERENCES users (id)
);

CREATE INDEX idx_users_email ON users (email ASC);

/************************************** TEST DATA ***************************************************/
INSERT INTO lkp_user_type (name) VALUES ("admin");
INSERT INTO lkp_user_type (name) VALUES ("student");
INSERT INTO lkp_user_type (name) VALUES ("professor");

                                                                        /* password = password*/
                                                                        /* type 2*/
INSERT INTO users (id, password, fname, lname, email,user_type_id) VALUES ("id1","$2a$10$JofcKIcaYmEaFudtzfuAfuFpwLPe3t/czs/cKdsz0IEdieXmWnu76", "test", "student1", "test-student1@email.com", "2");
INSERT INTO users (id, password, fname, lname, email,user_type_id) VALUES ("id2","$2a$10$JofcKIcaYmEaFudtzfuAfuFpwLPe3t/czs/cKdsz0IEdieXmWnu76", "test", "student2", "test-student2@email.com", "2");
INSERT INTO users (id, password, fname, lname, email,user_type_id) VALUES ("id3","$2a$10$JofcKIcaYmEaFudtzfuAfuFpwLPe3t/czs/cKdsz0IEdieXmWnu76", "test", "student3", "test-student3@email.com", "2");
INSERT INTO users (id, password, fname, lname, email,user_type_id) VALUES ("id4","$2a$10$JofcKIcaYmEaFudtzfuAfuFpwLPe3t/czs/cKdsz0IEdieXmWnu76", "test", "student4", "test-student4@email.com", "2");
INSERT INTO users (id, password, fname, lname, email,user_type_id) VALUES ('id8', '$2a$10$JofcKIcaYmEaFudtzfuAfuFpwLPe3t/czs/cKdsz0IEdieXmWnu76', 'Donald', 'Flores', 'stu8@email.com', '2');
INSERT INTO users (id, password, fname, lname, email,user_type_id) VALUES ('id9', '$2a$10$JofcKIcaYmEaFudtzfuAfuFpwLPe3t/czs/cKdsz0IEdieXmWnu76', 'Marie', 'Robinson', 'stu9@email.com', '2');
INSERT INTO users (id, password, fname, lname, email,user_type_id) VALUES ('id10', '$2a$10$JofcKIcaYmEaFudtzfuAfuFpwLPe3t/czs/cKdsz0IEdieXmWnu76', 'Eugene', 'Hunt', 'stu10@email.com', '2');
INSERT INTO users (id, password, fname, lname, email,user_type_id) VALUES ('id11', '$2a$10$JofcKIcaYmEaFudtzfuAfuFpwLPe3t/czs/cKdsz0IEdieXmWnu76', 'Mark', 'James', 'stu11@email.com', '2');
INSERT INTO users (id, password, fname, lname, email,user_type_id) VALUES ('id12', '$2a$10$JofcKIcaYmEaFudtzfuAfuFpwLPe3t/czs/cKdsz0IEdieXmWnu76', 'David', 'Watkins', 'stu12@email.com', '2');
INSERT INTO users (id, password, fname, lname, email,user_type_id) VALUES ('id13', '$2a$10$JofcKIcaYmEaFudtzfuAfuFpwLPe3t/czs/cKdsz0IEdieXmWnu76', 'Christine', 'Mendoza', 'stu13@email.com', '2');
INSERT INTO users (id, password, fname, lname, email,user_type_id) VALUES ('id14', '$2a$10$JofcKIcaYmEaFudtzfuAfuFpwLPe3t/czs/cKdsz0IEdieXmWnu76', 'Albert', 'Hill', 'stu14@email.com', '2');
INSERT INTO users (id, password, fname, lname, email,user_type_id) VALUES ('id15', '$2a$10$JofcKIcaYmEaFudtzfuAfuFpwLPe3t/czs/cKdsz0IEdieXmWnu76', 'Jason', 'Gray', 'stu15@email.com', '2');
INSERT INTO users (id, password, fname, lname, email,user_type_id) VALUES ('id16', '$2a$10$JofcKIcaYmEaFudtzfuAfuFpwLPe3t/czs/cKdsz0IEdieXmWnu76', 'Jennifer', 'Medina', 'stu16@email.com', '2');
INSERT INTO users (id, password, fname, lname, email,user_type_id) VALUES ('id17', '$2a$10$JofcKIcaYmEaFudtzfuAfuFpwLPe3t/czs/cKdsz0IEdieXmWnu76', 'Gloria', 'Garrett', 'stu17@email.com', '2');
INSERT INTO users (id, password, fname, lname, email,user_type_id) VALUES ('id18', '$2a$10$JofcKIcaYmEaFudtzfuAfuFpwLPe3t/czs/cKdsz0IEdieXmWnu76', 'Heather', 'White', 'stu18@email.com', '2');
INSERT INTO users (id, password, fname, lname, email,user_type_id) VALUES ('id19', '$2a$10$JofcKIcaYmEaFudtzfuAfuFpwLPe3t/czs/cKdsz0IEdieXmWnu76', 'Kimberly', 'Peterson', 'stu19@email.com', '2');
INSERT INTO users (id, password, fname, lname, email,user_type_id) VALUES ('id20', '$2a$10$JofcKIcaYmEaFudtzfuAfuFpwLPe3t/czs/cKdsz0IEdieXmWnu76', 'Harold', 'Garcia', 'stu20@email.com', '2');
INSERT INTO users (id, password, fname, lname, email,user_type_id) VALUES ('id21', '$2a$10$JofcKIcaYmEaFudtzfuAfuFpwLPe3t/czs/cKdsz0IEdieXmWnu76', 'Samuel', 'Allen', 'stu21@email.com', '2');
INSERT INTO users (id, password, fname, lname, email,user_type_id) VALUES ('id22', '$2a$10$JofcKIcaYmEaFudtzfuAfuFpwLPe3t/czs/cKdsz0IEdieXmWnu76', 'Paula', 'Sims', 'stu22@email.com', '2');
INSERT INTO users (id, password, fname, lname, email,user_type_id) VALUES ('id23', '$2a$10$JofcKIcaYmEaFudtzfuAfuFpwLPe3t/czs/cKdsz0IEdieXmWnu76', 'Cynthia', 'Garza', 'stu23@email.com', '2');
INSERT INTO users (id, password, fname, lname, email,user_type_id) VALUES ('id24', '$2a$10$JofcKIcaYmEaFudtzfuAfuFpwLPe3t/czs/cKdsz0IEdieXmWnu76', 'Paul', 'Stanley', 'stu24@email.com', '2');
INSERT INTO users (id, password, fname, lname, email,user_type_id) VALUES ('id25', '$2a$10$JofcKIcaYmEaFudtzfuAfuFpwLPe3t/czs/cKdsz0IEdieXmWnu76', 'Tammy', 'Cruz', 'stu25@email.com', '2');
INSERT INTO users (id, password, fname, lname, email,user_type_id) VALUES ('id26', '$2a$10$JofcKIcaYmEaFudtzfuAfuFpwLPe3t/czs/cKdsz0IEdieXmWnu76', 'Debra', 'Woods', 'stu26@email.com', '2');
INSERT INTO users (id, password, fname, lname, email,user_type_id) VALUES ('id27', '$2a$10$JofcKIcaYmEaFudtzfuAfuFpwLPe3t/czs/cKdsz0IEdieXmWnu76', 'Brandon', 'Williams', 'stu27@email.com', '2');
/*type 3*/
INSERT INTO users (id, password, fname, lname, email,user_type_id) VALUES ("id5","$2a$10$JofcKIcaYmEaFudtzfuAfuFpwLPe3t/czs/cKdsz0IEdieXmWnu76", "test", "prof1", "test-prof1@email.com", "3");
INSERT INTO users (id, password, fname, lname, email,user_type_id) VALUES ("id6","$2a$10$JofcKIcaYmEaFudtzfuAfuFpwLPe3t/czs/cKdsz0IEdieXmWnu76", "test", "prof2", "test-prof2@email.com", "3");
INSERT INTO users (id, password, fname, lname, email, user_type_id) VALUES ('id29', '$2a$10$JofcKIcaYmEaFudtzfuAfuFpwLPe3t/czs/cKdsz0IEdieXmWnu76', 'Gary', 'Ferguson', 'prof5@email.com', '3');
INSERT INTO users (id, password, fname, lname, email, user_type_id) VALUES ('id30', '$2a$10$JofcKIcaYmEaFudtzfuAfuFpwLPe3t/czs/cKdsz0IEdieXmWnu76', 'Craig', 'Berry', 'prof6@email.com', '3');
INSERT INTO users (id, password, fname, lname, email, user_type_id) VALUES ('id31', '$2a$10$JofcKIcaYmEaFudtzfuAfuFpwLPe3t/czs/cKdsz0IEdieXmWnu76', 'Jonathan', 'Gonzales', 'prof7@email.com', '3');
INSERT INTO users (id, password, fname, lname, email, user_type_id) VALUES ('id32', '$2a$10$JofcKIcaYmEaFudtzfuAfuFpwLPe3t/czs/cKdsz0IEdieXmWnu76', 'Martin', 'Mcdonald', 'prof8@email.com', '3');
INSERT INTO users (id, password, fname, lname, email, user_type_id) VALUES ('id33', '$2a$10$JofcKIcaYmEaFudtzfuAfuFpwLPe3t/czs/cKdsz0IEdieXmWnu76', 'Carol', 'Garrett', 'prof9@email.com', '3');
INSERT INTO users (id, password, fname, lname, email, user_type_id) VALUES ('id34', '$2a$10$JofcKIcaYmEaFudtzfuAfuFpwLPe3t/czs/cKdsz0IEdieXmWnu76', 'Barbara', 'Sanchez', 'prof10@email.com', '3');
INSERT INTO users (id, password, fname, lname, email, user_type_id) VALUES ('id35', '$2a$10$JofcKIcaYmEaFudtzfuAfuFpwLPe3t/czs/cKdsz0IEdieXmWnu76', 'Clarence', 'Rodriguez', 'prof11@email.com', '3');
INSERT INTO users (id, password, fname, lname, email, user_type_id) VALUES ('id36', '$2a$10$JofcKIcaYmEaFudtzfuAfuFpwLPe3t/czs/cKdsz0IEdieXmWnu76', 'Lisa', 'Edwards', 'prof12@email.com', '3');
INSERT INTO users (id, password, fname, lname, email, user_type_id) VALUES ('id37', '$2a$10$JofcKIcaYmEaFudtzfuAfuFpwLPe3t/czs/cKdsz0IEdieXmWnu76', 'Norma', 'Kim', 'prof13@email.com', '3');
INSERT INTO users (id, password, fname, lname, email, user_type_id) VALUES ('id38', '$2a$10$JofcKIcaYmEaFudtzfuAfuFpwLPe3t/czs/cKdsz0IEdieXmWnu76', 'Jane', 'Wagner', 'prof14@email.com', '3');
/*type 1*/
INSERT INTO users (id, password, fname, lname, email,user_type_id) VALUES ("id7","$2a$10$JofcKIcaYmEaFudtzfuAfuFpwLPe3t/czs/cKdsz0IEdieXmWnu76", "test", "admin", "test-admin@email.com", "1");



INSERT INTO semesters(id) VALUES ("S16");

INSERT INTO courses (id, name, description, semester_id) VALUES ("cid1","COMP666", "testDescription", "S16");
INSERT INTO courses (id, name, description, semester_id) VALUES ("cid2","COMP777", "testDescription2", "S16");
INSERT INTO courses (id, name, description, semester_id) VALUES ("cid3","COMP888", "testDescription3", "S16");
INSERT INTO courses (id, name, description, semester_id) VALUES ('cid4', 'ECON789', 'interdum mauris ullamcorper purus sit amet nulla quisque', 'S16');
INSERT INTO courses (id, name, description, semester_id) VALUES ('cid5', 'ECON456', 'penatibus et magnis dis parturient montes nascetur', 'S16');
INSERT INTO courses (id, name, description, semester_id) VALUES ('cid6', 'EDUC789', 'turpis enim blandit mi in', 'S16');
INSERT INTO courses (id, name, description, semester_id) VALUES ('cid7', 'EDUC456', 'vulputate justo in blandit ultrices enim lorem ipsum', 'S16');
INSERT INTO courses (id, name, description, semester_id) VALUES ('cid8', 'FINA789', 'adipiscing molestie hendrerit at vulputate vitae', 'S16');
INSERT INTO courses (id, name, description, semester_id) VALUES ('cid9', 'FINA456', 'eget elit sodales scelerisque mauris sit', 'S16');
INSERT INTO courses (id, name, description, semester_id) VALUES ('cid10', 'CHEM789', 'vestibulum ante ipsum primis in faucibus orci luctus', 'S16');
INSERT INTO courses (id, name, description, semester_id) VALUES ('cid11', 'CHEM456', 'nulla elit ac nulla sed', 'S16');
INSERT INTO courses (id, name, description, semester_id) VALUES ('cid12', 'BIO456', 'natoque penatibus et magnis dis parturient montes nascetur', 'S16');
INSERT INTO courses (id, name, description, semester_id) VALUES ('cid13', 'BIO789', 'nisi eu orci mauris', 'S16');
INSERT INTO courses (id, name, description, semester_id) VALUES ('cid14', 'PSYC456', 'vestibulum rutrum rutrum neque aenean', 'S16');
INSERT INTO courses (id, name, description, semester_id) VALUES ('cid15', 'PSYC123', 'faucibus orci luctus et ultrices posuere', 'S16');
INSERT INTO courses (id, name, description, semester_id) VALUES ('cid16', 'ART147', 'faucibus orci luctus et ultrices posuere cubilia curae', 'S16');
INSERT INTO courses (id, name, description, semester_id) VALUES ('cid17', 'ART852', 'mauris morbi non lectus aliquam', 'S16');
INSERT INTO courses (id, name, description, semester_id) VALUES ('cid18', 'JOUR963', 'maecenas tristique est et tempus semper est', 'S16');
INSERT INTO courses (id, name, description, semester_id) VALUES ('cid19', 'JOUR458', 'posuere cubilia curae nulla dapibus dolor', 'S16');
INSERT INTO courses (id, name, description, semester_id) VALUES ('cid20', 'LNGS789', 'dolor morbi vel lectus', 'S16');
INSERT INTO courses (id, name, description, semester_id) VALUES ('cid21', 'LNGS654', 'sed vel enim sit', 'S16');
INSERT INTO courses (id, name, description, semester_id) VALUES ('cid22', 'MATH123', 'convallis tortor risus dapibus augue vel', 'S16');
INSERT INTO courses (id, name, description, semester_id) VALUES ('cid23', 'MATH145', 'sit amet eleifend pede', 'S16');
INSERT INTO courses (id, name, description, semester_id) VALUES ('cid24', 'HIST652', 'et tempus semper est quam pharetra magna', 'S16');
INSERT INTO courses (id, name, description, semester_id) VALUES ('cid25', 'HIST789', 'integer a nibh in', 'S16');
INSERT INTO courses (id, name, description, semester_id) VALUES ('cid26', 'PHED854', 'dapibus nulla suscipit ligula in', 'S16');
INSERT INTO courses (id, name, description, semester_id) VALUES ('cid27', 'PHED523', 'magnis dis parturient montes nascetur', 'S16');
INSERT INTO courses (id, name, description, semester_id) VALUES ('cid28', 'PHIL146', 'congue vivamus metus arcu adipiscing molestie hendrerit', 'S16');
INSERT INTO courses (id, name, description, semester_id) VALUES ('cid29', 'PHYS489', 'condimentum curabitur in libero', 'S16');
INSERT INTO courses (id, name, description, semester_id) VALUES ('cid30', 'PHIL456', 'aenean lectus pellentesque eget', 'S16');
INSERT INTO courses (id, name, description, semester_id) VALUES ('cid31', 'POLT456', 'tincidunt in leo maecenas', 'S16');
INSERT INTO courses (id, name, description, semester_id) VALUES ('cid32', 'RLS789', 'pede posuere nonummy integer non velit', 'S16');
INSERT INTO courses (id, name, description, semester_id) VALUES ('cid33', 'POLT545', 'curae mauris viverra diam vitae quam suspendisse', 'S16');
INSERT INTO courses (id, name, description, semester_id) VALUES ('cid34', 'PTBS566', 'dolor morbi vel lectus', 'S16');
INSERT INTO courses (id, name, description, semester_id) VALUES ('cid35', 'PTBS874', 'vel augue vestibulum rutrum rutrum', 'S16');
INSERT INTO courses (id, name, description, semester_id) VALUES ('cid36', 'THEA452', 'felis sed lacus morbi sem', 'S16');
INSERT INTO courses (id, name, description, semester_id) VALUES ('cid37', 'THEA123', 'pulvinar sed nisl nunc rhoncus', 'S16');
INSERT INTO courses (id, name, description, semester_id) VALUES ('cid38', 'WRTG789', 'congue eget semper rutrum nulla', 'S16');
INSERT INTO courses (id, name, description, semester_id) VALUES ('cid39', 'WRTG41', 'volutpat sapien arcu sed augue', 'S16');
INSERT INTO courses (id, name, description, semester_id) VALUES ('cid40', 'RLS456', 'proin interdum mauris non ligula pellentesque ultrices', 'S16');



/* students of the courses*/
INSERT INTO lkp_course_users (course_id, user_id) VALUES ("cid1","id1");
INSERT INTO lkp_course_users (course_id, user_id) VALUES ("cid15","id1");
INSERT INTO lkp_course_users (course_id, user_id) VALUES ("cid16","id1");
INSERT INTO lkp_course_users (course_id, user_id) VALUES ("cid17","id1");
INSERT INTO lkp_course_users (course_id, user_id) VALUES ("cid18","id1");
INSERT INTO lkp_course_users (course_id, user_id) VALUES ("cid19","id1");
INSERT INTO lkp_course_users (course_id, user_id) VALUES ("cid14","id1");
INSERT INTO lkp_course_users (course_id, user_id) VALUES ("cid13","id1");
INSERT INTO lkp_course_users (course_id, user_id) VALUES ("cid12","id1");
INSERT INTO lkp_course_users (course_id, user_id) VALUES ("cid1","id2");
INSERT INTO lkp_course_users (course_id, user_id) VALUES ("cid1","id3");
INSERT INTO lkp_course_users (course_id, user_id) VALUES ("cid1","id4");
INSERT INTO lkp_course_users (course_id, user_id) VALUES ("cid2","id1");
INSERT INTO lkp_course_users (course_id, user_id) VALUES ("cid2","id2");
INSERT INTO lkp_course_users (course_id, user_id) VALUES ("cid2","id3");
INSERT INTO lkp_course_users (course_id, user_id) VALUES ("cid3","id1");
INSERT INTO lkp_course_users (course_id, user_id) VALUES ("cid3","id2");
insert into lkp_course_users (course_id, user_id) values ('cid1', 'id8');
insert into lkp_course_users (course_id, user_id) values ('cid2', 'id9');
insert into lkp_course_users (course_id, user_id) values ('cid3', 'id10');
insert into lkp_course_users (course_id, user_id) values ('cid4', 'id11');
insert into lkp_course_users (course_id, user_id) values ('cid5', 'id12');
insert into lkp_course_users (course_id, user_id) values ('cid6', 'id13');
insert into lkp_course_users (course_id, user_id) values ('cid7', 'id14');
insert into lkp_course_users (course_id, user_id) values ('cid8', 'id15');
insert into lkp_course_users (course_id, user_id) values ('cid9', 'id16');
insert into lkp_course_users (course_id, user_id) values ('cid10', 'id17');
insert into lkp_course_users (course_id, user_id) values ('cid11', 'id18');
insert into lkp_course_users (course_id, user_id) values ('cid12', 'id19');
insert into lkp_course_users (course_id, user_id) values ('cid13', 'id20');
insert into lkp_course_users (course_id, user_id) values ('cid14', 'id21');
insert into lkp_course_users (course_id, user_id) values ('cid15', 'id22');
insert into lkp_course_users (course_id, user_id) values ('cid16', 'id23');
insert into lkp_course_users (course_id, user_id) values ('cid17', 'id24');
insert into lkp_course_users (course_id, user_id) values ('cid18', 'id25');
insert into lkp_course_users (course_id, user_id) values ('cid19', 'id26');
insert into lkp_course_users (course_id, user_id) values ('cid20', 'id27');
insert into lkp_course_users (course_id, user_id) values ('cid21', 'id8');
insert into lkp_course_users (course_id, user_id) values ('cid22', 'id9');
insert into lkp_course_users (course_id, user_id) values ('cid23', 'id10');
insert into lkp_course_users (course_id, user_id) values ('cid24', 'id11');
insert into lkp_course_users (course_id, user_id) values ('cid25', 'id12');
insert into lkp_course_users (course_id, user_id) values ('cid26', 'id13');
insert into lkp_course_users (course_id, user_id) values ('cid27', 'id14');
insert into lkp_course_users (course_id, user_id) values ('cid28', 'id15');
insert into lkp_course_users (course_id, user_id) values ('cid29', 'id16');
insert into lkp_course_users (course_id, user_id) values ('cid30', 'id17');
insert into lkp_course_users (course_id, user_id) values ('cid31', 'id18');
insert into lkp_course_users (course_id, user_id) values ('cid32', 'id19');
insert into lkp_course_users (course_id, user_id) values ('cid33', 'id20');
insert into lkp_course_users (course_id, user_id) values ('cid34', 'id21');
insert into lkp_course_users (course_id, user_id) values ('cid35', 'id22');
insert into lkp_course_users (course_id, user_id) values ('cid36', 'id23');
insert into lkp_course_users (course_id, user_id) values ('cid37', 'id24');
insert into lkp_course_users (course_id, user_id) values ('cid38', 'id25');
insert into lkp_course_users (course_id, user_id) values ('cid39', 'id26');
insert into lkp_course_users (course_id, user_id) values ('cid40', 'id27');
insert into lkp_course_users (course_id, user_id) values ('cid1', 'id8');
insert into lkp_course_users (course_id, user_id) values ('cid2', 'id9');
insert into lkp_course_users (course_id, user_id) values ('cid3', 'id10');
insert into lkp_course_users (course_id, user_id) values ('cid4', 'id11');
insert into lkp_course_users (course_id, user_id) values ('cid5', 'id12');
insert into lkp_course_users (course_id, user_id) values ('cid6', 'id13');
insert into lkp_course_users (course_id, user_id) values ('cid7', 'id14');
insert into lkp_course_users (course_id, user_id) values ('cid8', 'id15');
insert into lkp_course_users (course_id, user_id) values ('cid9', 'id16');
insert into lkp_course_users (course_id, user_id) values ('cid10', 'id17');
insert into lkp_course_users (course_id, user_id) values ('cid11', 'id18');
insert into lkp_course_users (course_id, user_id) values ('cid12', 'id19');
insert into lkp_course_users (course_id, user_id) values ('cid13', 'id20');
insert into lkp_course_users (course_id, user_id) values ('cid14', 'id21');
insert into lkp_course_users (course_id, user_id) values ('cid15', 'id22');
insert into lkp_course_users (course_id, user_id) values ('cid16', 'id23');
insert into lkp_course_users (course_id, user_id) values ('cid17', 'id24');
insert into lkp_course_users (course_id, user_id) values ('cid18', 'id25');
insert into lkp_course_users (course_id, user_id) values ('cid19', 'id26');
insert into lkp_course_users (course_id, user_id) values ('cid20', 'id27');
insert into lkp_course_users (course_id, user_id) values ('cid21', 'id8');
insert into lkp_course_users (course_id, user_id) values ('cid22', 'id9');
insert into lkp_course_users (course_id, user_id) values ('cid23', 'id10');
insert into lkp_course_users (course_id, user_id) values ('cid24', 'id11');
insert into lkp_course_users (course_id, user_id) values ('cid25', 'id12');
insert into lkp_course_users (course_id, user_id) values ('cid26', 'id13');
insert into lkp_course_users (course_id, user_id) values ('cid27', 'id14');
insert into lkp_course_users (course_id, user_id) values ('cid28', 'id15');
insert into lkp_course_users (course_id, user_id) values ('cid29', 'id16');
insert into lkp_course_users (course_id, user_id) values ('cid30', 'id17');
insert into lkp_course_users (course_id, user_id) values ('cid31', 'id18');
insert into lkp_course_users (course_id, user_id) values ('cid32', 'id19');
insert into lkp_course_users (course_id, user_id) values ('cid33', 'id20');
insert into lkp_course_users (course_id, user_id) values ('cid34', 'id21');
insert into lkp_course_users (course_id, user_id) values ('cid35', 'id22');
insert into lkp_course_users (course_id, user_id) values ('cid36', 'id23');
insert into lkp_course_users (course_id, user_id) values ('cid37', 'id24');
insert into lkp_course_users (course_id, user_id) values ('cid38', 'id25');
insert into lkp_course_users (course_id, user_id) values ('cid39', 'id26');
insert into lkp_course_users (course_id, user_id) values ('cid40', 'id27');
insert into lkp_course_users (course_id, user_id) values ('cid1', 'id8');

/* profs of the courses */
INSERT INTO lkp_course_users (course_id, user_id) VALUES ("cid3","id5");
INSERT INTO lkp_course_users (course_id, user_id) VALUES ("cid2","id6");
INSERT INTO lkp_course_users (course_id, user_id) VALUES ("cid1","id5");
INSERT INTO lkp_course_users (course_id, user_id) VALUES ('cid4', 'id30');
INSERT INTO lkp_course_users (course_id, user_id) VALUES ('cid5', 'id31');
INSERT INTO lkp_course_users (course_id, user_id) VALUES ('cid6', 'id34');
INSERT INTO lkp_course_users (course_id, user_id) VALUES ('cid7', 'id32');
INSERT INTO lkp_course_users (course_id, user_id) VALUES ('cid8', 'id30');
INSERT INTO lkp_course_users (course_id, user_id) VALUES ('cid9', 'id34');
INSERT INTO lkp_course_users (course_id, user_id) VALUES ('cid10', 'id35');
INSERT INTO lkp_course_users (course_id, user_id) VALUES ('cid11', 'id29');
INSERT INTO lkp_course_users (course_id, user_id) VALUES ('cid12', 'id37');
INSERT INTO lkp_course_users (course_id, user_id) VALUES ('cid13', 'id35');
INSERT INTO lkp_course_users (course_id, user_id) VALUES ('cid14', 'id35');
INSERT INTO lkp_course_users (course_id, user_id) VALUES ('cid15', 'id38');
INSERT INTO lkp_course_users (course_id, user_id) VALUES ('cid16', 'id33');
INSERT INTO lkp_course_users (course_id, user_id) VALUES ('cid17', 'id29');
INSERT INTO lkp_course_users (course_id, user_id) VALUES ('cid18', 'id37');
INSERT INTO lkp_course_users (course_id, user_id) VALUES ('cid19', 'id33');
INSERT INTO lkp_course_users (course_id, user_id) VALUES ('cid20', 'id30');
INSERT INTO lkp_course_users (course_id, user_id) VALUES ('cid21', 'id31');
INSERT INTO lkp_course_users (course_id, user_id) VALUES ('cid22', 'id29');
INSERT INTO lkp_course_users (course_id, user_id) VALUES ('cid23', 'id31');
INSERT INTO lkp_course_users (course_id, user_id) VALUES ('cid24', 'id35');
INSERT INTO lkp_course_users (course_id, user_id) VALUES ('cid25', 'id35');
INSERT INTO lkp_course_users (course_id, user_id) VALUES ('cid26', 'id37');
INSERT INTO lkp_course_users (course_id, user_id) VALUES ('cid27', 'id31');
INSERT INTO lkp_course_users (course_id, user_id) VALUES ('cid28', 'id30');
INSERT INTO lkp_course_users (course_id, user_id) VALUES ('cid29', 'id36');
INSERT INTO lkp_course_users (course_id, user_id) VALUES ('cid30', 'id29');
INSERT INTO lkp_course_users (course_id, user_id) VALUES ('cid31', 'id38');
INSERT INTO lkp_course_users (course_id, user_id) VALUES ('cid32', 'id36');
INSERT INTO lkp_course_users (course_id, user_id) VALUES ('cid33', 'id38');
INSERT INTO lkp_course_users (course_id, user_id) VALUES ('cid34', 'id32');
INSERT INTO lkp_course_users (course_id, user_id) VALUES ('cid35', 'id37');
INSERT INTO lkp_course_users (course_id, user_id) VALUES ('cid36', 'id31');
INSERT INTO lkp_course_users (course_id, user_id) VALUES ('cid37', 'id31');
INSERT INTO lkp_course_users (course_id, user_id) VALUES ('cid38', 'id38');
INSERT INTO lkp_course_users (course_id, user_id) VALUES ('cid39', 'id32');
INSERT INTO lkp_course_users (course_id, user_id) VALUES ('cid40', 'id36');
