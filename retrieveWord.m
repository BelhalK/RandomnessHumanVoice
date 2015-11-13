function [ startBloc, endBloc, z ] = ...
retrieveWord( y, lengthFrame, energyThreshold, fs, minimalLength, maxGap)

%   y = signal audio

%   lengthFrame = longueur d'une frame

%   energyThreshold = energy minimale à partir de laquelle un chiffre est
%   détecté dans le signal

%   fs = fréquence du signal audio

%   minimalLength = longueur minimale requise pour un chiffre énoncé

%   maxGap = paramètre auxilliaire

%Cherche dans le signal audio des blocs de parole

% Découpage du signal en frames ('lengthFrame' ms) 
frame = lengthFrame/1000;
fr = fs*frame;
nb_frames = floor(length(y)/fr); % Nombre de frames dans le signal

% Calcul de l'énergie sur chaque frame
energy = zeros(nb_frames,1);
for i=1:nb_frames
    energy(i,1) = sum(power(y((i-1)*fr+1:i*fr),2));
end

% Utilisation de l'énergie pour trouver les frames pertinentes
k = 1;
someFrame = false;
startWord = zeros(1,1);
endWord = zeros(1,1);
for i=2:nb_frames-10 
    if (energy(i,1)>energyThreshold && ~someFrame)
        someFrame = true;
        startWord(k,1) = i;
    end
    if (energy(i,1)<energyThreshold)
        if (someFrame)
            nonAWord = true;       
            for sizeGap = 1:maxGap
                if (energy(i+sizeGap,1)>energyThreshold)
                    nonAWord = false;
                end
            end  
            if (nonAWord)
                endWord(k,1) = i;
                k = k+1;
                someFrame = false;
            end
        end
    end
end

% Enlever les blocs dont la longueur est trop petite
startBloc = zeros(1,1);
endBloc = zeros(1,1);
k = 0;
for i=1:length(startWord)
    if (endWord(i,1)-startWord(i,1)>=minimalLength)
        k = k+1;
        startBloc(k,1) = startWord(i,1);
        endBloc(k,1) = endWord(i,1);
    end
end

% Retourner les débuts et fin de chaque mot
for i=1:length(startBloc)
    startBloc(i,1) = fr*(startBloc(i,1)-1)+1;
    endBloc(i,1) = fr*endBloc(i,1);
end

% Mettre à la même échelle l'ensemble des chiffres prononcés
z = zeros(length(y),1);
for i=1:length(startBloc)
    z(startBloc(i,1):endBloc(i,1)) = y(startBloc(i,1):endBloc(i,1));
end
    
end

