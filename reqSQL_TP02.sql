SELECT
	spj.ID_P
FROM
	spj
INNER JOIN p ON p.ID_P=spj.ID_P
WHERE
	p.COLOR="red"