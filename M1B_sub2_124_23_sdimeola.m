
unction[Output] = M1B_sub2_124_23_sdimeola(Input)
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
TimeOg = CruiseAutoData(:,1);
SpeedCompactOg = CruiseAutoData(:,2);

%% ____________________
%% CALCULATIONS
threshold1 = 1.37;
Idx1 = SpeedCompactOg >= threshold1;
SpeedCompactOg = SpeedCompactOg(Idx1);
TimeOg = TimeOg(Idx1);
Output = Input .* 3;

%% ____________________
%% FORMATTED TEXT/FIGURE DISPLAYS
figure;
scatter(TimeOg, SpeedCompactOg, 'o');

%% ____________________
%% RESULTS
fprintf('Data successfully passed to subfunction 2 programmed by Skyler DiMeola.\n')

%% ____________________
%% ACADEMIC INTEGRITY STATEMENT
% We have not used source code obtained from any other unauthorized
% source, either modified or unmodified. Neither have we provided
% access to my code to another. The program we are submitting
% is our own original work.



