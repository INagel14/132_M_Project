function[Tau] = M4_sub4_124_23_thussp(x,y,Vf, TimeAcc)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ENGR 132 
% Program Description 
%This function will find the point at which the object begins to accelerate
%and find the time constant of the model
% Function Call
%M4_sub4_124_23_thussp()
%
% Input Arguments
% Velocity data and final velocity
%
% Output Arguments
%time constant
%
% Assignment Information
%   Assignment:     M03, Problem 3
%   Team member:    Patrick Thuss, thussp@purdue.edu 
%   Team ID:        124-23
%   Academic Integrity:
%     [] We worked with one or more peers but our collaboration
%        maintained academic integrity.
%     Peers we worked with: Name, login@purdue [repeat for each]
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% ____________________
%% INITIALIZATION


%data(:,1)= x; %initializes independent val (time) (seconds)
%data(:,2)= y; %initializes dependent val (speed)

%var = 0; %boolean variable marked as false
%tolerance = 0.25; %tolerance for velocity change
    
%% ____________________
%% CALCULATIONS
% Calculate 63.2% of the final velocity

targetVal = 0.632*Vf;

indx = find(y >= targetVal, 1); %find when speed is greater than 
% 63.2 of final V

Tau = x(indx)-TimeAcc; %Calculate Tau

%% ____________________
%% FORMATTED TEXT/FIGURE DISPLAYS
fprintf('The value for Tau is: %0.2f\n',Tau); %print tau val
%print tau

%% ____________________
%% RESULTS


%% ____________________
%% ACADEMIC INTEGRITY STATEMENT
% We have not used source code obtained from any other unauthorized
% source, either modified or unmodified. Neither have we provided
% access to my code to another. The program we are submitting
% is our own original work.



