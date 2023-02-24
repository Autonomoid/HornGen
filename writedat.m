function[]=writedat(fname,x,y) 

    fullname=sprintf('%s.dat',fname);
    fid=fopen(fullname,'w');

    for n=1:length(x)
          fprintf(fid,'%.4g %.4f 0\n',x(n),y(n));
    end

    fclose(fid);

end
