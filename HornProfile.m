function [x, y] = HornProfile(lambda, ns, nc, pw, tw, td, theta, thr)

    % Initialize
    x = 0;
    y = -thr;

    % Construct horn
    for n = 1:ns

        %Create a new sction
        [x1, y1] = NewSection(lambda, nc(n), pw(n),...
            tw(n), td(n), theta(n));

        % Add section to horn
        [x, y] = AddSection(x, y, x1, y1);

    end
    
end