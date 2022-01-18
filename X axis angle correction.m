function Fy = fcn(VitesseY, AngleX, VitesseAngleX, VitesseZ)

vx = 0;
coefvx = 2;
a = 0;

if VitesseZ > 0.0001
    anglex = atan(VitesseY/VitesseZ);
else
    anglex = 0;
end

if AngleX > anglex%+0.0001
    %vx = -0.1;
    vx = -coefvx*abs(VitesseY)-0.1;
    if VitesseAngleX < vx
        a = -1;
    end
    if VitesseAngleX > vx
        a = 1;
    end
end

if AngleX < anglex%-0.0001
    %vx = 0.1;
    vx = coefvx*abs(VitesseY)+0.1;
    if VitesseAngleX < vx
        a = -1;
    end
    if VitesseAngleX > vx
        a = 1;
    end
end

Fy = a*20000;%*diff;