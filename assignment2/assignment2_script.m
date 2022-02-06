%Initial theta
t1=0; t2=0; t3=0; t4=0; t5=0; t6=0;
%Link length or offset distance parameters
l0=0.305; l1=0.740; l2=1.075; l3=0.250; l4=1.275; l5=0.0; l6=0.240;
% alpha angle 
alpha1 = pi/2; alpha2=0; alpha3=pi/2; alpha4=pi/2; alpha5=-pi/2; alpha6=0;

% Transformation matrix for joints
A1 = TransformMatrix(t1, l1, alpha1, l0);
A2 = TransformMatrix(t2, 0 , alpha2, l2);
A3 = TransformMatrix(t3, 0 , alpha3, l3);
A4 = TransformMatrix(t4, l4, alpha4, 0);
A5 = TransformMatrix(t5, l5, alpha5, 0);
A6 = TransformMatrix(t6, l6, alpha6, 0);


T = A1 * A2 * A3 * A4 * A5 * A6

% Using toolbox  
L(1) = Link('revolute', 'd', l1, 'a', l0, 'alpha', alpha1);
L(2) = Link('revolute', 'd', 0, 'a', l2, 'alpha', alpha2);
L(3) = Link('revolute', 'd', 0, 'a', l3, 'alpha', alpha3);
L(4) = Link('revolute', 'd', l4, 'a', 0, 'alpha', alpha4);
L(5) = Link('revolute', 'd', l5, 'a', 0, 'alpha', alpha5);
L(6) = Link('revolute', 'd', l6, 'a', 0, 'alpha', alpha6);

RobotArm = SerialLink(L,'name','myRobo')
RobotArm.fkine([t1,t2,t3,t4,t5,t6])
RobotArm.plot([t1,t2,t3,t4,t5,t6])