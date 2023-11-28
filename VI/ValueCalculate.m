function utility = ValueCalculate(U,row,col,a)
global gamma rewards All_actions wind
action  = All_actions(a+1,:);
w = wind(row,col);
UM = [neighU(U,row,col,action);neighU(U,row,col,All_actions(mod(a+1,4)+1,:));neighU(U,row,col,All_actions(mod(a+2,4)+1,:));neighU(U,row,col,All_actions(mod(a-1,4)+1,:))];
if a==w  % direction is the same as wind
    utility = rewards(row,col)+gamma*(0.75*UM(1)+0.1*UM(2)+0.05*UM(3)+0.1*UM(4));
elseif abs(a-w)==2  % opposite
    utility = rewards(row,col)+gamma*(0.55*UM(1)+0.2*UM(2)+0.05*UM(3)+0.2*UM(4));
elseif mod(w+1,4) ==a
    utility = rewards(row,col)+gamma*(0.6*UM(1)+0.15*UM(2)+0.05*UM(3)+0.2*UM(4));
elseif mod(a+1,4)==w
    utility = rewards(row,col)+gamma*(0.6*UM(1)+0.2*UM(2)+0.05*UM(3)+0.15*UM(4));
else
    utility = rewards(row,col)+gamma*UM(1);
end
end