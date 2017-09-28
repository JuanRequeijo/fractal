function tree

%%% Author: Didier Gonze
%%% Created: 6/1/2009
%%% Updated: 6/1/2009

clear;
clc;


%%% Parameters

niter=7;        % number of iterations
trunk=1;        % size of the trunk
thick=1.1;      % thickness of the branches
shrink=0.8;     % shrink ratio
theta=pi/6;     % angle (in radian)


%%% Figure

figure(1)

%axis off;
%set(gcf,'color','b')
whitebg([0.8 0.8 0.95])
plot([0 0],[0 -trunk],'k','linewidth',niter*1.5)
set(gca,'XTickLabel',{''})
set(gca,'YTickLabel',{''})
set(gca,'XTick',[])
set(gca,'YTick',[])

%%% Initialisation

x=0;
y=0;
k=niter;

addbranch(k,x,y-1,x,y,theta,shrink,thick);



% ==========================================
% function addbranch
% ==========================================

function addbranch(k,xr,yr,x0,y0,theta,shrink,thick)

%%% Compute the 2 new branches

Lr=sqrt((x0-xr)^2+(y0-yr)^2);   % length of the previous branch
L=shrink*Lr;                    % length of the new branch
    
alpha=atan2(y0-yr,x0-xr);

x1=x0+L*cos(alpha-theta/2);
y1=y0+L*sin(alpha-theta/2);
x2=x0+L*cos(alpha+theta/2);
y2=y0+L*sin(alpha+theta/2);

%%% Plot the 2 new branches

hold on;
plot([x0 x1],[y0 y1],'k-','linewidth',k*thick);
hold on;
plot([x0 x2],[y0 y2],'k-','linewidth',k*thick);

%%% To plot green leaves...

if k==1
   hold on;
   plot([x1 x2],[y1 y2],'g.','markersize',40);
end

%%% Iteration

if k>1
   k=k-1;    
   addbranch(k,x0,y0,x1,y1,theta,shrink,thick)
   addbranch(k,x0,y0,x2,y2,theta,shrink,thick)
end







