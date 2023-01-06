/*LA CLAUSE HAVING*/

SELECT
	spj.ID_P
FROM
	spj	
GROUP BY spj.ID_P
HAVING SUM(spj.QTY)>1250

SELECT
	spj.ID_S, SUM(spj.QTY)
FROM
	spj

GROUP BY spj.ID_S
HAVING spj.ID_S > "s3"

SELECT
	spj.ID_J, SUM(spj.QTY)
FROM
	spj,j
WHERE 
	spj.ID_J=j.ID_J AND
	j.CITY="athens"
GROUP BY spj.ID_J
HAVING SUM(spj.QTY)>1000

SELECT
	spj.ID_P, spj.ID_J
FROM
	spj
 
GROUP BY spj.ID_P, spj.ID_J
HAVING AVG(spj.QTY) >320

/*Correction du prof, je ne l'ai pas trouvé:
	Ici, dans le group by, il a ajouté id_p pour appliquer une fonction là-dessus quand bien même 
	il n'apparaitrait pas dans le select. 
	 => S'il me demande la même pièce a au moins 3 projets != 
		dans ce cas-là, j'applique une fonction d'agrégation de ce type dans la clause HAVING:
				COUNT(DISTINCT SPJ.ID_J)>=3
*/
SELECT
	DISTINCT spj.ID_S
FROM
	spj
 
GROUP BY spj.ID_S, spj.ID_P
HAVING COUNT(DISTINCT spj.ID_J)>=3  

/*
Correction du prof:
*/
SELECT
	 spj.ID_P
FROM
	spj
 
GROUP BY spj.ID_P
HAVING COUNT(DISTINCT spj.ID_S)>=2

/*
Correction prof:
*/
select distinct id_p
from spj 
group by id_p, id_j 
having count(distinct id_s) >= 2; 

select 
	spj.ID_P, SUM(spj.QTY)
from
	spj
group by spj.ID_P
having COUNT( spj.DATE_DERNIERE_LIVRAISON)>3

