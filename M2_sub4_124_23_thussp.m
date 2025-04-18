function[Tau] = M2_sub4_124_23_thussp(x,y,Vf,yL, TimeAcc)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ENGR 132 
% Program Description 
%This function will find the point at which the object begins to accelerate
%and find the time constant of the model
% Function Call
%M2_sub4_124_23_thussp()
%
% Input Arguments
% Velocity data and final velocity
%
% Output Arguments
%time constant
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

var = 0;
indx = 1;
tolerance = 0.25;

%% ____________________
%% CALCULATIONS
%find y of tau
 y_tau = yL + 0.632 * (Vf - yL);

while(var == 0)

    if y_tau <= (y(indx) + tolerance) && y_tau >= (y(indx) - tolerance)
        Tau = x(indx) - TimeAcc;
        var = 1;
    end
    indx = indx +1;
end

%  %find the closes y value to that in the data
%  [~, apprxYTauIdx] = min(abs(data(2,:) - y_tau));
% %find the x value of that and then subtract ts to get tau
% Tau = data(apprxYTauIdx,1) - TimeAcc;
fprintf('Tau equals: %0.2f\n',Tau);

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



