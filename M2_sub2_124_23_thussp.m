function[TimeAcc,yL] = M2_sub2_124_23_thussp(x,y)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ENGR 132 
% Program Description 
%This function will find the point at which the object begins to accelerate
%and find the time constant of the model
% Function Call
%M2_sub2_124_23_thussp()
%
% Input Arguments
% Velocity data and final velocity
%
% Output Arguments
%Marked time of beginning accleration and time constant value
%
% Assignment Information
%   Assignment:     M02, Problem 3
%   Team member:    Patrick Thuss, thussp@purdue.edu 
%   Team ID:        124-23
%   Academic Integrity:
%     [] We worked with one or more peers but our collaboration
%        maintained academic integrity.
%     Peers we worked with: Name, login@purdue [repeat for each]
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% ____________________
%% INITIALIZATION
data = [x, y];
found = false;
TimeAcc = NaN;
yL = NaN;
indx = 1;
%% ____________________
%% CALCULATIONS

cleanMean = movmean(y,40);
%figure;
%plot(x,cleanMean,'-r');

while (cleanMean(indx) <= 0.5)
    TimeAcc = x(indx);
    yL = y(indx);
    indx = indx + 1;

end


% for index = 1:length(x)-1
%     if ~found && abs(cleanMean(index+1) - cleanMean(index)) > 1.1
%         TimeAcc = x(index+1);
%         yL = cleanMean(index+1);
%         found = true;  % mark found point
%     end
% end



%% ____________________
%% ACADEMIC INTEGRITY STATEMENT
% We have not used source code obtained from any other unauthorized
% source, either modified or unmodified. Neither have we provided
% access to my code to another. The program we are submitting
% is our own original work.



