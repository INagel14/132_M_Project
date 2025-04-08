function[] = M1B_main_124_23_inagel()
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ENGR 132 
% Run the skeleton function that runs all the functions
%
% Function Call
% [] = M1B_main_124_23_inagel()
%
% Input Arguments
% None
%
% Output Arguments
% None
%
% Assignment Information
%   Assignment:     M1B, Problem xx
%   Team member:    Isaac Nagel, inagel@purdue.edu
%   Team ID:        124-23
%   Academic Integrity:
%     [N/A] We worked with one or more peers but our collaboration
%        maintained academic integrity.
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% ____________________
%% INITIALIZATION
% Pull all data from the spreadsheet
testData = readmatrix('Sp25_cruiseAuto_experimental_data.csv','NumHeaderLines',1);

% Pull in ALL the columns for graphical analysis
Time = testData(:,1);

% Compact Car
Speed_Compact_Winter_Test1 = testData(:,2);
Speed_Compact_Winter_Test2 = testData(:,3);
Speed_Compact_Winter_Test3 = testData(:,4);
Speed_Compact_Winter_Test4 = testData(:,5);
Speed_Compact_Winter_Test5 = testData(:,6);
Speed_Compact_AllSeason_Test1 = testData(:,7);
Speed_Compact_AllSeason_Test2 = testData(:,8);
Speed_Compact_AllSeason_Test3 = testData(:,9);
Speed_Compact_AllSeason_Test4 = testData(:,10);
Speed_Compact_AllSeason_Test5 = testData(:,11);
Speed_Compact_Summer_Test1 = testData(:,12);
Speed_Compact_Summer_Test2 = testData(:,13);
Speed_Compact_Summer_Test3 = testData(:,14);
Speed_Compact_Summer_Test4 = testData(:,15);
Speed_Compact_Summer_Test5 = testData(:,16);

% Sedan
Speed_Sedan_Winter_Test1 = testData(:,17);
Speed_Sedan_Winter_Test2 = testData(:,18);
Speed_Sedan_Winter_Test3 = testData(:,19);
Speed_Sedan_Winter_Test4 = testData(:,20);
Speed_Sedan_Winter_Test5 = testData(:,21);
Speed_Sedan_AllSeason_Test1 = testData(:,22);
Speed_Sedan_AllSeason_Test2 = testData(:,23);
Speed_Sedan_AllSeason_Test3 = testData(:,24);
Speed_Sedan_AllSeason_Test4 = testData(:,25);
Speed_Sedan_AllSeason_Test5 = testData(:,26);
Speed_Sedan_Summer_Test1 = testData(:,27);
Speed_Sedan_Summer_Test2 = testData(:,28);
Speed_Sedan_Summer_Test3 = testData(:,29);
Speed_Sedan_Summer_Test4 = testData(:,30);
Speed_Sedan_Summer_Test5 = testData(:,31);

% SUV
Speed_SUV_Winter_Test1
Speed_SUV_Winter_Test2
Speed_SUV_Winter_Test3
Speed_SUV_Winter_Test4
Speed_SUV_Winter_Test5

%% ____________________
%% CALCULATIONS

Test1 = M1A_sub1_124_23_thussp(test_vec);

Test2 = M1A_sub2_124_23_sdimeola(test_vec);

Test3 =  M1A_sub3_124_23_muell147(test_vec);

%% ____________________
%% FORMATTED TEXT/FIGURE DISPLAYS

%General Goal:
% Plot everything:

% Specifically, Plot each car
% Compact Car
% -Winter, All, Summer
% Sedan Car
% -Winter, All, Summer
% SUV
% -Winter, All, Summer

%% ____________________
%% RESULTS


%% ____________________
%% ACADEMIC INTEGRITY STATEMENT
% We have not used source code obtained from any other unauthorized
% source, either modified or unmodified. Neither have we provided
% access to my code to another. The program we are submitting
% is our own original work.



