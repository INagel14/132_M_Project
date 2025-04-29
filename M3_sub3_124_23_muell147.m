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
%% ____________________
%% INITIALIZATION
Vf = max(SpeedClean);
cleanMean = movmean(SpeedClean, 40);  % Apply moving average filter to smooth the data

vixdata = TimeClean(1:round(TimeAcc));  % x data before acceleration
viydata = SpeedClean(1:round(TimeAcc));  % y data before acceleration

finaly = SpeedClean(round(TimeAcc):end);  % y/speed values of data after acceleration
finalx = TimeClean(round(TimeAcc):end);  % x/time values of data after acceleration

slope_threshold = 0.01;  % Value to determine flatness (more strict)
Window = 375;  % Sliding window for slope calculation
timeLength = length(finalx);  % Total length of time data after acceleration

slope = zeros(1, timeLength - Window);  % Pre-allocate slope vector
flat_indices = [];  % Initialize array to store indices of flat areas

%% ____________________
%% CALCULATIONS

% Calculate slope for the entire data range
for idx = (Window + 1):timeLength
    % Calculate change in Y (speed) and X (time)
    changeY = SpeedClean(idx) - SpeedClean(idx - Window);
    changeX = TimeClean(idx) - TimeClean(idx - Window);
    slope(idx - Window) = changeY / changeX;
end

% Find all instances where slope is less than the threshold (flat regions)
for idx = 1:length(slope)
    if slope(idx) < slope_threshold
        flat_indices = [flat_indices, idx];  % Append the index where slope becomes flat
    end
end

% Determine the final velocity by averaging the last segment of flat data
if ~isempty(flat_indices)
    avgFinalStart = flat_indices(end) + Window - 1;  % Use the last flat index to start final velocity
    finalvelocityVals = finaly(avgFinalStart:end);  % Extract final velocity data
    Vf = mean(finalvelocityVals);  % Calculate the average final velocity
else
    Vf = NaN;  % If no flat region is found, return NaN (or handle accordingly)
end

% Calculate the initial velocity as the mean of the data before acceleration
Vi = mean(viydata);

%% ____________________
%% FORMATTED TEXT/FIGURE DISPLAYS
fprintf('The initial velocity is %.3f\n', Vi);
fprintf('The final velocity is %.3f\n', Vf);

end


%% ____________________
%% ACADEMIC INTEGRITY STATEMENT
% We have not used source code obtained from any other unauthorized
% source, either modified or unmodified. Neither have we provided
% access to my code to another. The program we are submitting
% is our own original work.