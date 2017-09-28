function juliaLoop

%%% Compute and draw the Julia set

%%% Author: Didier Gonze 
%%% Created: 22/1/2008
%%% Updated: 18/1/2011

%%% Here several plots are generated with different complex numbers
%%% whose real and imaginary parts are equally distributed along a 
%%% circle in the complex space.

%%% In a next step I would like to generate a little animation 
%%% (animated gif showing the fractal progressively changing).
%%% This is useless but funny.

clear;
clc;

%%% Parameters

% complex number loop:

% the real and the imaginary parts of the complex number are 
% taken on a circle defined by the center (xc,yc) and a rayon r.
% nplot is the number of plotsd drawn

nplot=16;
xc=0.3;    % default: 0.5
yc=0.65;   % default: 0.65
ray=0.2;    % default: 0.4

niter = 14;         % nb iteration
v = 200;        % resolution

%%% Initialize figures 

figure(1);    % Figure 1: circle in the Re/Im plane
clf;

x=[xc-ray:0.01:xc+ray];
y=sqrt(ray^2-(x-xc).^2)+yc;
plot(x,y);
hold on;
y=-sqrt(ray^2-(x-xc).^2)+yc;
plot(x,y);
hold on;
plot([0 0],[yc-ray yc+ray],'k--')
hold on;
plot([xc-ray xc+ray],[0 0],'k--')
xlim([xc-ray-ray/10 xc+ray+ray/10])
ylim([yc-ray-ray/10 yc+ray+ray/10])
xlabel('Re(C)','fontsize',16)
ylabel('Im(C)','fontsize',16)

figure(2)    % Figure 2: Julia sets
clf;


%%% Run the loop

for j=1:nplot

[p1,p2] = pol2cart(2*pi*j/nplot,ray);
rec=p1+xc;
imc=p2+yc;

figure(1)
plot(rec,imc,'r.');
hold on;
    
c = rec+imc*i;  % complex number

r = max(abs(c),2);     % radius of the circle beyond which every point diverges
d = linspace(-r,r,v);  % divide the x-axis
Z = ones(v,1)*d+i*(ones(v,1)*d)';   % create the matrix A containing complex numbers
C = zeros(v,v);  % Julia set point matrix

for k = 1:niter
    Z = Z.*Z+ones(v,v).*c;
    C = C+(abs(Z)<=r);
end

figure(2)
subplot(4,4,j)
imagesc(C);
colormap(jet);
hold off;
axis equal;
axis off;

end