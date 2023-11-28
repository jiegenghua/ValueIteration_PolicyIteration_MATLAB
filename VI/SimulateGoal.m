%% run the policy 50 instances and record the number of times the agent managed to reach the goal state
P = getOptimalPolicy(U); % optimal policy
global NUM_ROW NUM_COL obstacleIndex wind All_actions rewards

iter = 50;
maxsteps = 1000;
successRate = 0;
rewardslist = [];
for n=1:iter
    goal = [2,8];   % the index of goal state
    start = [8,1];  % initial state position
    total_reward = 0;
    for m=1:maxsteps
        total_reward = total_reward+rewards(start(1), start(2));
        total_reward = total_reward+rewards(start(1), start(2));
        next = start+All_actions(wa(wind(start(1), start(2)), P(start(1), start(2)))+1,:);
        if sum(ismember(obstacleIndex, next, 'rows'))==1 ||  next(1)<1 ||next(2)<1 ||next(1)>NUM_ROW ||next(2)>NUM_COL       % if the action will take the agent to the obstacle or out of boundary
             start = start;
        else
             start = next;
        end  
 
        if norm(start - goal)<0.01
            successRate=successRate+1;
            break;
        end
    end
     rewardslist = [rewardslist; total_reward];
end
plot(rewardslist);
