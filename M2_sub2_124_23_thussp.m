function[TimeAcc,Tau] = M2_sub2_124_23_thussp(data)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ENGR 132 
% Program Description 
%This function will find the point at which the object begins to accelerate
%and find the time constant of the model
% Function Call
%M2_sub3_124_23_thussp()
%
% Input Arguments
% Velocity data
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
did you complete the assignment information? delete this line if yes
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% ____________________
%% INITIALIZATION
speed = data(2,:);

%% ____________________
%% CALCULATIONS
index = 0;
for time = data(1,:)
    index = index+1;
    if abs(speed(index+1)-speed(index)) > 1.2 %searches the data for a point 
%where the velocity increases by more than 1.2 since the last point
        TimeAcc = time(index); %TimeAcc is the time of acceleration (T_s)
    end
end

yL = data(2,TimeAcc); %assigns YL aka original velocity at acceleration

Tau = 


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



