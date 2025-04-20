function[] = M3_Benchmark_124_23(TimeAcc, Tau, Vi, Vf, indx);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ENGR 132 
% Run the skeleton function that runs all the functions
%
% Function Call
% [] = M3_Benchmark_124_23()
%
% Input Arguments
% None
%
% Output Arguments
% None
%
% Assignment Information
%   Assignment:     M3
%   Team ID:        124-23
%   Academic Integrity:
%     [N/A] We worked with one or more peers but our collaboration
%        maintained academic integrity.
% 
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% ____________________
%% INITIALIZATION

% Initialize Benchmark values:

% Compact Car
compTimeAccBench = 6.21;
compTauBench = 1.51;
compViBench = -0.09;
compVfBench = 25.08;

% Sedan Car
sedanTimeAccBench = 9.39;
sedanTauBench = 1.96;
sedanViBench = -0.22;
sedanVfBench = 24.72;

% SUV Car
SUVTimeAccBench = 6.85;
SUVTauBench = 2.80;
SUVViBench = 0.19;
SUVVfBench = 25.18;

% Create new index
newIdx = indx-1;

%% ____________________
%% CALCULATIONS

% Part 4a: Calculate SSE to evaluate data cleaning



% Part 4b: Algo accuracy analysis 

% Calculate percent error in TimeAcc:

if newIdx == 1
    % Calc here
    % Find TimeAccc error
    errorTimeAcc = (abs(compTimeAccBench - TimeAcc) ./ compTimeAccBench) .* 100;
    % Find Tau error
    errorTau = (abs(compTauBench - Tau) ./ compTauBench) .* 100;
    % Find Vi error
    errorVi = (abs(compViBench - Vi) ./ compViBench) .* 100;
    % Fnd Vf
    errorVf = (abs(compVfBench - Vf) ./ compVfBench) .* 100;
    % Output all data
    fprintf('The percent error in the acceleration start time is %0.2f %% \n',errorTimeAcc);
    fprintf('The percent error in Tau is %0.2f %% \n', errorTau);
    fprintf('The percent error in the initial velocity is %0.2f %% \n',errorVi);
    fprintf('The percent error in the final velocity is %0.2f %% \n',errorVf);

elseif newIdx == 2
    % Calc here
elseif newIdx == 3
    % Calc here
else
    % Display error message?
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



