function [ histogram LM RM ] = CreateErrorHistogram( e )
%[ histogram ] = CreateHistogram( e )
%   Creates histogram of errors.

[nr nc] = size(e);

% Compute Range of Errors
max_err = e(2,2);
min_err = e(2,2);
x = e; % To compute distinct elements of e
for i = 1:nr
    for j = 1:nc
        if( e(i,j) == 999 )
            x(i,j) = 0;
        elseif( e(i,j) > max_err )
            max_err = e(i,j);
        elseif( e(i,j) < min_err )
            min_err = e(i,j);
        end
    end
end

% Initialize
histogram = struct('error', [ ], 'count', [ ]);
ue = unique(x); % Contains the unique/distinct elements of e
[nrue ncue] = size(ue);
for i = 1:nrue
    histogram(1,i).error = ue(i);
    histogram(1,i).count = 0;
end

% Create Histogram
for i = 1:nr
    for j = 1:nc
        if( e(i,j) == 999 )
            ;
        else
            for k = 1:nrue
                if( e(i,j) == histogram(1,k).error )
                    histogram(1,k).count = histogram(1,k).count + 1;
                end
            end
        end
    end
end
% display
% for j = 1:nrue
%     disp(['histogram(',num2str(j),').error -> ',num2str( histogram(1,j).error ),', count -> ',num2str( histogram(1,j).count )])
% end

% Compute LM RM
max_count = -1;
for i = 1:nrue
     X(i) = histogram(1,i).error; % For Plot
     Y(i) = histogram(1,i).count; % For Plot
    if( histogram(1,i).count > max_count )
        max_count = histogram(1,i).count;
        LM = histogram(1,i).error;
    end
end
second_max_count = -1;
for i = 1:nrue
    if( histogram(1,i).count == max_count )
        ;
    elseif( histogram(1,i).count > second_max_count )
        second_max_count = histogram(1,i).count;
        RM = histogram(1,i).error;
    end
end

% % Compute LE RE
% LE = struct('error', [ ], 'count', [ ]);
% RE = struct('error', [ ], 'count', [ ]);
% posLE = 0;
% posRE = 0;
% for i = 1:nrue
%     if( histogram(1,i).error <= LM )
%         posLE = posLE + 1;
%         LE(posLE).error = histogram(1,i).error;
%         LE(posLE).count = histogram(1,i).count;
%     end
%     if( histogram(1,i).error >= RM )
%         posRE = posRE + 1;
%         RE(posRE).error = histogram(1,i).error;
%         RE(posRE).count = histogram(1,i).count;
%     end
% end
% % Compute LN RN
% mincount_LE = LE(1).count;
% LN = LE(1).error;
% for j = 1:posLE
%     if( LE(j).count < mincount_LE )
%         mincount_LE = LE(j).count;
%         LN = LE(j).error;
%     end
% end
% mincount_RE = RE(1).count;
% RN = RE(1).error;
% for j = 1:posRE
%     if( RE(j).count < mincount_RE )
%         mincount_RE = RE(j).count;
%         RN = RE(j).error;
%     end
% end
% LN
% RN

% Plot histogram
% figure
% stem(X,Y,'MarkerEdgeColor',[1 0 0],'Color',[0 0 1]);
% grid

end

