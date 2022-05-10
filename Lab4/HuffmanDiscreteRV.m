% Declare the distribution of X, Y separately and jointly
probX = [0.35 0.4 0.25];
probY = [0.4 0.6];
probJoint = [0.15 0.1 0.15 0.2 0.3 0.1];
% Call the HuffmanLength function for all three distributions
huffmanX = HuffmanLength(probX);
huffmanY = HuffmanLength(probY);
huffmanJoint = HuffmanLength(probJoint);
% Print the resulting huffman lengths
fprintf('Average Length of Huffman Code for X:%i\n',huffmanX);
fprintf('Average Length of Huffman Code for Y:%i\n',huffmanY);
fprintf('Average Length of Huffman Code for X and Y Jointly:%i\n',huffmanJoint);