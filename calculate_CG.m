function [CG, CG_Dry, g] = calculate_CG(input)

% Unpack struct for easier reading
d = input.booster_diameter;
L = input.Lenght;
r_out = d / 2;
r_in = r_out - input.Interstage_thickness;

V_pa = abs(input.Vpa);

% Geometry
Interstage_Length = V_pa / (pi * r_in^2);
Interstage_OSA = 2 * pi * Interstage_Length * (d / 2);
W_interstage = Interstage_OSA * input.MER;

W_structures = input.Wstr - input.W_Landing - W_interstage;
Systems_Length = input.V_sys / (pi * r_out^2);
Fuel_Length = input.V_ppl_Fuel / (pi * r_out^2);
Oxidizer_Length = input.V_ppl_Oxidizer / (pi * r_out^2);

% Component Centers
Center_Interstage = Interstage_Length / 2;
Center_Systems = Systems_Length / 2;
Center_Fuel = Fuel_Length / 2;
Center_Oxidizer = Oxidizer_Length / 2;
Center_Engine = input.Engine_Length / 2;
Center_Landing = input.Landing_Length / 2;
Center_Full_body = (L - Interstage_Length) / 2;

% Distances from front
Interstage_Length_orgin = Center_Interstage;
Systems_Length_orgin = Interstage_Length + Center_Systems;
Oxidizer_Length_orgin = Interstage_Length + Systems_Length + Center_Oxidizer;
Fuel_Length_orgin = Interstage_Length + Systems_Length + Oxidizer_Length + Center_Fuel;
Engine_Length_orgin = L - Center_Engine;
Landing_Length_orgin = L - Center_Landing;
Structure_Length_orgin = Interstage_Length + Center_Full_body;

% Moments
M_Interstage = Interstage_Length_orgin * W_interstage;
M_Systems = Systems_Length_orgin * input.W_sys;
M_Oxidizer = Oxidizer_Length_orgin * input.W_Oxidizer;
M_fuel = Fuel_Length_orgin * input.W_fuel;
M_Engine = Engine_Length_orgin * input.W_engine;
M_Landing = Landing_Length_orgin * input.W_Landing;
M_Structure = Structure_Length_orgin * W_structures;

% CG with fuel
Total_Moment = M_Interstage + M_Systems + M_Oxidizer + M_fuel + M_Engine + M_Landing + M_Structure;
Total_Weight = W_interstage + input.W_sys + input.W_Oxidizer + input.W_fuel + input.W_engine + input.W_Landing + W_structures;
CG = Total_Moment / Total_Weight;

% CG dry
Total_Moment_Dry = M_Interstage + M_Systems + M_Engine + M_Landing + M_Structure;
Total_Weight_Dry = W_interstage + input.W_sys + input.W_engine + input.W_Landing + W_structures;
CG_Dry = Total_Moment_Dry / Total_Weight_Dry;

% Return component geometry
g.Interstage = Interstage_Length_orgin;
g.Systems = Systems_Length_orgin;
g.Oxidizer = Oxidizer_Length_orgin;
g.Fuel = Fuel_Length_orgin;
g.Engine = Engine_Length_orgin;
g.Landing = Landing_Length_orgin;
g.Structure = Structure_Length_orgin;
end
