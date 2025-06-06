function[] = M4_Performance_124_23(TimeAcc, Tau, Vi, Vf, time, rawY, count)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ENGR 132 
% Run the skeleton function that runs all the functions
%
% Function Call
% [] = M4_Performance_124_23(TimeAcc, Tau, Vi, Vf, time, rawY)
%
% Input Arguments
% TimeAcc - The time when the acceleration starts
% Tau - The time constant
% Vi - The initial velocity
% Vf - The final velocity
% time - The raw time data
% rawY - The raw velocity data
% count - The current iteration for the data or trial number + 1
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

% Create boundary variables for the left and right bound
t_s_left = 4.50; %time start acc bound
t_s_right = 6.00;%time start acc bound
tau_l = 1.26; %tau left bound
tau_r = 3.89;%tau right bound
y_L_left = 1.10;%velocity initial left bound
y_L_right = -0.90;%velocity initial right bound
y_h_left = 25.82;%velocity final left bound
y_h_right = 23.36;%velocity final right bound

% Create blank vectors for graphing
y_left = zeros(1,31);
y_right = zeros(1,31);

trialNum = count - 1;
%% ____________________
%% CALCULATIONS

% Shift data

shift = TimeAcc - 5.0;
TimeShifted = time - shift;

% Calculate the left bound graph line
for idx = 1:length(TimeShifted)
    if TimeShifted(idx) <= t_s_left
        y_left(idx) = y_L_left;
    else 
        y_left(idx) = y_L_left + (1 - exp(- (TimeShifted(idx) - t_s_left) / tau_l)) * (y_h_left - y_L_left);
    end 
end

% Calculate the right bound graph line

for idx = 1:length(TimeShifted)
    if TimeShifted(idx) <= t_s_right
        y_right(idx) = y_L_right;
    else 
        y_right(idx) = y_L_right + (1 - exp(- (TimeShifted(idx) - t_s_right) / tau_r)) * (y_h_right - y_L_right);
    end 
end


yModel = zeros(size(TimeShifted));
    % Iterate through the entire vector
    for idx = 1:length(TimeShifted)
        if TimeShifted(idx) < 5.0
            % First part of piecewise equation
            yModel(idx) = Vi;
        else
            % Second part of piecewise equation
            yModel(idx) = Vi + (Vf - Vi) * ...
            (1 - exp(-(time(idx) - TimeAcc)/Tau));
        end
    end


% START OF IMPROVEMENT #2

passFlag = true;  % passes (hopefully)

for idx = 1:length(TimeShifted)
    % if model ever goes above the top bound OR below the bottom bound
    if yModel(idx) > y_left(idx) || yModel(idx) < y_right(idx)
        % If crosses bounds, mark as false
        passFlag = false;
    end
end

if passFlag
    % If it didn't cross any bounds, output this
    fprintf('Trial %d PASSED: Model stayed within bounds.\n', trialNum);
else
    % Output that it was false so it therefor failed
    fprintf('Trial %d FAILED: Model crossed a bound.\n', trialNum);
end


% END OF IMPROVEMENT #2



%% ____________________
%% FORMATTED TEXT/FIGURE DISPLAYS

figure; 
% Plot raw data
plot(TimeShifted, rawY, '-','Linewidth',0.5, 'Color',[0.85 0.325 0.098]);
hold on;
% Plot the model
plot(TimeShifted, yModel, '-','LineWidth',1.5,'Color',[0 0.447 0.741]);
% Plot the right bound
plot(TimeShifted,y_right,'-','LineWidth',2.5,'Color',[0.494 0.184 0.556]);
% Plot the left bound
plot(TimeShifted,y_left, '-', 'LineWidth',2.5, 'Color',[0.466 0.674 0.188]);
title(['Trail #', num2str(trialNum),' Benchmark Raw Data And Algorithm Model With Performance Boundaries']);
% Properly label the axis
xlabel('Time (s)');
ylabel('Speed (m/s)');
legend('Raw Data', 'Algorithm','Right Bound', 'Left Bound', 'Location','best');
grid on;


%% ____________________
%% RESULTS


%% ____________________
%% ACADEMIC INTEGRITY STATEMENT
% We have not used source code obtained from any other unauthorized
% source, either modified or unmodified. Neither have we provided
% access to my code to another. The program we are submitting
% is our own original work.



