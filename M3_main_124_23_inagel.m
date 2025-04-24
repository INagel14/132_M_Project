function[] = M3_main_124_23_inagel()
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ENGR 132 
% Run the skeleton function that runs all the functions
%
% Function Call
% [] = M3_main_124_23_inagel()
%
% Input Arguments
% None
%
% Output Arguments
% None
%
% Assignment Information
%   Assignment:     M3
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
% Pull all data from the spreadsheet
testData = readmatrix('Sp25_cruiseAuto_M3benchmark_data.csv','NumHeaderLines',1);

numCol = width(testData);
%numCol = 2;

% Pull in ALL the columns for graphical analysis
time = testData(:,1);

% Start index at 2 to avoid the first column of time values
indx = 2;


%% ____________________
%% CALCULATIONS





% Iterate through the data until we cover all of the columns
while indx <= numCol
    rawY = testData(:,indx);

    [TimeClean, SpeedClean] = M3_sub1_124_23_sdimeola(time, rawY);

    [TimeAcc, yL] = M3_sub2_124_23_thussp(TimeClean, SpeedClean);

   
  [Vi, Vf] = M3_sub3_124_23_muell147(TimeClean, SpeedClean, TimeAcc);

  [Tau] = M3_sub4_124_23_thussp(TimeClean, SpeedClean, Vf, yL,TimeAcc);

  M3_Benchmark_124_23(time, TimeClean, SpeedClean, TimeAcc, Tau, Vi, Vf, indx);
  
  M3_Performance_124_23(TimeAcc, Tau, Vi, Vf);

    indx = indx +1;

end


%% ____________________
%% FORMATTED TEXT/FIGURE DISPLAYS

% Test numcol function
%fprintf('The number of columns is %0.2f \n',numCol);



%% ____________________
%% RESULTS


%% ____________________
%% ACADEMIC INTEGRITY STATEMENT
% We have not used source code obtained from any other unauthorized
% source, either modified or unmodified. Neither have we provided
% access to my code to another. The program we are submitting
% is our own original work.



