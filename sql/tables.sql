DROP TABLE IF EXISTS bid_for CASCADE;
DROP TABLE IF EXISTS items CASCADE;
DROP TABLE IF EXISTS item_belongs_to_category CASCADE;
DROP TABLE IF EXISTS category CASCADE;
DROP TABLE IF EXISTS forgot_password;
DROP TABLE IF EXISTS users CASCADE;

CREATE TABLE users (
	email VARCHAR(50),
	display_name VARCHAR(15) NOT NULL,
	password VARCHAR(50) NOT NULL,
	PRIMARY KEY (email)
);

CREATE TABLE category (
	name VARCHAR(20) PRIMARY KEY
);
/*
Merged with relation 'owns' due to (1, 1) participation constraint
Merged with relation 'belongs_to' as it is a weak entity
*/
CREATE TABLE items (
	item_id INTEGER,
	name VARCHAR(20) NOT NULL,
	owner VARCHAR(50),
	location VARCHAR(100) NOT NULL,
	description VARCHAR(255),
	date_start DATE NOT NULL,
	date_end DATE NOT NULL,
	PRIMARY KEY (item_id),
	FOREIGN KEY (owner) REFERENCES users(email) ON DELETE CASCADE
);

CREATE TABLE item_belongs_to_category (
	item_id INTEGER,
	category VARCHAR(20),
	PRIMARY KEY (item_id, category),
	FOREIGN KEY (item_id) REFERENCES items(item_id) DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY (category) REFERENCES category(name)
);

CREATE TABLE bid_for (
	bidder VARCHAR(50),
	item_id INTEGER,
	bid_amount NUMERIC(8, 2),
	PRIMARY KEY (bidder, item_id),
	FOREIGN KEY (bidder) REFERENCES users(email) ON DELETE CASCADE,
	FOREIGN KEY (item_id) REFERENCES items(item_id)
);

--Weak entity so merge
CREATE TABLE forgot_password (
	email VARCHAR(50),
	reset_link VARCHAR(100) PRIMARY KEY,
	valid BOOLEAN NOT NULL,
	requested_time TIMESTAMP NOT NULL,
	FOREIGN KEY (email) REFERENCES users(email)
); 


CREATE OR REPLACE FUNCTION check_item_at_least_one_category()
RETURNS TRIGGER AS $$
BEGIN
IF (EXISTS (SELECT * FROM item_belongs_to_category c 
			WHERE NEW.item_id = c.item_id)) THEN
RETURN NEW;
END IF;
RETURN NULL;
END; $$ LANGUAGE PLPGSQL;

CREATE TRIGGER check_item_at_least_one_category
BEFORE INSERT OR UPDATE
ON items
FOR EACH ROW
EXECUTE PROCEDURE check_item_at_least_one_category();

