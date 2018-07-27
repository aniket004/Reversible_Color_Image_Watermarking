
% y = [ 0.1112 0.1039; 0.9334 0.4764; 0.2346 0.1447; 0.9352 0.5667; 0.6752 0.4243; 0.8703 0.5319; ];
% axes1 = axes('Parent',figure,'FontWeight','bold','FontSize',24);
%  'XTickLabel',{'Mandrill','Pepper','Sailboat','Barbara','Goldhill','Boat'},...
%  'XTick',[1 2 3 4 5 6 7 8]
%  box(axes1,'on');
%  hold(axes1,'all');
%  ylabel('Embedded bpp','FontWeight','bold','FontSize',24);
%  bar(y);
 
 
 y = [ 
       0.7577 0.7472 0.7085 0.2520; %nature
       0.7726 0.5649 0.3852 0.1340; %house
       0.8907 0.6842 0.4586 0.2098; %cycle
       1.1691 0.8931 0.5824 0.4136; %sea
       1.1515 0.8649 0.9013 0.5999; %cap
       0.9710 0.8949 0.7556 0.5284; %bird
       ];
   
 %y = [ 0.8994 0.3554; 0.9334 0.4764; 0.2346 0.1447; 0.9352 0.5667; 0.6752 0.4243; 0.8703 0.5319; ];
%Create figure
figure1 = figure;

% Create axes
axes1 = axes('Parent',figure1,...
    'YTickLabel',{'Nature','House','Cycle','Sea','Cap','Bird'},...
    'YTick',[1 2 3 4 5 6 ],...
    'XTick',[0 0.2 0.4 0.6 0.8 1 1.2 1.4 1.6 1.8 2],...
    'XGrid','on',...
    'FontWeight','bold',...
    'FontSize',20);
box(axes1,'on');
hold(axes1,'all');

% Create multiple lines using matrix input to bar
bar1 = bar(y,'Horizontal','on','BarWidth',1,'Parent',axes1);
% set(bar1(1),'FaceColor',[0.4784 0.06275 0.8941],'DisplayName','RGB');
% set(bar1(2),'FaceColor',[0.749 0.749 0],'DisplayName','YCbCr');

% Create ylabel
ylabel('Test Images','FontWeight','bold','FontSize',24);

% Create xlabel
xlabel('Embedding Capacity (bpp)','FontWeight','bold','FontSize',24);

