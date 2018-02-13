use project2;

DROP TABLE IF EXISTS member;
CREATE TABLE IF NOT EXISTS member(
	id VARCHAR(20) PRIMARY KEY,
	name VARCHAR(10) NOT NULL,
	password VARCHAR(20) NOT NULL,
	email VARCHAR(30) NOT NULL,
	email_get VARCHAR(1),
	reg_date TIMESTAMP NOT NULL
);

select * from member;