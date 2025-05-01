function[] = M4_main_124_23_inagel()
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ENGR 132 
% Run the skeleton function that runs all the functions
%
% Function Call
% [] = M4_main_124_23_inagel()
%
% Input Arguments
% None
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
tic

% Pull all data from the spreadsheet
testData = readmatrix('Sp25_cruiseAuto_M3benchmark_data.csv','NumHeaderLines',1);

numCol = width(testData);
%numCol = 2;

% Pull in ALL the columns for graphical analysis
time = testData(:,1);

% Start index at 2 to avoid the first column of time values
count = 2;

% Compact Car Test Numbers
compTimeAccBench = 6.21; %time accelertaion in seconds
compTauBench = 1.51; %constant
compViBench = -0.09; %velocity intial m/s
compVfBench = 25.08;%velocity final

% Sedan Car Test Numbers
sedanTimeAccBench = 9.39; %time accelertaion in seconds
sedanTauBench = 1.96;%constant
sedanViBench = -0.22;%velocity intial m/s
sedanVfBench = 24.72;%velocity final m/s

% SUV Car Test Numbers
SUVTimeAccBench = 6.85; %time accelertaion in seconds
SUVTauBench = 2.80;%constant
SUVViBench = 0.19;%velocity intial m/s
SUVVfBench = 25.18;%velocity final m/s

Window = 20;
%% ____________________
%% CALCULATIONS


% Iterate through the data until we cover all of the columns
while count <= numCol
    count2 = count-1;
    fprintf('Trial %0.0f \n', count2);
    % Import raw data
    rawY = testData(:,count);

    % Call sub 1
    [cleanY, SpeedClean] = M4_sub1_124_23_sdimeola(time, rawY);

    TimeClean = movmean(cleanY,Window);
    % Call sub 2
    [TimeAcc, yL] = M4_sub2_124_23_thussp(TimeClean, SpeedClean);
    % Call sub 3
    [Vi, Vf] = M4_sub3_124_23_muell147(TimeClean, SpeedClean, TimeAcc);
    % Call sub 4
    [Tau] = M4_sub4_124_23_thussp(TimeClean, SpeedClean, Vf,TimeAcc);
    
    
    
      % Calculate percent error

% if count == 2
% 
%    % Find TimeAccc error
%    errorTimeAcc = (abs((compTimeAccBench - TimeAcc) ./ compTimeAccBench)) .* 100;
%    % Find Tau error
%    errorTau = (abs((compTauBench - Tau) ./ compTauBench)) .* 100;
%    % Find Vi error
%    errorVi = (abs((compViBench - Vi) ./ compViBench)) .* 100;
%    % Fnd Vf
%    errorVf = (abs((compVfBench - Vf) ./ compVfBench)) .* 100;
%    % Output all data
%    fprintf('The percent error in the acceleration start time is %0.2f %% \n',errorTimeAcc);
%    fprintf('The percent error in Tau is %0.2f %% \n', errorTau);
%    fprintf('The percent error in the initial velocity is %0.2f %% \n',errorVi);
%    fprintf('The percent error in the final velocity is %0.2f %% \n',errorVf);
% 
% elseif count == 3
%    % Find TimeAccc error
%    errorTimeAcc = (abs((sedanTimeAccBench - TimeAcc) ./ sedanTimeAccBench)) .* 100;
%    % Find Tau error
%    errorTau = (abs((sedanTauBench - Tau) ./ sedanTauBench)) .* 100;
%    % Find Vi error
%    errorVi = (abs((sedanViBench - Vi) ./ sedanViBench)) .* 100;
%    % Fnd Vf
%    errorVf = (abs((sedanVfBench - Vf) ./ sedanVfBench)) .* 100;
%    % Output all data
%    fprintf('The percent error in the acceleration start time is %0.2f %% \n',errorTimeAcc);
%    fprintf('The percent error in Tau is %0.2f %% \n', errorTau);
%    fprintf('The percent error in the initial velocity is %0.2f %% \n',errorVi);
%    fprintf('The percent error in the final velocity is %0.2f %% \n',errorVf);
% 
% elseif count == 4
%    % Find TimeAccc error
%    errorTimeAcc = (abs((SUVTimeAccBench - TimeAcc) ./ SUVTimeAccBench)) .* 100;
%    % Find Tau error
%    errorTau = (abs((SUVTauBench - Tau) ./ SUVTauBench)) .* 100;
%    % Find Vi error
%    errorVi = (abs((SUVViBench - Vi) ./ SUVViBench)) .* 100;
%    % Fnd Vf
%    errorVf = (abs((SUVVfBench - Vf) ./ SUVVfBench)) .* 100;
%    % Output all data
%    fprintf('The percent error in the acceleration start time is %0.2f %% \n',errorTimeAcc);
%    fprintf('The percent error in Tau is %0.2f %% \n', errorTau);
%    fprintf('The percent error in the initial velocity is %0.2f %% \n',errorVi);
%    fprintf('The percent error in the final velocity is %0.2f %% \n',errorVf);
% 
% 
% end
% 
% 
% 
% 
    % Make model: 
    % Make a vector of the size to store the numbers
    yModel = zeros(size(TimeClean));
    % Iterate through the entire vector
    for idx = 1:length(TimeClean)
        if TimeClean(idx) < TimeAcc
            % First part of piecewise equation
            yModel(idx) = Vi;
        else
            % Second part of piecewise equation
            yModel(idx) = Vi + (Vf - Vi) * ...
            (1 - exp(-(TimeClean(idx) - TimeAcc)/Tau));
        end
    end
% 
%     %Calculate SSE
% 
    % Make a vector of the length of time to simplify the function
    n = length(TimeClean);
    % Calculate the actual SSE
    SSEmodAlgo = sum((SpeedClean - yModel).^2) / n;

    % Display SSE_mod
    fprintf('SSEmod using algorithm parameters: %.4f\n', SSEmodAlgo);
% 
% 
% 
% 
% 
%     % Call benchmark
     M4_Benchmark_124_23(time, rawY, count);
%     % Call performance
     M4_Performance_124_23(TimeAcc, Tau, Vi, Vf, time, rawY , count);
%     % 
%      %Create a new figure
%     figure;
%     % Plot the raw data in orange (I added a bit of spice)
%     plot(time, rawY, '-','Color','#D95319'); 
%     hold on;
%     % Plot the benchmark first order model in black
%     plot(TimeClean, yModel, 'k-','LineWidth', 1);
%     % Properly label the axis
%     xlabel('Time (s)');
%     ylabel('Speed (m/s)');
%     % Add a title
%     title(['Trial #', num2str(count-1),' Benchmark Data vs. Algorithm First-Order Model']);
%     % Add a legend in the best spot
%     legend('Benchmark Data', 'Algorithm Model', 'Location','best');
%     % Turn on the grid because it looks good
%     grid on;

    % Make a gap because the data is hard to read
    fprintf('\n\n');

    % Increase the counter index
    count = count +1;

end

toc
end

%% ____________________
%% FORMATTED TEXT/FIGURE DISPLAYS




%% ____________________
%% RESULTS


%% ____________________
%% ACADEMIC INTEGRITY STATEMENT
% We have not used source code obtained from any other unauthorized
% source, either modified or unmodified. Neither have we provided
% access to my code to another. The program we are submitting
% is our own original work.



