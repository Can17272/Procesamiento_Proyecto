Fs=0;
f_corte=0;
% Author: S. Disch
%ya_alt=0;
Delay=Width; % basic delay of input sample in sec
DELAY=round(Delay*Fs); % basic delay in # samples
WIDTH=round(Width*Fs); % modulation width in # samples

MODFREQ=f_corte/Fs; % modulation frequency in # samples
LEN=length(x); % # of samples in WAV-file
L=2+DELAY+WIDTH*2; % length of the entire delay
Delayline=zeros(L,1); % memory allocation for delay
y=zeros(size(x)); % memory allocation for output vector
for n=1:(LEN-1)
    M=MODFREQ;
    MOD=sin(M*2*pi*n);
    TAP=1+DELAY+WIDTH*MOD;
    i=floor(TAP);
    frac=TAP-i;
    Delayline=[x(n);Delayline(1:L-1)];
%---Linear Interpolation-----------------------------
    y(n,1)=Delayline(i+1)*frac+Delayline(i)*(1-frac);

end