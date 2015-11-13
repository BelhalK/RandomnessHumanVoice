function [ coeff ] = COMPUTE_COEFF( audio )
% Calcul de coeffecients pouvant servir à reconnaître un chiffre

% Fréquence d'acquisition du signal audio
fs = 44100;

% Calcul des MFCC
Tw = 25;           % analysis frame duration (ms)
Ts = 10;           % analysis frame shift (ms)
alpha = 0.97;      % preemphasis coefficient
R = [ 300 3700 ];  % frequency range to consider
M = 20;            % number of filterbank channels 
C = 13;            % number of cepstral coefficients
L = 22;            % cepstral sine lifter parameter
hamming = @(N)(0.54-0.46*cos(2*pi*[0:N-1].'/(N-1)));
MFCCs = mfcc( audio, fs, Tw, Ts, alpha, hamming, R, M, C, L );

% Calcul de coeffcients à partir des MFCCs
coeff = zeros(3*C,1);
m1 = floor(size(MFCCs,2)/3);
m2 = floor(2*size(MFCCs,2)/3);
m3 = size(MFCCs,2);

for i=1:C
    coeff(i,1) = mean(MFCCs(i,1:m1));
    coeff(i+C,1) = mean(MFCCs(i,m1:m2)); 
    coeff(i+2*C,1) = mean(MFCCs(i,m2:m3));
end
coeff = (coeff-mean(coeff))/var(coeff);


end

