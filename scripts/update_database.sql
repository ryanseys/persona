ALTER TABLE user ENGINE = InnoDB;
ALTER TABLE user CHANGE id id BIGINT AUTO_INCREMENT;
ALTER TABLE user CHANGE passwd passwd CHAR(64) NOT NULL;

ALTER TABLE email ENGINE = InnoDB;
ALTER TABLE email CHANGE id id BIGINT AUTO_INCREMENT;
ALTER TABLE email CHANGE user user BIGINT NOT NULL;
ALTER TABLE email ADD FOREIGN KEY user_fkey (user) REFERENCES user(id);
ALTER TABLE email CHANGE address address VARCHAR(255) UNIQUE NOT NULL;

ALTER TABLE staged ENGINE = InnoDB;
ALTER TABLE staged DROP PRIMARY KEY;
ALTER TABLE staged ADD id BIGINT AUTO_INCREMENT PRIMARY KEY;
ALTER TABLE staged CHANGE secret secret CHAR(48) UNIQUE NOT NULL;
ALTER TABLE staged CHANGE new_acct new_acct BOOL NOT NULL;
ALTER TABLE staged CHANGE email email VARCHAR(255) UNIQUE NOT NULL;
ALTER TABLE staged CHANGE ts ts TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL;

