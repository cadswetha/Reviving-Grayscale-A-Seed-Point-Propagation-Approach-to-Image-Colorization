% Assume your data is stored in a cell array called 'data' with n samples
n = size(dataset, 1);
cv = cvpartition(n, 'HoldOut', 0.2); % Use 20% of the data for testing
train_idx = cv.training;
test_idx = cv.test;

% Split input and output dataset
X = [];
y = [];
for i = 1:n
    X = [X,dataset{i,1}];
    y = [y,dataset{i,2}];
end

% Split dataset into training and testing sets
X_train = X(train_idx);
y_train = y(train_idx);
X_test = X(test_idx);
y_test = y(test_idx);

input_layer = featureInputLayer(121);

hidden_layer_1 = fullyConnectedLayer(60);
hidden_layer_1.Name = 'hidden_layer_1';

relu_layer_1 = reluLayer();
relu_layer_1.Name = 'relu_layer_1';

hidden_layer_2 = fullyConnectedLayer(60);
hidden_layer_2.Name = 'hidden_layer_2';

relu_layer_2 = reluLayer();
relu_layer_2.Name = 'relu_layer_2';

output_layer = fullyConnectedLayer(3);
output_layer.Name = 'output_layer';

layers = [    input_layer    hidden_layer_1    relu_layer_1    hidden_layer_2    relu_layer_2    output_layer    regressionLayer()];

options = trainingOptions('adam', ...
    'MaxEpochs', 500, ...
    'MiniBatchSize', 400, ...
    'Plots','training-progress');

net = trainNetwork(X_train, y_train, layers, options);
