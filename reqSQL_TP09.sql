/*Requêtes imbriquées non corrélées:*/

/*Correction du prof: */

SELECT DISTINCT PNAME
FROM P
WHERE ID_P IN (	SELECT ID_P
				FROM SPJ
				WHERE QTY = 500 );
				
