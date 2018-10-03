-- EVENT  
use lportal1;
show events;

SET GLOBAL event_scheduler = ON;
SHOW PROCESSLIST;

SELECT @@event_scheduler;
 
SET GLOBAL contractUpdate = ON;
SET @@global.contractUpdate = ON;
SET GLOBAL lportal1.contractUpdate = 1;
SET @@global.lportal1.contractUpdate = 1;
 

 
DELIMITER |
CREATE EVENT contractUpdate1
ON SCHEDULE EVERY 1 day
STARTS CURRENT_TIMESTAMP
DO
BEGIN
SET SQL_SAFE_UPDATES = 0;
UPDATE lportal1.tblContract
SET IsActive = 0
WHERE ExpireDate < CURDATE();
END 
| DELIMITER ; 


SELECT dep.name FROM dep INNER JOIN emp ON dep.id = emp.depId
GROUP BY dep.name
HAVING COUNT(emp.id) >= 2;


SELECT name, MAX(SALARY) FROM emp
WHERE SALARY <> (SELECT MAX(SALARY) FROM emp);

SELECT name, MAX(SALARY) FROM emp WHERE SALARY NOT IN (SELECT MAX(SALARY) FROM emp);

select * from emp;

SELECT * FROM emp e1 WHERE (SELECT COUNT(DISTINCT salary) FROM emp e2 WHERE e2.salary > e1.salary)  = 3;

SELECT * FROM emp ORDER BY salary DESC LIMIT 1,1;

SELECT * FROM `emp` ORDER BY `salary` DESC LIMIT 1 OFFSET 1;


http://javarevisited.blogspot.com/2016/01/4-ways-to-find-nth-highest-salary-in.html#axzz58SbQXCwk