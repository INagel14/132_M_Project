function [Vi, Vf]=  M2_sub3_124_23_muell147(TimeClean, SpeedClean, TimeAcc)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ENGR 132
%
% Subfunction 4- finding initial and final velocities, testing function call
% Function Call
% [Vf, Vi]=  M1B_sub3_124_23_muell147(TimeClean, SpeedClean, TimeAcc)
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

change_line= abs(SpeedClean(2:end)-SpeedClean(1:end-1)); %finding the difference between side by side points

for y= 1:length(change_line) 
     if change_line(y) < slope_threshold && index == 0
         flat_indices = [flat_indices, y];
         index= 1;
     end
end

Vfstart_index = flat_indices(1) + 1; %identifying start point of data
Vfdata = cleanMean(Vfstart_index:end); % creating vector of data for final velocity


Vi= mean([lasty, firsty]); % averaging final and intial y values to find initial velocity
Vf= mean(Vfdata);


% %finding start of flattened curve after acceleration part of curve
% change_line= abs(finaly(2:end)-finaly(1:end-1)); %finding the difference between side by side points
% flat_indices= []; % empty vector to store indice(s) where slope flattens
% 
% %finding when curve flattens
% for y= 1:length(change_line) 
%     if change_line(y) < slope_threshold && index == 0
%         flat_indices = [flat_indices, y];
%         index= 1;
%     end
% end
% 
% 
% % Finding final velocity
% Vfstart_index = flat_indices(1) + 1; %identifying start point of data
% Vfdata = finaly(Vfstart_index:end); % creating vector of data for final velocity
% Vf= mean(Vfdata); % averaging for final velocity
% 
% %% ____________________
% %% FORMATTED TEXT/FIGURE DISPLAYS
fprintf('The initial velocity is %.3f\n', Vi)
fprintf('The final velocity is %.3f\n', Vf)
% 
% %% ____________________
% %% RESULTS
fprintf('Data successfully passed to subfunction 3 programmed by Elizabeth Mueller.\n')


% % function [Vi, Vf] = M2_sub3_124_23_muell147(TimeClean, SpeedClean, TimeAcc)
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % ENGR 132
% %
% % Subfunction 4- finding initial and final velocities, testing function call
% % Function Call
% % [Vf, Vi]=  M1B_sub3_124_23_muell147(TimeClean, SpeedClean, TimeAcc)
% %
% % Input Arguments
% % TimeClean (variable name for Y data that Skyler cleaned)
% % SpeedClean (variable name for Y data that Skyler cleaned)
% % TimeAcc (variable name for start time that Patrick found)
% %
% % Output Arguments
% % Vf (final velocity I calculated)
% % Vi (initial velocity I calculated)
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 
% %% ____________________
% %% INITIALIZATION
% 
% vixdata = TimeClean(:,1:round(TimeAcc)); % x data before acceleration
% viydata = SpeedClean(:, 1:round(TimeAcc)); % y data before acceleration
% 
% finaly = SpeedClean(:, round(TimeAcc):end); % y/speed values after acceleration
% finalx = TimeClean(:,round(TimeAcc):end); % x/time values after acceleration
% 
% slope_threshold = 0.0001; % Value that makes sure slope is close to 0
% index = 0; % Setting index for determining when flattened curve starts
% 
% %% ____________________
% %% CALCULATIONS
% 
% % Finding linear model of start to acceleration time
% linstart = polyfit(vixdata, viydata, 1); 
% Vimodel = linstart(1) * vixdata + linstart(2);
% 
% % Initial velocity (slope of the initial linear fit)
% Vi = linstart(1);
% 
% % Apply a moving average filter to smooth the final velocity data
% window_size = 40; % Set the window size for the moving average filter
% smoothed_finaly = movmean(finaly, window_size);
% 
% % Finding the change in the smoothed curve to detect flattening
% change_line = abs(smoothed_finaly(2:end) - smoothed_finaly(1:end-1));
% flat_indices = find(change_line < slope_threshold);
% 
% % If no flat region is found, try using a smaller threshold or different smoothing technique
% if isempty(flat_indices)
%     slope_threshold = 0.02;  % Try a smaller threshold if no flat region is found
%     smoothed_finaly = movmean(finaly, window_size);
%     change_line = abs(smoothed_finaly(2:end) - smoothed_finaly(1:end-1));
%     flat_indices = find(change_line < slope_threshold);
% end
% 
% % Selecting the start of the flat region to calculate final velocity
% if ~isempty(flat_indices)
%     Vfstart_index = flat_indices(1) + 1;
%     Vfdata = finaly(Vfstart_index:end);  % Use original data or smoothed data
% else
%     % If no flattening, take the entire final segment
%     Vfdata = finaly;
% end
% 
% % Final velocity calculation
% Vf = mean(Vfdata);
% 
% %% ____________________
% %% FORMATTED TEXT/FIGURE DISPLAYS
% fprintf('The initial velocity is %.3f\n', Vi)
% fprintf('The final velocity is %.3f\n', Vf)
% 
% %% ____________________
% %% RESULTS
% fprintf('Data successfully passed to subfunction 3 programmed by Elizabeth Mueller.\n')


%% ____________________
%% ACADEMIC INTEGRITY STATEMENT
% We have not used source code obtained from any other unauthorized
% source, either modified or unmodified. Neither have we provided
% access to my code to another. The program we are submitting
% is our own original work.



