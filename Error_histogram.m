function [ ] = Error_histogram( image )
%Create interpolation error histogram for a particular image

if ( ischar(image) == 1 )
    %If input 'image' is the name of the image file 
    rgb = imread(image);
else
    %If input 'image' the pixel matrix itself
    rgb = image;
end
rgb = double(rgb);

% Transform color space
ycocg = rgb2ycocg( rgb );

% Separate integer part
ycocg_i = floor( ycocg );

%---------R----------------------------------------------------------------
[ x e ] = Interpolate( rgb(:,:,1) );
[nr nc nl] = size( e )

R_freq = zeros( 1, (255*2 + 1) ); % -255...-1 0 1...255
for i = 1:nr
    for j = 1:nc
        if( e(i,j) == 999 )
            ;
        else
            R_freq( 1, ( e(i,j) + 256 ) ) = R_freq( 1, ( e(i,j) + 256 ) ) + 1;
        end
    end
end

% for j = 1:(255*2 + 1)
%     disp(['R_freq(',num2str(j-256),') -> ',num2str( R_freq(1,j) )])
% end

% Plot histogram
figure1 = figure;
axes1 = axes('Parent',figure1,'FontWeight','bold','FontSize',24);
xlim(axes1,[-100 100]);
ylim(axes1,[0 3.5e+004]);
box(axes1,'on');
hold(axes1,'all');
title('R histogram','FontWeight','bold','FontSize',24);
bar(-255:255,R_freq,'FaceColor',[0.502 0.502 0.502],'LineWidth',1,...
    'BarWidth',1);
xlabel('Interpolation Error','FontWeight','bold','FontSize',24);
ylabel('Frequency','FontWeight','bold','FontSize',24);

%---------G----------------------------------------------------------------
[ x e ] = Interpolate( rgb(:,:,2) );
[nr nc nl] = size( e )

G_freq = zeros( 1, (255*2 + 1) ); % -255...-1 0 1...255
for i = 1:nr
    for j = 1:nc
        if( e(i,j) == 999 )
            ;
        else
            G_freq( 1, ( e(i,j) + 256 ) ) = G_freq( 1, ( e(i,j) + 256 ) ) + 1;
        end
    end
end

% for j = 1:(255*2 + 1)
%     disp(['G_freq(',num2str(j-256),') -> ',num2str( G_freq(1,j) )])
% end

% Plot histogram
figure1 = figure;
axes1 = axes('Parent',figure1,'FontWeight','bold','FontSize',24);
xlim(axes1,[-100 100]);
ylim(axes1,[0 3.5e+004]);
box(axes1,'on');
hold(axes1,'all');
title('G histogram','FontWeight','bold','FontSize',24);
bar(-255:255,G_freq,'FaceColor',[0.502 0.502 0.502],'LineWidth',1,...
    'BarWidth',1);
xlabel('Interpolation Error','FontWeight','bold','FontSize',24);
ylabel('Frequency','FontWeight','bold','FontSize',24);

%---------B----------------------------------------------------------------
[ x e ] = Interpolate( rgb(:,:,3) );
[nr nc nl] = size( e )

B_freq = zeros( 1, (255*2 + 1) ); % -255...-1 0 1...255
for i = 1:nr
    for j = 1:nc
        if( e(i,j) == 999 )
            ;
        else
            B_freq( 1, ( e(i,j) + 256 ) ) = B_freq( 1, ( e(i,j) + 256 ) ) + 1;
        end
    end
end

% for j = 1:(255*2 + 1)
%     disp(['B_freq(',num2str(j-256),') -> ',num2str( B_freq(1,j) )])
% end

% Plot histogram
figure1 = figure;
axes1 = axes('Parent',figure1,'FontWeight','bold','FontSize',24);
xlim(axes1,[-100 100]);
ylim(axes1,[0 3.5e+004]);
box(axes1,'on');
hold(axes1,'all');
title('B histogram','FontWeight','bold','FontSize',24);
bar(-255:255,B_freq,'FaceColor',[0.502 0.502 0.502],'LineWidth',1,...
    'BarWidth',1);
xlabel('Interpolation Error','FontWeight','bold','FontSize',24);
ylabel('Frequency','FontWeight','bold','FontSize',24);

%-----------------------------B1--------------------------------------------
%extended plot

B1_freq(1,(-2:1:2)+256 ) = B_freq(1,(-2:1:2)+256);

for i = 3:nr+3
    for j = 3:nc+3
        B1_freq(1, e(i+3,j+3)+256) = B_freq( 1, e(i,j)+256);
    end
end

B_freq(1, (3+256):(5+256) ) = 0;
B_freq(1, (-3+256):-1:(-5+256)) = 0;

figure1 = figure;
axes1 = axes('Parent',figure1,'FontWeight','bold','FontSize',24);
xlim(axes1,[-100 100]);
ylim(axes1,[0 3.5e+004]);
box(axes1,'on');
hold(axes1,'all');
title('B1 histogram','FontWeight','bold','FontSize',24);
bar(-255:255,B1_freq,'FaceColor',[0.502 0.502 0.502],'LineWidth',1,...
    'BarWidth',1);
xlabel('Interpolation Error','FontWeight','bold','FontSize',24);
ylabel('Frequency','FontWeight','bold','FontSize',24);

%---------Y----------------------------------------------------------------
[ x e ] = Interpolate( ycocg_i(:,:,1) );
[nr nc nl] = size( e )

Y_freq = zeros( 1, (255*2 + 1) ); % -255...-1 0 1...255
for i = 1:nr
    for j = 1:nc
        if( e(i,j) == 999 )
            ;
        else
            Y_freq( 1, ( e(i,j) + 256 ) ) = Y_freq( 1, ( e(i,j) + 256 ) ) + 1;
        end
    end
end

% for j = 1:(255*2 + 1)
%     disp(['Y_freq(',num2str(j-256),') -> ',num2str( Y_freq(1,j) )])
% end

% Plot histogram
figure1 = figure;
axes1 = axes('Parent',figure1,'FontWeight','bold','FontSize',24);
xlim(axes1,[-100 100]);
ylim(axes1,[0 3.5e+004]);
box(axes1,'on');
hold(axes1,'all');
title('Y histogram','FontWeight','bold','FontSize',24);
bar(-255:255,Y_freq,'FaceColor',[0.502 0.502 0.502],'LineWidth',1,...
    'BarWidth',1);
xlabel('Interpolation Error','FontWeight','bold','FontSize',24);
ylabel('Frequency','FontWeight','bold','FontSize',24);

%---------Co----------------------------------------------------------------
[ x e ] = Interpolate( ycocg_i(:,:,2) );
[nr nc nl] = size( e )

Co_freq = zeros( 1, (255*2 + 1) ); % -255...-1 0 1...255
for i = 1:nr
    for j = 1:nc
        if( e(i,j) == 999 )
            ;
        else
            Co_freq( 1, ( e(i,j) + 256 ) ) = Co_freq( 1, ( e(i,j) + 256 ) ) + 1;
        end
    end
end

% for j = 1:(255*2 + 1)
%     disp(['Cb_freq(',num2str(j-256),') -> ',num2str( Cb_freq(1,j) )])
% end

% Plot histogram
figure1 = figure;
axes1 = axes('Parent',figure1,'FontWeight','bold','FontSize',24);
xlim(axes1,[-100 100]);
ylim(axes1,[0 3.5e+004]);
box(axes1,'on');
hold(axes1,'all');
title('Co histogram','FontWeight','bold','FontSize',24);
bar(-255:255,Co_freq,'FaceColor',[0.502 0.502 0.502],'LineWidth',1,...
    'BarWidth',1);
xlabel('Interpolation Error','FontWeight','bold','FontSize',24);
ylabel('Frequency','FontWeight','bold','FontSize',24);

%---------Cg----------------------------------------------------------------
[ x e ] = Interpolate( ycocg_i(:,:,3) );
[nr nc nl] = size( e )

Cg_freq = zeros( 1, (255*2 + 1) ); % -255...-1 0 1...255
for i = 1:nr
    for j = 1:nc
        if( e(i,j) == 999 )
            ;
        else
            Cg_freq( 1, ( e(i,j) + 256 ) ) = Cg_freq( 1, ( e(i,j) + 256 ) ) + 1;
        end
    end
end

% for j = 1:(255*2 + 1)
%     disp(['Cr_freq(',num2str(j-256),') -> ',num2str( Cr_freq(1,j) )])
% end

% Plot histogram
figure1 = figure;
axes1 = axes('Parent',figure1,'FontWeight','bold','FontSize',24);
xlim(axes1,[-100 100]);
ylim(axes1,[0 3.5e+004]);
box(axes1,'on');
hold(axes1,'all');
title('Cg histogram','FontWeight','bold','FontSize',24);
bar(-255:255,Cg_freq,'FaceColor',[0.502 0.502 0.502],'LineWidth',1,...
    'BarWidth',1);
xlabel('Interpolation Error','FontWeight','bold','FontSize',24);
ylabel('Frequency','FontWeight','bold','FontSize',24);

end

