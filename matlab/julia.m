function julia

%%% Compute and draw the Julia set

%%% Author: Didier Gonze 
%%% Created: 22/1/2008
%%% Updated: 18/1/2011

clear;
clc;

%%% Parameters

c = 0.2+0.65i;          % complex number (default: 0.2+0.65i)

niter=20;               % number of iterations (default: 20)
th=3;                   % threshold to determine divergence (default: 3)
v=500;                % resolution (<-> number of points to compute) (default: 500)


%%% Initialisation

r = max(abs(c),2);     % radius of the circle beyond which every point diverges

d = linspace(-r,r,v);  % divide the x-axis

Z = ones(v,1)*d+i*(ones(v,1)*d)';   % create the matrix A containing complex numbers

C = zeros(v,v);  % Julia set point matrix


%%% Compute the julia set

for k = 1:niter
    Z = Z.*Z+ones(v,v).*c;
    C = C+(abs(Z)<=r);
end


%%% Figure

figure(1)
clf;

imagesc(C);

colormap(jet);

hold off;
axis equal;
axis off;



