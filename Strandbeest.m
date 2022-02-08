close all               %Clsoes windows
clear all               %Clears all variables
clc                     %Clear command window

%Declare variable
crank_r = 120;%120 Red
link_1 = 400;%400 Green
link_2 = 400;%400 Pink
link_3 = 275;%275 Purple
link_4 = 400;%400 Light-Blue
link_6 = 400;%400 Cyan
link_7 = 275;%275 Orange
link_8 = 275;%275 Dark-Green
link_9 = 275;%275 Dark-Blue
link_10 = 275;%275 Yellow
link_11 = 540;%540 Bordo
crank_x = 0;
crank_y = 0;
pin_x = crank_x - (286);%286 Black
pin_y = crank_y;
link_5 = 275;%275 Bordo geometry


node_1_x = pin_x;
node_1_y = 5;

link_9_t = 0;

link_10_t = pi;
link_11_t = pi;

node_2_x = pin_x - link_9;
node_2_y = pin_y;

link_8_t = 3/4*pi;

node_3_x = pin_x;
node_3_y = pin_y - link_8;

link_7_t = pi;

node_4_x = pin_x - link_7;
node_4_y = pin_y - link_3;

link_5_t = 3/4*pi;

node_5_y = pin_y - link_8 - link_5;
node_5_x = pin_x;

node_6_y = node_5_y;
node_6_x = node_5_x;


%Animation

ii=0;

x = [];
y = [];

for t=0:0.2:2*pi %%rotation link

    ii = ii + 1;

    node_0_x = crank_x + crank_r*cos(t);
    node_0_y = crank_y + crank_r*sin(t);

    
    %
    % NODE 1
    %

    dist = 10000000;
    
    for link_9_t=0:0.02:pi
        node_1_x = pin_x + link_9*cos(link_9_t);
        node_1_y = pin_y + link_9*sin(link_9_t);

        dist_tmp = sqrt((node_0_x-node_1_x)^2+(node_0_y-node_1_y)^2);

        diff = abs(dist_tmp - link_1);

        if (diff < dist)
            dist = diff;
            theta = link_9_t;
        end
    end
    
    link_9_t = theta;
    
    node_1_x = pin_x + link_9*cos(link_9_t);
    node_1_y = pin_y + link_9*sin(link_9_t);
    
    
    %
    % NODE 2
    %
    
    dist = 10000000;
    
    for link_10_t=.75*pi:0.02:1.5*pi
        node_2_x = pin_x + link_10*cos(link_10_t);
        node_2_y = pin_y + link_10*sin(link_10_t);
    
        dist_tmp = sqrt((node_2_x-node_1_x)^2+(node_2_y-node_1_y)^2);
        
        diff = abs(dist_tmp - link_2);
        
        if (diff < dist)
            dist = diff;
            theta = link_10_t;
        end
    end
    
    link_10_t = theta;
    
    node_2_x = pin_x + link_10*cos(link_10_t);
    node_2_y = pin_y + link_10*sin(link_10_t);
    
    %
    % NODE 3
    %
    
     dist = 10000000;
    
    for link_8_t=pi:0.02:2*pi
        node_3_x = pin_x + link_8*cos(link_8_t);
        node_3_y = pin_y + link_8*sin(link_8_t);
    
        dist_tmp = sqrt((node_0_x-node_3_x)^2+(node_0_y-node_3_y)^2);
        
        diff = abs(dist_tmp - link_6);
        
        if (diff < dist)
            dist = diff;
            theta = link_8_t;
        end
    end
    
    link_8_t = theta;
    
    node_3_x = pin_x + link_8*cos(link_8_t);
    node_3_y = pin_y + link_8*sin(link_8_t);
    
    %
    % NODE 4
    %
    
    dist = 10000000;
    
    for link_7_t=.75*pi:0.02:1.5*pi
        node_4_x = node_3_x + link_7*cos(link_7_t);
        node_4_y = node_3_y + link_7*sin(link_7_t);
    
        dist_tmp = sqrt((node_4_x-node_2_x)^2+(node_4_y-node_2_y)^2);
        
        diff = abs(dist_tmp - link_3);
        
        if (diff < dist)
            dist = diff;
            theta = link_7_t;
        end
    end
    
    link_7_t = theta;
    
    node_4_x = node_3_x + link_7*cos(link_7_t);
    node_4_y = node_3_y + link_7*sin(link_7_t);
    
    
    %
    % NODE 5
    %
    
    dist = 10000000;
    
    for link_5_t=pi:0.02:2*pi
        node_5_x = node_3_x + link_5*cos(link_5_t);
        node_5_y = node_3_y + link_5*sin(link_5_t);
    
        dist_tmp = sqrt((node_4_x-node_5_x)^2+(node_4_y-node_5_y)^2);
       
        diff = abs(dist_tmp - link_4);
      
        if (diff < dist)
            dist = diff;
            theta = link_5_t;
        end
    end

    link_5_t = theta;

    node_5_x = node_3_x + link_5*cos(link_5_t);
    node_5_y = node_3_y + link_5*sin(link_5_t);

    node_6_x = node_3_x + link_11*cos(link_5_t);
    node_6_y = node_3_y + link_11*sin(link_5_t);

    x(end+1) = node_3_x + link_11*cos(link_5_t);
    y(end+1) = node_6_y;

    %
    % DRAW
    %

    plot([crank_x pin_x], [crank_y pin_y],'k','linewidth',4); hold on       % crank to pin
    plot([crank_x node_0_x], [crank_y node_0_y],'r','linewidth',4); hold on     % crank

    plot([node_0_x node_1_x], [node_0_y node_1_y],'g','linewidth',4);           % link_1
    plot([pin_x node_1_x], [pin_y node_1_y],'b','linewidth',4);                 % link_9

    plot([pin_x node_2_x], [pin_y node_2_y],'y','linewidth', 4);                % link_10
    plot([node_1_x node_2_x], [node_1_y node_2_y],'m','linewidth', 4);          % link_2

    plot([node_0_x node_3_x], [node_0_y node_3_y],'c','linewidth',4);           % link_6
    plot([pin_x node_3_x], [pin_y node_3_y],'Color',[0.4660 0.6740 0.1880],'linewidth',4);                 % link_8

    plot([node_3_x node_4_x], [node_3_y node_4_y],'Color',[0.8500 0.3250 0.0980],'linewidth', 4);          % link_7
    plot([node_2_x node_4_x], [node_2_y node_4_y],'Color',[0.4940 0.1840 0.5560],'linewidth', 4);          % link_3

    plot([node_4_x node_5_x], [node_4_y node_5_y],'Color',[0.3010 0.7450 0.9330],'linewidth', 4);          % link_4

    plot([node_3_x node_6_x], [node_3_y node_6_y],'Color',[0.6350 0.0780 0.1840],'linewidth', 4);          % link_5

    plot(x,y,'r');

    hold off            %So next plot will erase the current plot
    axis([-900 600 -900 600]);
    pause(0.05)          
end