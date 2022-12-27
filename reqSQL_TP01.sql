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
		