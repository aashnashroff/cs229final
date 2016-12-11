x = bestFeatures;
result = zeros(2,50);
for i=1:50
    v = mod(x(i),78);
    t_minus = (x(i) - v)*1.0/78;
    t = t_minus + 1;
    result(1,i) = v;
    result(2,i) = Time(t);
end
