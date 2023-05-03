function temperatur

intervall = [40 80 160 320 640 1280];

maxvektor = [];
minvektor = [];
medelvektor = [];
fel = [];


for i = intervall


    [x, T1] = stav(i, 3000, 200)
    minvektor = [minvektor; min(T1)];
    medelvektor = [medelvektor; mean(T1)];
    maxvektor = [maxvektor; max(T1)];
    
    %Väljer nu att störa q0 med minus 200
    
    [~, T2] = stav(i, 2800, 200);
    [~, T3] = stav(i, 3000, 190);
    
    fel = [fel; abs(max(T1)-(max(T2))) + abs(max(T1)-max(T3))];


end
intervall = intervall'

fig = figure;
table = uitable(fig);
data = [intervall, minvektor, medelvektor, maxvektor, fel];
set(table, 'Data', data, 'ColumnName', {'intervall';'minsta_T';'snitt_T';'max_T'; 'fel'}, 'Position', [500 400 400 125])
end


    
