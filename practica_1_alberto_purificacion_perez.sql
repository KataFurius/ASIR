--Pograma 1--

clear buff;
set serveroutput on; 
set ver off;
set echo off
set feedback off;

DECLARE

numero INTEGER;

BEGIN

	FOR numero IN REVERSE 10 .. 100 LOOP

		dbms_output.put_line(numero);

	END LOOP;

END;
/

--Programa 2--

clear buff;
set serveroutput on; 
set ver off;
set echo off
set feedback off;

DECLARE

media_salarial empleado.salario%type;
total_empleados empleado.empleado_id%type;

BEGIN

SELECT avg(salario) INTO media_salarial FROM empleado;
SELECT count(empleado_id) INTO total_empleados FROM empleado;

dbms_output.put_line('El numero de empleados es ' ||total_empleados|| ' y la media de los salarios es ' ||media_salarial);

END;
/

--Programa 2--

clear buff;
set serveroutput on; 
set ver off;
set echo off
set feedback off;

DECLARE

media_salarial empleado.salario%type;

BEGIN

SELECT avg(salario) INTO media_salarial FROM empleado;

UPDATE empleado set salario = media_salarial where salario < media_salarial;

COMMIT;

dbms_output.put_line('La media salarial es ' ||media_salarial);
dbms_output.put_line('Se ha actualizado el salario a los trabajadores que cobrasen menos');

END;
/


--Programa 3--

clear buff;
set serveroutput on; 
set ver off;
set echo off
set feedback off;

DECLARE

media_salarial_670 empleado.salario%type;
media_salarial_667 empleado.salario%type;

BEGIN

SELECT avg(salario) INTO media_salarial_670 from empleado where trabajo_id=670;
select avg(salario) into media_salarial_667 from empleado where trabajo_id=667;

if media_salarial_667 < media_salarial_670 then
	update empleado set salario = salario+75 where trabajo_id=667;
	commit;
	dbms_output.put_line('La media del dpto. 667 es ' ||media_salarial_667|| ' y las del dpto. 670 es ' ||media_salarial_670);
	dbms_output.put_line('Por tanto, se ha sumado 75 a todos los salarios.');
else
	dbms_output.put_line('La media del dpto. 667 es ' ||media_salarial_667|| ' y las del dpto. 670 es ' ||media_salarial_670);
	dbms_output.put_line('Por tanto, no se ha sumado 75 porque la media no es menor.');
end if;
	
END;
/

--Programa 4--

clear buff;
set serveroutput on; 
set ver off;
set echo off
set feedback off;

DECLARE

total_empleados real;
empleados_dep real;
empleados_suma real := 0;
i integer;

BEGIN

select count(empleado_id) into total_empleados from empleado;

for i in 667 .. 672 loop
	select count(empleado_id) into empleados_dep from empleado where trabajo_id=i;
	empleados_suma := empleados_suma + empleados_dep;
end loop;

if total_empleados = empleados_suma then
	dbms_output.put_line('El total de empleados es ' ||total_empleados|| ' y la suma de los departamentos es ' ||empleados_suma);
	dbms_output.put_line('Por tanto, el resultado es el mismo.');
else

	dbms_output.put_line('El total de empleados es ' ||total_empleados|| ' y la suma de los departamentos es ' ||empleados_suma);
	dbms_output.put_line('Por tanto, el resultado es diferente.');
end if;

END;
/	