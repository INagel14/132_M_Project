function [Vi, Vf]=  M4_sub3_124_23_muell147(TimeClean, SpeedClean, TimeAcc)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ENGR 132
%
% Subfunction 4- finding initial and final velocities, testing function call
% Function Call
% [Vf, Vi]=  M4_sub3_124_23_muell147(TimeClean, SpeedClean, TimeAcc)
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
%   Assignment:     M4, Problem xx
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

viydata = SpeedClean(1:round(TimeAcc));  % y data before acceleration

finaly = SpeedClean(round(TimeAcc):end);  % y/speed values of data after acceleration
finalx = TimeClean(round(TimeAcc):end);  % x/time values of data after acceleration

slope_threshold = -0.01;  % Value to determine flatness (more strict)
Window = 375;  % Sliding window for slope calculation
timeLength = length(finalx);  % Total length of time data after acceleration

slope = zeros(1, timeLength - Window);  % Pre-allocate slope vector
flat_points = [];  % Initialize array to store indices of flat areas

%% ____________________
%% CALCULATIONS

% Calculate slope for the entire data range
for idx = (Window + 1):timeLength
    % Calculate change in Y (speed) and X (time)
    changeY = SpeedClean(idx) - SpeedClean(idx - Window);
    changeX = TimeClean(idx) - TimeClean(idx - Window);
    slope(idx - Window) = changeY / changeX;
end



% START OF IMPROVEMENT #1 (Use multiple slope points, not just one)

% Go through each point
for idx = 1:length(slope)
    % Find where the slope is less than the set threshold
    if slope(idx) < slope_threshold
        % Add to index if it is a flat spot
        flat_points = [flat_points, idx];  
    end
end

% If the vector of flat points is not empty
if ~isempty(flat_points)
    % Take the very last point of the flat points (adjust for window)
    avgFinalStart = flat_points(end) + Window - 1;  
    % Create new vector of the SpeedClean data from that point to the end
    finalvelocityVals = finaly(avgFinalStart:end);  
    % Take the mean of all those points to approximate the final velocity
    Vf = mean(finalvelocityVals);
else
    % Output error message
    % (Useful for testing (i.e your slope threshold is too strict))
    Vf = NaN; 
end

% END OF IMPROVEMENT #2






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