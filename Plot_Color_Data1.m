function [ ] = Plot_Color_Data1( )
%%%

disp('Lena');
[ LENApr LENApy LENAbr LENAby ] = Plot_Color( 'lena.tiff' );
disp(' ');

%--------------------------------------------------------------------------
disp('Mandrill');
[ MANDRILLpr MANDRILLpy MANDRILLbr MANDRILLby ] = Plot_Color( 'mandrill.tiff' );
disp(' ');

%--------------------------------------------------------------------------

disp('plane');
[ PLANEpr PLANEpy PLANEbr PLANEby ] = Plot_Color( 'plane.tiff' );
disp(' ');
%--------------------------------------------------------------------------

disp('sailboat');
[ SAILBOATpr SAILBOATpy SAILBOATbr SAILBOATby ] = Plot_Color( 'sailboat.tiff' );
disp(' ');
%--------------------------------------------------------------------------

disp('splash');
[ SPLASHpr SPLASHpy SPLASHbr SPLASHby ] = Plot_Color( 'splash.tiff' );
disp(' ');
%--------------------------------------------------------------------------

disp('jellybeans');
[ JELLYBEANSpr JELLYBEANSpy JELLYBEANSbr JELLYBEANSby ] = Plot_Color( 'jellybeans.tiff' );
disp(' ');
%--------------------------------------------------------------------------

disp('car');
[ CARpr CARpy CARbr CARby ] = Plot_Color( 'car.tiff' );
disp(' ');
%--------------------------------------------------------------------------

disp('pepper');
[ PEPPERpr PEPPERpy PEPPERbr PEPPERby ] = Plot_Color( 'pepper.tiff' );
disp(' ');
%--------------------------------------------------------------------------

disp('zelda');
[ ZELDApr ZELDApy ZELDAbr ZELDAby ] = Plot_Color( 'zelda.tiff' );
disp(' ');
%--------------------------------------------------------------------------


% Create figure
figure1 = figure;

% Create axes
axes1 = axes('Parent',figure1,'FontWeight','bold','FontSize',24);
box(axes1,'on');
grid(axes1,'on');
hold(axes1,'all');

% Create plot
plot(SAILBOATbr,SAILBOATpr,'Parent',axes1,'MarkerSize',10,'Marker','o','LineWidth',3,...
    'Color',[0 0 1],...
    'DisplayName','RGB');

% Create plot
plot(SAILBOATby,SAILBOATpy,'Parent',axes1,'MarkerSize',10,'Marker','square','LineWidth',3,...
    'Color',[0.8706 0.4902 0],...
    'DisplayName','YCbCr');

title('SAILBOAT');

% Create xlabel
xlabel('Embedded bpp','FontWeight','bold','FontSize',24);

% Create ylabel
ylabel('PSNR (dB)','FontWeight','bold','FontSize',24);

% Create legend
legend1 = legend(axes1,'show');
set(legend1,'EdgeColor',[1 1 1],'YColor',[1 1 1],'XColor',[1 1 1],...
    'Position',[0.7573 0.6548 0.1469 0.2699]);

%--------------------------------------------------------------------------

max_cap = [113310 170899; 241024 336119; 94280 247150; 37940 118853; 175105 255160; 483766 501937; 144783 215261; 274907 368196 ]
max_cap = max_cap./(512*512)

% Create figure
figure1 = figure;

% Create axes
axes1 = axes('Parent',figure1,...
    'YTickLabel',{'Lena','Zelda','Plane','Sailboat','Splash','Jellybeans','Car','Pepper'},...
    'YTick',[1 2 3 4 5 6 7 8],...
    'XTick',[0 0.2 0.4 0.6 0.8 1 1.2 1.4 1.6 1.8 2],...
    'XGrid','on',...
    'FontWeight','bold',...
    'FontSize',24);
box(axes1,'on');
hold(axes1,'all');

% Create multiple lines using matrix input to bar
bar1 = bar(max_cap,'Horizontal','on','BarWidth',1,'Parent',axes1);
set(bar1(1),'FaceColor',[0.4784 0.06275 0.8941],'DisplayName','RGB');
set(bar1(2),'FaceColor',[0.749 0.749 0],'DisplayName','YCbCr');

% Create ylabel
ylabel('Test Images','FontWeight','bold','FontSize',24);

% Create xlabel
xlabel('Embedding Capacity (bpp)','FontWeight','bold','FontSize',24);

% Create legend
legend1 = legend(axes1,'show');
set(legend1,'YColor',[1 1 1],'XColor',[1 1 1]);

end

