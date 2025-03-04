function rezultat = functie_mea(x, y)
    rezultat = x.^2 + y.^2 + sin(x) .* cos(y);
end


val = functie_mea(2, 3) % Apelează funcția cu x = 2 și y = 3
disp(val) % Afișează rezultatul
[X, Y] = meshgrid(-5:0.1:5, -5:0.1:5);
Z = X.^2 + Y.^2 + sin(X) .* cos(Y);

figure;
surf(X, Y, Z) % Creează un grafic 3D
xlabel('x'); ylabel('y'); zlabel('f(x, y)');
title('Graficul funcției')
colorbar