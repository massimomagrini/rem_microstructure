function [epoch_iss, epoch_sub_perc] = segmentation (epoch, SEM_initial, SEM_final, REM_initial, REM_final,sf)
%[epoch_iss, epoch_sub_perc] = segmentation (epoch, SEM_initial, SEM_final, REM_initial, REM_final, sf)
%The input vectors SEM_initial, SEM_final, REM_initial, and REM_final are the outputs of the function “transient_simpl.m” respectively applied to the moving average relative to the SEM component and to the moving average relative to the REM component.
%The output epoch_iss (instantaneous sub-stage) gives the value of the sub-stage (equal to 1, or 2, or 3, or 4) for each instant of the considered REM-sleep epoch. The output epoch_sub_perc gives the time percentage for each sub-stage in the considered REM-sleep epoch.

  
 M = size (epoch, 2);
 epoch_iss (1:M) = 0.;
 N_slow = size (SEM_initial, 2);
 N_rapid = size (REM_initial, 2);
for n = 1 : N_slow
     i1 = round (SEM_initial(n) * sf) + 1;
     i2 = round (SEM_final(n) * sf) + 1;
     for i = i1 : i2
         epoch_iss (i) = epoch_iss (i) + 1.;
     end
 end
 for n = 1 : N_rapid
     i1 = round (REM_initial(n) * sf) + 1;
     i2 = round (REM_final(n) * sf) + 1;
     for i = i1 : i2
         epoch_iss (i) = epoch_iss (i) + 2.;
     end
 end
 epoch_sub_perc (1:4) = 0.;
 for i = 1 : M
     epoch_iss (i) = epoch_iss (i) + 1.;
     k = epoch_iss(i);
     epoch_sub_perc (k) = epoch_sub_perc (k) + 100./M;
 end
 nos = 1.;
 for i = 2 : M
    if abs (epoch_iss (i) - epoch_iss (i-1)) > 0.
	     nos = nos +1;
    end
 end