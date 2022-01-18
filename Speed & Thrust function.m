function F = fcn(VitesseZ, PositionZ, AngleX, AngleY, VitesseX, VitesseY)

z = PositionZ;

%{
if (abs(VitesseX) < z+0.001) && abs(VitesseY) < z+0.001 
    vz = -(sqrt(z)/40)^0.8;
else
    vz = 0;
end
%}

vz = -(sqrt(z)/40)^0.8;

persistent k
if isempty(k)
    k = 1;
end

a = (7605*10^3)/1000;

if VitesseZ-vz < 0
    k = k+a;
    if k >= 7605*10^3
        k = 7605*10^3;
    end
    
elseif VitesseZ-vz >= 0
    k = k-a;
    if k <= 0
        k = 0;
    end
    
end

F = k;
end