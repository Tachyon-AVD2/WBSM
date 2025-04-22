function Cf = ConstantsFirst
% Values from Tachyon Vehicle

Cf.Lb = 29.534; %[ft], Total body length, Input from Geometry

Cf.Sbtot = 1521.649;  %[ft^2], Body Wetted SurfaCse Area, Input from Geometry 14093.949

Cf.mf = 2;  %[] Modifying FaCstor, orbiter: 1, booster: 1,   Input from Weights

Cf.ULF = 6; %[] Ultimate Load FaCstor,  Input from Weights

Cf.Dbe = 24.475; %[ft] Equivalent body diameter, Input from Geometry

Cf.Qmax = 2046.772;    %[lb/ft^2] Maxmium dynamic pressure, Input from TrajeCstory

Cf.Ttotrk = 674425.803*13; %[lb]   Total momentum thrust of all roCsket engines, Input from Propulsion

Cf.Wins = 1.7; %[lb/ft^2] Unit weight of TPS

Cf.Aratio = 80; %[] Rocket expansion ratio

Cf.Neng = 13; %[] Number of rocket engines

Cf.wTank = 48071.076; %[lb] Total Weight of Propellant tanks, Input from Geometry

Cf.Gear = 0;    %[lb] Landing Gear weight

Cf.Wpayload = 0;   %[lb]   Payload Weight, Input from Synthesis

Cf.lambda = 0; %[] Wing Taper Ratio, Input from Geometry

Cf.lambdah = 0; %[deg] mid-Chord sweep angle, Input from Geometry

Cf.Swfh = 0; %[ft^2] Horizontal stabilizer planform area, Input from Geometry

Cf.Swfv = 0; %[ft^2] VertiCsal stabilizer planform area, Input from Geometry

Cf.Sref = 0;    %[ft^2] Reference Wing Area

Cf.AR = 0;  %[] Wing Aspect ratio

Cf.tc = 0; %[] Wing Thickness to Chord Ratio

Cf.Wspan = 0; %[ft] Wingspan
