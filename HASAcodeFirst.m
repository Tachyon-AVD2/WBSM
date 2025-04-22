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

function [MainComponents, Propellant, Structure,  Propulsion, Subsystem] = HASAcodeFirst(cf, wOxidizer, wFuel, WTOGW, Cf)
% Constants
Stb = Cf.Sbtot;

% Total Structure Weight
o = abs((Cf.Lb*Cf.ULF/Cf.Dbe)^0.15*Cf.Qmax^0.16*Cf.Sbtot^1.05);
wBody = 0.341*Cf.mf*o^1.0;    %Body Weight 
wPropellant = wOxidizer + wFuel;  %Propellant Weight
Wemp = WTOGW - wPropellant;     %Empty Weight
Ww = cf*0.2958*Cf.mf*(abs(Wemp*Cf.ULF/1000)^0.52 * abs(Cf.Sref)^0.7 * abs(Cf.AR)^0.47 * abs((1+Cf.lambda)/(Cf.tc))^0.4 * abs(0.3+0.7/cos(Cf.lambdah)))^1.017;  %Wing Weight
Delta = abs((WTOGW/Cf.Sref)^0.6*(Cf.Swfh)^1.2*(Cf.Qmax)^0.8);
Wfinh = 0.0035*(Delta)^1.0;     %Horiziontal Tail Weight
Wfinv = 5.0*(Cf.Swfv)^1.09;        %Vertical Tail Weight
wGear = 0.00916*(Wemp)^1.124;  %Landing Gear Weight
wThrust = 0.0025*Cf.Ttotrk;     %Thrust Structure Weight
wtps = Cf.Wins*(Stb + Cf.Sref + Cf.Swfh);   %TPS Weight

wStructure = wBody + wtps + wGear + wThrust;

% Propulsion Weight
wEng = 0.00766*(Cf.Ttotrk) + 0.00033 * (Cf.Ttotrk) * (Cf.Aratio)^0.5 + 130 * Cf.Neng; %Engine Weight

wPropulsion = wEng + Cf.wTank;

% Subsystem Weight
Psi = abs(((Cf.Sref + Cf.Swfv + Cf.Swfh)*Cf.Qmax/1000)^0.334 * (Cf.Lb + Cf.Wspan)^0.5);
wHydr = 2.64*(Psi)^1.0; %Hydraulic Weight
wAvioncs = 66.37*(Wemp)^0.361;    %Avionics Weight
O = abs((Wemp)^0.5 * (Cf.Lb)^0.25);
wElectrical = 1.167*(O)^1.0; %Electrical System Weight
wEquipment = 10000 + 0.01*(Wemp-0.0000003);    %Equipment Weight

wSubsystem = wHydr + wAvioncs + wElectrical + wEquipment;

MainComponents = [wPropellant; wStructure; wPropulsion; wSubsystem; WTOGW];
Propellant = [wOxidizer; wFuel];
Structure = [wBody; wtps; wGear; wThrust; Cf.wTank];
Propulsion = wEng;
Subsystem = [wHydr; wAvioncs; wElectrical; wEquipment];

end
