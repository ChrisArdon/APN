syms x
disp('Cuadratura Gaussiana');
f=input('ingrese la funcion a integrar f: ');
p=input('ingrese el polinomio: ');
n=input('ingrese el grado: ');
X=double(solve(p));
X
Y=double(subs(f,X));
h=diff(p);
for i=1:n
    d=int(p/(x-X(i)));
    m=subs(d,1)-subs(d,-1);
    W(i)=double(norm((1/(subs(h,X(i))))*m));
end
double(W)
integral=0;
for i=1:n
    integral=integral+W(i)*Y(i);
end
fprintf('\nEl valor aproximado es: %.15f\n',double(integral));
