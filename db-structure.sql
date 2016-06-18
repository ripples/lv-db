DROP TABLE IF EXISTS lkp_course_users;
DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS courses;
DROP TABLE IF EXISTS lkp_user_type;

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

CREATE TABLE courses (
  id VARCHAR(60) NOT NULL,
  name VARCHAR(60) NOT NULL,
  description VARCHAR(1000) DEFAULT NULL,
  start_dtm TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  end_dtm TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (id)
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
INSERT INTO users (id, password, fname, lname, email,user_type_id) VALUES ("id1","$2a$10$JofcKIcaYmEaFudtzfuAfuFpwLPe3t/czs/cKdsz0IEdieXmWnu76", "test", "student1", "test-student1@email.com", "2");
INSERT INTO users (id, password, fname, lname, email,user_type_id) VALUES ("id2","$2a$10$JofcKIcaYmEaFudtzfuAfuFpwLPe3t/czs/cKdsz0IEdieXmWnu76", "test", "student2", "test-student2@email.com", "2");
INSERT INTO users (id, password, fname, lname, email,user_type_id) VALUES ("id3","$2a$10$JofcKIcaYmEaFudtzfuAfuFpwLPe3t/czs/cKdsz0IEdieXmWnu76", "test", "student3", "test-student3@email.com", "2");
INSERT INTO users (id, password, fname, lname, email,user_type_id) VALUES ("id4","$2a$10$JofcKIcaYmEaFudtzfuAfuFpwLPe3t/czs/cKdsz0IEdieXmWnu76", "test", "student4", "test-student4@email.com", "2");
INSERT INTO users (id, password, fname, lname, email,user_type_id) VALUES ("id5","$2a$10$JofcKIcaYmEaFudtzfuAfuFpwLPe3t/czs/cKdsz0IEdieXmWnu76", "test", "prof1", "test-prof1@email.com", "3");
INSERT INTO users (id, password, fname, lname, email,user_type_id) VALUES ("id6","$2a$10$JofcKIcaYmEaFudtzfuAfuFpwLPe3t/czs/cKdsz0IEdieXmWnu76", "test", "prof2", "test-prof2@email.com", "3");
INSERT INTO users (id, password, fname, lname, email,user_type_id) VALUES ("id7","$2a$10$JofcKIcaYmEaFudtzfuAfuFpwLPe3t/czs/cKdsz0IEdieXmWnu76", "test", "admin", "test-admin@email.com", "1");

INSERT INTO courses (id, name, description) VALUES ("cid1","COMP666", "testDescription");
INSERT INTO courses (id, name, description) VALUES ("cid2","COMP777", "testDescription2");
INSERT INTO courses (id, name, description) VALUES ("cid3","COMP888", "testDescription3");

INSERT INTO lkp_course_users (course_id,user_id) VALUES ("cid1","id1");
INSERT INTO lkp_course_users (course_id,user_id) VALUES ("cid1","id2");
INSERT INTO lkp_course_users (course_id,user_id) VALUES ("cid1","id3");
INSERT INTO lkp_course_users (course_id,user_id) VALUES ("cid1","id4");
INSERT INTO lkp_course_users (course_id,user_id) VALUES ("cid1","id5");

INSERT INTO lkp_course_users (course_id,user_id) VALUES ("cid2","id1");
INSERT INTO lkp_course_users (course_id,user_id) VALUES ("cid2","id2");
INSERT INTO lkp_course_users (course_id,user_id) VALUES ("cid2","id3");
INSERT INTO lkp_course_users (course_id,user_id) VALUES ("cid2","id6");

INSERT INTO lkp_course_users (course_id,user_id) VALUES ("cid3","id1");
INSERT INTO lkp_course_users (course_id,user_id) VALUES ("cid3","id2");
INSERT INTO lkp_course_users (course_id,user_id) VALUES ("cid3","id5");
