function cantor(level,mplot)

clc;

% cantor(LEVEL, MPLOT) Draw the Cantor fractal. 
% LEVEL denotes the number of iterations to perform.
% MPLOT = 1 to draw multiplot
% Example: cantor(5,0);
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

function singleplot(level)

figure(1)
clf;

a=zeros(1,level);
b=zeros(1,level);
a(level)=0;
b(level)=1;

subcantor(level,a,b);

xlim([-0.2,1.2]);
title(sprintf('Cantor Fractal, level=%g',level));
set(gca,'XTickLabel',{''})
set(gca,'YTickLabel',{''})
set(gca,'XTick',[])
set(gca,'YTick',[])
%axis off;    % to remove the boxes
%set(findobj(gca,'Type','line','Color','k')   % black
set(findobj(gca,'Type','line'),'LineWidth',2) % thick


%------------------------------------------------------------
% Run multi-plot
%------------------------------------------------------------

function multiplot(level)

figure(1)
clf;

for ilevel=1:level

subplot(level,1,ilevel)

a=zeros(1,ilevel);
b=zeros(1,ilevel);
a(ilevel)=0;
b(ilevel)=1;

subcantor(ilevel,a,b);

xlim([-0.2,1.2]);
text(-0.1,0.1,sprintf('(%g)',ilevel),'fontsize',14);
% title(sprintf('Cantor Fractal, level=%g',level));
set(gca,'XTickLabel',{''})
set(gca,'YTickLabel',{''})
set(gca,'XTick',[])
set(gca,'YTick',[])
%axis off;    % to remove the boxes
%set(findobj(gca,'Type','line','Color','k')   % black
set(findobj(gca,'Type','line'),'LineWidth',2) % thick

end


%------------------------------------------------------------
% Compute / Draw the segments
%------------------------------------------------------------

function subcantor(k,a,b)

% k=level

if(k==1)
    plot([a(k) b(k)],[0 0]);
    hold on;
else
    k=k-1;
    L=b(k+1)-a(k+1); % segment length
    % left segment
    a(k)=a(k+1);
    b(k)=a(k+1)+L/3;
    subcantor(k,a,b)
    % right segment
    a(k)=b(k+1)-L/3;
    b(k)=b(k+1);
    subcantor(k,a,b)
end

return




