function[] = M2_main_124_23_inagel()
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ENGR 132 
% Run the skeleton function that runs all the functions
%
% Function Call
% [] = M2_main_124_23_inagel()
%
% Input Arguments
% None
%
% Output Arguments
% None
%
% Assignment Information
%   Assignment:     M2
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
time = testData(:,1);

% In the future, could make a variable for all 5 trials, then graph. Use
% the set function to then set the color for each line of the graph. 

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

% To simplify in the future, make all 5 in one variable like:
% TestVar = testData(:,2:6);

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
Speed_SUV_Winter_Test1 = testData(:,32);
Speed_SUV_Winter_Test2 = testData(:,33);
Speed_SUV_Winter_Test3 = testData(:,34);
Speed_SUV_Winter_Test4 = testData(:,35);
Speed_SUV_Winter_Test5 = testData(:,36);
Speed_SUV_AllSeason_Test1 = testData(:,37);
Speed_SUV_AllSeason_Test2 = testData(:,38);
Speed_SUV_AllSeason_Test3 = testData(:,39);
Speed_SUV_AllSeason_Test4 = testData(:,40);
Speed_SUV_AllSeason_Test5 = testData(:,41);
Speed_SUV_Summer_Test1 = testData(:,42);
Speed_SUV_Summer_Test2 = testData(:,43);
Speed_SUV_Summer_Test3 = testData(:,44);
Speed_SUV_Summer_Test4 = testData(:,45);
Speed_SUV_Summer_Test5 = testData(:,46);

SuperVar = testData(:,2:46);

indx = 2;
%% ____________________
%% CALCULATIONS

% I love patrick 
% i love u too isaac 

%Test1 = M2_sub1_124_23_sdimeola(Time);

%Test2 = M2_sub2_124_23_thussp(Time);

%Test3 =  M2_sub3_124_23_muell147(Time);




while indx <= 2
    rawY = testData(:,indx);

    [TimeClean, SpeedClean] = M2_sub1_124_23_sdimeola(time, rawY);

    [TimeAcc, yL] = M2_sub2_124_23_thussp(TimeClean, SpeedClean);
    fprintf('TimeAcc: %0.2f\n',TimeAcc);

   
   [Vi, Vf] = M2_sub3_124_23_muell147(TimeClean, SpeedClean, TimeAcc);

   % [Tau] = M2_sub4_124_23_thussp(TimeClean, SpeedClean, Vf, yL,TimeAcc);

    indx = indx +1;

end






%% ____________________
%% FORMATTED TEXT/FIGURE DISPLAYS

% Winter Tires

% Compact Winter
% figure;
% subplot(1,3,1);
% x = time;
% plot(x,Speed_Compact_Winter_Test1,'Color',[0.466 0.6740 0.1880]);
% hold on
% plot(x,Speed_Compact_Winter_Test2,'Color',[0.85 0.325 0.0980]);
% plot(x,Speed_Compact_Winter_Test3,'Color',[0.929 0.6940 0.1250]);
% plot(x,Speed_Compact_Winter_Test4,'Color',[0.494 0.1840 0.5560]);
% plot(x,Speed_Compact_Winter_Test5,'Color',[0 0.4470 0.7410]);
% hold off
% title('Compact');
% sgtitle('Raw Experimental Data for Winter Tires');
% xlabel('Time (s)');
% ylabel('Velocity (m/s)');
% legend('Test 1','Test 2','Test 3','Test 4','Test 5','Location','best');
% 
% % Sedan Winter
% subplot(1,3,2);
% x = time;
% plot(x,Speed_Sedan_Winter_Test1,'Color',[0.466 0.6740 0.1880]);
% hold on
% plot(x,Speed_Sedan_Winter_Test2,'Color',[0.85 0.325 0.0980]);
% plot(x,Speed_Sedan_Winter_Test3,'Color',[0.929 0.6940 0.1250]);
% plot(x,Speed_Sedan_Winter_Test4,'Color',[0.494 0.1840 0.5560]);
% plot(x,Speed_Sedan_Winter_Test5,'Color',[0 0.4470 0.7410]);
% hold off
% title('Sedan');
% xlabel('Time (s)');
% ylabel('Velocity (m/s)');
% 
% % SUV Winter
% subplot(1,3,3);
% x = time;
% plot(x,Speed_SUV_Winter_Test1,'Color',[0.466 0.6740 0.1880]);
% hold on
% plot(x,Speed_SUV_Winter_Test2,'Color',[0.85 0.325 0.0980]);
% plot(x,Speed_SUV_Winter_Test3,'Color',[0.929 0.6940 0.1250]);
% plot(x,Speed_SUV_Winter_Test4,'Color',[0.494 0.1840 0.5560]);
% plot(x,Speed_SUV_Winter_Test5,'Color',[0 0.4470 0.7410]);
% hold off
% title('SUV');
% xlabel('Time (s)');
% ylabel('Velocity (m/s)');
% 
% 
% 
%  % All-Seasons
% 
% % Compact All-Season
% figure;
% subplot(1,3,1);
% x = time;
% plot(x,Speed_Compact_AllSeason_Test1,'Color',[0.466 0.6740 0.1880]);
% hold on
% plot(x,Speed_Compact_AllSeason_Test2,'Color',[0.85 0.325 0.0980]);
% plot(x,Speed_Compact_AllSeason_Test3,'Color',[0.929 0.6940 0.1250]);
% plot(x,Speed_Compact_AllSeason_Test4,'Color',[0.494 0.1840 0.5560]);
% plot(x,Speed_Compact_AllSeason_Test5,'Color',[0 0.4470 0.7410]);
% hold off
% title('Compact');
% sgtitle('Raw Experimental Data for All-Season Tires');
% xlabel('Time (s)');
% ylabel('Velocity (m/s)');
% legend('Test 1','Test 2','Test 3','Test 4','Test 5','Location','best');
% 
% % Sedan All-Season
% subplot(1,3,2);
% x = time;
% plot(x,Speed_Sedan_AllSeason_Test1,'Color',[0.466 0.6740 0.1880]);
% hold on
% plot(x,Speed_Sedan_AllSeason_Test2,'Color',[0.85 0.325 0.0980]);
% plot(x,Speed_Sedan_AllSeason_Test3,'Color',[0.929 0.6940 0.1250]);
% plot(x,Speed_Sedan_AllSeason_Test4,'Color',[0.494 0.1840 0.5560]);
% plot(x,Speed_Sedan_AllSeason_Test5,'Color',[0 0.4470 0.7410]);
% hold off
% title('Sedan');
% xlabel('Time (s)');
% ylabel('Velocity (m/s)');
% 
% % SUV All-Season
% subplot(1,3,3);
% x = time;
% plot(x,Speed_SUV_AllSeason_Test1,'Color',[0.466 0.6740 0.1880]);
% hold on
% plot(x,Speed_SUV_AllSeason_Test2,'Color',[0.85 0.325 0.0980]);
% plot(x,Speed_SUV_AllSeason_Test3,'Color',[0.929 0.6940 0.1250]);
% plot(x,Speed_SUV_AllSeason_Test4,'Color',[0.494 0.1840 0.5560]);
% plot(x,Speed_SUV_AllSeason_Test5,'Color',[0 0.4470 0.7410]);
% hold off
% title('SUV');
% xlabel('Time (s)');
% ylabel('Velocity (m/s)');
% 
% 
% 
% % Summer
% 
% % Compact Summer
% figure;
% subplot(1,3,1);
% x = time;
% plot(x,Speed_Compact_Summer_Test1,'Color',[0.466 0.6740 0.1880]);
% hold on
% plot(x,Speed_Compact_Summer_Test2,'Color',[0.85 0.325 0.0980]);
% plot(x,Speed_Compact_Summer_Test3,'Color',[0.929 0.6940 0.1250]);
% plot(x,Speed_Compact_Summer_Test4,'Color',[0.494 0.1840 0.5560]);
% plot(x,Speed_Compact_Summer_Test5,'Color',[0 0.4470 0.7410]);
% hold off
% title('Compact');
% sgtitle('Raw Experimental Data for Summer Tires');
% xlabel('Time (s)');
% ylabel('Velocity (m/s)');
% legend('Test 1','Test 2','Test 3','Test 4','Test 5','Location','best');
% 
% % Sedan Summer
% subplot(1,3,2);
% x = time;
% plot(x,Speed_Sedan_Summer_Test1,'Color',[0.466 0.6740 0.1880]);
% hold on
% plot(x,Speed_Sedan_Summer_Test2,'Color',[0.85 0.325 0.0980]);
% plot(x,Speed_Sedan_Summer_Test3,'Color',[0.929 0.6940 0.1250]);
% plot(x,Speed_Sedan_Summer_Test4,'Color',[0.494 0.1840 0.5560]);
% plot(x,Speed_Sedan_Summer_Test5,'Color',[0 0.4470 0.7410]);
% hold off
% title('Sedan');
% xlabel('Time (s)');
% ylabel('Velocity (m/s)');
% 
% % SUV Summer
% subplot(1,3,3);
% x = time;
% plot(x,Speed_SUV_Summer_Test1,'Color',[0.466 0.6740 0.1880]);
% hold on
% plot(x,Speed_SUV_Summer_Test2,'Color',[0.85 0.325 0.0980]);
% plot(x,Speed_SUV_Summer_Test3,'Color',[0.929 0.6940 0.1250]);
% plot(x,Speed_SUV_Summer_Test4,'Color',[0.494 0.1840 0.5560]);
% plot(x,Speed_SUV_Summer_Test5,'Color',[0 0.4470 0.7410]);
% hold off
% title('SUV');
% xlabel('Time (s)');
% ylabel('Velocity (m/s)');
% 
% 
% 
% 
% %%%_______________________________________________________________
% % Mega Subplot :)
% 
% figure;
% subplot(3,3,1);
% x = time;
% plot(x,Speed_Compact_Winter_Test1,'Color',[0.466 0.6740 0.1880]);
% hold on
% plot(x,Speed_Compact_Winter_Test2,'Color',[0.85 0.325 0.0980]);
% plot(x,Speed_Compact_Winter_Test3,'Color',[0.929 0.6940 0.1250]);
% plot(x,Speed_Compact_Winter_Test4,'Color',[0.494 0.1840 0.5560]);
% plot(x,Speed_Compact_Winter_Test5,'Color',[0 0.4470 0.7410]);
% hold off
% title('Compact-Winter Tires');
% sgtitle(['All Raw Experimental Data For Winter, All-Season, and Summer Tires' ...
%     ' On Compacts, Sedans, and SUVs']);
% xlabel('Time (s)');
% ylabel('Velocity (m/s)');
% legend('Test 1','Test 2','Test 3','Test 4','Test 5','Location','best');
% 
% 
% subplot(3,3,2);
% x = time;
% plot(x,Speed_Compact_AllSeason_Test1,'Color',[0.466 0.6740 0.1880]);
% hold on
% plot(x,Speed_Compact_AllSeason_Test2,'Color',[0.85 0.325 0.0980]);
% plot(x,Speed_Compact_AllSeason_Test3,'Color',[0.929 0.6940 0.1250]);
% plot(x,Speed_Compact_AllSeason_Test4,'Color',[0.494 0.1840 0.5560]);
% plot(x,Speed_Compact_AllSeason_Test5,'Color',[0 0.4470 0.7410]);
% hold off
% title('Compact-All-Season Tires');
% xlabel('Time (s)');
% ylabel('Velocity (m/s)');
% 
% 
% subplot(3,3,3);
% x = time;
% plot(x,Speed_Compact_Summer_Test1,'Color',[0.466 0.6740 0.1880]);
% hold on
% plot(x,Speed_Compact_Summer_Test2,'Color',[0.85 0.325 0.0980]);
% plot(x,Speed_Compact_Summer_Test3,'Color',[0.929 0.6940 0.1250]);
% plot(x,Speed_Compact_Summer_Test4,'Color',[0.494 0.1840 0.5560]);
% plot(x,Speed_Compact_Summer_Test5,'Color',[0 0.4470 0.7410]);
% hold off
% title('Compact-Summer Tires');
% xlabel('Time (s)');
% ylabel('Velocity (m/s)');
% 
% 
% % Sedan Car
% % -Winter, All, Summer
% 
% subplot(3,3,4);
% x = time;
% plot(x,Speed_Sedan_Winter_Test1,'Color',[0.466 0.6740 0.1880]);
% hold on
% plot(x,Speed_Sedan_Winter_Test2,'Color',[0.85 0.325 0.0980]);
% plot(x,Speed_Sedan_Winter_Test3,'Color',[0.929 0.6940 0.1250]);
% plot(x,Speed_Sedan_Winter_Test4,'Color',[0.494 0.1840 0.5560]);
% plot(x,Speed_Sedan_Winter_Test5,'Color',[0 0.4470 0.7410]);
% hold off
% title('Sedan-Winter Tires');
% xlabel('Time (s)');
% ylabel('Velocity (m/s)');
% 
% subplot(3,3,5);
% x = time;
% plot(x,Speed_Sedan_AllSeason_Test1,'Color',[0.466 0.6740 0.1880]);
% hold on
% plot(x,Speed_Sedan_AllSeason_Test2,'Color',[0.85 0.325 0.0980]);
% plot(x,Speed_Sedan_AllSeason_Test3,'Color',[0.929 0.6940 0.1250]);
% plot(x,Speed_Sedan_AllSeason_Test4,'Color',[0.494 0.1840 0.5560]);
% plot(x,Speed_Sedan_AllSeason_Test5,'Color',[0 0.4470 0.7410]);
% hold off
% title('Sedan-All-Season Tires');
% xlabel('Time (s)');
% ylabel('Velocity (m/s)');
% 
% 
% subplot(3,3,6);
% x = time;
% plot(x,Speed_Sedan_Summer_Test1,'Color',[0.466 0.6740 0.1880]);
% hold on
% plot(x,Speed_Sedan_Summer_Test2,'Color',[0.85 0.325 0.0980]);
% plot(x,Speed_Sedan_Summer_Test3,'Color',[0.929 0.6940 0.1250]);
% plot(x,Speed_Sedan_Summer_Test4,'Color',[0.494 0.1840 0.5560]);
% plot(x,Speed_Sedan_Summer_Test5,'Color',[0 0.4470 0.7410]);
% hold off
% title('Sedan-Summer Tires');
% xlabel('Time (s)');
% ylabel('Velocity (m/s)');
% 
% 
% % SUV
% % -Winter, All, Summer
% 
% subplot(3,3,7);
% x = time;
% plot(x,Speed_SUV_Winter_Test1,'Color',[0.466 0.6740 0.1880]);
% hold on
% plot(x,Speed_SUV_Winter_Test2,'Color',[0.85 0.325 0.0980]);
% plot(x,Speed_SUV_Winter_Test3,'Color',[0.929 0.6940 0.1250]);
% plot(x,Speed_SUV_Winter_Test4,'Color',[0.494 0.1840 0.5560]);
% plot(x,Speed_SUV_Winter_Test5,'Color',[0 0.4470 0.7410]);
% hold off
% title('SUV-Winter Tires');
% xlabel('Time (s)');
% ylabel('Velocity (m/s)');
% 
% subplot(3,3,8);
% x = time;
% plot(x,Speed_SUV_AllSeason_Test1,'Color',[0.466 0.6740 0.1880]);
% hold on
% plot(x,Speed_SUV_AllSeason_Test2,'Color',[0.85 0.325 0.0980]);
% plot(x,Speed_SUV_AllSeason_Test3,'Color',[0.929 0.6940 0.1250]);
% plot(x,Speed_SUV_AllSeason_Test4,'Color',[0.494 0.1840 0.5560]);
% plot(x,Speed_SUV_AllSeason_Test5,'Color',[0 0.4470 0.7410]);
% hold off
% title('SUV-All-Season Tires');
% xlabel('Time (s)');
% ylabel('Velocity (m/s)');
% 
% 
% subplot(3,3,9);
% x = time;
% plot(x,Speed_SUV_Summer_Test1,'Color',[0.466 0.6740 0.1880]);
% hold on
% plot(x,Speed_SUV_Summer_Test2,'Color',[0.85 0.325 0.0980]);
% plot(x,Speed_SUV_Summer_Test3,'Color',[0.929 0.6940 0.1250]);
% plot(x,Speed_SUV_Summer_Test4,'Color',[0.494 0.1840 0.5560]);
% plot(x,Speed_SUV_Summer_Test5,'Color',[0 0.4470 0.7410]);
% hold off
% title('SUV-Summer Tires');
% xlabel('Time (s)');
% ylabel('Velocity (m/s)');


%% ____________________
%% RESULTS


%% ____________________
%% ACADEMIC INTEGRITY STATEMENT
% We have not used source code obtained from any other unauthorized
% source, either modified or unmodified. Neither have we provided
% access to my code to another. The program we are submitting
% is our own original work.



