## OVERVIEW
This exercise will introduce the concept of linear codes used to protect transmitted data from
errors caused by noise in the environment. First, we will use a sample code defined by

![code](http://www.sciweavers.org/tex2img.php?eq=P%3D%20%5Cbegin%7Bbmatrix%7D1%20%26%201%20%26%200%20%5C%5C0%20%26%201%20%26%201%5C%5C1%20%26%200%20%26%201%20%5Cend%7Bbmatrix%7D%20&bc=White&fc=Black&im=jpg&fs=12&ff=mathdesign&edit=0)

with generator matrix G = [P, I3] and parity-check matrix H = [I3,-PT] . Later, we will use the
(23; 12) Golay code, which is closely related to the code used on the original Voyager space probe.
It has generator matrix G = [Q; I12] and parity-check matrix H = [I11,-QT], where the matrix Q
can be found in golay.mat and is given by
