function Cs = ConstantsSecond
% Values from Tachyon Vehicle

Cs.Lb = 98.425; %[ft], Total body length, Input from Geometry

Cs.Sbtot = 9978.351;  %[ft^2], Body Wetted SurfaCse Area, Input from Geometry

Cs.mf = 1.5;  %[] Modifying FaCstor, orbiter: 1, booster: 1,   Input from Weights

Cs.ULF = 6; %[] Ultimate Load FaCstor,  Input from Weights

Cs.Dbe = 24.475; %[ft] Equivalent body diameter, Input from Geometry

Cs.Qmax = 1044.272;    %[lb/ft^2] Maxmium dynamic pressure, Input from TrajeCstory 1044271.500

Cs.Wpayload = 63933.980;   %[lb]   Payload Weight, Input from Synthesis

Cs.lambda = 0.0996; %[] Wing Taper Ratio, Input from Geometry

Cs.lambdah = 60; %[deg] mid-Chord sweep angle, Input from Geometry

Cs.Swfh = 0; %[ft^2] Horizontal stabilizer planform area, Input from Geometry

Cs.Swfv = 105.379*2; %[ft^2] VertiCsal stabilizer planform area, Input from Geometry

Cs.Ttotrk = 674425.803; %[lb]   Total momentum thrust of all roCsket engines, Input from Propulsion

Cs.Sref = 2676.121;    %[ft^2] Reference Wing Area

Cs.AR = 1.8;  %[] Wing Aspect ratio

Cs.tc = 0.046; %[] Wing Thickness to Chord Ratio

Cs.Wins = 1.7; %[lb/ft^2] Unit weight of TPS

Cs.Aratio = 80; %[] Rocket expansion ratio

Cs.Neng = 1; %[] Number of rocket engines

Cs.wTank = 2647.6+2056.3776; %[lb] Total Weight of Propellant tanks, Input from Geometry

Cs.Wspan = 76.214; %[ft] Wingspan
