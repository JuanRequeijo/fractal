function flake

%%% From: http://hypo.ge.ch/www/math/html/root.html
%%% Modified by Didier Gonze
%%% Created: 1/1/2008
%%% Updated: 1/1/2008

clc;
clear;

global x y

a=[0;0];
b=[1;0];

e=[b(1)*cos(pi/3)-b(2)*sin(pi/3)
   b(1)*sin(pi/3)+b(2)*cos(pi/3)];

f=[b(1)*cos(-pi/3)-b(2)*sin(-pi/3)
   b(1)*sin(-pi/3)+b(2)*cos(-pi/3)];

n=4;     % number of iterations

x=[];y=[];

koch(a,b,n);
koch(b,f,n);
koch(f,a,n);

h=fill(x,y,'c');
axis equal
axis off
set(gcf,'color','b')
%set(gcf,'doubleBuffer','on')
figure(gcf)


%%% To make the flake rotate:

% while 1
%     rotate(h,[90 0],1,[0 0 0])
%     drawnow
% end



% ============================================================
% Function koch
% ============================================================

function koch(a,b,n)

global x y

if n==0
    %     plot([a(1) b(1)],[a(2) b(2)])
    x=[x a(1) b(1)];
    y=[y a(2) b(2)];
else
    c=a+(b-a)/3;
    d=a+2*(b-a)/3;
    e=[(d(1)-c(1))*cos(pi/3)-(d(2)-c(2))*sin(pi/3)+c(1)
        (d(1)-c(1))*sin(pi/3)+(d(2)-c(2))*cos(pi/3)+c(2)];
    koch(a,c,n-1)
    koch(c,e,n-1)
    koch(e,d,n-1)
    koch(d,b,n-1)
end



