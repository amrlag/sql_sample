SELECT SUM(baseForce) AS "Points de force du jeu", SUM(baseAgi) AS "Points d'agilité du jeu", 
SUM(baseIntel) AS "Points d'intelligence du jeu" 
FROM classe;


SELECT MIN(levelMin), MAX(levelMin) 
FROM arme


SELECT nom, baseForce+baseAgi+baseIntel AS "Points de caractéristiques"
from classe

SELECT nom, concat("F: ", baseForce, " - ", "A: ", baseAgi, " - ", "I: ", baseIntel) AS "Classe"
FROM classe;

/*ici, je concatène et fais deux substrings*/
SELECT CONCAT(SUBSTRING(classe.nom,1,5)," - ", SUBSTRING(classe.description,1,20)) AS
"CLASSE: "
	
FROM classe

SELECT
	*
FROM
	arme
	WHERE
    	degat<25
		
SELECT
	nom, surnom
FROM
	personnage
	WHERE
    	level=10
		
SELECT
	*
FROM
	typearme
	WHERE
    	estDistance=1
		
SELECT
	*
FROM
	personnage
WHERE
	idPersonnage <=3 AND
    level =10
	
SELECT
	*
FROM
	arme
WHERE
	(idTypeArme=1 OR
    idTypeArme=2) AND
    (degat>=25 AND
     degat<=40)
	 
SELECT
	*
FROM
	arme
WHERE
	(idTypeArme=1 OR
    idTypeArme=2) AND
    (degat BETWEEN
    25 AND
    40)
	
SELECT
	*
FROM
	personnage
WHERE
	level !=8 OR
    level>7 OR
    level<6
	
SELECT
	COUNT(*) AS "Nb Perso <10"
FROM
	personnage
WHERE
	level<10
	
SELECT
	AVG(degat)
FROM
	arme
WHERE
	levelMin BETWEEN
    3 AND
    7
	

SELECT
	*
FROM
	arme
WHERE
	nom LIKE "%bois%"
	
SELECT
	*
FROM
	personnage
WHERE
	idPersonnage IN(2,3,4,6) AND
    level=10
	
SELECT
	*
FROM
	personnage
LIMIT 2

SELECT
	*
FROM
	personnage
LIMIT 5
OFFSET 1

SELECT
	*
FROM
	arme
INNER JOIN typearme ON arme.idTypeArme=typearme.idTypeArme

SELECT
	arme.nom, arme.levelMin, arme.degat, typearme.libelle, typearme.estDistance
FROM
	arme
INNER JOIN typearme ON arme.idTypeArme=typearme.idTypeArme

SELECT
	personnage.nom, classe.nom
FROM
	personnage
INNER JOIN classe ON classe.idClasse= personnage.idClasse


/*ici, on voit bien que l'égalité n'est pas la même car la clé est présente dans deux tablles. Voir les liaisons entre les tables*/
SELECT
	p.nom, a.nom
FROM
	personnage p
INNER JOIN arme a ON a.idTypeArme= p.idArmeUtilise

/* double jointure*/
SELECT
	p.nom, a.nom, a.levelMin, a.degat, t.libelle AS "TYPE ARME", t.estDistance
FROM
	personnage p
INNER JOIN typearme t ON t.idTypeArme=p.idArmeUtilise
INNER JOIN arme a ON a.idArme=p.idArmeUtilise

/*Jointures et filtres*/

SELECT
	p.nom, p.level, a.nom, p.level
FROM
	arme a
INNER JOIN dispose d ON d.idArme=a.idArme
INNER JOIN personnage p ON p.idArmeUtilise=a.idArme

SELECT
	*
FROM
	arme
INNER JOIN typearme ta ON ta.idTypeArme=arme.idTypeArme 
WHERE
	ta.estDistance=0
	
SELECT
	a.nom AS "ARME UTILISEE", p.nom AS "PERSONNAGE", ta.libelle AS "TYPE ARME"
FROM
	personnage p
INNER JOIN classe c ON p.idClasse=c.idClasse
INNER JOIN arme a ON a.idArme=p.idArmeUtilise
INNER JOIN typearme ta ON ta.idTypeArme=a.idTypeArme
WHERE
	c.nom="guerrier"
	
SELECT
	*
FROM
	personnage p 
INNER JOIN dispose d ON d.idPersonnage=p.idPersonnage
INNER JOIN arme a ON a.idArme=d.idArme
INNER JOIN typearme ta ON ta.idTypeArme=a.idTypeArme
WHERE
	p.level=10
ORDER BY p.idPersonnage;

SELECT
	AVG(a.degat)
FROM
	 arme a 
INNER JOIN typearme ta ON ta.idTypeArme=a.idTypeArme
WHERE
	ta.estDistance=1
	
SELECT
	DISTINCT p.nom AS "NOM PERSONNAGE"
FROM
	 personnage p 
INNER JOIN dispose d ON d.idPersonnage=p.idPersonnage
INNER JOIN arme a ON a.idArme=d.idArme
INNER JOIN typearme ta ON ta.idTypeArme=a.idTypeArme
WHERE
	ta.libelle LIKE "a%"	
ORDER BY p.nom

/*LES JOINTURES EXTERNES
je passe ce module, je vais faire del'auto-jointure
*/


