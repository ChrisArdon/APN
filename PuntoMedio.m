syms t y
disp('Metodo de Punto Medio')
f= input('Ingrese la ecuacion diferencial dy/dt: ');
intervalo=input('Ingrese el intervalo [a,b]: ');
y0=input('Ingrese el valor inicial: ');
F=input('Ingrese la solucion exacta de la ecuacion diferencial: ');
h=input('Ingrese el valor de h: ');
a=intervalo(1); %Obteniendo el limite inferior del intervalo
b=intervalo(2); %Obteniendo el limite superior del intervalo
T=[a:h:b]; %Vector con los valores de t
n=length(T)-1; %Numero de subintervalos entre [a,b]
Y(1)=y0; %La primera posicion del arreglo de aproximaciones es el valor inicial
fprintf('ti\t\t\t\t\t || k1\t\t\t \\ k2\t\t\t || Yi\t\t\t\t\t || F(ti)\t\t\t\t || error\n');
fprintf('%.15f\t || %.9f\t || %.9f\t || %.15f\t || %.15f\t || %e\n', T(1),0,0,double(Y(1)),double(Y(1)),0);
for i=1:n
    k1=subs(f,{t,y},{T(i),Y(i)});
    k2=subs(f,{t,y},{T(i)+h/2, Y(i)+(h/2)*k1});
    Y(i+1)=Y(i)+h*k2;
    exacta=subs(F,T(i+1));
    error=abs(exacta-Y(i+1));
    fprintf('%.15f\t || %.9f\t || %.9f\t || %.15f\t || %.15f\t || %e\n',T(i+1),double(k1),double(k2),double(Y(i+1)),double(exacta),double(error));
end
fprintf('Valor aproximado y(%.15f)=%.15f \n',b,double(Y(n+1)));
fprintf('Valor exacto F(%.15f)=%.15f \n',b,double(exacta));
fprintf('Error= %e \n',double(error));
%para implicitas
%F=t*exp(2*y)+y^2-sin(t*y)-(pi/2)*exp(2);
%g=subs(F,t,T)
%for i=1:length(g)
    %exact(i)=double(solve(g(i)));
%end
%error=abs(exact-Y);