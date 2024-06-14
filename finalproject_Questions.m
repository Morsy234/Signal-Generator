clc
%Question 1
fs=1000;
figure;
t1=linspace(-2,-1,1*fs);
x1=zeros(size(t1));
t2=linspace(-1,3,4*fs);
x2=ones(size(t2));
t3=linspace(3,4,1*fs);
x3=zeros(size(t3));

Tt1=[t1 t2 t3];
u=[x1 x2 x3];

texp=linspace(-2,4,6*fs);
e=exp((-1*abs(texp))/5);
ft=e.*u;

subplot(2,2,1);
plot(Tt1,ft);
ylim([0,2]);
xlim([-3,6]);
title('y(t)');


y1=3*ft;
subplot(2,2,2);
plot(Tt1,y1);
ylim([0,4]);
xlim([-3,6]);
title('y1(t)');

subplot(2,2,3);
plot((Tt1-2),ft);
ylim([0,2]);
xlim([-5,3]);
title('y2(t)');

subplot(2,2,4);
Tt1=Tt1-4;
Tt1=Tt1/2;
Tt1=fliplr(-Tt1);
y=fliplr(ft);
plot(Tt1,y);
ylim([0,2]);
xlim([-5,5]);
title('y3(t)');
%%
%---------------------------------------------------------------
%Question 2
%a
FS=5;
TS=1/FS;
t=linspace(-100000,100000,200000*FS);
x=(10.^(-3)).*t;
m=(sin(x)./x).^2;
M=TS*fftshift(fft(m));
l=length(m);
freq=(-l/2:l/2-1)*(FS/l);
w=2*pi*freq;
figure;
plot(t,m);
title('sinc(0.001t).^2');
figure;
plot(w,abs(M));
xlim([-0.004,0.004]);
title('M Fourier Transform');


r=m.*cos(2.*pi.*(10.^5).*t);
R=TS*fftshift(fft(r));
ln=length(r);
freq2=(-ln/2:ln/2-1)*(FS/ln);
w2=2*pi*freq2;
figure;
plot(t,r);
title('m*cos(2.*pi.*(10.^5).*t)');
figure;
plot(w,abs(R));
ylim([0,1600])
title('R Fourier Transform');



%%
%---------------------------------------------------------------
%Question 3
 figure;
 nneg= -10 : -1;
 npos= 1 : 10;
 Dnneg=(0.3045./((2*1j*nneg)+1));
 Dnpos=(0.3045./((2*1j*npos)+1));
 D0=0.3045;
 n=[nneg, 0, npos];
 Dn=[Dnneg, D0, Dnpos];
 stem(n, abs(Dn));
 title('Magnitude Spectrum');
 figure;
 stem(n,angle(Dn));
 title('Phase Spectrum');

