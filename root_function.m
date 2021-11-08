function [csi, iss, sub_perc, epochs, duration] = root_function (filename,start_time, end_time, sf)
%[csi, iss, sub_perc, epochs, duration] = root_function (filename, start_time, end_time, sf)
%While the vectors epoch_iss and epoch_sub_perc, which are the output of “microstr.m”, 
%are related to a single REM-sleep epoch, iss and sub_perch are matrices that are related to all the REM-sleep epochs of the night sleep. In fact, sub_perc (n, k) indicates the percentage of sub-stage k (k = 1, 2, 3,4) for the nth REM-sleep period, and iss (n, i) indicates the instantaneous values of sub-stage k for the nth REM-sleep period (the index i corresponds to the instant (i/sf – 1) (in seconds), sf being the sampling rate (in Hz).
%The matrix epochs (n, i) gives the values of the EOG portion corresponding to the nth REM-sleep period 
%at the instant (i/sf – 1), in the interval from i = 1 to i = duration (n) * sf.
%The output csi gives the number of sampled points in the EOG signal recorded during the entire night. 
%The input variable filename indicates the ascii file containing this EOG signal. 
%The output vector duration (n) indicates the duration of the nth REM-sleep period.


 a1 = load (filename, '-ascii');
 a1 = a1';
 csi = size (a1, 2)
 numero = size (start_time, 2);
 duration (1:numero) = 0.;
 for n = 1 : numero
    duration (n) = end_time (n) - start_time (n);
 end
 indexmax = max (duration) * sf;
 sub_perc (1:numero, 1:4) = 0.;
 iss (1:numero, 1: indexmax) = 0;
 epochs (1:numero, 1:indexmax) = 0.;
 for n = 1:numero
    epoch = epoca (a1, start_time (n), duration (n), sf);
    z = duration (n) * sf;
    epochs (n, 1:z) = epoch (1: z);
    [iss0,sub_perc0] = microstr (epoch, sf);
    sub_perc (n, 1:4) = sub_perc0 (1:4);
    iss (n, 1:z) = iss0 (1:z);
    clear epoch
    clear z
    clear iss0
 end