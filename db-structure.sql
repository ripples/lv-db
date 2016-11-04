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
  email VARCHAR(255) NOT NULL UNIQUE,
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
  PRIMARY KEY (id, semester_id),
  FOREIGN KEY (semester_id) REFERENCES semesters (id)
);

CREATE TABLE lkp_course_users (
  id INTEGER NOT NULL AUTO_INCREMENT,
  course_id VARCHAR(60) NOT NULL,
  semester_id VARCHAR(60) NOT NULL,
  user_id VARCHAR(60) NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (course_id, semester_id) REFERENCES courses (id, semester_id),
  FOREIGN KEY (user_id) REFERENCES users (id)
);

CREATE INDEX idx_users_email ON users (email ASC);

/************************************** TEST DATA ***************************************************/
INSERT INTO lkp_user_type (name) VALUES ("admin");
INSERT INTO lkp_user_type (name) VALUES ("student");
INSERT INTO lkp_user_type (name) VALUES ("professor");

                                                                        /* password = password*/
                                                                        /* type 2*/
INSERT INTO semesters(id, start_dtm, end_dtm) VALUES("F16", "2016-09-06", "2016-12-24")