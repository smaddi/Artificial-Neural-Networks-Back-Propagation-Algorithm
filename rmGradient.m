function grad = rmGradient(x, activFnct)
%rmGRADIENT returns the gradient of Activation Function function
% Here,
%    activFnct = Seloected Activation (Nonlinearity) Function

grad = zeros(size(x));

if(activFnct == 1)
    gradx = rmsigmoid(x);
    grad = gradx .* (1 - gradx);
elseif(activFnct == 2)
    gradx = rmHyperbolicTangent(x);
    grad = 1 - (gradx.^2);
elseif(activFnct == 3)
    gradx = rmRactifierLU(x);
    grad = 1./1+exp(-x); % ---?????????????
    
    %??????????????
    if(x>0)
        grad = 1;
    elseif(x<0)
        grad = 0;
    end
end 
% =============================================================

end