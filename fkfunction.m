
function eq=fkfunction(x)
br=[ 296.65  31.47  -31.47  -296.65  -265.18  265.18;
   -134.93 324.47  324.47  -134.93  -189.44 -189.44 ;
         0      0       0        0        0       0];
pr=[ 112.47    92.47   -92.47   -112.47   -20       20; 
     41.84    76.48    76.48     41.84  -118.32  -118.32 ;
       0     0       0       0        0       0];
global l1 l2 l3 l4 l5 l6
eq(1)=(br(1,1)*cosd(x(5))*cosd(x(6))+br(2,1)*(sind(x(4))*sind(x(5))*cosd(x(6))-cosd(x(4))*sind(x(6)))+x(1)-pr(1,1))^2+(br(1,1)*cosd(x(5))*sind(x(6))+br(2,1)*(sind(x(4))*sind(x(5))*sind(x(6))+cosd(x(4))*cosd(x(6)))+x(2)-pr(2,1))^2+(br(1,1)*(-sind(x(5)))+br(2,1)*sind(x(4))*cosd(x(5))+x(3))^2-l1^2;
eq(2)=(br(1,2)*cosd(x(5))*cosd(x(6))+br(2,2)*(sind(x(4))*sind(x(5))*cosd(x(6))-cosd(x(4))*sind(x(6)))+x(1)-pr(1,2))^2+(br(1,2)*cosd(x(5))*sind(x(6))+br(2,2)*(sind(x(4))*sind(x(5))*sind(x(6))+cosd(x(4))*cosd(x(6)))+x(2)-pr(2,2))^2+(br(1,2)*(-sind(x(5)))+br(2,2)*sind(x(4))*cosd(x(5))+x(3))^2-l2^2;
eq(3)=(br(1,3)*cosd(x(5))*cosd(x(6))+br(2,3)*(sind(x(4))*sind(x(5))*cosd(x(6))-cosd(x(4))*sind(x(6)))+x(1)-pr(1,3))^2+(br(1,3)*cosd(x(5))*sind(x(6))+br(2,3)*(sind(x(4))*sind(x(5))*sind(x(6))+cosd(x(4))*cosd(x(6)))+x(2)-pr(2,3))^2+(br(1,3)*(-sind(x(5)))+br(2,3)*sind(x(4))*cosd(x(5))+x(3))^2-l3^2;
eq(4)=(br(1,4)*cosd(x(5))*cosd(x(6))+br(2,4)*(sind(x(4))*sind(x(5))*cosd(x(6))-cosd(x(4))*sind(x(6)))+x(1)-pr(1,4))^2+(br(1,4)*cosd(x(5))*sind(x(6))+br(2,4)*(sind(x(4))*sind(x(5))*sind(x(6))+cosd(x(4))*cosd(x(6)))+x(2)-pr(2,4))^2+(br(1,4)*(-sind(x(5)))+br(2,4)*sind(x(4))*cosd(x(5))+x(3))^2-l4^2;
eq(5)=(br(1,5)*cosd(x(5))*cosd(x(6))+br(2,5)*(sind(x(4))*sind(x(5))*cosd(x(6))-cosd(x(4))*sind(x(6)))+x(1)-pr(1,5))^2+(br(1,5)*cosd(x(5))*sind(x(6))+br(2,5)*(sind(x(4))*sind(x(5))*sind(x(6))+cosd(x(4))*cosd(x(6)))+x(2)-pr(2,5))^2+(br(1,5)*(-sind(x(5)))+br(2,5)*sind(x(4))*cosd(x(5))+x(3))^2-l5^2;
eq(6)=(br(1,6)*cosd(x(5))*cosd(x(6))+br(2,6)*(sind(x(4))*sind(x(5))*cosd(x(6))-cosd(x(4))*sind(x(6)))+x(1)-pr(1,6))^2+(br(1,6)*cosd(x(5))*sind(x(6))+br(2,6)*(sind(x(4))*sind(x(5))*sind(x(6))+cosd(x(4))*cosd(x(6)))+x(2)-pr(2,6))^2+(br(1,6)*(-sind(x(5)))+br(2,6)*sind(x(4))*cosd(x(5))+x(3))^2-l6^2;
