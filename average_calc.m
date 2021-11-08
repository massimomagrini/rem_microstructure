function [moving_average] = average_calc (epoch_comp, time_window, sf)
%[moving_average] = average_calc (epoch_comp, time_window, sf)
%The input epoch_comp is the SEM (and then the REM) component of the EOG signal over a REM-sleep period 
%(the output of “component_calc.m”). The output of “average_calc.m” is the convolution of the absolute 
%value of the component with a rectangular window lasting time_window (for our analyses, time_window = 2.5 s).
ls
 total_number = size (epoch_comp, 2);
 hwp = round (time_window * sf / 2.);
 rectangle (1 : total_number) = 0.;
 rectangle (1 : hwp + 1) = 1./(2.*hwp+1.);
 rectangle (total_number-hwp+1 : total_number) = 1./(2.*hwp+1.);
 transform_of_rectangle = fft (rectangle);
 absepoch_comp = abs (epoch_comp);
 transform_of_absepoch_comp = fft (absepoch_comp);
 product = transform_of_absepoch_comp .* transform_of_rectangle;
 zzz = ifft (product);
 moving_average = real (zzz);
 moving_average (1 : hwp) = moving_average (hwp +1);
 z = total_number - hwp;
 moving_average (z : total_number) = moving_average (z - 1);