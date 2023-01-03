/*AGREGATION & PARTIONNEMENT*/

/*EXEMPLES D UTILISATION*/

SELECT COUNT(*)
FROM
	spj

SELECT AVG(spj.QTY)
FROM
	spj

SELECT MIN(spj.QTY), MAX(spj.QTY)
FROM
	spj
	
SELECT SUM(spj.QTY)
FROM
	spj
	
SELECT COUNT(DISTINCT spj.ID_S)
FROM
	spj
	
SELECT 
	SUM(spj.QTY), spj.ID_S
FROM
	spj
GROUP BY spj.ID_S

SELECT 
	spj.ID_S, spj.ID_P, SUM(spj.QTY)
FROM
	spj
GROUP BY spj.ID_S, spj.ID_P

/*EXPLIQUEZ SI LES REQUêTES SONT LEGALES OU NON: */

SELECT 
	p.ID_P, SUM(p.WEIGHT)
FROM
	p 
GROUP BY color

/*
=> La requête est fausse:
	La requête est illégale car il y a un champ (id_p) dans la clause SELECT
	qui n'est pas dans la clause GROUP BY.
	Pour corriger cela, on peut grouper par id_p:
		SELECT id_p, SUM(weight) FROM p GROUP BY id_p;
*/

SELECT 
	spj.ID_S, SUM(qty)
FROM
	spj 

/*
=> La requête est fausse: 
	Vu qu'ID_P est la clé primaire de P, nous sommes en train de construire 
	des groupes qui contiennent tous un seul produit.
	Solution: GROUPER PAR COULEUR
		SELECT color, SUM(weight) FROM p GROUP BY color;
*/
	
SELECT
	P.ID_P, p.WEIGHT
FROM
	p
GROUP BY p.ID_P

/*
	=> Cette requête est incorrecte car les deux champs du select ne sont pas présent dans le group by
		Solution:
			SELECT id_p, weight FROM p GROUP BY id_p, weight;	
*/


/*EXERCICES*/

SELECT
	COUNT(*), spj.QTY
FROM
	spj
GROUP BY spj.QTY

SELECT
	COUNT(*), spj.ID_S
FROM
	spj
GROUP BY spj.ID_S

SELECT
	j.JNAME AS "NOM DU PROJET:", SUM(spj.QTY) AS "QUANTITE:"
FROM
	spj, j
WHERE
	spj.ID_J=j.ID_J
GROUP BY j.JNAME
ORDER BY j.JNAME

SELECT
	spj.ID_S, spj.ID_P, spj.ID_J, p.WEIGHT*spj.QTY AS "POIDS: "
FROM
	p, spj
WHERE
	spj.ID_P=p.ID_P;
/*
Attention, ce qu'il y a en-dessous, malgré que cela soit juste est incorrect car j'ai commis un OVERKILL 
de table: en effet, la table j est inutile.
*/	
SELECT
	SUM(p.WEIGHT*spj.QTY), spj.ID_J
FROM
	j, p, spj
WHERE
	spj.ID_J=j.ID_J AND
    spj.ID_P=p.ID_P
GROUP BY spj.ID_J     
/*VOICI LA CORRECTION: 
	Je ne savais pas qu'on pouvait accéder à une autre clé étrangère sans faire un lien direct à celle-ci.
*/

SELECT  id_j, SUM(qty * weight) 
FROM spj, p 
WHERE spj.id_p=p.id_p 
GROUP BY id_j;

SELECT
	MAX(p.WEIGHT*spj.QTY) AS "POIDS LIVRAISON LA PLUS LOURDE"
FROM
	p, spj
WHERE
	spj.ID_P=p.ID_P
	
/*De nouveau, j'ai commis un double overkills ici: 
Encore une fois, pas de DISTINCT dans SUM: je ne sais pas pourquoi j'ai cette drôle idée de faire ça.
Pourtant j'ai la même réponse que lui mais bon double overkills de tables cela ne pardonne pas.*/

SELECT
	spj.ID_J, spj.ID_P, SUM(DISTINCT spj.QTY) AS "TOTAL"
FROM
	p, j, spj
WHERE
	p.ID_P=spj.ID_P AND
    j.ID_J=spj.ID_J
GROUP BY spj.ID_J, spj.ID_P

/*Voici la correction: */

SELECT id_j, id_p, SUM(qty) total 
FROM spj 
GROUP BY id_p, id_j;	
	

