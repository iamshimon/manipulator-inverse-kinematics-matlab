clc
clear all
close all

%%% This example shows how to do the inverse kinematics for a 4 link
%%% manipulator

% DH parameters
global d1 a1 alpha1 
global d2 a2 alpha2
global d3 a3 alpha3
global d4 a4 alpha4 
global x_des y_des z_des %where you want the end-effector


%D-H for links. Theta's are not set, because we need to find them. 
d1=0; a1=1;  alpha1=0; % theta1
d2=0; a2=1; alpha2=0; % theta2
d3=0; a3=1; alpha3=0; %theta3
d4=0; a4=1; alpha4=0; %theta4


%Below is the input given to the IK
%Location where we want the end-effector to be
%Change this value if you want to try out different position
x_des = 2.5; y_des = 2.5; z_des = 0;

% initial guess values for theta
theta1=pi/2; theta2=0; theta3=pi/4; theta4=0;

X0 = [theta1, theta2, theta3, theta4];

%plot the initial position of the manipulator
disp('initial position');
figure(1)
plot_manipulator(X0)


%% Solve for the values of theta that give the required end-effector pose.
%fsolve solves for the roots for the equation X-XDES
[X,FVAL,EXITFLAG] = fsolve('find_joint_angles',X0);
theta1 = X(1);
theta2 = X(2);
theta3 = X(3);
theta4 = X(4);
disp(['Exitflag after running fsolve = ', num2str(EXITFLAG) ]) %Tells if fsolve converged or not
               %1 means converged else not converged             
              
 X
 FVAL
%Visualise the manipulator with the generated theta values
X_des = [x_des y_des,z_des];
disp('final position');
figure(2)
plot_manipulator(X,X_des)