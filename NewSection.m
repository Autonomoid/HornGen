function [x, y] = NewSection(lambda, nc, pw, tw, td, theta)
    % Returns corrugation coordinates of section
    %
    %  x_1   x_4   x_5
    %  .     ._____.    <- y_1, y_4, y_5
    %  |_____|          <- y_2, y_2, y_3
    %  '     '
    %  x_2   x_3
    %
    %
    % Usage: [x, y] = section(lambda, nc, pw, tw, td, theta)
    %
    % lambda = 1 % wavelength / m
    % 
    % nc = 5 % number of corrugations in segment
    % 
    % pw = 0.3 % peak width in wavelengths
    % tw = 0.15 % trough width in wavelengths
    % td = 0.1 % trough depth = wavelengths
    % 
    % theta = 65 % flare angle of segment
    %            % to horizontal / degrees

    %% Pre-allocate co-ordiante arrays
    x = zeros(4*nc+1,1); 
    y = zeros(4*nc+1,1);

    %% Starting co-ordinates of segment
    x(1) = 0; 
    y(1) = 0;

    %% Loop over all corrugations in segment
    for n = 0:(nc-1)

        % Compute x co-ordinates
        x(4*n+2) = x(4*n+1);
        x(4*n+3) = x(4*n+2) + tw*lambda;
        x(4*n+4) = x(4*n+3);
        x(4*n+5) = x(4*n+4) + pw*lambda;

        % Compute y co-ordinates
        y(4*n+2) = y(4*n+1) - td*lambda;
        y(4*n+3) = y(4*n+2); 
        y(4*n+4) = y(4*n+3) + td*lambda;
        y(4*n+5) = y(4*n+4); 

    end

    %% Rotate segment to specified flare angle

    coords = [x, y]';

    % Convert theta into radians
    theta = theta * pi/180;

    for n = 1:length(x)

        rotation = [cos(theta), -sin(theta);
                sin(theta), cos(theta)];

        coords2(:,n) = rotation*coords(:,n);

    end

    coords3=coords2';

    %% Plot result
%     figure;
%     plot(x,y);
%     xlim([x(1),x(end)]);
%     ylim([-2*td,td]);
%     
%     figure;
%     x=coords3(:,1);
%     y=coords3(:,2);
%     plot(x,y);
%     xlim([x(1),x(end)]);
%     ylim([x(1),x(end)]);

    x = coords3(2:end,1);
    y = coords3(2:end,2);

end
