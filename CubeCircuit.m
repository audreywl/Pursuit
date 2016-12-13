fig = figure('Position',[20,20,1000,1000]);

axis equal
axis([-0.1,1.1,-0.1,1.1,-0.1,1.1]);
set(gca,'visible','off')
set(gcf,'Color',[1,1,1]);

hold on

line([0,0],[0,0],[0,1]);
line([1,1],[0,0],[0,1]);
line([0,0],[1,1],[0,1]);
line([1,1],[1,1],[0,1]);
line([0,1],[0,0],[0,0]);
line([0,1],[1,1],[0,0]);
line([0,1],[0,0],[1,1]);
line([0,1],[1,1],[1,1]);
line([0,0],[0,1],[0,0]);
line([1,1],[0,1],[0,0]);
line([0,0],[0,1],[1,1]);
line([1,1],[0,1],[1,1]);

M(9) = struct('cdata',[],'colormap',[]);

pause(1);
drawnow
M(1) = getframe(fig);

quiver3(0,0,0, 0,1,0, 0,'Color','r','LineWidth',2.0);
pause(1);
drawnow
M(2) = getframe(fig);

quiver3(0,1,0, 1,0,0, 0,'Color','r','LineWidth',2.0);
pause(1);
drawnow
M(3) = getframe(fig);

quiver3(1,1,0, 0,-1,0, 0,'Color','r','LineWidth',2.0);
pause(1);
drawnow
M(4) = getframe(fig);

quiver3(1,0,0, 0,0,1, 0,'Color','r','LineWidth',2.0);
pause(1);
drawnow
M(5) = getframe(fig);

quiver3(1,0,1, 0,1,0, 0,'Color','r','LineWidth',2.0);
pause(1);
drawnow
M(6) = getframe(fig);

quiver3(1,1,1, -1,0,0, 0,'Color','r','LineWidth',2.0);
pause(1);
drawnow
M(7) = getframe(fig);

quiver3(0,1,1, 0,-1,0, 0,'Color','r','LineWidth',2.0);
pause(1);
drawnow
M(8) = getframe(fig);

quiver3(0,0,1, 0,0,-1, 0,'Color','r','LineWidth',2.0);
pause(1);
drawnow
M(9) = getframe(fig);
