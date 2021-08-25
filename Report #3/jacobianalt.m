%%%%%%%%%%%%%%%%%%%%%%    Mert Emrem - 250203015    %%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%    ME460 - Project #3        %%%%%%%%%%%%%%%%%%%%%%

clc; clear all

syms theta1(t) theta2(t) s3(t) d1 tau1 tau2 f3 Fx Fy Fz


Px = s3(t)*cos(theta2(t))*cos(theta1(t));
Py = s3(t)*cos(theta2(t))*sin(theta1(t));
Pz = d1 + s3(t)*sin(theta2(t));

dx = diff(Px,t); dy = diff(Py,t); dz = diff(Pz,t);


theta1dotx = subs(Fx*dx, [diff(theta2(t), t) diff(s3(t), t)], [0 0]);
theta1doty = subs(Fy*dy, [diff(theta2(t), t) diff(s3(t), t)], [0 0]);
theta1dotz = subs(Fz*dz, [diff(theta2(t), t) diff(s3(t), t)], [0 0]);
theta2dotx = subs(Fx*dx, [diff(theta1(t), t) diff(s3(t), t)], [0 0]);
theta2doty = subs(Fy*dy, [diff(theta1(t), t) diff(s3(t), t)], [0 0]);
theta2dotz = subs(Fz*dz, [diff(theta1(t), t) diff(s3(t), t)], [0 0]);
s3dotx = subs(Fx*dx, [diff(theta1(t), t) diff(theta2(t), t)], [0 0]);
s3doty = subs(Fy*dy, [diff(theta1(t), t) diff(theta2(t), t)], [0 0]);
s3dotz = subs(Fz*dz, [diff(theta1(t), t) diff(theta2(t), t)], [0 0]);


tau1 = -collect(theta1dotx + theta1doty + theta1dotz,diff(theta1(t), t))
tau2 = -collect(theta2dotx + theta2doty + theta2dotz,diff(theta2(t), t))
s3 = -collect((s3dotx + s3doty + s3dotz),diff(s3(t), t))



