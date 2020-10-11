function [cost, grad] = costFunctionReg(theta, X, y, lambda)
%COSTFUNCTIONREG Compute cost and gradient for logistic regression with regularization
%   J = COSTFUNCTIONREG(theta, X, y, lambda) computes the cost of using
%   theta as the parameter for regularized logistic regression and the
%   gradient of the cost w.r.t. to the parameters. 

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta.
%               You should set J to the cost.
%               Compute the partial derivatives and set grad to the partial
%               derivatives of the cost w.r.t. each parameter in theta
first=(theta'*X')';
second=exp(-1*first);
third=1+second;
fourth=1./third;
cost=-(1/m)*(y'*log(fourth)+(1-y)'*log(1-fourth));
reg=(lambda/(2*m))*sum(theta(2:size(X, 2)).^2);
cost=cost+reg;

%==============================================================
%for gradient
fifth=(fourth-y)';
grad=(1/m)*(fifth*X)';
grad(2:size(X, 2))=grad(2:size(X, 2))+(lambda/m)*theta(2:size(X, 2));









% =============================================================

end
