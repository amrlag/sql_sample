/*Requêtes imbriquées non corrélées*/

SELECT DISTINCT m.Contenu
FROM message m
WHERE
	m.Expediteur IN (SELECT p.SSN
                       FROM personne p
                       WHERE p.Sexe="m");

/*Correction prof: 
	Attetion aux mots utilisés ! Il m'a eu j'ai confondu envoyé et reçu donc je travaillais sur LAG
	mauvaise table.
	Ma version:
		SELECT  DISTINCT p.Nom
FROM personne p
WHERE
   p.SSN IN (SELECT m.Expediteur
         FROM message m 
         WHERE m.ID_Message="m4" );
*/	

select distinct p.nom
from personne p
where p.SSN IN (select d.destinataire
                from destinataires d
                where d.id_message='M4');	