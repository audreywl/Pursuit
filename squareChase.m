time_step = 0.002;
time_span = 2.0;
num_steps = time_span / time_step;

positions  = zeros(3,num_steps,4);
velocities = zeros(3,num_steps,4);

positions(:,1,1) = [0,0,0];
positions(:,1,2) = [0,1,0];
positions(:,1,3) = [1,1,0];
positions(:,1,4) = [1,0,0];
positions(:,1,5) = [1,0,1];
positions(:,1,6) = [1,1,1];
positions(:,1,7) = [0,1,1];
positions(:,1,8) = [0,0,1];

%%Calculate positions matrix
for j = 1:(size(positions,2)-1)

 %Calculate velocities
 for i = 1:7
     velocities(:,j,i) = positions(:,j,i+1) - positions(:,j,i);
     velocities(:,j,i) = velocities(:,j,i)/norm(velocities(:,j,i));
 end
 %The last velocity needs manual calculation, because it wraps
 velocities(:,j,8) = positions(:,j,1) - positions(:,j,8);
 velocities(:,j,8) = velocities(:,j,8)/norm(velocities(:,j,8)); %Make velocities unit vectors

 %Scale velocity to the time_step (i.e. make it a change in position)
 velocities(:,j,:) = velocities(:,j,:) * time_step;

 %Add the velocity*time to the current position to calculate the next
 %position
 positions(:,j+1,:) = positions(:,j,:) + velocities(:,j,:);
end

fig = figure('Position',[20,20,1000,1000]);


line1 = animatedline(0,0,0);
line2 = animatedline(0,1,0);
line3 = animatedline(1,1,0);
line4 = animatedline(1,0,0);
line5 = animatedline(1,0,1);
line6 = animatedline(1,1,1);
line7 = animatedline(0,1,1);
line8 = animatedline(0,0,1);
axis equal
axis([0,1,0,1,0,1]);
set(gca,'visible','off')
set(gcf,'Color',[1,1,1]);

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

M(num_steps*2) = struct('cdata',[],'colormap',[]);

hold on
for i = 1:num_steps  
    addpoints(line1,positions(1,i,1),positions(2,i,1),positions(3,i,1));
    addpoints(line2,positions(1,i,2),positions(2,i,2),positions(3,i,2));
    addpoints(line3,positions(1,i,3),positions(2,i,3),positions(3,i,3));
    addpoints(line4,positions(1,i,4),positions(2,i,4),positions(3,i,4));
    addpoints(line5,positions(1,i,5),positions(2,i,5),positions(3,i,5));
    addpoints(line6,positions(1,i,6),positions(2,i,6),positions(3,i,6));
    addpoints(line7,positions(1,i,7),positions(2,i,7),positions(3,i,7));
    addpoints(line8,positions(1,i,8),positions(2,i,8),positions(3,i,8));
    view(i/25-37.5,25);
    drawnow
    M(i) = getframe(fig);
end

k = num_steps;
for i = k+1:k*2
    view(i/25-37.5,25);
    drawnow
    M(i) = getframe(fig);
end
drawnow