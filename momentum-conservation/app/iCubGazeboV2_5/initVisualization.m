% INITVISUALIZATION initializes the visualization settings.
%
%                   REQUIRED VARIABLES:
%
%                   - Config: [struct] with fields:
%
%                             - Visualization: [struct]; (created here)
%
% Author: Gabriele Nava (gabriele.nava@iit.it)
% Genova, Nov 2018
    
%% ------------Initialization----------------

% this list contains the NAMES of all the variables that it will be
% possible to plot when the simulation is over
Config.Visualization.vizVariableList = {'t','jointVel','L','baseVel'};

% if "activateXAxisMenu" is TRUE, a GUI will appear asking the user to 
% specify which variable to use as x-axis in the plots between the ones 
% inside the "vizVariableList". If FALSE, the "defaultXAxisVariableName" 
% will be used instead. The selected x-axis must respect these conditions:
%
% - the variable exists;
% - the variable "defaultXAxisVariableName" is also inside the "vizVariableList";
% - the variable is a vector of the same length of the y-axis;
%
% if one of the above conditions is not true, the specified x-axis is ignored.
Config.Visualization.activateXAxisMenu        = true;
Config.Visualization.defaultXAxisVariableName = 't';

% general settings
Settings = struct;
Settings.lineWidth         = 4;
Settings.fontSize_axis     = 25;
Settings.fontSize_leg      = 25;
Settings.removeLegendBox   = true;
Settings.legendOrientation = 'horizontal';
Settings.xLabel            = {'Time [s]'};
    
% time
Config.Visualization.figureSettingsList{1}.Mode = 'singlePlot';
Config.Visualization.figureSettingsList{1}.Settings = Settings;
Config.Visualization.figureSettingsList{1}.Settings.yLabel = {'Time [s]'};
Config.Visualization.figureSettingsList{1}.Settings.figTitle = {'Integration time'};
    
% joint velocities
Config.Visualization.figureSettingsList{2}.Mode = 'multiplePlot';
Config.Visualization.figureSettingsList{2}.numOfFigures = 5;
Config.Visualization.figureSettingsList{2}.numOfSubFigures = 5;
Config.Visualization.figureSettingsList{2}.totalSubFiguresSinglePlot = [3,2];
Config.Visualization.figureSettingsList{2}.Settings = Settings;
Config.Visualization.figureSettingsList{2}.Settings.yLabel = {'Joint Velocities [rad/s]'};
Config.Visualization.figureSettingsList{2}.modeMultiplePlot = 'newplot';  
Config.Visualization.figureSettingsList{2}.legendList = {'torsoPitch','torsoRoll','torsoYaw', ...
                                                         'LshoulderPitch','LshoulderRoll','LshoulderYaw','Lelbow','LwristProsup', ...
                                                         'RshoulderPitch','RshoulderRoll','RshoulderYaw','Relbow','RwristProsup', ...
                                                         'LhipPitch','LhipRoll','LhipYaw','Lknee','LanklePitch','LankleRoll', ...
                                                         'RhipPitch','RhipRoll','RhipYaw','Rknee','RanklePitch','RankleRoll'};                                                    
% momentum
Config.Visualization.figureSettingsList{3} = Config.Visualization.figureSettingsList{2};
Config.Visualization.figureSettingsList{3}.numOfFigures = 2;
Config.Visualization.figureSettingsList{3}.numOfSubFigures = 3;
Config.Visualization.figureSettingsList{3}.totalSubFiguresSinglePlot = [3,1];
Config.Visualization.figureSettingsList{3}.Settings.yLabel = {'Momentum'};
Config.Visualization.figureSettingsList{3}.legendList = {'LMom-x','LMom-y','LMom-z','AngMom-x','AngMom-y','AngMom-z'};

% base velocity
Config.Visualization.figureSettingsList{4} = Config.Visualization.figureSettingsList{3};
Config.Visualization.figureSettingsList{4}.Settings.yLabel = {'Base Vel'}; 
Config.Visualization.figureSettingsList{4}.legendList = {'LVel-x','LVel-y','LVel-z','AngVel-x','AngVel-y','AngVel-z'};