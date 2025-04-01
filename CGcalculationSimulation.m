% Main simulation script
clc; clear;

% ======= Inputs as Struct =======
input.booster_diameter = 6.496;
input.Lenght = 59.275;
input.Interstage_thickness = 0.005;
input.Vpa = -137.5085;
input.MER = 49.37429;

input.V_sys = 46.2882;
input.W_sys = 13577;

input.V_ppl_Fuel = 746.15;
input.V_ppl_Oxidizer = 996.70;
input.W_fuel = 318828.860227207;
input.W_Oxidizer = 1147783.89681794;

input.Engine_Length = 3.07;
input.W_engine = 20896;

input.Landing_Length = 3;
input.W_Landing = 6*600;

input.Wstr = 32403;

%% Calculations below

% ======= Call CG Calculation =======
[CG, CG_Dry, g] = calculate_CG(input);

% ======= Plot CG and components =======
plot_rocket_CG(input.booster_diameter, input.Lenght, CG, CG_Dry, g);


%% ======= Simulate CG Shift Through Realistic Mission Profile =======

% Time segments
t_ascent = linspace(0, 100, 100);         % 100 s ascent burn
t_coast = linspace(101, 520, 100);        % ~7 minutes coasting
t_landing = linspace(521, 580, 60);       % 1 min landing burn

% Combine full time vector
time_full = [t_ascent, t_coast, t_landing];
CG_shift_full = zeros(size(time_full));

% === Ascent Burn: 100% → 10% ===
for i = 1:length(t_ascent)
    frac = 1 - 0.9 * (i-1)/(length(t_ascent)-1);  % 1 → 0.1
    input_dyn = input;
    input_dyn.W_fuel = input.W_fuel * frac;
    input_dyn.W_Oxidizer = input.W_Oxidizer * frac;
    [CG_dyn, ~, ~] = calculate_CG(input_dyn);
    CG_shift_full(i) = CG_dyn;
end

% === Coast Phase: hold @ 10% ===
for i = 1:length(t_coast)
    frac = 0.1;  % constant fuel level
    input_dyn = input;
    input_dyn.W_fuel = input.W_fuel * frac;
    input_dyn.W_Oxidizer = input.W_Oxidizer * frac;
    [CG_dyn, ~, ~] = calculate_CG(input_dyn);
    CG_shift_full(length(t_ascent) + i) = CG_dyn;
end

% === Landing Burn: 10% → 0% ===
for i = 1:length(t_landing)
    frac = 0.1 * (1 - (i-1)/(length(t_landing)-1));  % 0.1 → 0
    input_dyn = input;
    input_dyn.W_fuel = input.W_fuel * frac;
    input_dyn.W_Oxidizer = input.W_Oxidizer * frac;
    [CG_dyn, ~, ~] = calculate_CG(input_dyn);
    CG_shift_full(length(t_ascent) + length(t_coast) + i) = CG_dyn;
end

% === Plot CG vs Time ===
figure;
plot(time_full, CG_shift_full, 'b-', 'LineWidth', 2);
hold on;

% Mark phase transitions
% Get phase lengths
N_ascent = length(t_ascent);
N_coast = length(t_coast);
N_landing = length(t_landing);

% Mark phase transitions using time vector and correct indices
xline(time_full(N_ascent), '--k', 'Stage Sep');
xline(time_full(N_ascent + N_coast), '--r', 'Landing Burn Start');

xlabel('Time (s)');
ylabel('CG Location (m)');
title('CG Shift Through Boost, Coast, and Landing Burn');
grid on;

% ======= Print CG in command Window =======

fprintf('Location of Center of Interstage:   %.2f m\n', g.Interstage );
fprintf('Location of Center of Systems:      %.2f m\n', g.Systems );
fprintf('Location of Center of Oxidizer:     %.2f m\n', g.Oxidizer );
fprintf('Location of Center of Fuel:         %.2f m\n', g.Fuel);
fprintf('Location of Center of Engines:      %.2f m\n', g.Engine );
fprintf('Location of Center of Landing Gear: %.2f m\n', g.Landing);
fprintf('Location of Center of Structures:   %.2f m\n', g.Structure );

fprintf('Center of Gravity (from most foward point of the interstage):                %.2f m\n', CG);
fprintf('Center of Gravity WITHOUT fuel(from most foward point of the interstage):    %.2f m\n', CG_Dry);
