function Dv_f = derivata_directie_numerica(f, x0, v, h)
    v = v / norm(v); % Asigurăm că v este un vector unitar
    Dv_f = (f(x0 + h * v) - f(x0)) / h;
end
f = @(x) x(1).^2 + x(2).^2; % Definim funcția
x0 = [1, 2]; % Punctul unde calculăm derivata
v = [1, 1]; % Vectorul direcție
h = 1e-5; % Pas mic pentru aproximație

Dv_f = derivata_directie_numerica(f, x0, v, h);
fprintf('Derivata direcțională numerică: %.4f\n', Dv_f);
