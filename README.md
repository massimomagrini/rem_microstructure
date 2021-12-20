# rem_microstructure
This package, written in the Matlab/Octave language, have been used in our laboratory to quantitatively determine the REM-sleep microstructure by analyzing the ElectroOculoGraphic (EOG) signal recorded during sleep.


The REM-sleep microstructure consists in the alternation of four sub-stages inside a REM-sleep period. This alternation is due to two important phenomena reported in the literature:
1) Rapid Eye Movements (REMs) are significantly present only in “phasic” sub-periods of REM-sleep periods, and are absent or poorly present during “tonic” sub-periods.
2) In addition to REMs, also Slow Eye Movements (SEMs) occur during REM-sleep periods.
The sub-stages are respectively characterized by:
No enhancement either of SEMs or REMs (sub-stage 1);
Selective enhancement of SEMs ( sub-stage 2);
Selective enhancement of REMs (sub-stage 3);
Enhancement of both SEMs and REMs (sub-stage 4).

For each REM-sleep period, the analysis is carried out in four steps:
1)	Two band-pass filters (0.2-0.6 Hz, and 1-3 Hz) are applied to the EOG signal to obtain the SEM component and the REM component, respectively.
2)	The time course of the average absolute value over a moving window lasting 2.5 seconds is calculated for both components. The difference between this average and the average of the absolute value over the entire REM-sleep period is then divided by the average amplitude over the entire period. In other words, a comparison is made between the quasi-instantaneous amplitude and the background amplitude of both components. Two non-dimensional descriptors are thus obtained.
3)	A sub-period of the REM-sleep period is considered as characterized by an enhancement of one of the two components if the relative descriptor is greater than 0 over the entire sub-period and greater than 1 at least in one instant of the sub-period.
4)	Finally, each instant of the REM-sleep period is assigned to one of the four sub-stages.

The numerical values of the parameters (cutoff frequencies, time length of the moving window, and thresholds applied to the descriptors) have been suggested by the literature, including the literature about the NREM microstructure.

The package consists of seven functions.
The functions “component_calc.m”, “average_calc.m”, “transient_simpl.m”, and “segmentation.m” are successively executed for the analysis of a single REM-sleep period. All of them are called by “microstr.m”, which thus provides the thorough characterization of the microstructure of a REM-sleep period.
In turn, a thorough analysis of all the REM-sleep periods of a night sleep is obtained by running “root_function.m”. In fact, this function calls the function “epoca.m” to extract the portions of the EOG signal that correspond to the REM-sleep periods, and then calls “microstr.m” for each period.

A more detailed description of the package can be found on the ISTI Open Portal:
https://openportal.isti.cnr.it/doc?id=people______::c2c785d4a891ba4a58fdff814b100b1d





