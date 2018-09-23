DROP TABLE IF EXISTS bid_for;
DROP TABLE IF EXISTS items;
DROP TABLE IF EXISTS category;
DROP TABLE IF EXISTS users;

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
	category VARCHAR(20),
	name VARCHAR(20) NOT NULL,
	owner VARCHAR(50),
	location VARCHAR(100) NOT NULL,
	description VARCHAR(255),
	date_start DATE NOT NULL,
	date_end DATE NOT NULL,
	PRIMARY KEY (item_id, category),
	FOREIGN KEY (owner) REFERENCES users(email) ON DELETE CASCADE,
	FOREIGN KEY (category) REFERENCES category(name) ON DELETE CASCADE
);

CREATE TABLE bid_for (
	bidder VARCHAR(50),
	item_id INTEGER,
	category VARCHAR(20),
	bid_amount NUMERIC(8, 2),
	PRIMARY KEY (bidder, item_id, category),
	FOREIGN KEY (bidder) REFERENCES users(email) ON DELETE CASCADE,
	FOREIGN KEY (item_id, category) REFERENCES items(item_id, category)
)