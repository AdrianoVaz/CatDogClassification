function model = training(X,y)
    [m,n] = size(X);
    y = y';
    % Initialize fitting parameters
    theta = zeros(n, 1);
    % Define the sigmoid function
    g = inline('1 ./ (1 + exp(-z))'); 
    % Newton's method
    iterations = 1000;
    J = zeros(iterations, 1);
    % Initialize lambda - the regularization parameter
    lambda =  1;
    alpha = 0.1;
    fprintf('\nTraining...\n');
    for i = 1:iterations
        % Calculate the hypothesis function
        z = X * theta;
        h = g(z);
        % Calculate J
        J(i) =-(1/(2*m)*(sum(y.*log(h) + (1-y).*log(1-h))+ lambda*sum(theta).^2));
        % Here is the actual update
        theta = theta*(1-alpha*(lambda/m)) - alpha * (1/m)*((h-y)'*X)';
    end
    model=theta;
end