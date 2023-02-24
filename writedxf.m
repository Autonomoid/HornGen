function[]=writedxf(fname,x,y) 

    % Given a filename and a 3d mesh specified by X,Y
    fullname=sprintf('%s.dxf',fname);
    fid=fopen(fullname,'w');

    fprintf(fid,'0\nSECTION\n2\nHEADER\n0\nENDSEC\n0\nSECTION\n2\nENTITIES\n');

    for n=1:length(x)-1
          fprintf(fid,'0\nLINE\n8\n0\n62\n4\n10\n%.4f\n20\n%.4f\n30\n0\n11\n%.4f\n21\n%.4f\n31\n0\n',...
              x(n),y(n),x(n+1),y(n+1));
    end

    fprintf(fid,'0\nENDSEC\n0\nEOF\n');
    fclose(fid);
    
end
