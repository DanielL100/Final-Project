%%%%%%  Input Parameters  %%%%%%%
T=ts3; % define on workspace ts3=1/1024;
u=out.TSABAD_out_log(2:end,2);
y=out.TSABAD_out_log(2:end,3);

M=8*400;                                %%  With M specified,a smoothing operation is performed on the raw spectral estimates.
N=2^10;                              %% The transfer function is estimated at 128 equally spaced frequencies
                                             %%  between 0 (excluded) and
                                             %%  pi. This number can be changed  to N. 
%%%%%%   Calculated Parameters  %%%%%%%
Ncap=length(u);
Yd = zeros(N,1,1);
Ud = zeros(N,1);
nfft = 2*ceil(Ncap/N)*N;
l= nfft;
M1=fix(l/M);sc=l/(2*N);
freqs = [1:N]'*pi/N/T/(2*pi);  %%% Hz  %%%

%%%%%%   Transfer Functin Calculation  %%%%%%%
Y = fft(y,nfft);
U = fft(u,nfft);
Y=[Y(l-M1+2:l,:);Y];
U=[U(l-M1+2:l,:);U];
Y1(:,1,1)=Y(:,1).*conj(U(:,1));
Y = Y1;
clear Y1; 
U = abs(U).^2;
         if M1>1,
            ha = .54 - .46*cos(2*pi*(0:M1)'/M1);
            ha=ha/(norm(ha)^2);
            Y=filter(ha,1,Y);
            U=filter(ha,1,U);
        end
Yd=Yd+Y(M1+fix(M1/2)+sc:sc:M1+fix(M1/2)+l/2,:,:);
Ud=Ud+U(M1+fix(M1/2)+sc:sc:l/2+M1+fix(M1/2),:);
spe =[];
zer = find(abs(Ud(:,1))==0);
Ud(zer,1) = ones(length(zer),1); 
resp(1,1,:) =  Yd(:,1,1)./Ud(:,1);
resp(1,1,zer)=inf*ones(length(zer),1);  

%%%%%%   Transfer Functin Calculation  %%%%%%%
i=find(freqs>160); 
i=min(i); % Finds first index of frequency which larger than 500[Hz] 
f=freqs(1:i);
c_l=reshape(resp(1:i),i,1);
o_l=c_l./(1-c_l);

%%%%%%   Close-Loop--Magnitude  %%%%%%%
figure(20)
orient(figure(20),'tall')
subplot(2,1,1)
semilogx(f,20*log10(abs(c_l)),'b');
title('Gts - Transfer Function in Elevation - Close Loop')
xlabel('Hz');
ylabel('Magnitude (dB)');
grid
%%%%%%   Close-Loop--Phase  %%%%%%%
subplot(2,1,2)
semilogx(f,(((angle(c_l))*180/pi)),'b');
xlabel('Hz');
ylabel('Phase (deg)');
grid
% o2i1x=freqs;
% o2i1=squeeze(resp);
% figure
% mbode(o2i1x,o2i1)