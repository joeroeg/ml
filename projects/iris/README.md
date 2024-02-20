# Iris Dataset Classification Project

## Overview
This project demonstrates a simple classification task using the famous Iris dataset.

This is one of the earliest datasets used in the literature on classification methods and widely used in statistics and machine learning.  The data set contains 3 classes of 50 instances each, where each class refers to a type of iris plant.  One class is linearly separable from the other 2; the latter are not linearly separable from each other

In this project, we use machine learning algorithms from Scikit-learn to classify iris flowers into three species: Setosa, Versicolor, and Virginica.

![Iris Flowers](images/iris_visual.png)

## Dataset Description
Origin: The dataset contains samples of iris flowers collected by Edgar Anderson and contributed by Fisher. It was collected to quantify the morphologic variation of iris flowers of three related species.

Structure: The dataset consists of 150 samples, with each sample representing an individual iris flower. Each sample contains four features:

Sepal length (in centimeters)
Sepal width (in centimeters)
Petal length (in centimeters)
Petal width (in centimeters)
Additionally, each sample is labeled with the species of iris it belongs to. There are three classes or species in the dataset:

Setosa
Versicolor
Virginica
Classes: The goal of using the Iris dataset in machine learning tasks is typically to predict the species of an iris flower based on its features. This makes it a classification problem with three classes.

Characteristics: The dataset is well-structured and balanced, with 50 samples for each of the three classes. The features are numeric and have meaningful interpretations in the context of botany.

Applications: The Iris dataset is commonly used for teaching and practicing machine learning algorithms, particularly for tasks such as classification, clustering, and dimensionality reduction. It's also frequently used in research papers and competitions as a benchmark dataset.


## Installation
To run this project, you need Python installed on your system. You can install the required dependencies using pip:

```bash
pip install numpy scikit-learn
```

## Usage
To train and evaluate the classification models, simply run the `iris_classification.py` script:

```bash
python iris_classification.py
```

This script will load the Iris dataset, preprocess the data, train several classification models, evaluate their performance using cross-validation, and display the results.

## Files
- `iris_classification.py`: Python script for loading the Iris dataset, training classification models, and evaluating their performance.
- `README.md`: This file, providing an overview of the project.
- `LICENSE`: License information for the project.
- `requirements.txt`: List of dependencies required to run the project.

## Results
After running the `iris_classification.py` script, you will see the performance metrics of various classification algorithms, such as accuracy, precision, recall, and F1-score. Here's a sample output:

```
Random Forest Classifier:
Accuracy: 0.97
Precision: 0.97
Recall: 0.97
F1-score: 0.97
```

## License
This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
