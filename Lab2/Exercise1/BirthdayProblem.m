probabilityData = zeros(50,1);      % creating empty array

% Iterate through the number of students in the class
for k = 1:50
    a = BirthdayProbability(k); % calling the custom probability function
    probabilityData(k,1) = a;   % appending probability output into array
end
numStudents = 1:50;

% Plotting probability into scatter plot
scatter(numStudents,probabilityData,'filled')
grid("on")
xlabel("Number of Students")
ylabel("Probability")
title("Probability of Birthday Shared in a Class")
