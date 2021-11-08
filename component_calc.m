function [epoch_comp] = component_calc (epoch, f1, f2, sf)
%[epoch_comp] = component_calc (epoch, f1, f2, sf)
%This function applies an ideal rectangular filter in the frequency domain to 
%the input signal epoch (the portion of the EOG signal corresponding to the considered REM-sleep period). 
%The cutoff frequencies of the filter are f1 and f2 (in Hz) (f1 = 0.2 for SEMs and 1.0 for REMS; 
%f2 = 0.6 for SEMs and 3.0 for REMs). sf is the sampling rate (in Hz). 
%For each REM-sleep period, this function is applied twice, to respectively obtain the SEM component and the REM component.

 total_number = size (epoch, 2);
 totaltime = total_number / sf;
 harmonic1 = round (f1 * totaltime);
 harmonic2 = round (f2 * totaltime);
 v = fft (epoch);
 v(1:harmonic1) = 0.;
 v(harmonic2 + 2: total_number - harmonic2) = 0.;
 v(total_number - harmonic1 + 2 : total_number) = 0.;
 zc = ifft (v);
 epoch_comp = real (zc);