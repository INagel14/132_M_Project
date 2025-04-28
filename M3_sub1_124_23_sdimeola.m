
function[TimeClean, SpeedClean] = M3_sub1_124_23_sdimeola(time, rawY)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ENGR 132
% Run subfunction 2 to clean the data.
%
% Function Call
% [TimeClean, SpeedClean] = M3_sub2_124_23_sdimeola(time, rawY)
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
%   Assignment:     M3
%   Team member:    Skyler DiMeola, sdimeola@purdue.edu
%   Team ID:        124-23
%   Academic Integrity:
%     [N/A] We worked with one or more peers but our collaboration
%        maintained academic integrity.
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% ____________________
%% INITIALIZATION
%data = readmatrix("Sp25_cruiseAuto_experimental_data.csv");
%TimeOg = data(:,1);
%SpeedOg = data(:,2);

TimeOg = time(:); % vector to hold function input for time
SpeedOg = rawY(:); % vector to hold function input for speed
TimeClean = []; % empty vector to hold cleaned time data
SpeedClean = []; % empty vector to hold cleaned speed data
chunkSize = 20;
chunkOverlap = 15;
madThreshold = 0.5;


%% ____________________
%% CALCULATIONS
% For loop that iterates through 20 data points at time and takes a linear
% regression of those data points, removng any that fall outside the
% standard deviation.
for i = 1:(chunkSize - chunkOverlap):(numel(TimeOg) - chunkSize + 1)
    idx = i:i + chunkSize - 1;
    timeChunk = TimeOg(idx);
    speedChunk = SpeedOg(idx);

    if numel(speedChunk) >= 2
        p = polyfit(timeChunk, speedChunk, 1);
        speedFit = polyval(p, timeChunk);
        leftovers = abs(speedChunk - speedFit);

        mad = 1.4826 * median(leftovers);
        normalizeLeftovers = leftovers / (mad + eps);
        isInlier = normalizeLeftovers <= madThreshold;

        if sum(isInlier) >= 2
            pRefined = polyfit(timeChunk(isInlier), speedChunk(isInlier), 1);

            speedFitRefined = polyval(pRefined, timeChunk);
            leftoversRefined = abs(speedChunk - speedFitRefined);
            madRefined = 1.4826 * median(leftoversRefined(isInlier));
            isInlier = leftoversRefined <= madThreshold * madRefined;

            TimeClean = [TimeClean; timeChunk(isInlier)];
            SpeedClean = [SpeedClean; speedChunk(isInlier)];
        end
    end
end
%% ____________________
%% FORMATTED TEXT/FIGURE DISPLAYS
% figure;
% plot(TimeClean, SpeedClean, 'o');
% title('Cleaned Time Data vs. Cleaned Speed Data')
% xlabel('Cleaned Time Data')
% ylabel('Cleaned Speed Data')
% 
figure;
plot(TimeClean,SpeedClean,'-g');
% disp(isSpeedFull);
% disp(isTimeFull);
% disp(count);
%% ____________________
%% RESULTS
%fprintf('Data successfully passed to subfunction 2 programmed by Skyler DiMeola.\n')
end
%% ____________________
%% ACADEMIC INTEGRITY STATEMENT
% We have not used source code obtained from any other unauthorized
% source, either modified or unmodified. Neither have we provided
% access to my code to another. The program we are submitting
% is our own original work.



