CREATE FUNCTION increment(age integer) RETURNS integer
AS 'select age + 1;'
LANGUAGE sql;
