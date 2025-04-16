
function[Output] = M1B_sub2_124_23_sdimeola(Input)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ENGR 132 
% Run subfunction 3 to find the final and inital speed
%
% Function Call
% [Output] = M1B_sub2_124_23_sdimeola(Input)
%
% Input Arguments
% Input
%
% Output Arguments
% Output
%
% Assignment Information
%   Assignment:     M1B, Problem xx
%   Team member:    Skyler DiMeola, sdimeola@purdue.edu
%   Team ID:        124-23
%   Academic Integrity:
%     [N/A] We worked with one or more peers but our collaboration
%        maintained academic integrity.
%     
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% ____________________
%% INITIALIZATION
CruiseAutoData = readmatrix("Sp25_cruiseAuto_experimental_data.csv");
% Vectors to Hold Rough Data
TimeOg = CruiseAutoData(:,1);
SpeedCompactOg = CruiseAutoData(:,2);

numX = numel(TimeOg);
disp(numX);
count = 0;
% Vectors to Hold Clean Data
TimeClean = [];
SpeedCompactClean = [];

% Opperator to Maintain Equal Vector Lenghts
VecLength = length(TimeClean);

% Opperator to Designate Number of Elements being Parsed
numParse = 50;

% Threshold for Standard Deviation
StdThreshold = 1000;

%% ____________________
%% CALCULATIONS
for i = 1:numParse: VecLength - numParse + 1
    idx = i:i + numParse - 1;
    timeChunk = TimeOG(idx);
    speedChunk = SpeedCompactOg(idx);

    p = polyfit(timeChunk, speedChunk, 1);
    speedFit = polyval(p, timeChunk);

    leftovers = abs(speedChunk - speedFit);
    locStd = std(leftovers);
    
    for j = 1:length(timeChunk)
        if leftovers(j) <= StdThreshold * locStd
            TimeClean(end + 1) = timeChunk(j);
            SpeedCompactClean(end + 1) = SpeedCompactClean(j);
            count = count + 1;
        end
    end
end

isTimeFull = numel(TimeClean);
isSpeedFull = numel(SpeedCompactClean);
%% ____________________
%% FORMATTED TEXT/FIGURE DISPLAYS
figure;
scatter(TimeClean, SpeedCompactClean);
disp(isSpeedFull);
disp(isTimeFull);
disp(count);
%% ____________________
%% RESULTS
fprintf('Data successfully passed to subfunction 2 programmed by Skyler DiMeola.\n')

%% ____________________
%% ACADEMIC INTEGRITY STATEMENT
% We have not used source code obtained from any other unauthorized
% source, either modified or unmodified. Neither have we provided
% access to my code to another. The program we are submitting
% is our own original work.



