clc
clear all
close all
n = 40;              % number of rounds
%%-------------------mutual---------simulation-------------------------
counter = zeros(1,n);
%h = waitbar(0,'1','name','Please wait...');
for j=1:10^4
         
                w = rand(1,n/2) > 0.5;              % response of predefined challenge
                v = rand(2,n/2) > 0.5;              % response of random challenge
                D = rand(1,n/2) > 0.5;              % sequence of predefined challenge
                CRprime = rand(1,2*n) > 0.5;      % produce the random challenge and response by adverasary
                
                for i=1:2:n
                    
                    if CRprime(i) == D((i+1)/2)
                        counter(i) = counter(i)+1;
                    else
                        break
                    end
                    i = i+1;
                    if CRprime(i) == v((rand>0.5)+1,i/2)
                        counter(i) = counter(i)+1;
                    else
                        break
                    end
                    
                end
   % waitbar(j /(10^8),h,[num2str(j/(10^6)) '%'])
                
end
%close(h)
%%-----------------plot-------------------------------------------------
FAR_sim = counter/j;
round = [1:n];
semilogy(round,FAR_sim,'r')
axis([0 40 10^-20 1 ])
grid on
hold on
%%------------------------------ theorical--------------------------------
FAR_thr = (1/2).^[1:n];
semilogy(round,FAR_thr,'bp')
axis([0 40 10^-20 1 ])
grid on

title('FAR against mafia fraud with 10^8 iteration(mutual)','color','b')
xlabel('number of rounds','color','r')
ylabel('FAR against mafia fraud','color','r')
legend('simulation','theorical')



