function s = simplebounds(s,Lb,Ub)
    ns_tmp = s;  
    I = ns_tmp < Lb;  
    ns_tmp(I) = Lb(I);   
    J = ns_tmp > Ub;  
    ns_tmp(J) = Ub(J);  
    s = ns_tmp;  