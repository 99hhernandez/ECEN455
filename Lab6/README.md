## OVERVIEW
This exercise will introduce the concept of linear codes used to protect transmitted data from
errors caused by noise in the environment. First, we will use a sample code defined by

![code](https://bit.ly/3LV2ifA)

with generator matrix G = [P, I<sub>3</sub>] and parity-check matrix H = [I3,-P<sup>T</sup>] . Later, we will use the
(23, 12) Golay code, which is closely related to the code used on the original Voyager space probe.
It has generator matrix G = [Q, I<sub>12</sub>] and parity-check matrix H = [I<sub>11</sub>,-Q<sup>T</sup>], where the matrix Q
can be found in golay.mat and is given by


        [1 1 0 0 0 1 1 1 0 1 0]
        [0 1 1 0 0 0 1 1 1 0 1]
        [1 1 1 1 0 1 1 0 1 0 0]
        [0 1 1 1 1 0 1 1 0 1 0]
        [0 0 1 1 1 1 0 1 1 0 1]
    Q = [1 1 0 1 1 0 0 1 1 0 0]
        [0 1 1 0 1 1 0 0 1 1 0]
        [0 0 1 1 0 1 1 0 0 1 1] 
        [1 1 0 1 1 1 0 0 0 1 1]
        [1 0 1 0 1 0 0 1 0 1 1]
        [1 0 0 1 0 0 1 1 1 1 1]
        [1 0 0 0 1 1 1 0 1 0 1]

## EXERCISES

1. For the first code, generate inputs which consists of all possible three-bit messages. Make
this in the form of a matrix u with three columns and 8 rows.

2. Generate the \codebook" which is a matrix containing all six-bit codewords (each row has
one codeword) from the corresponding row of inputs. You can get this with a single matrix
multiplication followed by the mod operation. Call this matrix C. List all codewords and
find d<sub>min</sub>.

3. Given our choice of H, construct a syndrome table which corrects all errors of weight t <=
⌊(dmin - 1)=2⌋.

    To make the syndrome table computation easier, try listing all low weight errors and building
the syndrome table sequentially. For example, use the binary syndrome as an integer address
into a 2<sup>n-k</sup> * n table that maps syndromes to error patterns.
For example, initialize the array to all ones. Then, for each low weight error pattern, compute
the syndrome. Look in the table to see if the error pattern has lower weight than the current
entry. If so, replace it. This will give a syndrome table with minimum weight error patterns.
Entries that never change from all ones can be treated as detected errors.

4. Decode the received vector [1 0 1 1 1 1] using the syndrome table.

5. Simulate the code over a BSC with error rate 0.05, 0.10 and 0.15. Compare with your
theoretical predictions based on error correcting radius of the code.
