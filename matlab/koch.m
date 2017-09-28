function koch(level,mplot)

clc;

% koch(LEVEL, MPLOT) Draw the Koch fractal. 
% LEVEL denotes the number of iterations to perform.
% MPLOT = 1 to draw multiplot
% Example: koch(5,0);
% Default: level=5, mplot=0

% Author: Didier Gonze
% Created: 13/1/2007
% Updated: 13/1/2007


if(nargin ~= 2)
   level=5;
   mplot=1;
end


if(mplot==0)
   singleplot(level)
else
   multiplot(level)
end

 

%------------------------------------------------------------
% Run single plot
%------------------------------------------------------------

function singleplot(level,x1,y1,x2,y2)

figure(1)
clf;

x1=zeros(1,level);
y1=zeros(1,level);
x2=zeros(1,level);
y3=zeros(1,level);
x1(level)=0;
y1(level)=0;
x2(level)=1;
y2(level)=0;

subkoch(level,x1,y1,x2,y2);

xlim([-0.2,1.2]);
ylim([-0.2,1.2]);
title(sprintf('Cantor Fractal, level=%g',level));
set(gca,'XTickLabel',{''})
set(gca,'YTickLabel',{''})
set(gca,'XTick',[])
set(gca,'YTick',[])
%axis off;    % to remove the boxes
%set(findobj(gca,'Type','line'),'Color','k')   % black
%set(findobj(gca,'Type','line'),'LineWidth',2) % thick


%------------------------------------------------------------
% Run multi-plot
%------------------------------------------------------------

function multiplot(level,x1,y1,x2,y2)

figure(1)
clf;

for ilevel=1:level

subplot(level,1,ilevel)

x1=zeros(1,ilevel);
y1=zeros(1,ilevel);
x2=zeros(1,ilevel);
y3=zeros(1,ilevel);
x1(ilevel)=0;
y1(ilevel)=0;
x2(ilevel)=1;
y2(ilevel)=0;

subkoch(ilevel,x1,y1,x2,y2);

xlim([-0.2,1.2]);
ylim([-0.1,0.35]);
text(-0.1,0.03,sprintf('(%g)',ilevel),'fontsize',14);
%title(sprintf('Cantor Fractal, level=%g',level));
set(gca,'XTickLabel',{''})
set(gca,'YTickLabel',{''})
set(gca,'XTick',[])
set(gca,'YTick',[])
%axis off;    % to remove the boxes
%set(findobj(gca,'Type','line'),'Color','k')   % black
%set(findobj(gca,'Type','line'),'LineWidth',2) % thick

end


%------------------------------------------------------------
% Compute / Draw the 4 segments
%------------------------------------------------------------

function subkoch(k,x1,y1,x2,y2)

% k = iteration level
% A line is drawn when k = 1

if(k==1)
    plot([x1(k) x2(k)],[y1(k) y2(k)]);
    hold on;
else
    k=k-1;
    dx=x2(k+1)-x1(k+1);
    dy=y2(k+1)-y1(k+1);
    L=sqrt(dx^2+dy^2); % segment length
    r=sqrt(1/3^2 - 1/6^2);
    % left segment
    x1(k)=x1(k+1);
    y1(k)=y1(k+1);
    x2(k)=x1(k+1)+dx/3;
    y2(k)=y1(k+1)+dy/3;
    subkoch(k,x1,y1,x2,y2)
    % middle left segment
    x1(k)=x2(k);
    y1(k)=y2(k);
    x2(k)=0.5*(x1(k+1)+x2(k+1))-r*(y2(k+1)-y1(k+1));
    y2(k)=0.5*(y1(k+1)+y2(k+1))+r*(x2(k+1)-x1(k+1));
    subkoch(k,x1,y1,x2,y2)
    % middle right segment
    x1(k)=x2(k);
    y1(k)=y2(k);
    x2(k)=x2(k+1)-dx/3;
    y2(k)=y2(k+1)-dy/3;
    subkoch(k,x1,y1,x2,y2)
    % right segment
    x1(k)=x2(k);
    y1(k)=y2(k);
    x2(k)=x2(k+1);
    y2(k)=y2(k+1);
    subkoch(k,x1,y1,x2,y2)
end

return




