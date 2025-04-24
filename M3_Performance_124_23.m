function[] = M3_Performance_124_23(TimeAcc, Tau, Vi, Vf)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ENGR 132 
% Run the skeleton function that runs all the functions
%
% Function Call
% [] = M3_Performance_124_23()
%
% Input Arguments
% None
%
% Output Arguments
% None
%
% Assignment Information
%   Assignment:     M3
%   Team ID:        124-23
%   Academic Integrity:
%     [N/A] We worked with one or more peers but our collaboration
%        maintained academic integrity.



% 
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% ____________________
%% INITIALIZATION

% Create boundary variables for the left and right bound
t = [0:30];
t_s_left = 4.50;
t_s_right = 6.00;
tau_l = 1.26;
tau_r = 3.89;
y_L_left = 1.10;
y_L_right = -0.90;
y_h_left = 25.82;
y_h_right = 23.36;

% Create blank vectors for graphing
y_left = zeros(1,30);
y_right = zeros(1,30);


%% ____________________
%% CALCULATIONS
% Calculate the left bound graph line
for i = t
    if i >= 0 && i <= t_s_left
        y_left(i+1) = y_L_left;
    else 
        y_left(i+1) = y_L_left + (1 - exp((-1).*((i-t_s_left)./(tau_l)))).*(y_h_left - y_L_left);
    end 
end

% Calculate the right bound graph line

for i = t
    if i >= 0 && i <= t_s_right
        y_right(i+1) = y_L_right;
    else 
        y_right(i+1) = y_L_right + (1 - exp((-1).*((i-t_s_right)./(tau_r)))).*(y_h_right - y_L_right);
    end 
end


  calcLine = zeros(1,30);
for idx = t
    if idx >= 0 && idx <= TimeAcc
        calcLine(idx+1) = Vi;
    else 
        calcLine(idx+1) = Vi + (1 - exp((-1).*((idx-TimeAcc)./(Tau)))).*(Vf - Vi);
    end 
end

figure; 
plot(t, calcLine);
hold on
plot(t,y_right);
plot(t,y_left);
legend('Data Set', 'Right Bound', 'Left Bound')

%% ____________________
%% FORMATTED TEXT/FIGURE DISPLAYS



%% ____________________
%% RESULTS


%% ____________________
%% ACADEMIC INTEGRITY STATEMENT
% We have not used source code obtained from any other unauthorized
% source, either modified or unmodified. Neither have we provided
% access to my code to another. The program we are submitting
% is our own original work.



