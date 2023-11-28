function neighborU = neighU(U,row,col,a)
global NUM_ROW NUM_COL
newrow = row+a(1); newcol = col+a(2);
if newrow<1 ||newcol <1 || newrow>NUM_ROW || newcol>NUM_COL
    neighborU = U(row,col);
else
    neighborU = U(newrow,newcol);
end
end