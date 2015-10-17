clear ; 
close all; 
clc;

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