function Cf = ConstantsFirst

Cf.Lb = 1; 

Cf.Sbtot = 1; 

Cf.mf = 1.17;  % orbiter: 1, booster: 1

Cf.ULF = 6.32;

Cf.Dbe = 3.66;

Cf.Qmax = 19935.71;

Cf.mf = 1.17;

Cf.wTank = 5869 + 4805;  %[kg] Propellant tank weight (Fuel + Oxidizer), Input from Geometry

Cf.wEng = 4230; %[kg] Engine weight, From Propulsion

Cf.Wgtot = 28147;%[kg] OEW

Cf.wLandingLegs = 1055.68; % [kg] From Structures and Materials

Cf.wGridfins = 100;

Cf.Wins = 1.83 + 1.83;  % Unit weight of the TPS [kg/m^2]

Cf.Ttork = 8588; %Total Momentum of all 9 Merlin engines, Propulsion