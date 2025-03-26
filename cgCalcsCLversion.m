%{
MAE4151 - SENIOR DESIGN II
Tachyon Aerospace
Author: Benjamin Tran, Juan Garza

Simple script for calculating CG from structures, system, propellant, and
payload weights.
%}
clc; clear;
%% First Stage Components (IGNORE THIS FOR NOW MASS ARE RIGHT LOCATION ARE WRONG)
components_stage1 = {'Structure1', 'Fuel1', 'Oxidizer1', 'Engines1', 'Systems1'};
mass.Structure1 = 32403.48;     cg.Structure1 = 19.5;
mass.Fuel1      = 315622.87;     cg.Fuel1      = 18.0;
mass.Oxidizer1  = 1136242.34;     cg.Oxidizer1  = 24.0;
mass.Engines1   = 19825;     cg.Engines1   = 25.5;
mass.Systems1   = 13577.53;      cg.Systems1   = 22.0;

%% Second Stage Components
components_stage2 = {'Structure2', 'Fuel2', 'Oxidizer2', 'Engines2', 'Systems2', 'Payload'};
mass.Structure2 = 33149.33;     cg.Structure2 = 13; %This location is an assumption based
mass.Fuel2      = 68733.04 * .05;      cg.Fuel2      = 20.41; %68733.04 (Need 10% or less on return)
mass.Oxidizer2  = 247438.96 * .05;      cg.Oxidizer2  = 23.7; %246438.96 (Need 10% or less on return)
mass.Engines2   = 1525;      cg.Engines2   = 26;
mass.Systems2   = 10817.47;      cg.Systems2   = 2.2;
mass.Payload    = 29000;      cg.Payload    = 14.3;

%% First Stage CG
mass_stage1 = cellfun(@(c) mass.(c), components_stage1);
cg_stage1   = cellfun(@(c) cg.(c),   components_stage1);
total_mass_stage1 = sum(mass_stage1);
total_moment_stage1 = sum(mass_stage1 .* cg_stage1);
cg_stage1_total = total_moment_stage1 / total_mass_stage1;

%% Second Stage CG
mass_stage2 = cellfun(@(c) mass.(c), components_stage2);
cg_stage2   = cellfun(@(c) cg.(c),   components_stage2);
total_mass_stage2 = sum(mass_stage2);
total_moment_stage2 = sum(mass_stage2 .* cg_stage2);
cg_stage2_total = total_moment_stage2 / total_mass_stage2;

%% Combined CG
total_mass_all = total_mass_stage1 + total_mass_stage2;
total_moment_all = total_moment_stage1 + total_moment_stage2;
cg_combined = total_moment_all / total_mass_all;

%% Ouputs
fprintf('\n==== CG RESULTS ====\n');
fprintf('First Stage CG:    %.2f m from nose\n', cg_stage1_total);
fprintf('Second Stage CG:   %.2f m from nose\n', cg_stage2_total);
fprintf('Combined CG:       %.2f m from nose\n', cg_combined);
fprintf('Total Mass:        %.2f kg\n', total_mass_all);

