DROP TABLE IF EXISTS lkp_course_users;
DROP TABLE IF EXISTS lkp_user_reset_token_hash;
DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS courses;
DROP TABLE IF EXISTS user_types;
DROP TABLE IF EXISTS semesters;

CREATE TABLE user_types (
  id INTEGER NOT NULL AUTO_INCREMENT,
  name VARCHAR(60) NOT NULL,
  PRIMARY KEY (id)
);

CREATE TABLE users (
  id INTEGER NOT NULL AUTO_INCREMENT,
  password VARCHAR(60) NULL,
  email VARCHAR(255) NOT NULL UNIQUE,
  fname VARCHAR(60) NULL,
  lname VARCHAR(60) NULL,
  update_dtm TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  last_login_dtm TIMESTAMP NULL,
  invited BIT NOT NULL DEFAULT 0,
  PRIMARY KEY (id)
);

CREATE TABLE lkp_user_reset_token_ids (
  id INTEGER NOT NULL AUTO_INCREMENT,
  user_email VARCHAR(60) NOT NULL,
  valid BIT NOT NULL DEFAULT 1,
  PRIMARY KEY (id),
  FOREIGN KEY (user_email) REFERENCES users (email)
);

CREATE TABLE semesters (
  id VARCHAR(60) NOT NULL,
  start_dtm TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  end_dtm TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (id)
);

CREATE TABLE courses (
  id VARCHAR(60) NOT NULL,
  name VARCHAR(60) NULL,
  description VARCHAR(1000) NULL,
  semester_id VARCHAR(60) NOT NULL,
  PRIMARY KEY (id, semester_id),
  FOREIGN KEY (semester_id) REFERENCES semesters (id)
);

CREATE TABLE lkp_course_users (
  id INTEGER NOT NULL AUTO_INCREMENT,
  course_id VARCHAR(60) NOT NULL,
  semester_id VARCHAR(60) NOT NULL,
  user_id INTEGER NOT NULL,
  user_type_id INTEGER NOT NULL DEFAULT 2,
  PRIMARY KEY (id),
  FOREIGN KEY (course_id, semester_id) REFERENCES courses (id, semester_id),
  FOREIGN KEY (user_id) REFERENCES users (id),
  FOREIGN KEY (user_type_id) REFERENCES user_types (id),
  UNIQUE KEY (course_id, semester_id, user_id)
);

CREATE INDEX idx_users_email ON users (email ASC);
CREATE INDEX idx_lkp_user_reset_token_hash_users_email ON lkp_user_reset_token_ids (user_email ASC);

INSERT INTO user_types (name) VALUES ("admin");
INSERT INTO user_types (name) VALUES ("student");
INSERT INTO user_types (name) VALUES ("professor"); /* 3 */

                                                                        /* password = password*/
                                                                        /* type 2*/
INSERT INTO semesters(id, start_dtm, end_dtm) VALUES("F16", "2016-09-06", "2016-12-24")