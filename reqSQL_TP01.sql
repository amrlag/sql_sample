SELECT
	sname
FROM
	s
	
SELECT
	DISTINCT sname
FROM
	s
	
SELECT
	sname
FROM
	s
WHERE
	STATUS=20
	
SELECT
	*
FROM
	p
WHERE
	(color="red" OR color="green") AND
    p.WEIGHT>15
	
SELECT
	id_p, qty
FROM
	spj
WHERE
	qty BETWEEN 500 AND
    700
	
/*Ici, c'est bizarre on met OR pas AND*/	
SELECT
	id_p, qty
FROM
	spj
WHERE
	qty <500 OR
    qty>700
	
SELECT
	p.PNAME, p.COLOR
FROM
	p
WHERE
	p.pname="Bolt" OR
    p.COLOR="Cam"

SELECT
	*
FROM
	s

SELECT
	s.SNAME AS "NOM: ", s.CITY AS "VILLE: "
FROM
	s

SELECT
	s.SNAME
FROM
	s
WHERE
	s.CITY="London" OR
    s.CITY="Paris"

SELECT
	s.SNAME
FROM
	s
WHERE
	s.STATUS<25 AND
    s.CITY="Paris"
	
/*Dès qu'il demande n'est pas dans l'interval d'office on met OR pas AND, j'ai saisi*/ 
SELECT
	s.SNAME
FROM
	s
WHERE
	s.STATUS<15 OR
    s.STATUS>25

SELECT
	DISTINCT p.PNAME
FROM
	p
WHERE
	p.COLOR="red" OR
    p.COLOR="blue"
	