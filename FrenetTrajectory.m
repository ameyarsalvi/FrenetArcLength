coordinates = csvread("path.csv");

figure
plot(coordinates(:,1),coordinates(:,2))

waypoints = [path.VarName1 path.VarName2];

refPath = referencePathFrenet(waypoints);
connector = trajectoryGeneratorFrenet(refPath);

%%

initState = [0 0 0 0 0 0];  % [S ds ddS L dL ddL]
termState = [30 0 0 0 0 0]; % [S ds ddS L dL ddL]
[~,trajGlobal] = connect(connector,initState,termState,5);

%%

%show(refPath);
%hold on
%axis equal
%plot(trajGlobal.Trajectory(:,1),trajGlobal.Trajectory(:,2),'b')
%legend(["Waypoints","Reference Path","Trajectory to 100m"])

plot(refPath.SegmentParameters(:,1),refPath.SegmentParameters(:,2))
