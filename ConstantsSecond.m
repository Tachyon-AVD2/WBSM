function Cs = ConstantsSecond
% Values from Space Shuttle

Cs.Lb = 107.5; %[ft], Total body length, Input from Geometry

Cs.Sbtot = 5634;  %[ft^2], Body Wetted SurfaCse Area, Input from Geometry

Cs.mf = 1.12;  %[] Modifying FaCstor, orbiter: 1, booster: 1,   Input from Weights

Cs.ULF = 5.25; %[] Ultimate Load FaCstor,  Input from Weights

Cs.Dbe = 21; %[ft] Equivalent body diameter, Input from Geometry

Cs.Qmax = 1000;    %[lb/ft^2] Maxmium dynamiCs pressure, Input from TrajeCstory

Cs.Wpayload = 1;   %[lb]   Payload Weight, Input from Synthesis

Cs.lambda = 0.2; %[] Wing Taper Ratio, Input from Geometry

Cs.lambdah = 21; %[deg] mid-Cshord sweep angle, Input from Geometry

Cs.Swfh = 510; %[ft^2] Horizontal stabilizer planform area, Input from Geometry

Cs.Swfv = 510; %[ft^2] VertiCsal stabilizer planform area, Input from Geometry

Cs.Ttotrk = 1410000; %[lb]   Total momentum thrust of all roCsket engines, Input from Propulsion

Cs.Sref = 3103;    %[ft^2] Reference Wing Area

Cs.AR = 1.961;  %[] Wing Aspect ratio

Cs.tc = 0.11; %[] Wing Thickness to Chord Ratio

Cs.Wins = 3.0; %[lb/ft^2] Unit weight of TPS

Cs.Aratio = 77.5; %[] Rocket expansion ratio

Cs.Neng = 3; %[] Number of rocket engines

Cs.wTank = 1; %[lb] Total Weight of Propellant tanks, Input from Geometry

Cs.Wspan = 78; %[ft] Wingspan
