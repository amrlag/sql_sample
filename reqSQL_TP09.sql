/*Requêtes imbriquées non corrélées:*/

/*Correction du prof: */

SELECT DISTINCT PNAME
FROM P
WHERE ID_P IN (	SELECT ID_P
				FROM SPJ
				WHERE QTY = 500 );

				
SELECT 
	DISTINCT p.PNAME
FROM
	p
WHERE
	p.ID_P IN     (SELECT  spj.ID_P
					FROM spj
					WHERE  spj.ID_S="s2");
					
SELECT 
	DISTINCT S.SNAME
FROM
	s
WHERE
	S.ID_S IN     (SELECT spj.ID_S
					FROM spj
					WHERE  spj.ID_P="p3");
					
/*Correction prof: */

SELECT DISTINCT SNAME
FROM S
WHERE ID_S IN (	SELECT ID_S
				FROM SPJ
				WHERE ID_P IN ( SELECT ID_P
								FROM P
								WHERE Color='Red' 
							  )
			  );
			  
/*Ma version: (fausse apparemment mais j'ai la bonne réponse)*/
SELECT
	s.ID_S, s.SNAME
FROM
	s
WHERE	
	s.ID_S IN (SELECT spj.ID_S
               FROM spj
               WHERE spj.ID_J="j4")
			   
/*Version du prof:*/

SELECT ID_S, SNAME
FROM S
WHERE ID_S IN (	SELECT SPJ.ID_S
				FROM SPJ, J
				WHERE SPJ.ID_J = J.ID_J
				  AND J.JNAME = 'Console' );
				  
/* Correction prof: */

	SELECT DISTINCT JNAME
FROM J
WHERE ID_J IN ( SELECT ID_J
				FROM SPJ
				GROUP BY ID_J
				HAVING SUM(QTY)>1000 );

/*Correction prof: */

SELECT DISTINCT pname
FROM p
WHERE color = ANY(
		SELECT color
		FROM p
		GROUP BY color
		HAVING count( * ) =1
);

/*Correction prof: */	

select DISTINCT pname
from p
where weight = ( select max(weight)
                 from p
               );


			   
				
				