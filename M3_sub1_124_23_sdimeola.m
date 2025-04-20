
function[TimeClean, SpeedClean] = M3_sub1_124_23_sdimeola(time, rawY)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ENGR 132
% Run subfunction 2 to clean the data.
%
% Function Call
% [TimeClean, SpeedClean] = M2_sub2_124_23_sdimeola(time, rawY)
%
% Input Arguments:
% time: uncleaned time data from imported csv.
% rawY: uncleaned speed data from imported csv.
%
% Output Arguments:
% TimeClean: Array of cleaned time data points
% SpeedClean: Array of cleaned speed data points
%
% Assignment Information
%   Assignment:     M2
%   Team member:    Skyler DiMeola, sdimeola@purdue.edu
%   Team ID:        124-23
%   Academic Integrity:
%     [N/A] We worked with one or more peers but our collaboration
%        maintained academic integrity.
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% ____________________
%% INITIALIZATION
TimeOg = time; % vector to hold function input for time
SpeedCompactOg = rawY; % vector to hold function input for speed

TimeClean = []; % empty vector to hold cleaned time data
SpeedClean = []; % empty vector to hold cleaned speed data

numX = numel(TimeOg); % variable to hold size of original data set
disp(numX); % Debug code
count = 0; % counter for loop iteration
numParse = 200; % Opperator to Designate Number of Elements being looked at
StdThreshold = 1; % Threshold for Standard Deviation

%% ____________________
%% CALCULATIONS
% For loop that iterates through 20 data points at time and takes a linear
% regression of those data points, removng any that fall outside the
% standard deviation.
for i = 1:numParse: (numX - numParse + 1)
    idx = i:i + numParse - 1;
    timeChunk = TimeOg(idx);
    speedChunk = SpeedCompactOg(idx);

    validIdx = speedChunk >= 0;
    timeChunk = timeChunk(validIdx);
    speedChunk = speedChunk(validIdx);

    if length(speedChunk) >= 2
        p = polyfit(timeChunk, speedChunk, 1);
        speedFit = polyval(p, timeChunk);

        leftovers = abs(speedChunk - speedFit);
        locStd = std(leftovers);

        %disp(locStd);
        for j = 1:length(timeChunk)
            if leftovers(j) <= StdThreshold * locStd
                TimeClean(end + 1) = timeChunk(j);
                SpeedClean(end + 1) = speedChunk(j);
                count = count + 1;
            end
        end
    end
end

isTimeFull = numel(TimeClean); % Debug: Verify if loop is working
isSpeedFull = numel(SpeedClean); % Debug: Verify if loop is working
%% ____________________
%% FORMATTED TEXT/FIGURE DISPLAYS
%figure;
%scatter(TimeClean, SpeedClean);
%title('Cleaned Time Data vs. Cleaned Speed Data')
%xlabel('Cleaned Time Data')
%ylabel('Cleaned Speed Data')

%figure;
%plot(TimeClean,SpeedClean,'-g');
%disp(isSpeedFull);
%disp(isTimeFull);
%disp(count);
%% ____________________
%% RESULTS
fprintf('Data successfully passed to subfunction 2 programmed by Skyler DiMeola.\n')
end
%% ____________________
%% ACADEMIC INTEGRITY STATEMENT
% We have not used source code obtained from any other unauthorized
% source, either modified or unmodified. Neither have we provided
% access to my code to another. The program we are submitting
% is our own original work.



