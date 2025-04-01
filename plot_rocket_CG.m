function plot_rocket_CG(booster_diameter, Lenght, CG, CG_Dry, g)

figure('Position', [100, 100, 600, 1000]);
hold on;
axis equal;
grid on;

rocket_height = Lenght;
x_center = booster_diameter / 2;
y_base = 0;

% Draw rocket body
rectangle('Position', [0, y_base, booster_diameter, rocket_height], ...
    'EdgeColor', 'k', 'LineWidth', 2);

% Flip Y manually
flip = @(y) rocket_height - y;

% Plot all component centers
fields = fieldnames(g);
for i = 1:length(fields)
    name = fields{i};
    y_val = flip(g.(name));
    scatter(x_center, y_val, 100, 'k', 'filled');
    text(x_center+0.2, y_val, name);
end

% CGs
scatter(x_center, flip(CG), 150, 'b', 'filled');
text(x_center+0.3, flip(CG), 'CG (With Fuel)', 'Color', 'b');

scatter(x_center, flip(CG_Dry), 150, 'r', 'filled');
text(x_center+0.3, flip(CG_Dry), 'CG (Dry)', 'Color', 'r');

% Labels
xlabel('Rocket Width (m)');
ylabel('Rocket Height (m)');
title('Rocket CG and Component Centers');

xlim([-5 booster_diameter + 5]);
ylim([y_base rocket_height + 5]);

hold off;
end
