% Prasad: Working on this codes for data Input
% Please refer to flow chart for understanding code.
%% clearing all variables 
clear ; 
close all; 
clc;

%% Loading Data
data = importdata('HW2_data.mat');%x is feature
                                  %y is loading data
all_feature_label = data.y;%Feature lable
all_feature = data.x;%Features in coloumns
all_feature = normc(all_feature); % Normalization
[total_trails_available,total_feature_available] = size(all_feature);
clearvars data;
% Data Related Parameters
ask_feature = 'Select mode: 1 for all features into algoritm, 2 for few features in random, 3 for few features selected :  ';
feature_mode = input(ask_feature);% variable feature is saved
display(feature_mode);

switch(feature_mode)
    case 1 %Consider all features in data as input
        feat_coloumn = (1:total_feature_available);
    case 2 % Consider few features with user specified number in random
        display(total_feature_available);
        ask_feature = 'Please Enter No.of Features you wnat to consider from total set:  ';
        tot_num_feat_sel = input(ask_feature);
        feat_coloumn = randperm(total_feature_available,tot_num_feat_sel);
    case 3 % Consider only features entered by user
        display(total_feature_available);
        ask_feature = 'Please enter the feature coloumn numbers in array format as <[2 9 4 6 8 ..]>: ';
        tot_num_feat_sel = input(ask_feature);
        feat_coloumn = tot_num_feat_sel;
end

% Extracting data for specified features
selected_features = zeros(total_trails_available,length(feat_coloumn));
for i = 1: length(feat_coloumn)
    selected_features(:,i)=all_feature(:,feat_coloumn(i));
end
clear i;
[examples_selected_feature,total_feature_selected]=size(selected_features);

% Seperating training & Testing Data
display(examples_selected_feature);
ask_training = 'Please enter No.of examples you want to used for training, rest are used for testing:  ';
train_example_rows = input(ask_training);
train_example_rows = randperm(examples_selected_feature,train_example_rows);
train_example_ind = 0;
test_example_rows = zeros(1,examples_selected_feature-length(train_example_rows));
for i = 1:examples_selected_feature 
    find_ex = find(train_example_rows == i); 
    if isempty(find_ex)
        train_example_ind =train_example_ind + 1;
        test_example_rows(train_example_ind) = i;
    end
end

% Generating Training Data 
training_data = zeros(length(train_example_rows),length(feat_coloumn));
for i = 1: length(train_example_rows)
    training_data(i,:)=selected_features(train_example_rows(i),:);
end

% Generating Testing Data 
testing_data = zeros(length(test_example_rows),length(feat_coloumn));
for i = 1: length(test_example_rows)
    testing_data(i,:)=selected_features(test_example_rows(i),:);
end

% clearring all variables 
clearvars -except training_data testing_data; 

%% setup class labels as output of output nodes
Target = zeros(m,2);
Target(:,1) = y;
temp = y;
temp(y == 0) = 1;
temp(y == 1) = 0;
Target(:,2) = temp;

%--------------------- Setup the parameters 
in_nodes  = n; % ?????? 
h1_nodes = 3;  % ??????  
num_labels = 2;          %??????   

%selecons of activation function
actiFnct = 'sigmoid'; % Select different nonlinearity functions from {'sigmoid', 'tanh', 'rectLU'}

switch(actiFnct)
    case 'sigmoid'
        activationFnct = 1;
    case 'tanh'
        activationFnct = 2;
    case 'rectLU'
        activationFnct = 3;
end    

%-------------------Initialize Random weights------------------------------
%initial weigths of h1
W1 = rand(in_nodes+1, h1_nodes);
%Intial weigths of output layer
W2 = rand(h1_nodes+1, num_labels);


%----------------------FeedForward-----------------------------------------
%adding bias at input layer
X= [ones(m,1),X];
for i = 1: (m*2/3)
    a = zeros(1, h1_nodes);
	for j = 1: h1_nodes
        temp = W1(:,j)';
 		temp1 = X(i,:)';
        a1 = temp*temp1;
		a(j) = rmSigmoid(a1)
    end
%adding bias at hiddennt layer
    a = [1, a];
	for k = 1:num_labels
		temp=W2(:,k)';
        temp1 =a(:);
        o1 = temp*temp1;
		o(i,k) = rmSigmoid(o1);
    end
end

%Now need to compare output o with target to adjust weights
%------------------ Calculating Gradient-----------------------------------
grad = rmGradient(o, activationFnct);