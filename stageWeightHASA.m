%{
MAE4151 - SENIOR DESIGN
Nebula Aerospace
Author: Benjamin Tran, Juan Garza

%}

clear; clc; format longG


Cs = ConstantsSecond;
Cf = ConstantsFirst;

cf1 = 1;
wOxidizer1 = 2629268.884;
wFuel1 = 730352.468;
WTOGW1 = 4441868.993;

[fMain, fPropel, fStruc, fPropu, fSub] = HASAcodeFirst(cf1, wOxidizer1, wFuel1, WTOGW1, Cf);

cf2 = 4/3;
wOxidizer2 = 567728.672;
wFuel2 = 157702.421;
WTOGW2 = 914379.880;

[sMain, sPropel, sStruc, sPropu, sSub] = HASAcodeSecond(cf2, wOxidizer2, wFuel2, WTOGW2, Cs);

totalComps1 = ["Propellant"; "Structure"; "Propulsion"; "System"; "TOGW"; "Oxidizer"; "Fuel"; "Body"; "TPS"; "Landing Legs"; "Propulsion"; "Propellant Tanks"; "Engine"; "Hydraulics"; "Avionics"; "Electrical"; "Equipment"];
totalComps2 = ["Propellant"; "Structure"; "Propulsion"; "System"; "TOGW"; "Oxidizer"; "Fuel"; "Body"; "TPS"; "Landing Legs"; "Propulsion"; "Propellant Tanks"; "Wings"; "Horizontal tail"; "Vertical Tail"; "Engine"; "Hydraulics"; "Avionics"; "Electrical"; "Equipment"];
totalValuesFirst = [fMain; fPropel; fStruc; fPropu; fSub];
totalValuesSecond = [sMain; sPropel; sStruc; sPropu; sSub];

FirstStage = table(totalComps1, totalValuesFirst)
SecondStage = table(totalComps2, totalValuesSecond);
totalValuesFirst





