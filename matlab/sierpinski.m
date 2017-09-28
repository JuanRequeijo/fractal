function sierpinsky(level)

% sierpinsky(LEVEL) Draw the Sierpinsky fractal. 
% LEVEL denotes the number of iterations to perform.
% Example: sierpinsky(3);
% Default: level=4

% Author: Didier Gonze
% Created: 22/1/2008
% Updated: 22/1/2008

clc;

if(nargin ~= 1)
   level=4;
end

figure(1)
clf;

x1=zeros(1,level);
x2=zeros(1,level);
x3=zeros(1,level);
y1=zeros(1,level);
y2=zeros(1,level);
y3=zeros(1,level);

x1(level)=0;
x2(level)=1;
x3(level)=2;
y1(level)=0;
y2(level)=sqrt(3);
y3(level)=0;

figure(1)
clf;

subsierpinsky(level,x1,x2,x3,y1,y2,y3);

xlim([-0.2,2.2]);
ylim([-0.2,2]);
%title(sprintf('Sierpinsky Fractal, level=%g',level));
set(gca,'XTickLabel',{''})
set(gca,'YTickLabel',{''})
set(gca,'XTick',[])
set(gca,'YTick',[])
% axis off;    % to remove the boxes



%------------------------------------------------------------
% Compute / Fill the 4 triangles
%------------------------------------------------------------

function subsierpinsky(k,x1,x2,x3,y1,y2,y3)

% k = iteration level
% A triangle is filled is filled when k = 1

if(k==1)
    fill([x1(k) x2(k) x3(k)],[y1(k) y2(k) y3(k)],'k');
    hold on;
else
    
    k=k-1;

    % triangle 1
     x1(k)=x1(k+1);
     y1(k)=y1(k+1);
     x2(k)=(x2(k+1)+x1(k+1))/2;
     y2(k)=(y2(k+1)+y1(k+1))/2;
     x3(k)=x2(k+1);
     y3(k)=y1(k+1);
     subsierpinsky(k,x1,x2,x3,y1,y2,y3)
    
    % triangle 2
     x1(k)=x2(k);
     y1(k)=y2(k);
     x2(k)=x2(k+1);
     y2(k)=y2(k+1);
     x3(k)=(x3(k+1)+x2(k+1))/2;
     y3(k)=(y2(k+1)+y1(k+1))/2;
     subsierpinsky(k,x1,x2,x3,y1,y2,y3)
    
    % triangle 3
    x1(k)=x2(k+1);
    y1(k)=y1(k+1);
    x2(k)=(x3(k+1)+x2(k+1))/2;
    y2(k)=(y2(k+1)+y1(k+1))/2;
    x3(k)=x3(k+1);
    y3(k)=y3(k+1);
    subsierpinsky(k,x1,x2,x3,y1,y2,y3)
end

return




