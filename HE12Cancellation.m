%% Constraints
frequency = 97e9 % / Hz
lambda = 299792458 / frequency % m
k = 2*pi/lambda % / m
th3 = 10 * pi/180 % rad
th3d = th3 * 180/pi % degrees
r3 = 0.03 % m
l3 = 0.03 % m
l = 0.10 % m

% Mode propagation constants
Bh11 = 1
Bh12 = 0

%% Step 1
r2 = r3 - l3 * tan(th3) % m

%% Step 2
th2 = atan2(r2,l-l3) % rad
th2d = th2 * 180/pi % degrees

%% Step 3
dth2 = th2-th3 % rad
dth2d = dth2 * 180/pi % degrees

l2 = (0.77*k*r2*dth2+pi)/(Bh11-Bh12) % m

%% Step 4
r1 = r2 - l2 * tan(th2) % m

%% Step 5
l1 = l - l2 - l3 % m

%% Step 6
th1 = atan2(r1,l1) % rad
th1d = th1 * 180/pi % degrees

%% Step 7
dth1 = th1 - th2 % rad
dth1d = dth1 * 180/pi % degrees

%%%%%%%%%%%%%%%%%%%
% Iterative stage %
%%%%%%%%%%%%%%%%%%%

fid=fopen('cancellation.dat','w');

fprintf(fid,'n th1 l1 r1 th2 l2 r2 th3 l3 r3\n');

for n = 1:10
    l2 = (0.77*k*r1*dth1+pi)/(Bh11-Bh12) % m
    r1 = r2 - l2 * tan(th2) % m
    l1 = l - l2 - l3 % m
    th1 = atan2(r1,l1) % rad
    th1d = th1 * 180/pi % degrees
    dth1 = th1 - th2 % rad
    dth1d = dth1 * 180/pi % degrees
    fprintf(fid,'%i %.4g %.4g %.4g %.4g %.4g %.4g %.4g %.4g %.4g\n',n,th1d,l1,r1,th2d,l2,r2,th3d,l3,r3);
end

fclose(fid);