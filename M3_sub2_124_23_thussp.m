function[TimeAcc,yL] = M3_sub2_124_23_thussp(x,y)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ENGR 132 
% Program Description 
%This function will find the point at which the object begins to accelerate
%and find the time constant of the model
% Function Call
%M3_sub2_124_23_thussp()
%
% Input Arguments
% Velocity data and final velocity
%
% Output Arguments
%Marked time of beginning accleration and time constant value
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
data = [x, y]; %creates data vector
found = false; %marks found for accelertion point as false
TimeAcc = NaN; %initializes timeAcc as non number incase not found
yL = NaN; %initializes yL as non number incase not found
indx = 1; %initializes index

slope_threshold = 0.7;

% Found to be best value (tested 55, 60, 65, 70
Window = 100;
%% ____________________
%% CALCULATIONS


timeLength = length(y); % makes vector for all time values
slope = zeros(1, timeLength-Window); % makes a vector to iterate through slope in function
% Find Vf

for idx = (Window+1):timeLength
    % Find Y2 - Y1d
    changeY = y(idx) - y(idx-Window);

    % Find X2 - X1
    changeX = x(idx) - x(idx-Window);

    slope(idx-Window) = changeY/changeX; %assignes slope

end

% Find the index for the final velocity
Index = find(slope > slope_threshold, 1);

% Go back one index to determine the actual spot
TimeAcc_index = Index + Window-1;

TimeAcc = x(TimeAcc_index); %actual time at x using index

yL = y(TimeAcc_index); %assigns yL as the velocity at timeAcc

fprintf('The time of acceleration is: %0.2f\n',TimeAcc); %prints time acc



%% ____________________
%% ACADEMIC INTEGRITY STATEMENT
% We have not used source code obtained from any other unauthorized
% source, either modified or unmodified. Neither have we provided
% access to my code to another. The program we are submitting
% is our own original work.



