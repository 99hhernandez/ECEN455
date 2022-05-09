## OVERVIEW

Modern communication systems rely on conversion of signals from analog
to digital and back. For example, your cellphone must convert the sound of
your voice from analog to digital, encode the digital stream for transmission,
and then modulate the digital information onto analog carriers. In this lab,
we explore the effects of quantization.

For a discrete time signal x<sub>1</sub>, x<sub>2</sub>, · · · , x<sub>n</sub>, the average power is

![P_x](http://www.sciweavers.org/tex2img.php?eq=%20P_%7Bx%7D%3D%20%5Cfrac%7B1%7D%7Bn%7D%20%5Csum_%7Bi%3D1%7D%5En%20%7B%7B%5Cmid%20%20%20x_%7Bi%7D%20%5Cmid%7D%5E%7B2%7D%7D%20%20%20%20&bc=White&fc=Black&im=png&fs=12&ff=arev&edit=0)

If the signal x<sub>i</sub> is quantized to the signal y<sub>i</sub>, then the quantization noise
(or error) signal is z<sub>i</sub> = x<sub>i</sub> − y<sub>i</sub>. Use the following definition for your mea-
surements:

![SQNR](http://www.sciweavers.org/tex2img.php?eq=SQNR%3D10%20log_%7B10%7D%20%5Cbig%28%20%5Cfrac%7BP_%7Bx%7D%7D%7BP_%7Bz%7D%7D%20%5Cbig%29%20%20&bc=White&fc=Black&im=png&fs=12&ff=arev&edit=0)

## EXERCISES

1. Optimal Non-uniform Quantization
    
    Consider a Gaussian source with zero mean and unit variance. Using
the Lloyd-Max algorithm, design an optimal quantizer with M = 2<sup>n</sup>
levels. Let q<sub>1</sub>, . . . , q<sub>M</sub> be the quantization points and 
let −10, b<sub>1</sub>, b<sub>2</sub>, . . . , b<sub>M−1</sub>,+10
be the decision boundaries. For n = 2 and n = 3, compute qs and bs
and the corresponding mean squared error. Do you see that the mean
squared error improves going from 2 bits to 3 bits? Generate many
samples of the Gaussian random variable and quantize it using the
quantizer you have designed in the previous part. Compute the mean squared error 
empirically and see that it matches with what you obtained in the previous part.

    For your own interest (do not have to turn it in) - for n = 10 and
n = 11 design the optimal quantizer and compute the SQNR. Do you
see that your SQNR increases by 6 dB?

2. Non-uniform Quantization and Logarithmic Compression
    
    There are four speech wave files (8 KHz/16-bit) on the website. You
can read these into Matlab using wavread and play them through the
headphone jack using sound. It is also possible to record your own
wave files using the Sound Recorder application.
    
    1. Load two of the wave files, plot them versus the time axis, and
listen to their content.

    2. Listen to these sound clips again after uniform 8-bit quantization.
What is the SQNR?

    3. Using the data from the speech files, compute the root mean
squared (RMS) value of the speech samples. Plot the histogram
of the magnitude of the speech samples relative to the RMS value,
i.e. if X[n] is a random variable that represents the amplitude of
the speech sample at time n, plot the histogram of ![fig](http://www.sciweavers.org/tex2img.php?eq=%20%5Cfrac%7B%5Cmid%20X%5Bn%5D%20%5Cmid%7D%7BX_%7BRMS%7D%7D%20%20%20&bc=White&fc=Black&im=png&fs=12&ff=arev&edit=0).

    4. Design and test an 8 bit nonuniform PCM system using μ-law
compressor and expander(or compander). Test your system using
one of the audio signals. Choose a value for μ which you think
will work best for the audio signal. Plot the encoded/decoded
waveform and playback the new signals. How does this compare
with the original signal? How does this compare with the 8-bit
uniform quantizer?

    5. What value of μ did you choose and why? What is the SQNR for
the audio signal?

___
μ-Law compressor ![comp](http://www.sciweavers.org/tex2img.php?eq=F%28x%29%3Dsgn%28x%29%20%5Cfrac%7Bln%281%2B%20%5Cmu%20%7Cx%7C%29%7D%7Bln%281%2B%20%5Cmu%29%7D%20%3B%20%20%20-1%20%5Cleq%20x%20%5Cleq%201&bc=White&fc=Black&im=png&fs=12&ff=arev&edit=0)

Expander ![expa](http://www.sciweavers.org/tex2img.php?eq=%20F%5E%7B-1%7D%28y%29%3Dsgn%28y%29%281%2F%20%5Cmu%29%28%20%281%2B%20%5Cmu%29%5E%7B%7Cy%7C%7D-1%29%20%20%3B%20-1%20%5Cleq%20y%20%5Cleq%201&bc=White&fc=Black&im=png&fs=12&ff=arev&edit=0)

