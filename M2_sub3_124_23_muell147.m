function [Vi, Vf]=  M2_sub3_124_23_muell147(TimeClean, SpeedClean, TimeAcc)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ENGR 132
%
% Subfunction 4- finding initial and final velocities, testing function call
% Function Call
% [Vf, Vi]=  M2_sub3_124_23_muell147(TimeClean, SpeedClean, TimeAcc)
%
% Input Arguments
% TimeClean (variable name for Y data that skyler cleaned)
% SpeedClean (variable name for Y data that skyler cleaned)
% TimeAcc (variable name for start time that Patrick found)
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
Vf= max(SpeedClean);
cleanMean = movmean(SpeedClean,40);

vixdata= TimeClean(:,1:round(TimeAcc)); % x data before acceleration
viydata= cleanMean(:, 1:round(TimeAcc)); % y data before acceleration

finaly= cleanMean(:, round(TimeAcc):end); % y/speed values of data after acceleration
finalx= TimeClean(:,round(TimeAcc):end); % x/time values of data after acceleration

slope_threshold= 0.05; % value that makes sure slope is close to 0
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



% %% FORMATTED TEXT/FIGURE DISPLAYS
fprintf('The initial velocity is %.3f\n', Vi)
fprintf('The final velocity is %.3f\n', Vf)
% 
% %% ____________________
% %% RESULTS
fprintf('Data successfully passed to subfunction 3 programmed by Elizabeth Mueller.\n')


%% ____________________
%% ACADEMIC INTEGRITY STATEMENT
% We have not used source code obtained from any other unauthorized
% source, either modified or unmodified. Neither have we provided
% access to my code to another. The program we are submitting
% is our own original work.



