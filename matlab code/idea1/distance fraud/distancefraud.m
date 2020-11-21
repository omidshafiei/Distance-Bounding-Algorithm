clc
clear all
close all
n = 40;                    % number of rounds
%% ------------------------distance fraud------simulation
counter = zeros(1,n);
%h = waitbar(0,'Please wait...');
for j=1:10^8
    
                
                v = rand(2,n) > 0.5;               % response of random challenge
                
                
                for i=2:2:n
                    if v(1,i) == v(2,i)
                        counter(i) = counter(i)+1;
                    elseif (rand>0.5)==v((rand>0.5)+1,i)
                        counter(i) = counter(i)+1;
                    else
                        break
                    end
                end
      % waitbar(j / 10^8,h,[num2str(j/10^8*100) '%'])
end
%close(h)

FAR_sim = (circshift(counter,[0 1])+counter)/j;
FAR_sim(1)=1;

round = [1:n];
semilogy(round,FAR_sim,'r')
axis([0 40 10^-20 1 ])
grid on

% ------ theorical---------------------------
FAR_thr = (3/4).^(floor([1:n]/2));
%% plot-----------------------------------------------------------------
hold on
round = [1:n];
semilogy(round,FAR_thr,'bp')
axis([0 40 10^-20 1 ])
grid on
title('FAR against distance fraud with 10^8 iteration','color','b')
xlabel('number of rounds','color','r')
ylabel('FAR against distance fraud','color','r')
legend('simulation','theorical')
                    