function [] = NewHorn()
    %=====================================================================
    % Name: NewHorn
    %
    % Description: Generates corrugated profile horn geometries.
    % Author: IceAxe (2012)
    %
    % Licence: 
    %
    %   This program is free software: you can redistribute it and/or
    %   modify it under the terms of the GNU General Public License as
    %   published by the Free Software Foundation, either version 3 of 
    %   the License, or (at your option) any later version.
    %
    %   This program is distributed in the hope that it will be useful,
    %   but WITHOUT ANY WARRANTY; without even the implied warranty of
    %   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    %   GNU General Public License for more details.
    %
    %   You should have received a copy of the GNU General Public License
    %   along with this program.
    %=====================================================================
  
    %% Main Horn Design
    close all;
    clear all;

    %% Band Properties
    fmin = 90e9 % Minimum frequency / Hz
    fmax = 105e9 % Maximum frequency / Hz
    fc = sqrt(fmin*fmax); % Centre frequency / Hz
    lambda = 299492458/fc; % Wavelength / m

    %% Horn properties
    ns = 7; % Number of sections; 1-5 = mode converter, 7 = apperture
    bwd = 20; % Beam width / degrees
    bw = bwd * pi/180 % Beam width / rad
    p = lambda/5; % Corrugation periodicity / m
    apr = (1.22*lambda)/(2*bw) % Apperture radius / m

    % Section 1
    thr = (3*lambda)/(2*pi) % Throat radius / m
    tw1 = 0.1;
    pw2 = 0.1;
    l1 = 5 * lambda * (tw1 + pw2);

    % Section 2
    l2 = 4 * lambda; % Length / m
    nc2 = l2 / p % Number of corrugations 
    th2 = -atan2(abs(apr-thr),l2) % Flare angle / rad
    th2d = th2 * 180/pi; % Flare angle / degrees

    % Section 3
    tw3 = 0.1;
    pw3 = 0.1;
    l3 = 5 * lambda * (tw3 + pw3);

    length = l1+l2+l3

    %% Section properties
    nc = [1 1 1 1 1 nc2 5]; % Number of corrugations per section
    pw = [0.1 0.1 0.1 0.1 0.1 0.1 0.1]; % Peak width / lambda
    tw = [0.1 0.1 0.1 0.1 0.1 0.1 0.1]; % Trough width / lambda
    td = [0.5 0.45 0.40 0.35 0.30 0.25 0.25]; % Trough depth / lambda
    theta = [0 0 0 0 0 th2d 0]; % Flare angle / degrees (to horizontal)

    %% Make horn profile
    [x, y] = HornProfile(lambda, ns, nc, pw, tw, td, theta, thr);

    %% Plot result
    plot(x,y);
    hold on
    y2=-y;
    plot(x,-y);
    xlim([-0.5,x(end)+0.5]);
    xlim([-0.1,x(end)+0.1]);
    xlim([-0.01,x(end)+0.01]);
    ylim([y(1)-0.01,y2(end)+0.01]);
    ylim([y(end)-0.01,y2(end)+0.01]);

    %% Export to .dxf & .nec
    fname = 'test';
    writedxf(fname,x,y);
    writenec2(fname,x,y,lambda);
    writedat(fname,x,y);
    
end
