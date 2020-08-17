clc; clear all; close all;

n = 1:1:100;
n2 = 1:1:101;
n1 = 1:1:102;


K_p = 17.9947607768602;
K_i = 41.8923134387203;
K_d = -0.685067684451754;
N = 3.3394404818866;

ref = 1000.*n1./n1;
y_p = linspace(0,0,100);
y_i = linspace(0,0,100);
y_d = linspace(0,0,100);
yda = linspace(0,0,100);
fb = linspace(0,0,100);
out = linspace(0,0,100);
e = linspace(0,0,100);
T=0.0001;

for a= 2:99
    % Proportional
    y_p(a+1) = K_p * e(a);

    % Integral
    y_i(a+1) = (K_i *e(a)) + y_i(a);
    
    % Derivative
    y_d(a+1) = (((K_d *e(a))- yda(a-1)) * N);
    yda(a)= T*y_d(a+1) + yda(a-1);
    
    fb(a)=  y_p(a) + y_i(a)- y_d(a);
    
%     if out(a)>4095
%         fb(a) = 4095;
%     elseif out(a) < 0
%         fb(a) = 0;
%     else
%         fb(a) = out(a);
%     end
    e(a+1) = ref(a) - fb(a);
end
figure(1);
stem(n,y_p,'.');
xlabel('n1');
ylabel('y_p');
title('Proportional term');

figure(2);
stem(n,y_i,'.');
xlabel('n');
ylabel('y_i');
title('Integral term');

figure(3);
stem(n,y_d,'.');
xlabel('n');
ylabel('y_d');
title('Derivative term');
 
figure(5);
stem(n,e,'.');
xlabel('n');
ylabel('error');

figure(4)
stem(n, fb);
%xlim([0 100]);
%ylim([-1200 1200]);
hold on
stem(n1, ref, '.');
hold off

title('Error and Reference');
