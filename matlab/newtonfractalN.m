function newtonfractal

%%% Didier Gonze
%%% 16/9/2011
%%% Adapted from http://hmf.enseeiht.fr/travaux/CD0203/travaux/optmfn/hi/03pa/hyd51/

%%% Compute the bassin of attraction of the solution of z^n-1=0 according to the
%%% Newton-Raphson method. 

%%% Let's define f(x)=z^n-1
%%% The n roots z_k of this equation are z_k=e^(2*i*pi*k/n)
%%% The Newton's method is applied to a set of starting point:
%%% x_n=x_(n-1)-f(x-1)/f'(x-1) <=> z_i = z_(i-1)-(z_(i-1)^n-1)/(n*z_(i-1)^(n-1)) 
%%% After niter iterations, each starting point is colored depending 
%%% either on which roots the initial point has converged to (criteria 1).
%%% or on the rapidity of convergence (criteria 2).

clear;
clc;

%%% Parameters

n=3;                     % parameter of the equation (gives the number of roots)
niter = 50;              % number of iteration
tol = 0.001;             % tolerance
criteria=1;              % criteria for colors
nx = 500;                % x resolution
ny = 500;                % y resolution
xmin = -1; xmax = 1;     % x limits
ymin = -1; ymax = 1;     % y limits

%%% Initialization

dx = (xmax - xmin)/(nx-1);
dy = (ymax - ymin)/(ny-1);

x(1:nx) = xmin:dx:xmax;
y(1:ny) = ymin:dy:ymax;

z = zeros(nx,ny);

for ix=1:nx
z(ix,:) = x(ix) + i*y(:)';
end

zcolor = zeros(nx,ny);

%%% Run

if criteria==1     % colour according to which roots the initial point has converged to

    for j=1:niter;
    z = z -(z.^n -1)./(n.*z.^(n-1));
    end

    for k=1:n
    cr(k) = exp(i*2*pi*k/n);
    zcolor = zcolor + k *(abs(z-cr(k))<tol);
    end

elseif criteria==2   % colour according to the rapidity of convergence
    
    for j=1:niter;
    z = z -(z.^n -1)./(n.*z.^(n-1));
        for k=1:n
        cr(k) = exp(i*2*pi*k/n);
        zcolor=zcolor+j*(abs(z-cr(k))<tol)/210;
        end
    end

end


%%% Figure

figure(1)
clf;

%pcolor(x,y,zcolor');
imagesc(zcolor')
%shading flat;
colormap(jet);
%set(gca,'xtick',[-2:0.5:2],'ytick',[-2:0.5:2]);

axis square
set(gca,'XTickLabel',{''})
set(gca,'YTickLabel',{''})
set(gca,'XTick',[])
set(gca,'YTick',[])

