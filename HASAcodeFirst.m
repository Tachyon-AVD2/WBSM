%{
MAE4151 - SENIOR DESIGN II
Tachyon Aerospace
Author: Benjamin Tran, Juan Garza

Script for estimating weight components for both stages from HASA
equations. These equations work more primarily for Hypersonic Aircraft, but
can be adapted to rockets. This does not have the Payload Mass

Constants are inputted based on the vehicle.
Constants are set in ConstantFirst Function
%}

function [MainComponents, Propellant, Structure,  Propulsion, Subsystem] = HASAcodeFirst(cf, wOxidizer, wFuel, WTOGW, C)

Stb = C.Sbtot/2;  %lower half of the body wetted surface area

% Total Structure Weight
o = abs( ((C.Lb * C.ULF ) / C.Dbe )^ 0.15 * C.Qmax ^ 0.16 * C.Sbtot ^ 1.05 );
wPropellant = wOxidizer + wFuel;  % Fuel weight, Propulsion
wBody = 0.341 * C.mf * o ^ 1.0;  %Body weight 
wThrust = 0.0025 * C.Ttork; % Thrust structure weight 
wtps = C.Wins * Stb; % TPS weight
wStructure = wBody + wtps + C.wLandingLegs + wThrust + C.wTank; %Total structure weight

% Propulsion Weight
wPropulsion = C.wEng;  %wtank +% Total propulsion weight 

% Subsystem Weight
phi = abs (( C.Qmax / 1000 ) ^ 0.334 * C.Lb ^ 0.5 );
wHydr = 2.64 * phi ^ 1.0; % Hydraulics weight
wAvioncs = 66.37 * WTOGW ^ 0.361; % Total avionics weight 
psi =  abs (WTOGW ^ 0.5 * C.Lb ^ 0.25);
wElectrical = 1.167 *  psi ^ 1.0; % Electrical weight
wEquipment = 1000 + 0.01 * (WTOGW - 0.0000003); % Equipment weight

wSubsystem = wHydr + wAvioncs + wElectrical + wEquipment; % Subsystems weight

% Total Weight
TOGW = wPropellant + wStructure  + C.wGridfins + wPropulsion + wSubsystem;  %HASA TOGW

MainComponents = [wPropellant; wStructure; wPropulsion; wSubsystem; TOGW];
Propellant = [wOxidizer; wFuel];
Structure = [wBody; wtps; C.wLandingLegs; wThrust; C.wTank];
Propulsion = C.wEng;
Subsystem = [wHydr; wAvioncs; wElectrical; wEquipment];

end