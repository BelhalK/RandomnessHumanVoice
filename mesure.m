function[valeur, v_dist, mean_dist] = mesure(X) 
%type : type de mesure : variance (var), entropie...
%X : vecteur

n = length(X) ;

%if (strcmp(type, 'var')) %si type = var
    
    %Calcul de la moyenne
    mean = 0 ;
    for i=1:n
        mean = mean + X(i);
    end
    mean = mean/n ;
    valeur(1)= mean;
    
    %Calcul de la variance
    var = 0 ;
    for i=1:n
        var = var + (X(i) - mean)*(X(i) - mean) ;
    end
    var = var/n ;
    
    valeur(2) = var ;
%end
    % calcul de l'entropie pour fréquence de nombre
    frequence = zeros(10,1);
    for j=1:n
        number = X(j);
        frequence(number+1) = frequence(number+1)+1;
    end
    frequence = frequence./n;

    entropie = 0;
    for k=1:length(frequence)
        if frequence(k)~= 0
            entropie = entropie + frequence(k)*log(1/frequence(k));
        end
    end
    valeur(3)=entropie;
    
    %calcul de la distance moy
    moy_dist =0;
    mean_dist =0;
    v_dist = zeros(1,n-1);
    for l=1:n-1
        moy_dist = moy_dist + (X(l+1)-X(l))^2;
        mean_dist = mean_dist + abs(X(l+1)-X(l));
        v_dist(1,l) = abs(X(l+1)-X(l)); 
    end
    moy_dist = moy_dist/(n-1);
    mean_dist =mean_dist/(n-1);
    
    %calcul de la variance de la distance moyenne
    var_dist = 0 ;
    for i=1:n-1
        var_dist = var_dist + (v_dist(i) - mean_dist)*(v_dist(i) - mean_dist) ;
    end
    var_dist = var_dist/(n-1) ;
    %var_dist = var(v_dist);
    valeur(4) = moy_dist;
    valeur(5) = var_dist;
    
    %calcul de l'entropie pour couple 
    freq_cple = zeros(10,10);
    for i=1:n-1
        f_num = X(i);
        s_num = X(i+1);
        freq_cple(f_num+1,s_num+1) = freq_cple(f_num+1,s_num+1)+1;
    end
    freq_cple = freq_cple./(n-1);

    entropie_cple = 0;
    for l=1:numel(freq_cple(1,:))
        for c =1:numel(freq_cple(:,1))
        if freq_cple(l,c)~= 0
            entropie_cple = entropie_cple + freq_cple(l,c)*log(1/freq_cple(l,c));
        end
        end
    end
    valeur(6)=entropie_cple;
    
end