function [Output]=  M1B_sub3_124_23_muell147(clean_data, accel_start)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ENGR 132
%
% Subfunction 4- finding initial and final velocities, testing function call
% Function Call
% [Vf, Vi]=  M1B_sub3_124_23_muell147(clean_data, accel_start)
%
% Input Arguments
% clean_data (variable name for data that skyler cleaned)
% accel_start (variable name for start time that Patrick found)
%
% Output Arguments
% Vf (final velocity I calculated)
% Vi (initial velocity I calculated)
%
% Assignment Information
%   Assignment:     M2, Problem xx
%   Team member:    Elizabeth Mueller, muell147@purdue.edu
%   Team ID:        124-23
%   Academic Integrity:
%     [N/A] We worked with one or more peers but our collaboration
%        maintained academic integrity.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% ____________________
%% INITIALIZATION
vixdata= TimeClean(:,1); % x data before acceleration
viydata= SpeedClean(:, 1:TimeAcc); % y data before acceleration

finaly= SpeedClean(:, TimeAcc:end); % y/speed values of data after acceleration
finalx= TimeClean(:,1); % x/time values of data after acceleration

slope_threshold= 0.1; % value that makes sure slope is close to 0
index= 0; %setting index for determing when flatenned curve starts

%% ____________________
%% CALCULATIONS
%Output = Input .* 3; %practicing subfunction

%finding linear model of start to acceleration time
linstart= polyfit(vixdata, viydata, 1); 
Vimodel= linstart(1)* vixdata+ linstart(2);

lastx= vixdata(end); %finding last x value if needed for reference or graphing
lasty= polyval(linstart, lastx); %finding last y value according to regression
firsty= linstart(2); %first y value is y intercept-- velocity can't be negative
firstx= 0; %first x value is at intercept

Vi= mean([lasty, firsty]); % averaging final and intial y values to find initial velocity

%finding start of flattened curve after acceleration part of curve
change_line= abs(finaly(2:end)-finaly(1:end-1)); %finding the difference between side by side points
flat_indices= []; % empty vector to store indice(s) where slope flattens

%finding when curve flattens
for y= 1:length(change_line) 
    if change_line(y) < slope_threshold && index == 0
        flat_indices = [flat_indices, y];
        index= 1;
    end
end

% Finding final velocity
Vfstart_index = flat_indices(1) + 1; %identifying start point of data
Vfdata = finaly(Vfstart_index:end); % creating vector of data for final velocity
Vf= mean(Vfdata); % averaging for final velocity

%% ____________________
%% FORMATTED TEXT/FIGURE DISPLAYS
fprintf('The initial velocity is %.3f\n', Vi)
fprintf('The final velocity is %.3f\n', Vf)

%% ____________________
%% RESULTS
fprintf('Data successfully passed to subfunction 3 programmed by Elizabeth Mueller.\n')

%% ____________________
%% ACADEMIC INTEGRITY STATEMENT
% We have not used source code obtained from any other unauthorized
% source, either modified or unmodified. Neither have we provided
% access to my code to another. The program we are submitting
% is our own original work.



