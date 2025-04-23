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

vixdata= TimeClean(1:round(TimeAcc)); % x data before acceleration
viydata= SpeedClean(1:round(TimeAcc)); % y data before acceleration

finaly= SpeedClean(round(TimeAcc):end); % y/speed values of data after acceleration
finalx= TimeClean(round(TimeAcc):end); % x/time values of data after acceleration

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



