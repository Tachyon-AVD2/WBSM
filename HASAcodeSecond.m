%{
MAE4151 - SENIOR DESIGN II
Tachyon Aerospace
Author: Benjamin Tran, Juan Garza

Script for estimating weight components for both stages from HASA
equations. These equations work more primarily for Hypersonic Aircraft, but
can be adapted to rockets.

Constants are inputted based on the vehicle.
Constants are set in ConstantSecond Function
%}

function [MainComponents, Propellant, Structure,  Propulsion, Subsystem] = HASAcodeSecond(cf, wOxidizer, wFuel, WTOGW, Cs)
% Constants
Stb = Cs.Sbtot/2;

% Total Structure Weight
o = abs((Cs.Lb*Cs.ULF/Cs.Dbe)^0.15*Cs.Qmax^0.16*Cs.Sbtot^1.05);
wBody = 0.341*Cs.mf*o^1.0;    %Body Weight
wPropellant = wOxidizer + wFuel;  %Propellant Weight
Wemp = WTOGW - wPropellant;     %Empty Weight
Ww = 0.2958*Cs.mf*(abs(Wemp*Cs.ULF/1000)^0.52 * abs(Cs.Sref)^0.7 * abs(Cs.AR)^0.47 * abs((1+Cs.lambda)/(Cs.tc))^0.4 * abs(0.3+0.7/cos(Cs.lambdah)))^1.017;  %Wing Weight
Delta = abs((WTOGW/Cs.Sref)^0.6*(Cs.Swfh)^1.2*(Cs.Qmax)^0.8);
Wfinh = 0.0035*(Delta)^1.0;     %Horiziontal Tail Weight
Wfinv = 5.0*(Cs.Swfv)^1.09;        %Vertical Tail Weight
wGear = 0.00916*(WTOGW)^1.124;  %Landing Gear Weight
wThrust = 0.0025*Cs.Ttotrk;     %Thrust Structure Weight
wtps = Cs.Wins*(Stb + Cs.Sref + Cs.Swfh);   %TPS Weight

wStructure = wBody + Ww + Wfinh + Wfinv + wtps + wGear + wThrust;

% Propulsion Weight
wEng = 0.00766*(Cs.Ttotrk) + 0.00033 * (Cs.Ttotrk) * (Cs.Aratio)^0.5 + 130 * Cs.Neng; %Engine Weight

wPropulsion = wEng + Cs.wTank;

% Subsystem Weight
Psi = abs(((Cs.Sref + Cs.Swfv + Cs.Swfh)*Cs.Qmax/1000)^0.334 * (Cs.Lb + Cs.Wspan)^0.5);
wHydr = 2.64*(Psi)^1.0; %Hydraulic Weight
wAvioncs = 66.37*(WTOGW)^0.361;    %Avionics Weight
O = abs((WTOGW)^0.5 * (Cs.Lb)^0.25);
wElectrical = 1.167*(O)^1.0; %Electrical System Weight
wEquipment = 10000 + 0.01*(WTOGW-0.0000003);    %Equipment Weight

wSubsystem = wHydr + wAvioncs + wElectrical + wEquipment;

MainComponents = [wPropellant; wStructure; wPropulsion; wSubsystem; WTOGW];
Propellant = [wOxidizer; wFuel];
Structure = [wBody; wtps; wGear; wThrust; Cs.wTank];
Propulsion = wEng;
Subsystem = [wHydr; wAvioncs; wElectrical; wEquipment];

end