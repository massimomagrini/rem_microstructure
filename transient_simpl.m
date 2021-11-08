function [initial_time, final_time] = transient_simpl (moving_average, thresh0, thresh1, sf)
%[initial_time, final_time] = transient_simpl (moving_average, thresh0, thresh1,sf)
%The input moving_average is the output of the function “average_calc.m” applied first to the SEM component 
%and then to the REM component. For our analyses, thresh0 = 0 and thresh1 = 1.
%The output initial_time is a vector whose components are the initial times (in seconds) of the sub_epochs 
%that are characterized by an enhancement of the EOG component. The output final_time is a vector whose 
%components are the end times (in seconds) of the sub_epochs that are characterized by an enhancement of the EOG component. 
%All these times are given with respect to the beginning of the recording.


possible_transient = false;
existing_transient = false;
possible_maximum = 0.;
possible_initial_time = 0.;
possible_maximum_time = 0.;
transient_index = 0;
initial_time (1) = 0.;
final_time (1) = 0.;
peak_v (1) = 0.;
peak_t (1) = 0.;
total_number = size (moving_average, 2);
sum = 0.;
long_average (1:total_number) = mean (moving_average);
descriptor = moving_average - long_average;
descriptor = descriptor ./ long_average;
for i = 1: total_number
    if descriptor(i) > thresh0
        if possible_transient == false
            possible_transient = true;
            possible_initial_time = (i-1)/sf;
         end
         if descriptor(i) > thresh1
            % transient confirmation
            existing_transient = true;
         end
    end
    if (descriptor(i) <= thresh0 && possible_transient == true)
        possible_transient = false;
        if existing_transient == true
            transient_index = transient_index + 1;
            initial_time (transient_index) = possible_initial_time;
            final_time (transient_index) = (i-2)/sf;
            existing_transient = false;
        end
    end     
end