function[values_t] = val_wind(X,size_wind)
%X: vector column of integers [0,9] size n
%size of the window ex: 20, 30...
n = length(X) ;

m = n - size_wind + 1 ;

if (m >0) 
    values_t = zeros(6, m) ;
end

w1 = 1 ;
w2 = size_wind ;
col=1 ;

%computation of different measures for each window
while (w2 <= n) 
    values_t(:,col) = mesure(X(w1:w2)) ;
    col = col+1 ;
    w1 = w1+1 ;
    w2 = w2+1 ;
end
end