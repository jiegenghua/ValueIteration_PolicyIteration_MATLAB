global NUM_ROW NUM_COL gamma rewards All_actions n_actions wind obstacleIndex epsilon

NUM_ROW = 8; NUM_COL=8;        % number of states
epsilon = 0.001;  % max error
gamma = 0.95;
r = 100;   % change r here
n_actions = 4;
All_actions = [1 0; 0 -1; -1 0; 0 1]; % down left up right, corresponding index [0,1,2,3]
rewards = ones(NUM_ROW,NUM_COL)*(-1);
rewards(2,8) = 10;        % goal position
obstacleIndex = [1,1;1,6;3,4;4,4;4,5;4,8;5,2;6,2;6,6;7,6;8,6];
%% direction of wind in the world coordination, my action is also in the world coord.
wind = [-1,0,0,3,2,-1,2,0;
        1,3,3,0,1,1,1,-1;
        2,3,0,-1,0,0,1,1;
        2,1,0,-1,-1,3,3,-1;
        3,-1,2,0,3,0,2,1;
        2,-1,3,2,2,-1,2,0;
        3,3,3,2,1,-1,2,1;
        -1,3,2,1,1,-1,3,2];
%%
policy = randi(n_actions, NUM_ROW, NUM_COL)-1;
U = zeros(NUM_ROW,NUM_COL);
tic
for i=1:NUM_ROW
    for j=1:NUM_COL
        b = [i,j];
        if sum(ismember(obstacleIndex, b, 'rows'))==1 || (i==2&&j==8) 
            rewards(i,j) = -10;
            policy(i,j) = -1;
            U(i,j) = -10;
        end
    end
end
rewards(4,3) = r; rewards(1,5)=r; rewards(2,5) =r;
U(2,8) = 10;
while 1
   U = PolicyEvaluation(policy, U);
   flag = 1;
   for i=1:NUM_ROW
       for j=1:NUM_COL
            if sum(ismember(obstacleIndex, [i,j], 'rows'))==1 || (i==2&&j==8)   % obstacles, goal
                continue
            end  
          maxu = -inf;
          maxa = -1;
          for k=0:(n_actions-1)    % find the action with max utility
              u = ValueCalculate(U,i,j,k);
              if u>maxu
                  maxu=u;
                  maxa=k;
              end
          end
          if maxu > ValueCalculate(U,i,j,policy(i,j))
              policy(i,j)= maxa;
              flag = 0;
          end
       end
   end
   if flag ==1
       break
   end
end
toc
PlotPolicy(policy);