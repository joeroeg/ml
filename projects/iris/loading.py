from sklearn.datasets import load_iris

# Load the Iris dataset
iris = load_iris()

# Access the features (X) and target (y) variables
X = iris.data  # Features (sepal length, sepal width, petal length, petal width)
y = iris.target  # Target variable (species of iris)

# Optionally, you can also access other information such as feature names, target names, and dataset description
feature_names = iris.feature_names
target_names = iris.target_names
dataset_description = iris.DESCR

# Print dataset information
print("Feature names:", feature_names)
print("Target names:", target_names)
print("Number of samples:", len(X))
print("Number of features:", X.shape[1])
print("Target names:", target_names)
print("Dataset description:\n", dataset_description)
