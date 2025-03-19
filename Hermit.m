disp('');
disp('¡Metodo de Hermite!*');
disp('');
syms x 
format long %sirve para visualizar mas decimales
X=input('Ingrese los valores de x: ');
Y=input('Ingrese los valores de y: ');
Yprima=input('ingrese los valores de las derivadas: ');
%f=input('Ingrese la funcion: ');
%Y=subs(f,X);
aprox= input('Ingrese el valor de aproximacion: ');
n=length(X); %nodos del ejercicio
m=2*n; %si tengo 5 valores o nodos, hermite me los duplica seran 10
Z=zeros(m,1); %inicializar la matriz  de los duplicados en cero para la primera columna
D=zeros(m); %inicializar la matriz en cero de las diferencias divididas
%1ER for para llenar la primera columna de diferencias divididas
for i=1:n
    Z(2*i-1)=X(i); %posicion impar
    Z(2*i)=X(i); %posicion par
    D(2*i-1, 1) = Y(i); %posicion impar de la 1era columna le asigno el valor Y
    D(2*i, 1)   = Y(i);%posicion par de la 1era columna le asigno el valor Y
end
%2DO for para llenar la 2da columna para las derivadas
for i=1:n
    D(2*i,2)=Yprima(i); %la primera derivada empieza en la primerla fila y aparece en posiciones pares
end
%quiero llenar las filas impares donde no hay derivada
   for i=2:n
       fila=2*i-1; %2*2=4-1=3 ok me llena la fila impar
        D(fila,2)=(D(fila,1)-D(fila-1,1))/(Z(fila)-Z(fila-1));
   end

%3ER FOR para ir llenando el resto de las tablas de diferencias divididas
for j=3:m
    for i=j:m
        D(i,j)=(D(i,j-1)-D(i-1,j-1))/(Z(i)-Z(i-j+1));
    end
end
disp('***** Tabla de diferencias divididas para Hermite *****');
format compact
disp(D);
%Construir el polinomio de Hermite
pol=D(1,1);%la primera diagonal fija
for i=2:m
    producto=1;
    for j=1:(i-1)
        producto=producto*(x-Z(j));
    end
    pol=pol+D(i,i)*producto;
end
disp('El polinomio de Hermite es: ');
pol=(pol);
pretty(vpa(pol,15));
valorAprox=subs(pol,aprox);
%valorExacto=subs(f,aprox);
%error=abs(valorExacto-valorAprox);
fprintf('El valor aproximado es: %.15f \n',double(valorAprox));
%fprintf('El valor exacto es: %.15f \n',double(valorExacto));
%fprintf('El error es: %e \n',double(error));