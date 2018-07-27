
b = -4:4;
a(1,b+5) = [ 2 3 5 6 9 8 7 5 3];
figure1 = figure;
axes1 = axes('Parent',figure1,'FontWeight','bold','FontSize',32);
xlim(axes1,[-8 8]);
ylim(axes1,[0 12]);
box(axes1,'on');
hold(axes1,'all');
%title('Error histogram','FontWeight','bold','FontSize',24);
bar(-4:4,a,'FaceColor',[0.3 0.5 0.9],'LineWidth',1,...
    'BarWidth',1);
xlabel('Prediction Error','FontWeight','bold','FontSize',32);
ylabel('Frequency','FontWeight','bold','FontSize',32);



b1 = -7:7;
a1(1,b1+8) = [2 3 0 0 0 5 6 9 8 7 0 0 0 5 3];
figure2 = figure;
axes1 = axes('Parent',figure2,'FontWeight','bold','FontSize',32);
xlim(axes1,[-8 8]);
ylim(axes1,[0 12]);
box(axes1,'on');
hold(axes1,'all');
%title('Error histogram','FontWeight','bold','FontSize',24);
bar(-7:7,a1,'FaceColor',[0.3 0.5 0.9],'LineWidth',1,...
    'BarWidth',1);
xlabel('Prediction Error','FontWeight','bold','FontSize',32);
ylabel('Frequency','FontWeight','bold','FontSize',32);


b2 = -7:7;
a2(1,b2+8) = [2 3 4 2 5 3 5 6 3 5 2 4 3 5 3];
figure3 = figure;
axes1 = axes('Parent',figure3,'FontWeight','bold','FontSize',32);
xlim(axes1,[-8 8]);
ylim(axes1,[0 12]);
box(axes1,'on');
hold(axes1,'all');
%title('Error histogram','FontWeight','bold','FontSize',24);
bar(-7:7,a2,'FaceColor',[0.3 0.5 0.9],'LineWidth',1,...
    'BarWidth',1);
xlabel('Prediction Error','FontWeight','bold','FontSize',32);
ylabel('Frequency','FontWeight','bold','FontSize',32);


