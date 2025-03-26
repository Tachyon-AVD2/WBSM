%{
MAE4350 - SENIOR DESIGN
Nebula Aerospace
Author: Benjamin Tran, Omare Temile, Shawn Lobo

This Script shows examples of how the HASAcode and CG_Calculation codes
can be used.
HASA can be used if you have length of body, swet, payload, and propellants
CG Calculator - Read input values in Notes

Testing of HASACode
- cf changes body weight

Terminology:
fwo = First Stage Oxidizer Weight
fwf = First Stage Fuel Weight

swo = Second Stage Oxidizer Weight
swf = Second Stage Fuel Weight

iFWO, iFWF, iSWO, iSWF = Iterating Values

%}

clear; clc; format longG


Cs = ConstantsSecond;
Cf = ConstantsFirst;

cf1 = 1;
wOxidizer1 = 28825.00;
wFuel1 = 0;
WTOGW1 = 226272;

[fMain, fPropel, fStruc, fPropu, fSub] = HASAcodeFirst(cf1, wOxidizer1, wFuel1, WTOGW1, Cf);

cf2 = 1;
wOxidizer2 = 28825.00;
wFuel2 = 0;
WTOGW2 = 226272;

[sMain, sPropel, sStruc, sPropu, sSub] = HASAcodeSecond(cf2, wOxidizer2, wFuel2, WTOGW2, Cs);

totalComps = ["Propellant"; "Structure"; "Propulsion"; "System"; "TOGW"; "Oxidizer"; "Fuel"; "Body"; "TPS"; "Landing Legs"; "Propulsion"; "Propellant Tanks"; "Engine"; "Hydraulics"; "Avionics"; "Electrical"; "Equipment"];
totalValuesFirst = [fMain; fPropel; fStruc; fPropu; fSub];
totalValuesSecond = [sMain; sPropel; sStruc; sPropu; sSub];

FirstStage = table(totalComps, totalValuesFirst)
SecondStage = table(totalComps, totalValuesSecond);





