function [x, y] = AddSection(x1, y1, x2, y2)

    x2 = x2 + x1(end);
    y2 = y2 + y1(end);

    x = cat(1, x1, x2);
    y = cat(1, y1, y2);

end