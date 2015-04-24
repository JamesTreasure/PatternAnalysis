function [y] = mymean(x)
y = [];
numberOfColumns = size(x, 2);
    for i = 1:numberOfColumns
        y(end+1) = sum(x(:,i))/length(x(:,i));
    end
end