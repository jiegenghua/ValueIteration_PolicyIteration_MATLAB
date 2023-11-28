function PlotPolicy(A)
global NUM_ROW NUM_COL
for i = 1:NUM_ROW
    fprintf('    ')
    for j = 1:NUM_COL
        if i==2 && j==8 
            fprintf('G');
        end
        if A(i,j) == 0
            fprintf('↓ \t');
        elseif A(i,j) == 1
            fprintf('← \t');
        elseif A(i,j) == 2
            fprintf('↑ \t');
        elseif A(i,j) == 3
            fprintf('→\t');
        else
            fprintf('O \t');
        end
    end
    fprintf('\n');
end
end