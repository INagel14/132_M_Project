function[TimeAcc,Tau] = M2_sub2_124_23_thussp(x,y,Vf)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ENGR 132 
% Program Description 
%This function will find the point at which the object begins to accelerate
%and find the time constant of the model
% Function Call
%M2_sub2_124_23_thussp()
%
% Input Arguments
% Velocity data and final velocity
%
% Output Arguments
%Marked time of beginning accleration and time constant value
%
% Assignment Information
%   Assignment:     M02, Problem 3
%   Team member:    Patrick Thuss, thussp@purdue.edu 
%   Team ID:        124-23
%   Academic Integrity:
%     [] We worked with one or more peers but our collaboration
%        maintained academic integrity.
%     Peers we worked with: Name, login@purdue [repeat for each]
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% ____________________
%% INITIALIZATION
data(:,1)= x;
data(:,2)= y;

%% ____________________
%% CALCULATIONS
index = 0;
for time = data(:,1)
    index = index+1;
    if abs(y(index+1)-y(index)) > 1.2 %searches the data for a point 
%where the velocity increases by more than 1.2 since the last point
        TimeAcc = time(index); %TimeAcc is the time of acceleration (T_s)
    end
end

yL = data(TimeAcc,2); %assigns YL aka original velocity at acceleration

%find y of tau
 y_tau = yL + 0.632 * (Vf - yL);

 %find the closes y value to that in the data
 [~, apprxYTauIdx] = min(abs(data(2,:) - y_tau));
%find the x value of that and then subtract ts to get tau
Tau = data(apprxYTauIdx,1) - TimeAcc;


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



