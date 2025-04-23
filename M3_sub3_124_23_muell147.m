<<<<<<< HEAD:M2_sub3_124_23_muell147.m
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
cleanMean = movmean(SpeedClean,40); %cleaning y values

vixdata= TimeClean(:,1:round(TimeAcc)); % x data before acceleration
viydata= SpeedClean(:, 1:round(TimeAcc)); % y data before acceleration

finaly= SpeedClean(:, round(TimeAcc):end); % y/speed values of data after acceleration
finalx= TimeClean(:,round(TimeAcc):end); % x/time values of data after acceleration

slope_threshold= 0.01; % value that makes sure slope is close to 0
index= 0; %setting index for determing when flatenned curve starts


%% ____________________
%% CALCULATIONS
%Output = Input .* 3; %practicing subfunction

timeLength = length(finalx); % makes vector for all time values
slope = zeros(1, timeLength-4); % makes a vector to iterate through slope in function over multiple data points
% Find Vf

for idx = 5:timeLength
    % Find Y2 - Y1d
    changeY = finaly(idx) - finaly(idx-4);

    % Find X2 - X1
    changeX = finalx(idx) - finalx(idx-4);

    slope(idx-4) = changeY/changeX;

end

% Find the index for the final velocity
veloFinalIndex = find(slope < slope_threshold, 1);

% Go back one index to determine the actual spot
avgFinalStart = veloFinalIndex + 4;

finalvelocityVals = finaly(avgFinalStart:end);

Vf = mean(finalvelocityVals);




% Find Vi
Vi = mean(viydata);

% Change











%finding linear model of start to acceleration time
% linstart= polyfit(vixdata, viydata, 1); 
% Vimodel= linstart(1)* vixdata+ linstart(2);
% 
% lastx= vixdata(end); %finding last x value if needed for reference or graphing
% lasty= polyval(linstart, lastx); %finding last y value according to regression
% firsty= linstart(2); %first y value is y intercept-- velocity can't be negative
% firstx= 0; %first x value is at intercept
% 
% change_line= abs(SpeedClean(2:end)-SpeedClean(1:end-1)); %finding the difference between side by side points
% 
% for y= 1:length(change_line) 
%      if change_line(y) < slope_threshold && index == 0
%          flat_indices = [flat_indices, y];
%          index= 1;
%      end
% end
% 
% Vfstart_index = flat_indices(1) + 1; %identifying start point of data
% Vfdata = cleanMean(Vfstart_index:end); % creating vector of data for final velocity
% 
% 
% Vi= mean([lasty, firsty]); % averaging final and intial y values to find initial velocity
% Vf= mean(Vfdata);



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



=======
function [Vi, Vf]=  M3_sub3_124_23_muell147(TimeClean, SpeedClean, TimeAcc)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ENGR 132
%
% Subfunction 4- finding initial and final velocities, testing function call
% Function Call
% [Vf, Vi]=  M3_sub3_124_23_muell147(TimeClean, SpeedClean, TimeAcc)
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
%   Assignment:     M3, Problem xx
%   Team member:    Elizabeth Mueller, muell147@purdue.edu
%   Team ID:        124-23
%   Academic Integrity:
%     [N/A] We worked with one or more peers but our collaboration
%        maintained academic integrity.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% ____________________
%% INITIALIZATION

vixdata= TimeClean(:,1:round(TimeAcc)); % x data before acceleration
viydata= SpeedClean(:, 1:round(TimeAcc)); % y data before acceleration

finaly= SpeedClean(:,round(TimeAcc):end); % y/speed values of data after acceleration
finalx= TimeClean(:,round(TimeAcc):end); % x/time values of data after acceleration

slope_threshold = 0.001; % value that makes sure slope is close to 0
index= 0; %setting index for determing when flatenned curve starts

% Found to be most accurate value on 4/20/2025
Window = 450;

%% ____________________
%% CALCULATIONS
%Output = Input .* 3; %practicing subfunction

timeLength = length(finalx); % makes vector for all time values
slope = zeros(1, timeLength-4); % makes a vector to iterate through slope in function
% Find Vf

for idx = (Window+1):timeLength
    % Find Y2 - Y1d
    changeY = finaly(idx) - finaly(idx-Window);

    % Find X2 - X1
    changeX = finalx(idx) - finalx(idx-Window);

    slope(idx-Window) = changeY/changeX;

end

% Find the index for the final velocity
veloFinalIndex = find(slope < slope_threshold, 1);

% Go back one index to determine the actual spot
avgFinalStart = veloFinalIndex + Window;

finalvelocityVals = finaly(avgFinalStart:end);

Vf = mean(finalvelocityVals);


% Find Vi
Vi = mean(viydata);


% %% FORMATTED TEXT/FIGURE DISPLAYS
fprintf('The initial velocity is %.3f\n', Vi)
fprintf('The final velocity is %.3f\n', Vf)
% 
% %% ____________________
% %% RESULTS
%fprintf('Data successfully passed to subfunction 3 programmed by Elizabeth Mueller.\n')


%% ____________________
%% ACADEMIC INTEGRITY STATEMENT
% We have not used source code obtained from any other unauthorized
% source, either modified or unmodified. Neither have we provided
% access to my code to another. The program we are submitting
% is our own original work.



>>>>>>> a38a047b3f013a917072e6218aaea2faa2e127e4:M3_sub3_124_23_muell147.m
