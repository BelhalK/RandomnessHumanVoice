function[var20] = trace_var20(X)
window = 30;
n = length(X) ;

m = n - window + 1 ;

if (m >0) 
    var20 = zeros(6, m) ;
end

w1 = 1 ;
w2 = window ;
col=1 ;
while (w2 <= n) 
    var20(:,col) = mesure(X(w1:w2)) ;
    col = col+1 ;
    w1 = w1+1 ;
    w2 = w2+1 ;
end
end