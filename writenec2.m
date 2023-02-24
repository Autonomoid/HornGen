function[]=writenec2(fname,x,y,lambda) 

    fullname=sprintf('%s.nec',fname);
    fid=fopen(fullname,'w');

    % Comments
    fprintf(fid,'CM Automatically Generated Geometry\n');
    fprintf(fid,'CE\n');

    copies = 10; % number of copies of the
                % wire to mirror around z axis

    % Define wires
    for n=1:length(x)-1

        % Maintain the 'equal areas' principle
        %radius = abs((y(n)*180)/(pi*copies));
        radius = 0.1 * lambda;

        fprintf(fid,'GW %i %i %.4g %.4g %.4g %.4g %.4g %.4g %.4g\n',...
            n,1,0,y(n),x(n),0,y(n+1),x(n+1),radius);
    end

    % Copy around the z-axis
    fprintf(fid,'GR,1,%i\n',copies);

    % End of geometry
    fprintf(fid, 'GE\n');

    % Set frequency
    %frequency = 299492458/lambda;
    frequency = 1; % /MHz
    fprintf(fid,'FR 0 0 0 0 %g 0 0 0 0 0\n',frequency);

    % Set excitation
    fprintf(fid,'EX 1 1 1 0 0 0 0 0 0 0\n');

    % Set measurment requests
    fprintf(fid,'RP     0    18    72   1000  0.00000E+00  0.00000E+00  5.00000E+00  5.00000E+00  0.00000E+00  0.00000E+00\n');

    % End script
    fprintf(fid,'EN     0     0     0      0  0.00000E+00  0.00000E+00  0.00000E+00  0.00000E+00  0.00000E+00  0.00000E+00\n');
    fclose(fid);

end
