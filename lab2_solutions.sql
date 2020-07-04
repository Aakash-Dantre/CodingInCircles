select Fname , Minit , Lname from EMPLOYEE where Salary >(select avg(Salary) from EMPLOYEE);
SELECT DISTINCT S.Fname, S.Minit, S.Lname from EMPLOYEE as E, EMPLOYEE as S where S.Ssn not in (select Essn from DEPENDENT,EMPLOYEE where EMPLOYEE.Ssn = DEPENDENT.Essn group by DEPENDENT.Essn) and E.Super_ssn = S.Ssn;
select E.Fname,E.Minit,E.Lname from EMPLOYEE as E, WORKS_ON as W where E.Ssn = W.Essn and Hours is NOt NULL group by Ssn order by E.Salary/sum(W.Hours) DESC;
select avg(tp), DEPARTMENT.Dname   from (select E.Fname,E.Minit,E.Lname,E.Ssn,E.Salary/sum(W.Hours) as tp,E.Dno from EMPLOYEE as E, WORKS_ON as W where E.Ssn = W.Essn and Hours is NOt NULL group by Ssn) as THROUGHPUT,DEPARTMENT where DEPARTMENT.Dnumber = THROUGHPUT.Dno group by DEPARTMENT.Dnumber order by avg(tp) desc;
select Pname, count(*) as employee_count from EMPLOYEE, WORKS_ON, PROJECT where EMPLOYEE.Ssn = WORKS_ON.Essn and WORKS_ON.Pno = PROJECT.Pnumber group by Pname order by employee_count DESC;
select * from (select Dnumber, count(*) as emp_count from EMPLOYEE, DEPARTMENT where EMPLOYEE.Dno = DEPARTMENT.Dnumber group by Dnumber) as D,EMPLOYEE where D.emp_count>3 and EMPLOYEE.Dno = D.Dnumber and EMPLOYEE.Salary > 37000;
select ssn,Fname,Minit,Lname from EMPLOYEE where ssn in (select distinct Essn from WORKS_ON where Pno>=3);
SELECT COUNT(*) AS Student_no, AVG(S.CGPA) FROM STUDENT as S,TAKES as T,COURSE as C WHERE C.CName="information technology" AND C.CNO=T.CNO AND T.RollNo=S.RollNumber;
SELECT F.Name , F.FID FROM FACULTY as F WHERE  F.FID NOT IN (SELECT Head FROM RESEARCH_CENTER);
SELECT C.CName FROM COURSE as C WHERE C.CNO NOT IN (SELECT DISTINCT CNO FROM TAKES WHERE Grade='A');