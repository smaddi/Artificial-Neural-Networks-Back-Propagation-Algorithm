% Prasad: Working on this codes for data Input
%% clearing all variables 
clear ; 
close all; 
clc;

%% Data Related Parameters
feature_mode =0; %Need to be assigned to 1 for selection of all Features 
                 %Need to set to 2 for 



%% Setup the parameters 
input_layer_nodes  = 16; % ?????? 
hidden_layer_nodes = 5;  % ??????  
num_labels = 2;          %??????   
actiFnct = 'sigmoid'; % Select different nonlinearity functions from {'sigmoid', 'tanh', 'rectLU'}

switch(actiFnct)
    case 'sigmoid'
        activationFnct = 1;
    case 'tanh'
        activationFnct = 2;
    case 'rectLU'
        activationFnct = 3;
end    

%-----------------------Loading Data---------------------------------------
%x is feature
%y is loading data


%--------------------If needed normalizing data----------------------------



%-------------------Initialize Random weights------------------------------


%------------------ Calculating Gradient-----------------------------------
grad = rmGradient(x, activationFnct)