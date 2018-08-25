# Decision-tree
Building a decision tree for Kaggle glass classification data set

Decision tree using C5.0 
C5.0 model works by splitting the sample based on the field that provides the maximum information gain.
C5.0 can produce two kinds of models. A decision tree is a straightforward description of the splits found by the algorithm. Each terminal (or "leaf") node describes a particular subset of the training data, and each case in the training data belongs to exactly one terminal node in the tree.
a rule set is a set of rules that tries to make predictions for individual records. Rule sets are derived from decision trees and, in a way, represent a simplified or distilled version of the information found in the decision tree. Rule sets can often retain most of the important information from a full decision tree but with a less complex model. Because of the way rule sets work, they do not have the same properties as decision trees.
The Kaggle glass classification challange where the chemical composition of glass is given and is required to determine the type of glass.
The data set can be obtained from "kaggle datasets download -d uciml/glass"
