function g = rmsigmoid(x)
%SIGMOID Compute sigmoid function

g = 1.0 ./ (1.0 + exp(-x));
end
