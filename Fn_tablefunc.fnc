create or replace function Fn_tablefunc return number is

--type s_emp is table of emp.emp_id%type;
l_emp e_emp;

begin
---update emp salary
  update emp
  set sal = sal + 100
  where dept_id =10
  returning emp_id bulk collect  into l_emp;

  for i in l_emp.first..l_emp.last loop
    dbms_output.put_line(l_emp(i));
  
  end loop;
  return 0;
end Fn_tablefunc;
/
