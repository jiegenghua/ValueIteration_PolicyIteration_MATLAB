function U = PolicyEvaluation(policy,U) 
global NUM_ROW NUM_COL obstacleIndex epsilon gamma
while 1
    Up = U;
    delta = 0;  
    for i=1:NUM_ROW
        for j=1:NUM_COL
            if sum(ismember(obstacleIndex, [i,j], 'rows'))==1  || (i==2&&j==8)   % obstacles,Goal
                continue
            end  
            Up(i,j) = ValueCalculate(U,i,j,policy(i,j));
            delta = max(delta,abs(Up(i,j)-U(i,j)));
        end
    end
    U = Up;
    if delta < epsilon*(1-gamma)/gamma
        disp('Policy evaluation is converging');
        break;
    end
end
end

