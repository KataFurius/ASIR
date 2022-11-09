--Ejercicio 1--
clear buff;
set serveroutput on; 
set ver off;
set echo off
set feedback off;

declare

numero number(4):=&numero;
entero number(4);

begin

if numero > 0 then
	dbms_output.put_line ('El valor absoluto del numero ' ||numero|| ' es ' ||numero);
else
	entero := -1 * numero;
	dbms_output.put_line ('El valor absoluto del numero ' ||numero|| ' es ' ||entero);
end if;
end;
/


--Ejercicio 2--

clear buff;
set serveroutput on; 
set ver off;
set echo off
set feedback off;

declare

frase varchar(100) := 'Tarzan de los monos';
letra varchar(1);

begin

for i in 1 .. length(frase) loop
	letra := substr(frase, i, 1);
	dbms_output.put_line(letra);
end loop;

end;
/

--Ejercicio 3--
clear buff;
set serveroutput on; 
set ver off;
set echo off
set feedback off;

declare

numero real :=&numero;
palabra varchar(20) :='&palabra';

begin

for i in 1 .. numero loop
	dbms_output.put_line(palabra);
end loop;

end;
/

--Ejercicio 4--
clear buff;
set serveroutput on; 
set ver off;
set echo off
set feedback off;

declare

fecha varchar(50);

begin

select systimestamp into fecha from dual;

dbms_output.put_line(fecha);

end;
/

--Ejercicio 5--
clear buff;
set serveroutput on; 
set ver off;
set echo off
set feedback off;

declare

emple empleado.nombre_de_pila%type;
job trabajo.funcion%type;
sueldo empleado.salario%type;
trabajo_numero empleado.trabajo_id%type;

begin

emple :='&empleado';
job :='&trabajo';
sueldo :=&salario;

select trabajo_id into trabajo_numero from empleado where nombre_de_pila = emple;

UPDATE empleado set salario = sueldo where nombre_de_pila = emple;
update trabajo set funcion = job where trabajo_id = trabajo_numero;

dbms_output.put_line('El salario y la funcion se han actualizado correctamente');

exception
	when no_data_found then
	dbms_output.put_line('El empleado ' ||emple|| ' no existe');

end;
/

--Ejercicio 6--
clear buff;
set serveroutput on; 
set ver off;
set echo off
set feedback off;


create or replace procedure actualizar_sueldo (apell empleado.apellido%type, 
sueldo empleado.salario%type)

IS

departamento empleado.departamento_id%type;

begin

select departamento_id into departamento from empleado where apellido = apell;

if departamento = 20 then
	dbms_output.put_line('El cambio no se permite porque el dpto. es ' ||departamento);
else
	update empleado set salario = sueldo where apellido = apell;
	commit;
	dbms_output.put_line('Se ha actualizado el sueldo a ' ||sueldo|| ' euros');
end if;

end actualizar_sueldo;
/

declare

apell empleado.apellido%type;
sueldo empleado.salario%type;

begin

apell :='&apellido';
sueldo :=&sueldo;

actualizar_sueldo (apell, sueldo);

end;
/

--Ejercicio 7--
clear buff;
set serveroutput on; 
set ver off;
set echo off
set feedback off;


create or replace procedure actualizar_sueldo (apell empleado.apellido%type, 
sueldo empleado.salario%type)

IS

departamento empleado.departamento_id%type;

begin

select departamento_id into departamento from empleado where apellido = apell;

if departamento = 20 then
	dbms_output.put_line('El cambio no se permite porque el dpto. es ' ||departamento);
else
	update empleado set salario = sueldo where apellido = apell;
	commit;
	dbms_output.put_line('Se ha actualizado el sueldo a ' ||sueldo|| ' euros');
end if;

exception
	when no_data_found then
	dbms_output.put_line('El apellido ' ||apell|| ' no existe');

end actualizar_sueldo;
/

declare

apell empleado.apellido%type;
sueldo empleado.salario%type;

begin

apell :='&apellido';
sueldo :=&sueldo;

actualizar_sueldo (apell, sueldo);

end;
/
