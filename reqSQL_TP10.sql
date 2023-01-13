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
				
/*Ma version: j'ai la bonne réponse */	

SELECT DISTINCT m.Contenu  
FROM message m 
WHERE
   m.ID_Message IN (SELECT d.ID_Message   
         FROM destinataires d
         WHERE  d.Destinataire  IN (SELECT p.SSN 
                         FROM personne p 
                         WHERE p.Sexe="f" AND
                                   p.Age<30)
                   
                   
                   );

/*Celle du prof: */		
select distinct m.contenu
from message m
where m.id_message in (select d.id_message
                       from destinataires d, personne p
                       where d.destinataire = p.SSN
                         and p.sexe = 'F'
                         and p.age < 30);

SELECT DISTINCT p.Nom
FROM personne p 
WHERE 
   p.SSN IN (SELECT ea.SSN2 
         FROM estami ea
         WHERE     
              ea.SSN1="p1"     );

			  