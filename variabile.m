
function x_min = minim_numerical_1var()
    f = @(x) x.^4 - 3*x.^3 + 2; % Definim funcția
    x0 = 0; % Punct de start pentru optimizare
    x_min = fminunc(f, x0); % Caută minimul
    fprintf('Minim numeric la x = %.4f\n', x_min);
end
minim_numerical_1var()
