CREATE SCHEMA IF NOT EXISTS spearphishing;
use spearphishing;

create table IF NOT EXISTS users (
	email varchar(255) UNIQUE PRIMARY KEY,
    fname varchar(15) NOT NULL,
    lname varchar(25) NOT NULL,
    position varchar(40),
    phonenumber varchar(10)
);

create table IF NOT EXISTS emails (
    id int auto_increment PRIMARY KEY,
    f_email varchar(255),
    subj varchar(255),
    FK_target varchar(255) references users(email),
    content MEDIUMTEXT,
    isPhish boolean
);

create table IF NOT EXISTS evals (
	id int auto_increment PRIMARY KEY,
	FK_email varchar(255) references users(email),
    FK_id int REFERENCES emails(id),
    is_eval_phish boolean
);

create table IF NOT EXISTS bigfive (
	u_email varchar(255),
    extraversion int,
    agreebleness int,
    imagination int,
    nevroticism int,
    consciousness int
);

/* Views for TP/TN/FP/FN accuracy queries */

CREATE VIEW ACC_QUERY as 
SELECT FK_email, FK_id, isPhish, is_eval_phish
FROM emails as e, evals as es
WHERE e.id = es.FK_id;

SELECT *
FROM ACC_QUERY;

/*Group By TP/TN/FP/TN*/
SELECT isPhish, is_eval_phish, COUNT(*)
FROM ACC_QUERY 
GROUP BY isPhish, is_eval_phish;

/* TPs Query */
SELECT * 
FROM ACC_QUERY 
WHERE isPhish=true AND is_eval_phish=true;

/* TN Query */
SELECT * 
FROM ACC_QUERY 
WHERE isPhish=true AND is_eval_phish=false;

/* FP Query */
SELECT * 
FROM ACC_QUERY 
WHERE isPhish=false AND is_eval_phish=true;

/* FN Query */
SELECT * 
FROM ACC_QUERY 
WHERE isPhish=false AND is_eval_phish=false;