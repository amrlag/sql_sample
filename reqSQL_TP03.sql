/*auto-jointure? EXPRESSIONS? STRINGS*/

SELECT
	pname, weight*454
FROM
	p
	
SELECT
	*
FROM
	s
WHERE
	sname LIKE "a%"

/*Ici, je cherche tous les noms qui ont à la 3E position un "a" puis n'importe quoi*/	
SELECT
	*
FROM
	s
WHERE
	sname LIKE "__a%"
	
SELECT
	*
FROM
	spj
WHERE
	year(date_derniere_livraison)>2017
	
SELECT
	tp1.ID_P, tp2.ID_P
FROM
	p tp1
INNER JOIN p tp2 ON tp1.ID_P=tp2.ID_P
WHERE
	tp1.COLOR=tp2.COLOR
	
SELECT
	DISTINCT p1.PNAME
FROM
	p p1
WHERE
	p1.PNAME LIKE "%c%"
ORDER BY p1.PNAME

SELECT
	p.PNAME
FROM
	p
WHERE
	p.WEIGHT*454<6000
	
SELECT
	j.JNAME
FROM
	j
WHERE
	j.JNAME LIKE "%i%"
	
SELECT
	s.SNAME
FROM
	s
WHERE
	s.SNAME LIKE "a%" OR
    s.SNAME LIKE "c%"
	
SELECT
	DISTINCT s.SNAME
FROM
	s
INNER JOIN spj ON s.ID_S=spj.ID_S
WHERE
	YEAR(spj.DATE_DERNIERE_LIVRAISON) BETWEEN
    2015 AND
    2019
	
SELECT
	p.ID_P,s.ID_S, j.ID_J
FROM
	s,p,j
WHERE
	s.CITY <>p.CITY OR
    p.CITY<>j.CITY
	
SELECT
	DISTINCT spj1.ID_P, spj2.ID_P, spj1.ID_S
FROM
	spj spj1, spj spj2
WHERE
	spj1.ID_S=spj2.ID_S AND
    spj1.ID_P<spj2.ID_P
	
SELECT
	 p.ID_P,s.ID_S, j.ID_J
FROM
	s,p,j
WHERE
	s.CITY <>p.CITY AND
    p.CITY<>j.CITY AND
    j.CITY<>s.CITY
	
SELECT
	DISTINCT spj1.ID_S
FROM
	spj spj1, spj spj2

WHERE
	spj1.ID_S=spj2.ID_S AND
	spj1.ID_P=spj2.ID_P AND
    spj1.ID_J <> spj2.ID_J
ORDER BY spj1.ID_S	
	