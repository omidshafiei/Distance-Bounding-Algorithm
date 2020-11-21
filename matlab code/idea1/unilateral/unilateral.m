clc
clear all
close all
n = 40;                    % number of rounds
%% ------------------------unilateral------simulation
counter = zeros(1,n);
%h = waitbar(0,'Please wait...');
for j=1:10^8
    
                w = rand(1,n) > 0.5;               % response of predefined challenge
                v = rand(2,n) > 0.5;               % response of random challenge
                D = rand(1,n) > 0.5;               % sequence of predefined challenge
                CRprime = rand(1,2*n) > 0.5;       % produce the random challenge and response by adverasary
                flag(1) = 0;                       


for i = 1:2:n
    
if flag((i+1)/2) == 0
    if CRprime(i) == D((i+1)/2)
        flag(i) = 0;
        counter(i) = counter(i)+1;
    else
        flag(1:n) =1;
        if w((i+1)/2) == (rand > 0.5)
            counter(i) = counter(i)+1;
        else
            break
        end
    end
else
    if w((i+1)/2) == (rand > 0.5)
        counter(i) = counter(i)+1;
    else
        break
    end
end
if flag(i) == 0
    i = i+1;
     if CRprime(i) == v((rand > 0.5)+1,i)
         flag(i/2 + 1) = 0;
     else
         flag(1:n) = 1;
     end
end
end
%waitbar(j / 10^8,h,[num2str(j/10^8*100) '%'])
end
%close(h)
%%-----------------plot--------------------------------------------------
FAR_sim =  (circshift(counter,[0 1])+counter)/j;
round = [1:n];
semilogy(round,FAR_sim,'r')
axis([0 40 10^-20 1 ])
grid on
%%-----------------------unilateral-------theorical-----------------------
for nn = 1:2:40
    
        for ii=1:nn
             s(ii) = ((1/2)^(ii))*((1/2)^(floor(nn/2)-floor(ii/2)+1));
        end
        FAR_thr(nn) = (1/2)^nn+sum(s);
end
for nn = 2:2:40
        for jj=1:nn
             ss(jj) = ((1/2)^(jj))*((1/2)^(floor(nn/2)-floor(jj/2)));
        end
  FAR_thr(nn) = (1/2)^nn+sum(ss);
end
%% -----------------------plot--------------------------------------------
hold on
round = [1:nn];
semilogy(round,FAR_thr,'bp')
axis([0 40 10^-20 1 ])
grid on
title('FAR against mafia fraud with 10^8 iteration','color','b')
xlabel('number of rounds','color','r')
ylabel('FAR against mafia fraud','color','r')
legend('simulation','theorical')
%%------------------------------------------------------------------------