% Script principal
% Rassemble l'ensemble des fonctions develop�es

%% Lecture du fichier audio qui contient les chiffres qui ont �t� �nonc�s
% Lecture et segmentation du signal 

% Lecture
[y,~] = audioread('essai2.3gp');
% Ajout d'1 seconde de silence au signal
y = [y; zeros(40000, 1)];

% R�cup�rer les frames de d�but et de fin des chiffres �nonc�s
[startWord, endWord, z] = retrieveWord(y, 50, 0.5, 44100, 2, 4);

%% Reconnaissance des chiffre

% Calcul inputs r�seau de neurones
coff = zeros(39, length(startWord));
for i=1:length(startWord)
    coff(:,i) = COMPUTE_COEFF(y(startWord(i,1):endWord(i,1)));
end

% Pour un chiffre �nonc� calculer les probabilit�s pour ce chiffre 
% d'�tre un "0", un "1" et ainsi de suite (output du r�seau de neurones
% approximativement entre 0 et 1)
numbers = zeros(10,length(startWord));
numbers(1,:) = net0(coff);
numbers(2,:) = net1(coff);
numbers(3,:) = net2(coff);
numbers(4,:) = net3(coff);
numbers(5,:) = net4(coff);
numbers(6,:) = net5(coff);
numbers(7,:) = net6(coff);
numbers(8,:) = net7(coff);
numbers(9,:) = net8(coff);
numbers(10,:) = net9(coff);

numbers_final = zeros(length(startWord),1);
for i=1:length(startWord)
    [~,numbers_final(i,1)] = max(numbers(:,i));
    numbers_final(i,1) = numbers_final(i,1) -1;
end

%% Affichage de l'�volution des mesures d'al�atoire
measure_rand(numbers_final);