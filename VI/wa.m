function randaction = wa(w,a)
if a==w   % direction is the same as wind
    randaction = randsample([a,mod(a+1,4),mod(a+2,4),mod(a-1,4)],1,true,[0.75,0.1,0.05,0.1]);
elseif abs(a-w)==2  % opposite
 randaction =   randsample([a,mod(a+1,4),mod(a+2,4),mod(a-1,4)],1,true,[0.55, 0.2, 0.05, 0.2]);
elseif mod(w+1,4) ==a
  randaction = randsample([a,mod(a+1,4),mod(a+2,4),mod(a-1,4)],1,true,[0.6, 0.15, 0.05, 0.2]);
elseif mod(a+1,4)==w
    randaction = randsample([a,mod(a+1,4),mod(a+2,4),mod(a-1,4)],1,true,[0.6, 0.2, 0.05, 0.15]);
else
    randaction = a;
end   
end

