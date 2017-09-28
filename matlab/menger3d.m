function menger(n);

% MENGER(N) draws the n-th iteration of the
% Menger cube (or Menger sponge)

% MENGER uses n = 2.
	
% Author : Jochen Schurr
% Date   : Nov 2004
% Version: 1.0


%%% default setting

switch nargin
    case 0
        n = 2;
end

% calculation of a matrix A consisting of zeros and ones
% which indicates the (non)existence of small cubes
% of the size 3^(-n).

tic

M = 0;

for k=1:n
    A = zeros([3^k, 3^k, 3^k]);
    A(:,:,1:3^(k-1)) = [M,      M,        M;
                        M, ones(size(M)), M;
                        M,      M,        M];
    A(:,:,3^(k-1)+1:2*3^(k-1)) = ...
        [M,             ones(size(M)), M;
         ones(size(M)), ones(size(M)), ones(size(M));
         M,             ones(size(M)), M];
    A(:,:,2*3^(k-1)+1:3^k) = [M,        M,      M;
                              M, ones(size(M)), M;
                              M,        M,      M];
    M=A;
end

% time used for the calculation of M

toc

% tarnsforming the matrix M into a 3-D picture

tic

hold on;
d = 1; 

% loop on all possible small cubes

for i = 1:3^n
    for j = 1:3^n
        for k = 1:3^n
            % is there a cube at the current position?
            if M(i,j,k) == 0 
                cube(i,j,k,d,n); 
            end
        end
    end
end


axis equal;
axis off;
hold off;

% time elapsed until the graphics are finished

toc

view(3);
hold off;

