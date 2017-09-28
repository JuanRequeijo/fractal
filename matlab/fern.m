%%% Fractal fern
%%% From: http://www.math.tamu.edu/~boas/courses/math696/Maple-fractals.html
%%% Adapted by D. Gonze (4/12/2010)

clc
clear
figure(1)
clf
set(gcf,'Color',[0,0.4,0.4])

%%% Parameters

iterations=20000;

Mat1=[0 0;0 0.16];
Mat2=[0.85 0.04;-0.04 0.85];
Mat3=[0.2 -0.26;0.23 0.22];
Mat4=[-0.15 0.28;0.26 0.24];

Vector1=[0;0];
Vector2=[0;1.6];
Vector3=[0;1.6];
Vector4=[0;0.44];

Prob1=0.01;
Prob2=0.85;
Prob3=0.07;
Prob4=0.07;

%%% Initialisation

P=[0;0];

%%% Run

for i = 1:iterations
  prob=rand;
  if prob<Prob1 
     P=Mat1*P+Vector1;
  elseif prob<Prob1+Prob2
     P=Mat2*P+Vector2;
  elseif prob<Prob1+Prob2+Prob3
     P=Mat3*P+Vector3;
  else
     P=Mat4*P+Vector4;
  end
x(i)=P(1);
y(i)=P(2);
end


%%% Figure

plot(x,y,'go','markersize',1)
axis equal; axis off;



