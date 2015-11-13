function [values_t,p_moydist] = measure_rand(X) 
%X: vector of integers [0,9]

%% Create vector values_w with all measures in all windows
values_t = val_wind(X,30);

%% plot measures along time 

%parameters 
fposition = [0.25 0.25 0.5 0.5];
fontsize =20;
leng_loc = 'southeast';
bleu    = [0.3 0.3 1] ;
rouge   = [1 0.3 0.3];
vert    = [0.3 0.9 0.3];
violet  = [0.7 0 0.8];
orange  = [1 0.6 0.2] ;
gris    = [0.4 0.4 0.4];

f1 = figure; set(f1,'color',[1 1 1]);
title ('Quantifier Aléatoire') 
set(f1,'Units', 'normalized', 'Position',fposition);

subplot(2,2,1,'Fontsize',fontsize)
[p_mean, p_var, p_ent, p_moydist, p_vardist, p_entcple] = plot_mesure('Var',bleu, values_t); % variance
legend(p_var,'Variance','Location',leng_loc)
subplot(2,2,3,'Fontsize',fontsize)
[p_mean, p_var, p_ent, p_moydist, p_vardist, p_entcple] = plot_mesure('VarDist',vert, values_t); % variance of distance between two succesiv numbers 
legend(p_vardist,'Distance moyenne','Location',leng_loc)
subplot(2,2,2,'Fontsize',fontsize)
[p_mean, p_var, p_ent, p_moydist, p_vardist, p_entcple] = plot_mesure('Ent',rouge, values_t); % entropie of each number
legend(p_ent,'Entropie','Location',leng_loc)
subplot(2,2,4,'Fontsize',fontsize)
[p_mean, p_var, p_ent, p_moydist, p_vardist, p_entcple] = plot_mesure('EntCple',violet, values_t); % entropie of each couple of number
legend(p_entcple,'Entropie couples','Location',leng_loc)


f2 = figure; set(f2,'color',[1 1 1]);
title ('Quantifier Aléatoire (2)') 
set(f2,'Units', 'normalized', 'Position',fposition);

subplot(2,1,1,'Fontsize',fontsize)
[p_mean, p_var, p_ent, p_moydist, p_vardist, p_entcple] = plot_mesure('Mean',orange, values_t); % mean number
legend(p_mean,'Variance','Location',leng_loc)
subplot(2,1,2,'Fontsize',fontsize)
[p_mean, p_var, p_ent, p_moydist, p_vardist, p_entcple] = plot_mesure('MoyDist',gris, values_t); % Mean distance between two succesiv numbers 
legend(p_moydist,'Distance moyenne','Location',leng_loc)



end