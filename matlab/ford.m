function ford

%%% Ford circles according the Farey series of order N
%%% Source: http://hypo.ge.ch/www/math/html/root.html
%%% Adapted by Didier Gonze
%%% Created: 5/1/2008
%%% Updated: 5/1/2008

clear;
clc;


%%% Parameters

n=8;               % number of iterations
style='allbuttwo'; % style = 'all' or 'allbutone' or 'allbuttwo' or 'half'
col=prism(256);    % col = prism(256)  - define colour

%%% Table of irreductible fractions whose the denominator does not exceed N 

fs=[];
for i=1:n
    for j=i+1:n
        if gcd(i,j)==1  % reduction test (greatest common divisor)
            fs=[fs; i j];
        end
    end
end

nbf=length(fs);

%%% Sorting of the fractions from the smaller to the larger

[i,j]=sort(fs(:,1)./fs(:,2));   

%%% Traitement des styles

switch style
    case 'all'
        fs=[0 1; fs(j,:); 1 1]';
    case 'allbutone'
        fs=[0 1; fs(j,:)]';
    case 'allbuttwo'
        fs=fs(j,:)';
    case 'half'
        fs=fs(j(1:round(nbf/2)),:)';
end

% ------------------------------------------------------------

%%% Figure (1) - circles 

figure(1);
h=plot(0,0);
hold on
delete(h)

%%% Reference circle

t=0:pi/100:2*pi;
ct=cos(t);
st=sin(t);

%%% Plot the circles centered at x=num/denom with radius=1/(2*denom^2).

nbc=length(fs);  % number of circles

for k=1:nbc
    i=fs(1,k);
    j=fs(2,k);
    cx=i/j;
    r=1/(2*j^2);
    cy=r;
    fill(r*ct+cx,r*st+cy,col(k,:))
end

axis equal
axis off
hold off

figure(gcf)


% ------------------------------------------------------------

%%% Figure (2) - spheres 

figure(2);
h=plot3(0,0,0);
hold on
delete(h)

%%% Reference sphere

reso=20;    % resolution
[x,y,z]=sphere(reso);

%%% Plot the spheres

C=ones(size(x));
nbs=length(fs);
f=linspace(0,1,nbs);

for k=1:nbs
    i=fs(1,k);
    j=fs(2,k);
    cx=i/j;
    r=1/(2*j^2);
    cy=r;
    surf(r*x+cx,r*y+cy,r*z,f(k)*C)
    surf(r*x+cx,r*y-cy,r*z,f(k)*C)
end

axis equal
axis off
hold off
shading interp
light
lighting phong
material shiny
view(45,45)
colormap(col)
figure(gcf)




