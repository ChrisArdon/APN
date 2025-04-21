>> syms t
>> Q=9+4*(cos(0.4*t))^2
>> C=5*exp(-0.5*t)+2*exp(0.15*t)
>> M=Q*C
>> a=2;
>> b=8;
>> h1=b-a;
>> h2=h1/2;
>> h3=h2/2;
>> h4=h3/2;
>> h5=h4/2;
>> h6=h5/2;
>> h7=h6/2;
>> R=zeros(7);
>> R(1,1)=(h1/2)*(subs(M,a)+subs(M,b));
>> R(2,1)=(1/2)*(R(1,1)+h1*(subs(M,a+1*h2)));
>> R(3,1)=(1/2)*(R(2,1)+h2*(subs(M,a+1*h3)+subs(M,a+3*h3)));
>> R(4,1)=(1/2)*(R(3,1)+h3*(subs(M,a+1*h4)+subs(M,a+3*h4)+subs(M,a+5*h4)+subs(M,a+7*h4)));
>> R(5,1)=(1/2)*(R(4,1)+h4*(subs(M,a+1*h5)+subs(M,a+3*h5)+subs(M,a+5*h5)+subs(M,a+7*h5)+subs(M,a+9*h5)+subs(M,a+11*h5)+subs(M,a+13*h5)+subs(M,a+15*h5)));
>> R(6,1)=(1/2)*(R(5,1)+h5*(subs(M,a+1*h6)+subs(M,a+3*h6)+subs(M,a+5*h6)+subs(M,a+7*h6)+subs(M,a+9*h6)+subs(M,a+11*h6)+subs(M,a+13*h6)+subs(M,a+15*h6)+subs(M,a+17*h6)+subs(M,a+19*h6)+subs(M,a+21*h6)+subs(M,a+23*h6)+subs(M,a+25*h6)+subs(M,a+27*h6)+subs(M,a+29*h6)+subs(M,a+31*h6)));
>> R(7,1)=(1/2)*(R(6,1)+h6*(subs(M,a+1*h7)+subs(M,a+3*h7)+subs(M,a+5*h7)+subs(M,a+7*h7)+subs(M,a+9*h7)+subs(M,a+11*h7)+subs(M,a+13*h7)+subs(M,a+15*h7)+subs(M,a+17*h7)+subs(M,a+19*h7)+subs(M,a+21*h7)+subs(M,a+23*h7)+subs(M,a+25*h7)+subs(M,a+27*h7)+subs(M,a+29*h7)+subs(M,a+31*h7)++subs(M,a+33*h7)+subs(M,a+35*h7)+subs(M,a+37*h7)+subs(M,a+39*h7)+subs(M,a+41*h7)+subs(M,a+43*h7)+subs(M,a+45*h7)+subs(M,a+47*h7)+subs(M,a+49*h7)+subs(M,a+51*h7)+subs(M,a+53*h7)+subs(M,a+55*h7)+subs(M,a+57*h7)+subs(M,a+59*h7)+subs(M,a+61*h7)+subs(M,a+63*h7)));
>> for i=2:7
R(i,2)=(4*R(i,1)-R(i-1,1))/3;
end
>> for i=3:7
R(i,3)=(16*R(i,2)-R(i-1,2))/15;
end
>> for i=4:7
R(i,4)=(64*R(i,3)-R(i-1,3))/63;
end
>> for i=5:7
R(i,5)=(256*R(i,4)-R(i-1,4))/255;
end
>> for i=6:7
R(i,6)=(1024*R(i,5)-R(i-1,5))/1023;
end
>> for i=7:7
R(i,7)=(4096*R(i,6)-R(i-1,6))/4095;
end
