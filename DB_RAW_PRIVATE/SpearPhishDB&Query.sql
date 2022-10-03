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

create table IF NOT EXISTS email_attr (
	ID int PRIMARY KEY,
    email_name varchar(255),
    reciprocity int,
    scarcity int,
    authority int,
    consistency int,
    liking int,
    social_proof int,
    earning int,
    hidden_link int,
    grammar_mistakes int,
    spoofing int
);

CREATE VIEW emails_filtered as
SELECT e.id as evaluation_ID, a.id as email_ID, a.isPhish as isPhishing,
a.reciprocity as Reciprocity, a.scarcity as Scarcity, a.authority as Authority, a.consistency as Consistency,
a.liking as Liking,a.social_proof as SocialProof, a.earning as Earning, a.hidden_link as HiddenLinks, a.grammar_mistakes as GrammarMistakes, a.spoofing as Spoofing
FROM emails as e, email_attr as a
WHERE a.ID=(MOD(e.id, 31));

DROP VIEW emails_filtered;

select * from emails_filtered;

/*VIEW FOR VALID USERS*/

CREATE VIEW VALID_USERS AS
SELECT email, participant_number, sex, age_category, extraversion, agreebleness, imagination, nevroticism, consciousness
FROM users, bigfive
WHERE email = u_email and email  IN (SELECT FK_email from spearphishing.evals GROUP BY FK_email);

CREATE VIEW results AS
SELECT participant_number as ParticipantID, sex as Gender, age_category as IsOver30, ef.isPhishing, e.is_eval_phish  as IsJudgedAsPhishing,
extraversion as Extraversion, agreebleness as Agreeableness, imagination as Openness, nevroticism as Neuroticism, consciousness as Conscientiousness,
ef.email_ID, Reciprocity, Scarcity, Authority, Consistency, SocialProof, Liking, Earning, HiddenLinks, GrammarMistakes, Spoofing
FROM VALID_USERS as vu, evals as e, emails_filtered as ef
WHERE vu.email = e.FK_email AND e.FK_ID=ef.evaluation_ID;

Drop VIEW results;

SELECT * from results;
/*QUERIES FOR TABLES*/

/*APPENDIX*/

SELECT gender, isPhishing, isJudgedAsPhishing, count(*)
FROM results GROUP BY gender, isPhishing, isJudgedAsPhishing;

SELECT isOver30, isPhishing, isJudgedAsPhishing, count(*)
FROM results GROUP BY isOver30, isPhishing, isJudgedAsPhishing;

SELECT participantID, gender, extraversion, agreeableness,openness, neuroticism, conscientiousness, count(*)
FROM results 
WHERE isPhishing!=isJudgedAsPhishing
GROUP BY participantID ORDER BY participantID, GENDER;

SELECT participantID, isOver30, extraversion, agreeableness,openness, neuroticism, conscientiousness, count(*)
FROM results 
WHERE isPhishing!=isJudgedAsPhishing
GROUP BY participantID ORDER BY participantID, isOver30;

SELECT participantID, extraversion, agreeableness,openness, neuroticism, conscientiousness, count(*)
FROM results 
WHERE isPhishing!=isJudgedAsPhishing
GROUP BY participantID ORDER BY participantID;

SELECT email_ID, reciprocity, count(*) as Misj,
CAST(AVG(Extraversion)AS DECIMAL(10,1)) as extr, CAST(AVG(Agreeableness)AS DECIMAL(10,1)) as agre, 
CAST(AVG(Openness)AS DECIMAL(10,1)) as open, CAST(AVG(Neuroticism)AS DECIMAL(10,1)) as neur,
CAST(AVG(Conscientiousness)AS DECIMAL(10,1)) as cons
FROM results
WHERE isPhishing!=isJudgedAsPhishing
GROUP BY email_ID;

SELECT email_ID, reciprocity, count(*) as Misj,
CAST(AVG(Extraversion)AS DECIMAL(10,1)) as extr, CAST(AVG(Agreeableness)AS DECIMAL(10,1)) as agre, 
CAST(AVG(Openness)AS DECIMAL(10,1)) as open, CAST(AVG(Neuroticism)AS DECIMAL(10,1)) as neur,
CAST(AVG(Conscientiousness)AS DECIMAL(10,1)) as cons
FROM results
WHERE isPhishing!=isJudgedAsPhishing
GROUP BY email_ID;

SELECT email_ID, scarcity, count(*) as Misj,
CAST(AVG(Extraversion)AS DECIMAL(10,1)) as extr, CAST(AVG(Agreeableness)AS DECIMAL(10,1)) as agre, 
CAST(AVG(Openness)AS DECIMAL(10,1)) as open, CAST(AVG(Neuroticism)AS DECIMAL(10,1)) as neur,
CAST(AVG(Conscientiousness)AS DECIMAL(10,1)) as cons
FROM results
WHERE isPhishing!=isJudgedAsPhishing
GROUP BY email_ID;

SELECT email_ID, authority, count(*) as Misj,
CAST(AVG(Extraversion)AS DECIMAL(10,1)) as extr, CAST(AVG(Agreeableness)AS DECIMAL(10,1)) as agre, 
CAST(AVG(Openness)AS DECIMAL(10,1)) as open, CAST(AVG(Neuroticism)AS DECIMAL(10,1)) as neur,
CAST(AVG(Conscientiousness)AS DECIMAL(10,1)) as cons
FROM results
WHERE isPhishing!=isJudgedAsPhishing
GROUP BY email_ID;

SELECT email_ID, consistency, count(*) as Misj,
CAST(AVG(Extraversion)AS DECIMAL(10,1)) as extr, CAST(AVG(Agreeableness)AS DECIMAL(10,1)) as agre, 
CAST(AVG(Openness)AS DECIMAL(10,1)) as open, CAST(AVG(Neuroticism)AS DECIMAL(10,1)) as neur,
CAST(AVG(Conscientiousness)AS DECIMAL(10,1)) as cons
FROM results
WHERE isPhishing!=isJudgedAsPhishing
GROUP BY email_ID;

SELECT email_ID, socialproof, count(*) as Misj,
CAST(AVG(Extraversion)AS DECIMAL(10,1)) as extr, CAST(AVG(Agreeableness)AS DECIMAL(10,1)) as agre, 
CAST(AVG(Openness)AS DECIMAL(10,1)) as open, CAST(AVG(Neuroticism)AS DECIMAL(10,1)) as neur,
CAST(AVG(Conscientiousness)AS DECIMAL(10,1)) as cons
FROM results
WHERE isPhishing!=isJudgedAsPhishing
GROUP BY email_ID;

SELECT email_ID, liking, count(*) as Misj,
CAST(AVG(Extraversion)AS DECIMAL(10,1)) as extr, CAST(AVG(Agreeableness)AS DECIMAL(10,1)) as agre, 
CAST(AVG(Openness)AS DECIMAL(10,1)) as open, CAST(AVG(Neuroticism)AS DECIMAL(10,1)) as neur,
CAST(AVG(Conscientiousness)AS DECIMAL(10,1)) as cons
FROM results
WHERE isPhishing!=isJudgedAsPhishing
GROUP BY email_ID;

SELECT email_ID, earning, count(*) as Misj,
CAST(AVG(Extraversion)AS DECIMAL(10,1)) as extr, CAST(AVG(Agreeableness)AS DECIMAL(10,1)) as agre, 
CAST(AVG(Openness)AS DECIMAL(10,1)) as open, CAST(AVG(Neuroticism)AS DECIMAL(10,1)) as neur,
CAST(AVG(Conscientiousness)AS DECIMAL(10,1)) as cons
FROM results
WHERE isPhishing!=isJudgedAsPhishing
GROUP BY email_ID;

SELECT email_ID, hiddenlinks, count(*) as Misj,
CAST(AVG(Extraversion)AS DECIMAL(10,1)) as extr, CAST(AVG(Agreeableness)AS DECIMAL(10,1)) as agre, 
CAST(AVG(Openness)AS DECIMAL(10,1)) as open, CAST(AVG(Neuroticism)AS DECIMAL(10,1)) as neur,
CAST(AVG(Conscientiousness)AS DECIMAL(10,1)) as cons
FROM results
WHERE isPhishing!=isJudgedAsPhishing
GROUP BY email_ID;

SELECT email_ID, grammarmistakes, count(*) as Misj,
CAST(AVG(Extraversion)AS DECIMAL(10,1)) as extr, CAST(AVG(Agreeableness)AS DECIMAL(10,1)) as agre, 
CAST(AVG(Openness)AS DECIMAL(10,1)) as open, CAST(AVG(Neuroticism)AS DECIMAL(10,1)) as neur,
CAST(AVG(Conscientiousness)AS DECIMAL(10,1)) as cons
FROM results
WHERE isPhishing!=isJudgedAsPhishing
GROUP BY email_ID;

SELECT email_ID, spoofing, count(*) as Misj,
CAST(AVG(Extraversion)AS DECIMAL(10,1)) as extr, CAST(AVG(Agreeableness)AS DECIMAL(10,1)) as agre, 
CAST(AVG(Openness)AS DECIMAL(10,1)) as open, CAST(AVG(Neuroticism)AS DECIMAL(10,1)) as neur,
CAST(AVG(Conscientiousness)AS DECIMAL(10,1)) as cons
FROM results
WHERE isPhishing!=isJudgedAsPhishing
GROUP BY email_ID;

SELECT participantID as ID, gender, isOver30, extraversion as extr, agreeableness as agree, openness as open,neuroticism as neur, conscientiousness as cons,
count(*) as Misj, CAST(AVG(reciprocity)AS DECIMAL(10,1)) as rec
FROM results
WHERE isPhishing!=isJudgedAsPhishing
GROUP BY participantID;

SELECT participantID as ID, gender, isOver30, extraversion as extr, agreeableness as agree, openness as open,neuroticism as neur, conscientiousness as cons,
count(*) as Misj, CAST(AVG(scarcity)AS DECIMAL(10,1)) as scar
FROM results
WHERE isPhishing!=isJudgedAsPhishing
GROUP BY participantID;

SELECT participantID as ID, gender, isOver30, extraversion as extr, agreeableness as agree, openness as open,neuroticism as neur, conscientiousness as cons,
count(*) as Misj, CAST(AVG(authority)AS DECIMAL(10,1)) as auth
FROM results
WHERE isPhishing!=isJudgedAsPhishing
GROUP BY participantID;

SELECT participantID as ID, gender, isOver30, extraversion as extr, agreeableness as agree, openness as open,neuroticism as neur, conscientiousness as cons,
count(*) as Misj, CAST(AVG(consistency)AS DECIMAL(10,1)) as cons
FROM results
WHERE isPhishing!=isJudgedAsPhishing
GROUP BY participantID;

SELECT participantID as ID, gender, isOver30, extraversion as extr, agreeableness as agree, openness as open,neuroticism as neur, conscientiousness as cons,
count(*) as Misj, CAST(AVG(socialproof)AS DECIMAL(10,1)) as socp
FROM results
WHERE isPhishing!=isJudgedAsPhishing
GROUP BY participantID;

SELECT participantID as ID, gender, isOver30, extraversion as extr, agreeableness as agree, openness as open,neuroticism as neur, conscientiousness as cons,
count(*) as Misj, CAST(AVG(liking)AS DECIMAL(10,1)) as lik
FROM results
WHERE isPhishing!=isJudgedAsPhishing
GROUP BY participantID;

SELECT participantID as ID, gender, isOver30, extraversion as extr, agreeableness as agree, openness as open,neuroticism as neur, conscientiousness as cons,
count(*) as Misj, CAST(AVG(Earning)AS DECIMAL(10,1)) as earn
FROM results
WHERE isPhishing!=isJudgedAsPhishing
GROUP BY participantID;

SELECT participantID as ID, gender, isOver30, extraversion as extr, agreeableness as agree, openness as open,neuroticism as neur, conscientiousness as cons,
count(*) as Misj, CAST(AVG(hiddenlinks)AS DECIMAL(10,1)) as hidl
FROM results
WHERE isPhishing!=isJudgedAsPhishing
GROUP BY participantID;

SELECT participantID as ID, gender, isOver30, extraversion as extr, agreeableness as agree, openness as open,neuroticism as neur, conscientiousness as cons,
count(*) as Misj, CAST(AVG(grammarMistakes)AS DECIMAL(10,1)) as grmm
FROM results
WHERE isPhishing!=isJudgedAsPhishing
GROUP BY participantID;

SELECT participantID as ID, gender, isOver30, extraversion as extr, agreeableness as agree, openness as open,neuroticism as neur, conscientiousness as cons,
count(*) as Misj, CAST(AVG(spoofing)AS DECIMAL(10,1)) as spoof
FROM results
WHERE isPhishing!=isJudgedAsPhishing
GROUP BY participantID;