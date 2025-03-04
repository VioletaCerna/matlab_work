
% task 1
clc; clear; close all;


% Definirea funcției
f = @(x) x.^4 - 6*x.^2 + 4*x + 12;

% Generarea valorilor pentru x
x = linspace(-3, 3, 1000);

% Calcularea valorilor funcției
y = f(x);

% Reprezentarea grafică
figure;
plot(x, y, 'b', 'LineWidth', 2); hold on;
xlabel('x');
ylabel('f(x)');
title('Identificarea minimelor locale și globale');% Identificarea minimelor locale folosind gradientul funcției
syms x_sym
f_sym = x_sym^4 - 6*x_sym^2 + 4*x_sym + 12;
df_sym = diff(f_sym); % Derivata funcției

% Găsirea punctelor critice (soluții pentru f'(x) = 0)
crit_points = double(solve(df_sym == 0, x_sym));

% Calculul valorilor funcției în punctele critice
f_crit = double(subs(f_sym, x_sym, crit_points));

% Afișarea minimelor pe grafic
plot(crit_points, f_crit, 'ro', 'MarkerSize', 8, 'MarkerFaceColor', 'r');

% Determinarea minimului global într-un interval
[x_min, f_min] = fminbnd(f, -3, 3);
plot(x_min, f_min, 'go', 'MarkerSize', 10, 'MarkerFaceColor', 'g');

legend('f(x)', 'Minime locale', 'Minim global');
hold off;
f(x, y) = (1 - x)^2+100( y -x^2)^2

clc; clear; close all;

% Definirea funcției de două variabile
f = @(x, y) (1 - x).^2 + 100*(y - x.^2).^2;

% Definirea domeniului
x = linspace(-2, 2, 100);
y = linspace(-1, 3, 100);
[X, Y] = meshgrid(x, y);
Z = f(X, Y);

% Reprezentarea 3D a funcției
figure;
surf(X, Y, Z, 'EdgeColor', 'none');
xlabel('x');
ylabel('y');
zlabel('f(x, y)');
title('Reprezentarea 3D a funcției Rosenbrock');
colorbar;
hold on;

% Determinarea minimului global folosind optimizare neliniară
x0 = [0, 0]; % Punct de start
[x_min, f_min] = fminunc(@(v) f(v(1), v(2)), x0);

% Marcarea minimului global pe grafic
plot3(x_min(1), x_min(2), f_min, 'ro', 'MarkerSize', 10, 'MarkerFaceColor', 'r');
legend('f(x, y)', 'Minim global');
hold off;

%task2
% Definim x și funcția f(x)
x = linspace(-2, 2, 100);
f = x.^4 - 2*x.^2 + x;

% Găsim minimele locale
minime_locale = islocalmin(f);
x_min = x(minime_locale);
f_min = f(minime_locale);

% Găsim maximele locale
maxime_locale = islocalmax(f);
x_max = x(maxime_locale);
f_max = f(maxime_locale);

% Creăm graficul principal
figure
plot(x, f, 'b', 'LineWidth', 2) % Linie albastră pentru funcție
hold on

% Adăugăm punctele minime cu cercuri roșii
plot(x_min, f_min, 'ro', 'MarkerSize', 8, 'LineWidth', 2)

% Adăugăm punctele maxime cu cercuri verzi
plot(x_max, f_max, 'go', 'MarkerSize', 8, 'LineWidth', 2)

% Adăugăm grilă și etichete
grid on
xlabel('x')
ylabel('f(x)')
title('Funcția cu minime și maxime locale marcate')

% Adăugăm legendă
legend('f(x)', 'Minime locale', 'Maxime locale', 'Location', 'best')

hold off
% 1. Cream o grila de puncte X, Y pe intervalul [-5,5]
[x, y] = meshgrid(linspace(-5, 5, 100), linspace(-5, 5, 100));

% 2. Definim constanta A
A = 10;

% 3. Calculam valorile functiei Rastrigin pentru fiecare punct (x, y)
rastrigin = A * 2 + (x.^2 - A * cos(2 * pi * x)) + (y.^2 - A * cos(2 * pi * y));

% 4. Gasim minimele si maximele locale
minime_locale = islocalmin(rastrigin, 1) & islocalmin(rastrigin, 2);
maxime_locale = islocalmax(rastrigin, 1) & islocalmax(rastrigin, 2);

% 5. Extragem coordonatele pentru minime si maxime
x_min = x(minime_locale);
y_min = y(minime_locale);
f_min = rastrigin(minime_locale);

x_max = x(maxime_locale);
y_max = y(maxime_locale);
f_max = rastrigin(maxime_locale);

% 6. Afisam graficul 3D al functiei Rastrigin
figure;
surf(x, y, rastrigin, 'EdgeColor', 'none'); % Grafic 3D colorat
colormap jet; shading interp;
hold on;

% 7. Marcam minimele locale cu cercuri rosii
plot3(x_min, y_min, f_min, 'ro', 'MarkerSize', 10, 'LineWidth', 2);

% 8. Marcam maximele locale cu cercuri verzi
plot3(x_max, y_max, f_max, 'go', 'MarkerSize', 10, 'LineWidth', 2);

% 9. Setari pentru vizualizare
xlabel('X'); ylabel('Y'); zlabel('f(X,Y)');
title('Functia Rastrigin - Minime si Maxime locale');
legend('f(x, y)', 'Minime locale', 'Maxime locale', 'Location', 'best');
hold off;

clc; clear; close all;  % Șterge variabilele, curăță ecranul și închide figurile

% Definim intervalul pentru x și y
[X, Y] = meshgrid(-10:0.5:10, -10:0.5:10);

% Calculăm valorile funcției Griewank
Z = (X.^2 + Y.^2) / 4000 - cos(X) .* cos(Y ./ sqrt(2)) + 1;

% Creăm graficul 3D
figure;
surf(X, Y, Z, 'EdgeColor', 'none'); % Suprafață 3D fără margini
colorbar; % Adaugă o bară de culori
xlabel('x'); ylabel('y'); zlabel('f(x, y)');
title('Funcția Griewank');
hold on;
plot3(0, 0, 0, 'ro', 'MarkerSize', 10, 'MarkerFaceColor', 'r'); % Minimul global
hold off;
clc; clear; close all;  % Șterge variabilele, curăță ecranul și închide figurile

% Definim intervalul pentru x și y
[X, Y] = meshgrid(-5:0.1:5, -5:0.1:5);

% Calculăm valorile funcției Ackley
Z = -20 * exp(-0.2 * sqrt(0.5 * (X.^2 + Y.^2))) ...
    - exp(0.5 * (cos(2 * pi * X) + cos(2 * pi * Y))) + 20 + exp(1);

% Creăm graficul 3D
figure;
surf(X, Y, Z, 'EdgeColor', 'none'); % Suprafață 3D fără margini
colorbar; % Adaugă o bară de culori
xlabel('x'); ylabel('y'); zlabel('f(x, y)');
title('Funcția Ackley');
hold on;
plot3(0, 0, 0, 'ro', 'MarkerSize', 10, 'MarkerFaceColor', 'r'); % Minimul global
hold off;


clc; clear; close all;  % Șterge variabilele, curăță ecranul și închide figurile

% Definim intervalul pentru x și y
[X, Y] = meshgrid(-5:0.1:5, -5:0.1:5);

% Calculăm valorile funcției Ackley
Z = -20 * exp(-0.2 * sqrt(0.5 * (X.^2 + Y.^2))) ...
    - exp(0.5 * (cos(2 * pi * X) + cos(2 * pi * Y))) + 20 + exp(1);

% Creăm graficul 3D
figure;
surf(X, Y, Z, 'EdgeColor', 'none'); % Suprafață 3D fără margini
colorbar; % Adaugă o bară de culori
xlabel('x'); ylabel('y'); zlabel('f(x, y)');
title('Funcția Ackley');
hold on;
plot3(0, 0, 0, 'ro', 'MarkerSize', 10, 'MarkerFaceColor', 'r'); % Minimul global
hold off;


%task 3
% Definirea funcției obiectiv (paraboloid)
f_paraboloid = @(x, y) x.^2 + y.^2;

% Generarea valorilor pentru x și y
[x, y] = meshgrid(-5:0.1:5, -5:0.1:5);
z = f_paraboloid(x, y);

% Crearea graficului 3D
figure;
surf(x, y, z);
xlabel('x');
ylabel('y');
zlabel('f(x, y)');
title('Paraboloid: f(x, y) = x^2 + y^2');
colorbar;

% Utilizarea fminunc pentru a găsi minimul
syms x_sym y_sym
z_sym = x_sym^2 + y_sym^2;
sol = solve([diff(z_sym, x_sym) == 0, diff(z_sym, y_sym) == 0], [x_sym, y_sym]);
disp(['Minimul global este la x = ', num2str(sol.x), ' si y = ', num2str(sol.y)]);


% Definirea funcției obiectiv (funcție trigonometrica)
f_trig = @(x, y) sin(x) + cos(y);

% Generarea valorilor pentru x și y
[x, y] = meshgrid(-5:0.1:5, -5:0.1:5);
z = f_trig(x, y);

% Crearea graficului 3D
figure;
surf(x, y, z);
xlabel('x');
ylabel('y');
zlabel('f(x, y)');
title('Funcție trigonometrica: f(x, y) = sin(x) + cos(y)');
colorbar;

% Utilizarea fminunc pentru a găsi minimul
f = @(xy) sin(xy(1)) + cos(xy(2)); % Funcția anonimă pentru fminunc
x0 = [0, 0];  % Punctul de pornire
options = optimoptions('fminunc', 'Algorithm', 'quasi-newton');
[minim, fval] = fminunc(f, x0, options);

disp(['Minimul local este la x = ', num2str(minim(1)), ' si y = ', num2str(minim(2))]);
disp(['Valoarea minimului este: ', num2str(fval)]);
% Definirea funcției obiectiv (sferă)
f_sfera = @(x, y, z) x.^2 + y.^2 + z.^2;

% Generarea valorilor pentru x, y și z
[x, y, z] = meshgrid(-5:0.1:5, -5:0.1:5, -5:0.1:5);
F = f_sfera(x, y, z);

% Crearea graficului 3D
figure;
slice(x, y, z, F, 0, 0, 0); % Graficul 3D al sferei
xlabel('x');
ylabel('y');
zlabel('z');
title('Sferă: f(x, y, z) = x^2 + y^2 + z^2');
colorbar;

% Utilizarea fminunc pentru a găsi minimul
f = @(xyz) xyz(1)^2 + xyz(2)^2 + xyz(3)^2; % Funcția anonimă pentru fminunc
x0 = [0, 0, 0];  % Punctul de pornire
options = optimoptions('fminunc', 'Algorithm', 'quasi-newton');
[minim, fval] = fminunc(f, x0, options);

disp(['Minimul global este la x = ', num2str(minim(1)), ' si y = ', num2str(minim(2)), ' si z = ', num2str(minim(3))]);
disp(['Valoarea minimului este: ', num2str(fval)]);



%task 4
% Calcul simbolic
syms x;

% Definirea funcției
f = x^2 + 4*x + 3;

% Derivata funcției
df = diff(f, x);

% Găsirea punctelor critice (minime sau maxime)
sol = solve(df == 0, x);
disp(['Punctul de minim este x = ', num2str(sol)]);

% Calculul valorii funcției în minim
f_min = subs(f, x, sol);
disp(['Valoarea minimului este f(x) = ', num2str(f_min)]);

% Definirea funcției ca funcție anonimă
f_numeric = @(x) x.^2 + 4*x + 3;

% Apelarea funcției fminunc pentru a găsi minimul
x0 = 0;  % Punctul de start
options = optimoptions('fminunc', 'Display', 'off');
[x_min, fval] = fminunc(f_numeric, x0, options);

disp(['Minimul funcției este la x = ', num2str(x_min)]);
disp(['Valoarea minimului este f(x) = ', num2str(fval)]);

% Calcul simbolic
syms x y;

% Definirea funcției
f = x^2 + y^2 + 4*x + 6*y;

% Derivata parțială față de x și y
dfx = diff(f, x);
dfy = diff(f, y);

% Găsirea punctelor critice (minime sau maxime)
sol = solve([dfx == 0, dfy == 0], [x, y]);
disp(['Punctul de minim este la x = ', num2str(sol.x), ' si y = ', num2str(sol.y)]);

% Calculul valorii funcției în minim
f_min = subs(f, [x, y], [sol.x, sol.y]);
disp(['Valoarea minimului este f(x, y) = ', num2str(f_min)]);


% Definirea funcției ca funcție anonimă
f_numeric_2d = @(xy) xy(1).^2 + xy(2).^2 + 4*xy(1) + 6*xy(2);

% Apelarea funcției fminunc pentru a găsi minimul
x0 = [0, 0];  % Punctul de start
options = optimoptions('fminunc', 'Display', 'off');
[minim, fval] = fminunc(f_numeric_2d, x0, options);

disp(['Minimul funcției este la x = ', num2str(minim(1)), ' si y = ', num2str(minim(2))]);
disp(['Valoarea minimului este f(x, y) = ', num2str(fval)]);




%task 5

% Definirea variabilelor simbolice
syms x y v1 v2;

% Definirea funcției
f = x^2 + y^2 + 4*x + 6*y;

% Derivate parțiale
dfx = diff(f, x);
dfy = diff(f, y);

% Definirea vectorului direcțional
v = [v1, v2];

% Derivata direcțională
D_v_f = dfx * v1 + dfy * v2;
disp(['Derivata direcțională este: ', char(D_v_f)]);

% Exemplu de calcul al derivatei direcționale într-un punct (x0, y0)
x0 = 1;
y0 = 2;
v1_val = 3;
v2_val = 4;
D_v_f_val = subs(D_v_f, {x, y, v1, v2}, {x0, y0, v1_val, v2_val});
disp(['Derivata direcțională în punctul (x0, y0) și direcția v este: ', num2str(D_v_f_val)]);


% Definirea funcției ca funcție anonimă
f_numeric = @(x, y) x.^2 + y.^2 + 4*x + 6*y;

% Punctul de evaluare
x0 = 1;
y0 = 2;

% Direcția vectorială v
v = [3, 4];

% Derivata direcțională numerică aproximată
epsilon = 1e-5;  % Mică valoare pentru diferența finită
D_v_f_numeric = (f_numeric(x0 + epsilon*v(1), y0 + epsilon*v(2)) - f_numeric(x0, y0)) / epsilon;

disp(['Derivata direcțională aproximată este: ', num2str(D_v_f_numeric)]);

% Crearea unei rețele de puncte pentru vizualizare
[x, y] = meshgrid(-5:0.1:5, -5:0.1:5);
z = x.^2 + y.^2 + 4*x + 6*y;  % Valori pentru funcția f(x, y)

% Crearea graficului 3D al funcției
figure;
surf(x, y, z);
hold on;

% Punctul de start pentru vectorul v
x0 = 1;
y0 = 2;
v = [3, 4];  % Direcția vectorială

% Reprezentarea vectorului în planul (x, y)
quiver3(x0, y0, f_numeric(x0, y0), v(1), v(2), 0, 'LineWidth', 2, 'Color', 'r');

% Etichete și titlu
xlabel('x');
ylabel('y');
zlabel('f(x, y)');
title('Funcția f(x, y) și direcția derivatelor');
colorbar;

%task 6
% Definirea variabilelor simbolice
syms x y;

% Definirea funcției
f = x^2 + y^2 + 4*x + 6*y;

% Calcularea gradientului
grad_f = gradient(f, [x, y]);
disp('Gradientul funcției f(x, y):');
disp(grad_f);

% Calcularea hessienei (matricea derivatelor parțiale de ordinul 2)
hess_f = hessian(f, [x, y]);
disp('Hessiana funcției f(x, y):');
disp(hess_f);

% Verificarea condiției FONC: Gradientul în punctul (x0, y0)
x0 = -2;
y0 = -3;
grad_at_x0_y0 = subs(grad_f, {x, y}, {x0, y0});
disp(['Gradientul în punctul (x0, y0) este: ', num2str(grad_at_x0_y0)]);

% Verificarea dacă gradientul este 0
if all(grad_at_x0_y0 == 0)
    disp('Gradientul este zero în punctul dat - posibila condiție FONC.');
else
    disp('Gradientul nu este zero în punctul dat.');
end

% Verificarea hessienei în punctul (x0, y0)
hess_at_x0_y0 = subs(hess_f, {x, y}, {x0, y0});
disp('Hessiana în punctul (x0, y0):');
disp(hess_at_x0_y0);

Gradientul funcției f(x, y):
[2*x + 4; 2*y + 6]
Hessiana funcției f(x, y):
[2, 0; 0, 2]
Gradientul în punctul (x0, y0) este: [0; 0]
Hessiana în punctul (x0, y0):
[2, 0; 0, 2]
Gradientul este zero în punctul dat - posibila condiție FONC.




% Crearea unei rețele de puncte pentru vizualizare
[x, y] = meshgrid(-5:0.1:5, -5:0.1:5);
z = x.^2 + y.^2 + 4*x + 6*y;  % Valori pentru funcția f(x, y)

% Crearea graficului 3D al funcției
figure;
surf(x, y, z);
hold on;

% Punctul în care vrem să vizualizăm gradientul
x0 = -2;
y0 = -3;
z0 = x0^2 + y0^2 + 4*x0 + 6*y0;

% Calcularea valorilor gradientului în punctul (x0, y0)
grad_at_x0_y0 = subs(grad_f, {x, y}, {x0, y0});
disp(['Gradientul în punctul (x0, y0) este: ', num2str(grad_at_x0_y0)]);

% Reprezentarea vectorului gradient în planul (x, y)
quiver3(x0, y0, z0, grad_at_x0_y0(1), grad_at_x0_y0(2), 0, 'LineWidth', 2, 'Color', 'r');

% Etichete și titlu
xlabel('x');
ylabel('y');
zlabel('f(x, y)');
title('Funcția f(x, y) și vectorul gradientului într-un punct dat');
colorbar;
