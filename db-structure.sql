DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS lkp_user_type;

CREATE TABLE lkp_user_type (
  user_type_id INTEGER NOT NULL AUTO_INCREMENT,
  name VARCHAR(60) NOT NULL,
  PRIMARY KEY (user_type_id)
);

INSERT INTO lkp_user_type (name) VALUES ("admin");
INSERT INTO lkp_user_type (name) VALUES ("student");
INSERT INTO lkp_user_type (name) VALUES ("professor");

CREATE TABLE users (
  id INTEGER NOT NULL AUTO_INCREMENT,
  username VARCHAR(60) NOT NULL,
  password VARCHAR(60) NOT NULL,
  salt CHAR(60) NOT NULL,
  email VARCHAR(255) NOT NULL,
  user_type_id INTEGER NOT NULL DEFAULT 2, 
  update_dtm TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  last_login_dtm TIMESTAMP NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (user_type_id) REFERENCES lkp_user_type (user_type_id)
);

CREATE INDEX idx_users_username ON users (username ASC);

INSERT INTO users (username,password,salt,email,user_type_id) VALUES ("admin","password","salt","email",1);
