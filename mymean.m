function [y] = mymean(x)
y = [];
numberOfRows = size(x, 1);
    for i = 1:numberOfRows
        y(end+1) = sum(x(:,i))/length(x(i,:));
    end
end