function [epoch] = epoca (trace, start_time, time_length, sf)
%[epoch] = epoca (trace, start_time, time_length, sf)
%This function is applied to obtain the portions of the EOG signal that correspond to REM-sleep periods. 
%The output epoch is the portion of trace (the EOG signal over the entire night recording) corresponding to the epoch 
%lasting time_length (in seconds) starting from start_time (in seconds). 
%The values of start_time and time_length are those given by sleep-stage scoring.


 end_time = start_time + time_length;
 index1 = round (sf  * start_time) + 1;
 index2 = round (sf * end_time) + 1;
 total_number = index2-index1 +1;
 epoch (1 : total_number) = trace (index1 : index2);