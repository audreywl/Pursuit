 time_step = 0.01;
 time_span = 1.5;
 num_steps = time_span / time_step;
 
 positions = zeros(2,num_steps,4);
 velocities = zeros(2,num_steps,4);
 
 positions(:,1,1) = [0,0];
 positions(:,1,2) = [0,1];
 positions(:,1,3) = [1,1];
 positions(:,1,4) = [1,0];
 
 %%Calculate positions matrix
 for j = 1:(size(positions,2)-1)
     
     %Calculate velocities
     for i = 1:3
         velocities(:,j,i) = positions(:,j,i+1) - positions(:,j,i);
         velocities(:,j,i) = velocities(:,j,i)/norm(velocities(:,j,i));
     end
     %The last velocity needs manual calculation, because it wraps
     velocities(:,j,4) = positions(:,j,1) - positions(:,j,4);
     velocities(:,j,4) = velocities(:,j,4)/norm(velocities(:,j,4)); %Make velocities unit vectors

     %Scale velocity to the time_step (i.e. make it a change in position)
     velocities(:,j,:) = velocities(:,j,:) * time_step;

     %Add the velocity*time to the current position to calculate the next
     %position
     positions(:,j+1,:) = positions(:,j,:) + velocities(:,j,:);
 end
 
 hold on
 for i = 1:4   
    plot(positions(1,:,i),positions(2,:,i));
 end
 axis equal
 axis([0,1,0,1]);