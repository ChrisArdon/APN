syms t y
disp('Metodo de Runge Kutta de cuarto orden');
f = input('Dy/dt= ');
intervalo=input('Ingrese el intervalo [a,b]: ');
y0=input('Ingrese el valor inicial: ');
F=input('Ingrese la solucion exacta de la ecuacion diferencial: ');
h=input('Ingrese el valor de h: ');
a=intervalo(1); %Obteniendo el limite inferior del intervalo
b=intervalo(2); %Obteniendo el limite superior del intervalo
T=[a:h:b]; %Vector con los valores de t
n=length(T)-1; %Numero de subintervalos entre [a,b]
Y(1)=y0; %La primera posicion del arreglo de aproximaciones es el valor inicial
fprintf('i=%d\n',1);
fprintf('t=%.15f\n',T(1));
fprintf('Y(t)=%.15f\n',Y(1));
exacta=double(subs(F,t,T(1)));
fprintf('F(t)=%.15f\n',exacta);
fprintf('Error=%.15f\n',double(abs(exacta-Y(1))));
for i=1:n
   fprintf('-----------------------------------\n');
   fprintf('i=%d\n',i+1);
   fprintf('t=%.15f\n',T(i+1));
   k1=double(subs(f,{t,y},{T(i),Y(i)}));
   k2=double(subs(f,{t,y},{T(i)+h/2,Y(i)+(k1*h)/2}));
   k3=double(subs(f,{t,y},{T(i)+h/2,Y(i)+(k2*h)/2}));
   k4=double(subs(f,{t,y},{T(i)+h,Y(i)+k3*h}));
   Y(i+1)=double(Y(i)+(h/6)*(k1+2*k2+2*k3+k4));
   fprintf('Y(t)=%.15f\n',Y(i+1));
   exacta=double(subs(F,t,T(i+1)));
   fprintf('F(t)=%.15f\n',exacta);
   fprintf('Error=%.15f\n',double(abs(exacta-Y(i+1))));
end
