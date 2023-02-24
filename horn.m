% functions [x, y] = HornProfile(...)

x = 0;
y = 0;

%% Section 1
lambda = 1;
nc = 5; 
pw = 0.3; 
tw = 0.15; 
td = 0.1; 
theta = 0; 

[x1, y1] = NewSection(lambda, nc, pw,...
    tw, td, theta);

%% Section 2
lambda = 1;
nc = 5; 
pw = 0.3; 
tw = 0.15; 
td = 0.1; 
theta = -10; 

[x2, y2] = NewSection(lambda, nc, pw,...
    tw, td, theta);

%% Section 3
lambda = 1;
nc = 5; 
pw = 0.3; 
tw = 0.15; 
td = 0.1; 
theta = -5; 

[x3, y3] = NewSection(lambda, nc, pw,...
    tw, td, theta);

%% Combine sections
% Add section 1 
[x, y] = AddSection(x, y, x1, y1);

% Add section 2 
[x, y] = AddSection(x, y, x2, y2);

% Add section 3
[x, y] = AddSection(x, y, x3, y3);

%% PLot result
plot(x,y);
