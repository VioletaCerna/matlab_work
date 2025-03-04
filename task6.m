function verificare_FONC(f, vars)
    grad_f = gradient(f, vars); % Calcul gradient
    crit_points = solve(grad_f == 0, vars); % Rezolvare ecuație grad_f = 0

    disp('Puncte critice:');
    disp(crit_points);

    for i = 1:length(crit_points.(char(vars(1))))
        x_val = double(crit_points.(char(vars(1))));
        y_val = double(crit_points.(char(vars(2))));
        grad_f_val = double(subs(grad_f, vars, [x_val, y_val]));

        fprintf('În punctul (%.4f, %.4f), gradientul este [%.4f, %.4f]\n', x_val, y_val, grad_f_val(1), grad_f_val(2));

        if all(grad_f_val == 0)
            fprintf('Acest punct satisface FONC!\n\n');
        else
            fprintf('Acest punct NU satisface FONC!\n\n');
        end
    end
end
[X, Y] = meshgrid(-2:0.2:5, -3:0.2:3);
Z = X.^2 + Y.^2 - 4*X; % Funcția f(x, y)

[Fx, Fy] = gradient(Z, 0.2, 0.2); % Calcul numeric al gradientului

figure;
surf(X, Y, Z, 'EdgeColor', 'none'); % Grafic 3D
hold on;
quiver(X, Y, Fx, Fy, 'r'); % Vectorii gradient
plot3(2, 0, 2^2 + 0^2 - 4*2, 'bo', 'MarkerSize', 10, 'LineWidth', 2); % Punct critic
xlabel('x'); ylabel('y'); zlabel('f(x, y)');
title('Funcția și gradientul său');
colorbar
grid on;
[X, Y] = meshgrid(-2:0.2:5, -3:0.2:3);
Z = X.^2 + Y.^2 - 4*X; % Funcția f(x, y)

[Fx, Fy] = gradient(Z, 0.2, 0.2); % Calcul numeric al gradientului

figure;
surf(X, Y, Z, 'EdgeColor', 'none'); % Grafic 3D
hold on;
quiver(X, Y, Fx, Fy, 'r'); % Vectorii gradient
plot3(2, 0, 2^2 + 0^2 - 4*2, 'bo', 'MarkerSize', 10, 'LineWidth', 2); % Punct critic
xlabel('x'); ylabel('y'); zlabel('f(x, y)');
title('Funcția și gradientul său');
colorbar
grid on;
