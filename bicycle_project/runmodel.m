close all; clear; clc;
addpath(genpath(fileparts(mfilename('fullpath')))); % 添加当前路径
run(fullfile('scripts', 'control_bonus.m'));  % 执行参数计算
modelPath = fullfile('model','bicycle_model.slx');
open_system(modelPath);
set_param('bicycle_model', 'Solver', 'ode4');
set_param('bicycle_model', 'StopTime', '3');
out = sim('bicycle_model');
run(fullfile('scripts', 'visualization.m'));
rmpath(genpath(fileparts(mfilename('fullpath'))));