function Fx = fcn(VitesseX, AngleY, VitesseAngleY, VitesseZ)

vy = 0;
coefvy = 2;
a = 0;

if VitesseZ > 0.0001
    angley = -atan(VitesseX/VitesseZ);
else
    angley = 0;
end

if AngleY > angley%+0.0001
    %vy = -0.1;
    vy = -coefvy*abs(VitesseX)-0.1;
    if VitesseAngleY < vy
        a = 1;
    end
    if VitesseAngleY > vy
        a = -1;
    end
end

if AngleY < angley%-0.0001
    %vy = 0.1;
    vy = coefvy*abs(VitesseX)+0.1;
    if VitesseAngleY < vy
        a = 1;
    end
    if VitesseAngleY > vy
        a = -1;
    end
end

Fx = a*20000;%*diff;