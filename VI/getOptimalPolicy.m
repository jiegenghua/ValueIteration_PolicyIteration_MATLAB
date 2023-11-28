function policy = getOptimalPolicy(U)
global NUM_ROW NUM_COL n_actions obstacleIndex
policy = ones(NUM_ROW, NUM_COL)*(-1);
for i=1:NUM_ROW
    for j=1:NUM_COL
        if sum(ismember(obstacleIndex, [i,j], 'rows'))==1 || (i==2&&j==8)   % obstacles,A,B
            continue
        end  
        maxu=-inf;
        for k=0:n_actions-1
            u = ValueCalculate(U,i,j,k);
            if u>maxu
                maxu = u;
                maxA = k;
            end
        end
        policy(i,j) = maxA;
    end
end
end