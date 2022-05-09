## OVERVIEW
This exercise will introduce the concept of linear codes used to protect transmitted data from
errors caused by noise in the environment. First, we will use a sample code defined by

![code](https://bit.ly/3vXfPxz)

with generator matrix G = [P, I3] and parity-check matrix H = [I3,-PT] . Later, we will use the
(23; 12) Golay code, which is closely related to the code used on the original Voyager space probe.
It has generator matrix G = [Q; I12] and parity-check matrix H = [I11,-QT], where the matrix Q
can be found in golay.mat and is given by
