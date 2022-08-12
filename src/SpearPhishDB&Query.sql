CREATE SCHEMA IF NOT EXISTS spearphishing;
use spearphishing;

create table users (
	email varchar(255) UNIQUE PRIMARY KEY,
    fname varchar(15) NOT NULL,
    lname varchar(25) NOT NULL,
    position varchar(40),
    phonenumber varchar(10)
);

create table emails (
    id int auto_increment PRIMARY KEY,
    subj varchar(255),
    FK_target varchar(255) references users(email),
    content MEDIUMTEXT,
    isPhish boolean
);

create table evals (
	FK_email varchar(255) references users(email),
    FK_id int REFERENCES emails(id),
    isEvalPhish boolean,
    PRIMARY KEY(FK_email, FK_id)
);

/* Views for TP/TN/FP/FN accuracy queries */

CREATE VIEW ACC_QUERY as 
SELECT FK_email, FK_id, isPhish, isEvalPhish
FROM emails, evals
WHERE id = FK_id;

/*Group By TP/TN/FP/TN*/
SELECT COUNT(*)
FROM ACC_QUERY 
GROUP BY (isPhish, isEvalPhish);

/* TPs Query */
SELECT * 
FROM ACC_QUERY 
WHERE isPhish=true AND isEvalPhish=true;

/* TN Query */
SELECT * 
FROM ACC_QUERY 
WHERE isPhish=false AND isEvalPhish=false;

/* FP Query */
SELECT * 
FROM ACC_QUERY 
WHERE isPhish=false AND isEvalPhish=true;

/* FN Query */
SELECT * 
FROM ACC_QUERY 
WHERE isPhish=false AND isEvalPhish=false;