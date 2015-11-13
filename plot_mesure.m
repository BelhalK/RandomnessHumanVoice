function [p_mean, p_var, p_ent, p_moydist, p_vardist, p_entcple] = plot_mesure(variable,color,vecteur)

fontsize = 20;
Xlabel = 'N° Fenêtre';
LW =2;
p_mean = 0; 
p_var = 0; 
p_ent = 0;
p_moydist=0;
p_vardist=0;
p_entcple=0;

if (strcmp(variable, 'Mean')) 
    p_mean = plot(vecteur(1,:),'LineWidth',LW,'Color',color);
    if max(vecteur(1,:)) ~= 0
    set(gca,'ylim',[0,max(vecteur(1,:))+mean(vecteur(1,:))*0.1], 'xlim', [0,length(vecteur(1,:))])
    end
    xlabel('Variance')
    title(variable)
end

if (strcmp(variable, 'Var')) 
    p_var = plot(vecteur(2,:),'LineWidth',LW,'Color',color);
    if max(vecteur(2,:)) ~= 0
    set(gca,'ylim',[0,max(vecteur(2,:))+mean(vecteur(2,:))*0.1], 'xlim', [0,length(vecteur(1,:))])
    end
    xlabel(Xlabel)
    ylabel(variable)
    title(variable)
end

if (strcmp(variable, 'Ent')) 
    p_ent = plot(vecteur(3,:),'LineWidth',LW,'Color',color);
    if max(vecteur(3,:)) ~= 0
    set(gca,'ylim',[0,max(vecteur(3,:))+mean(vecteur(3,:))*0.1], 'xlim', [0,length(vecteur(1,:))])
    end
    xlabel(Xlabel)
    ylabel(variable)
    title(variable)
end

if (strcmp(variable, 'MoyDist')) 
    p_moydist = plot(vecteur(4,:),'LineWidth',LW,'Color',color);
    if max(vecteur(4,:)) ~= 0
    set(gca,'ylim',[0,max(vecteur(4,:))+mean(vecteur(4,:))*0.1], 'xlim', [0,length(vecteur(1,:))])
    end
    xlabel(Xlabel)
    ylabel(variable)
    title(variable)
end

if (strcmp(variable, 'VarDist')) 
    p_vardist = plot(vecteur(5,:),'LineWidth',LW,'Color',color);
    if max(vecteur(5,:)) ~= 0
    set(gca,'ylim',[0,max(vecteur(5,:))+mean(vecteur(5,:))*0.1], 'xlim', [0,length(vecteur(1,:))])
    end
    xlabel(Xlabel)
    ylabel(variable)
    title(variable)
end

if (strcmp(variable, 'EntCple')) 
    p_entcple = plot(vecteur(6,:),'LineWidth',LW,'Color',color);
    if max(vecteur(6,:)) ~= 0
    set(gca,'ylim',[0,max(vecteur(6,:))+mean(vecteur(6,:))*0.1], 'xlim', [0,length(vecteur(1,:))])
    end
    xlabel(Xlabel)
    ylabel(variable)
    title(variable)
end
end