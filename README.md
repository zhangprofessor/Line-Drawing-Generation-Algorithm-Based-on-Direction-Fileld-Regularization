# Line-Drawing-Generation-Algorithm-Based-on-Direction-Fileld-Regularization

A Brief Introduction to the Code of the Algorithms:It consists of several parts:(1)Non-local Means filtering is used to preprocess
the input image;(2)Calculate the direction field of the input image and the Tikhonov regularization of the direction
field based on the self-representation idea.In order to improve the speed of operation, the Sherman-Morrison-Woodbury
formula is used to accelerate the regularization algorithm;(3)Using a regular direction field as a guide,the pre-processed
image is filtered by difference of Gaussian filter;(4)According to the non-linear characteristics of human visual system,
the Perceptual thresholding algorithm is designed to process the results of the Gaussion difference of filtering and obtain
binary line drawing image.

% ============================================================================

How to run the codes:
1.Open the Demo.m file.
2.In line 13 of the file, You can change the name of the picture as you like.
3.In line 36 of the file, thresholds can be set by yourself, usually in [0,1].
  But when the threshold is equal to 0.6, the effect is better.
4.Now just run the Main.m file and you can get a line drawing image.
