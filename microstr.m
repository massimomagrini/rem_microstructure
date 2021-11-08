function [epoch_iss, epoch_sub_perc] = microstr (epoch, sf)
%[epoch_iss, epoch_sub_perc] = microstr (epoch, sf)
%This function has the same output of “segmentation.m”. 
%It simply allows to orderly execute the analysis of the considered EOG portion (input epoch).
%The code of this function, which is here reported, provides a clear description of the rationale of the analysis method.


[SEM_comp] = component_calc (epoch, 0.2, 0.6, sf);
[REM_comp] = component_calc (epoch, 1., 3., sf);
[SEM_moving_average] = average_calc (SEM_comp, 2.5, sf);
[REM_moving_average] = average_calc (REM_comp, 2.5, sf);
[SEM_initial, SEM_final] = transient_simpl (SEM_moving_average, 0., 1., sf);
[REM_initial, REM_final] = transient_simpl (REM_moving_average, 0., 1., sf);
[epoch_iss, epoch_sub_perc] = segmentation (epoch, SEM_initial, SEM_final, REM_initial, REM_final, sf);