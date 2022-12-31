/*Récapitulatif TP01->TP03*/

SELECT
	DISTINCT p.Nom
FROM
	personne p
WHERE
	p.Age>30
	
SELECT
	DISTINCT p.Nom
FROM
	personne p
WHERE
	p.Sexe="f"	
	
SELECT
	m.ID_Message
FROM
	message m 
WHERE
	m.Expediteur="p1"

SELECT
	p.Nom
FROM
	personne p 
WHERE
	p.Sexe="m"
ORDER BY p.Nom 
		
SELECT
	DISTINCT m.Contenu
FROM
	 message m 
INNER JOIN personne p ON p.SSN=m.Expediteur
WHERE
	p.Sexe="m"

SELECT
	DISTINCT p.Nom
FROM
	 personne p
INNER JOIN destinataires d ON d.Destinataire=p.SSN
WHERE
	d.ID_Message="m4"

SELECT
	DISTINCT m.Contenu
FROM
	 message m 
INNER JOIN destinataires d ON d.ID_Message=m.ID_Message
INNER JOIN personne p ON p.SSN=d.Destinataire
WHERE
	p.Sexe="f" AND
    p.Age<30

SELECT
	DISTINCT p.Nom AS "AMIS DE P1:"
FROM
	 personne p 
INNER JOIN estami ea ON ea.SSN2=p.SSN
WHERE
	ea.SSN1="p1"	
	
SELECT
	DISTINCT m.Contenu
FROM
	message m 
INNER JOIN personne p ON m.Expediteur=p.SSN
WHERE
	p.Nom LIKE "%e%"
	
SELECT
	DISTINCT m.Date_Expedition
FROM
	destinataires d 
INNER JOIN personne p ON p.SSN=d.Destinataire
INNER JOIN message m ON m.Id_message=d.id_message
WHERE
	p.Sexe="f" AND
    p.Nom LIKE "m%" 
/*Ici, c'est important d'ajouter % après le a sinon il n'ira chercher uniquement des mots de 2 lettres
qui termine par un a*/	
SELECT
	DISTINCT m.Contenu
FROM
	message m 
INNER JOIN personne p ON p.SSN=m.Expediteur
WHERE
	p.Sexe="m" AND
    p.Nom LIKE "_a%"
	
SELECT
	DISTINCT p.Nom
FROM
	personne p, destinataires d, message m
WHERE
	p.SSN=m.Expediteur AND
    d.ID_Message=d.ID_Message AND
    p.Age<18

/*Un exercice en plus pour faire le suivant qui est un peu complexe: 
Ici, nous cherchons à avoir les amis de P1:*/

SELECT
	DISTINCT ea1.SSN2
FROM
	estami ea1, personne p
WHERE
	ea1.SSN1=p.SSN	AND
    ea1.SSN1="p1"
	
/*Mnt, on veut les amis des amis de P1: */

SELECT
	DISTINCT ea2.SSN2
FROM
	estami ea1, estami ea2
WHERE
    ea1.SSN2=ea2.SSN1 AND
    ea1.SSN1="p1"
/*requête incorrecte car je n'ai pas fait de jointure avec la table personne. 
Ici, elle est orpheline et ce n'est pas bon.*/	
SELECT
	DISTINCT ea2.SSN2
FROM
	estami ea1, estami ea2, personne p
WHERE
    ea1.SSN2=ea2.SSN1 AND
    p.Nom="xavier"
/*solution du prof: */

SELECT
	DISTINCT ea2.SSN2
FROM
	estami ea1, estami ea2, personne p
WHERE
    ea1.SSN2=ea2.SSN1 AND
    p.SSN=ea1.SSN1 AND
    p.Nom="xavier"

	



	

	

