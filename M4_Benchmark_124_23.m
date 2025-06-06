function[] = M4_Benchmark_124_23(time, rawY, indx)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ENGR 132 
% Run the skeleton function that runs all the functions for benchmark data
%
% Function Call
% [] = M4_Benchmark_124_23(time, rawY, indx)
%
% Input Arguments
% time - the raw time data
% rawY - the raw velocity data
%
% Output Arguments
% None
%
% Assignment Information
%   Assignment:     M4
%   Team member:    Isaac Nagel, inagel@purdue.edu
%   Team ID:        124-23
%   Academic Integrity:
%     [N/A] We worked with one or more peers but our collaboration
%        maintained academic integrity.
% 
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% ____________________
%% INITIALIZATION


% Compact Car Test Numbers
compTimeAccBench = 6.21; %seconds
compTauBench = 1.51; %constant
compViBench = -0.09; %meters per second initial
compVfBench = 25.08; %meters per second final

% Sedan Car Test Numbers
sedanTimeAccBench = 9.39;%seconds
sedanTauBench = 1.96; %constant
sedanViBench = -0.22; %meters per second initial
sedanVfBench = 24.72;%meters per second final

% SUV Car Test Numbers
SUVTimeAccBench = 6.85;%seconds
SUVTauBench = 2.80; %constant
SUVViBench = 0.19;%meters per second initial
SUVVfBench = 24.18;%meters per second final

% Create new index
newIdx = indx-1;


%% ____________________
%% CALCULATIONS

% If we are on the first trial (compact car)
if newIdx == 1
    % Make a vector to store the model y values
 yModel = zeros(size(time));
    % Iterate through the entire vector
    for idx = 1:length(time)
        % Part 1 of the piecewise equation
        if time(idx) < compTimeAccBench
            yModel(idx) = compViBench;
        else
            % Part 2 of the piecewiese equation
            yModel(idx) = compViBench + (compVfBench - compViBench) * ...
            (1 - exp(-(time(idx) - compTimeAccBench)/compTauBench));
        end
    end

% If we are on the second trial (sedan)
elseif newIdx == 2
    % Make a vector of the size to store the numbers
    yModel = zeros(size(time));
    % Iterate through the entire vector
    for idx = 1:length(time)
        if time(idx) < sedanTimeAccBench
            % First part of piecewise equation
            yModel(idx) = sedanViBench;
        else
            % Second part of piecewise equation
            yModel(idx) = sedanViBench + (sedanVfBench - sedanViBench) * ...
            (1 - exp(-(time(idx) - sedanTimeAccBench)/sedanTauBench));
        end
    end

% If this is the third trial (SUV)
elseif newIdx == 3
     % Make a vector of blanks
     yModel = zeros(size(time));
     % Iterate through all of it
    for idx = 1:length(time)
        if time(idx) < SUVTimeAccBench
            % First part of equation
            yModel(idx) = SUVViBench;
        else
            % Second part of equation
            yModel(idx) = SUVViBench + (SUVVfBench - SUVViBench) * ...
            (1 - exp(-(time(idx) - SUVTimeAccBench)/SUVTauBench));
        end
    end


end


% Calculate SSE

% Make a vector of the length of time to simplify the function
n = length(time);
% Calculate the actual SSE
SSEmod = sum((rawY - yModel).^2) / n;

%% ____________________
%% FORMATTED TEXT/FIGURE DISPLAYS

% Create a new figure
figure;
% Plot the raw data in orange (I added a bit of spice)
plot(time, rawY, '-','Color','#D95319'); 
hold on;
% Plot the benchmark first order model in black
plot(time, yModel, 'k-','LineWidth', 1);
% Properly label the axis
xlabel('Time (s)');
ylabel('Speed (m/s)');
% Add a title
title(['Trial #', num2str(newIdx),' Benchmark Data vs. Benchmark First-Order Model']);
% Add a legend in the best spot
legend('Benchmark Data', 'Benchmark Model', 'Location','best');
% Turn on the grid because it looks good
grid on;


% Display SSE_mod
fprintf('SSEmod using benchmark parameters: %.4f\n', SSEmod);





%% ____________________
%% RESULTS


%% ____________________
%% ACADEMIC INTEGRITY STATEMENT
% We have not used source code obtained from any other unauthorized
% source, either modified or unmodified. Neither have we provided
% access to my code to another. The program we are submitting
% is our own original work.



