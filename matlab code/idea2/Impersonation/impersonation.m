clc
clear all
close all
n = 40;                    % number of rounds
%% 
counter = zeros(1,n);
alpha = [0.25 0.5 0.75 1];
for k = 1:length(alpha)

%h = waitbar(0,'Please wait...');
% for j=1:10^9
%     
%                 
%                 v = rand(2,n) > 0.5;               
%                 c = rand(1,n) > 0.5;              
%                 p = rand(1,n) > alpha(k);    
%                 
%                 for i = 1:n
%                     if p(i) == 0
%                         if c(i) == (rand >0.5)
%                             counter(i) = counter(i)+1;
%                         elseif  v((rand>0.5)+1,i) == (rand>0.5)
%                             counter(i) = counter(i)+1;
%                         else
%                             break
%                         end
%                     else
%                         if (rand>0.5) == v(c(i)+1,i)
%                             counter(i) = counter(i)+1;
%                         else
%                             break
%                         end
%                     end
%                 end
% end
FAR_sim(k,:) = counter/j;
counter = zeros(1,n);
%%
FAR_thr(k,:) = (1/2 ).^[1:n];
end
round = [1:n];
%semilogy(round,FAR_sim(1,:),'-r',round,FAR_sim(2,:),'-g',round,FAR_sim(3,:),'-k',round,FAR_sim(4,:),'-b')
%axis([0 40 10^-20 1 ])
% grid on
% hold on
semilogy(round,FAR_thr(1,:),'-pr')
axis([0 40 10^-20 1 ])
grid on

title('FAR against impersonation attack with 10^8 iteration','color','b')
xlabel('number of rounds','color','r')
ylabel('FAR against impersonation attack','color','r')
legend('alpha = 0.25','alpha = 0.5','alpha = 0.75','alpha = 1','simulation')


               