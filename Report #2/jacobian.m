%%%%%%%%%%%%%%%%%%%%%%    Mert Emrem - 250203015    %%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%    CE301 - Assignment #3     %%%%%%%%%%%%%%%%%%%%%%
clc; clear all

syms f(theta1,theta2,s3) d1

J(theta1,theta2,s3) = jacobian([s3*cos(theta2)*cos(theta1), s3*cos(theta2)*sin(theta1), ... 
    d1 + s3*sin(theta2)], [theta1, theta2, s3])

DJ(theta1,theta2,s3) = simplify(diff(J,theta1) + diff(J,theta2) + diff(J,s3))
 
Jdet(theta1,theta2,s3) = simplify(det(J))

Jinv(theta1,theta2,s3) = simplify(inv(J))
   
h = 31.25; amax = 37.5; vmax = 16; t_1 = vmax/amax; sampling = 0.1;
h_1 = (amax*t_1^2)/2;
t_full = (31.25 - h_1*2)/16 + 2*t_1;
t_2 = t_full - t_1;
t_1sub = ceil(t_1 * 10) / 10; t_2sub = ceil(t_2 * 10) / 10;

time = xlsread('250203015_Project2.xlsx','AC5:AC31');
a_p = xlsread('250203015_Project2.xlsx','AD5:AD31');
v_p = xlsread('250203015_Project2.xlsx','AE5:AE31');
theta_1 = xlsread('250203015_Project2.xlsx','AL5:AL31');
theta_2 = xlsread('250203015_Project2.xlsx','AM5:AM31');
s_3 = xlsread('250203015_Project2.xlsx','AP5:AP31');

q = [theta_1 theta_2 s_3]';

x_coeff = 0.5/1.225; y_coeff = 0.5/1.225; z_coeff = 1/1.225;
v_px = x_coeff*v_p; v_py = y_coeff*v_p; v_pz = z_coeff*v_p;
a_px = x_coeff*a_p; a_py = y_coeff*a_p; a_pz = z_coeff*a_p;

v_mat = [-v_px -v_py -v_pz]';
a_mat = [-a_px -a_py -a_pz]';

q_dot = [];

for i = 1:length(v_mat)
   
    Jinp = Jinv(q(1,i),q(2,i),q(3,i));
    conc = double(Jinp * v_mat(1:3,i));
    q_dot = [q_dot conc];
    
end


q_ddot = [];

for i = 1:length(v_mat)
   
    Jinp = Jinv(q(1,i),q(2,i),q(3,i));
    DJinp =  DJ(q_dot(1,i),q_dot(2,i),q_dot(3,i));
    conc = double(Jinp * (a_mat(1:3,i)-DJinp*q_dot(1:3,i)));
    q_ddot = [q_ddot conc]
    
end




subplot(2,1,1);
plot(time, q_dot(1, 1:27))
    
hold on 

plot(time, q_dot(2, 1:27))
yyaxis right
plot(time, q_dot(3, 1:27))

xlabel('time (s)', 'interpreter', 'latex') 


leg1 = legend('$\dot{\theta}_1$','$\dot{\theta}_2$','$\dot{s}_3$');
set(leg1,'Interpreter','latex');
set(leg1,'FontSize',17);

hold off 

subplot(2,1,2); 
plot(time, q_ddot(1, 1:27))
hold on 
plot(time, q_ddot(2, 1:27))
yyaxis right
plot(time, q_ddot(3, 1:27))


leg1 = legend('$\ddot{\theta}_1$','$\ddot{\theta}_2$','$\ddot{s}_3$');
set(leg1,'Interpreter','latex');
set(leg1,'FontSize',17);
hold off 
