function newtonfractal

%%% Didier Gonze
%%% 16/9/2011
%%% Adapted from http://calque.pagesperso-orange.fr/logiciels/octave/newton.html

clear;
clc;

%%% Parameters

n=40;       % number of iterations

d=0.0001;   % threshold

t=401;      % number of pixels /side


%%% Initialisation (matrice of pixels Red Green Blue)

R=uint8(ones(t))*50;
G=uint8(ones(t))*50;
B=uint8(ones(t))*50;

%%% Coordinates 

x=[-200:200]./200;
y=[-200:200]./200;


%%% Start simulation

for px=1:t
for py=1:t

	u=zeros(n,1);
	v=zeros(n,1);
    
	z=u+i*v;
	
	z(1)=x(px)+i*y(py);   % initial z value
    
	if(z(1)==0)   	% if division by 0

			R(t+1-py,px)=200;
    else                
		for k=2:n       % iteration
		z(k)=z(k-1)-(z(k-1)^3-1)./(3*z(k-1)^2);   % z(k)=z(k-1)-f(k-1)/f'(k-1)
        end
        f=t+1-py;		

        %%% Comparison with the cubic roots of 1

        if (abs(z(n)-1)<d)
			R(py,px)=200;
        elseif(abs(z(n)+0.5*(1+i*sqrt(3)))<d)
			G(py,px)=200;
        elseif(abs(z(n)+0.5*(1-i*sqrt(3)))<d)
			B(py,px)=200;
        end
    end
				
end	
end


%%% Concatenate data

X = cat(3,R,G,B);

%%% Image

figure(1)
clf;

image(X)

axis square

set(gca,'XTickLabel',{''})
set(gca,'YTickLabel',{''})
set(gca,'XTick',[])
set(gca,'YTick',[])


