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
  id INTEGER NOT NULL AUTO_INCREMENT,
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
  id INTEGER NOT NULL AUTO_INCREMENT,
  name VARCHAR(60) NOT NULL,
  description VARCHAR(1000) DEFAULT NULL,
  start_dtm TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  end_dtm TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (id)
);

CREATE TABLE lkp_course_users (
  id INTEGER NOT NULL AUTO_INCREMENT,
  course_id INTEGER NOT NULL,
  user_id INTEGER NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (course_id) REFERENCES courses (id),
  FOREIGN KEY (user_id) REFERENCES users (id)
);

CREATE INDEX idx_users_email ON users (email ASC);

INSERT INTO lkp_user_type (name) VALUES ("admin");
INSERT INTO lkp_user_type (name) VALUES ("student");
INSERT INTO lkp_user_type (name) VALUES ("professor");
                                                                        /* password = password*/
INSERT INTO users (password, fname, lname, email,user_type_id) VALUES ("$2a$10$JofcKIcaYmEaFudtzfuAfuFpwLPe3t/czs/cKdsz0IEdieXmWnu76", "test", "user", "test-user@email.com", 1);

INSERT INTO courses (name, description) VALUES ("testCourse", "testDescription");
INSERT INTO courses (name, description) VALUES ("testCourse2", "testDescription2");

INSERT INTO lkp_course_users (course_id,user_id) VALUES (1,1);
INSERT INTO lkp_course_users (course_id,user_id) VALUES (2,1);
