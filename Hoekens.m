close all; clear all; clc;
L1=4.5; %space
L2=1.5; %red
L3=5; %green
L4=4.3; %blue
ii=0;
  x=[];
    y=[];

A=[0,0]; 
D=[L1,0]; 
for t=0:0.05:4.2*pi %rotate link
    %1) Angle values obtained by position analysis are entered.
    BD=sqrt(L1.^2+L2*L2-2*L1*L2*cos(t)); 
    fi=acos((L3*L3+L4*L4-BD*BD)/(2*L3*L4));
    theta3=2*atan((-L2*sin(t)+L4*sin(fi))/(L1+L3-L2*cos(t)-L4*cos(fi)));
    theta4=2*atan((L2*sin(t)-L3*sin(fi))/(L4-L1+L2*cos(t)-L3*cos(fi)));
  
    ii=ii+1;
    %2) The positions of the joint points are entered.
    B=[(L2*cos(t)),(L2*sin(t))]; 
    C=[(L2*cos(t)+L3*cos(theta3)),(L2*sin(t)+L3*sin(theta3))];
    E=[((L2)*cos(t)+(L3+2.5)*cos(theta3)),((L2)*sin(t)+(L3+2.5)*sin(theta3))];%change of black link
    x(ii)=[E(1)];
    y(ii)=[E(2)];
    %3) Links are created.
    plot([A(1),B(1)],[A(2),B(2)],'LineWidth',4,'Color','r'); hold on
    plot([B(1),C(1)],[B(2),C(2)],'LineWidth',4,'Color','g'); hold on
    plot([C(1),E(1)],[C(2),E(2)],'LineWidth',4,'Color','k'); hold on
    plot([A(1),D(1)],[A(2),D(2)],'LineWidth',4,'Color','y'); hold on
    plot([C(1),D(1)],[C(2),D(2)],'LineWidth',4,'Color','b'); hold on
    axis([-5 15 -5 15]);
    plot(x,y,'k');
    hold off
    pause(0.000005); %An image update is performed every 0.005 seconds. 
end
hold on


