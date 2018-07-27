
dr=uigetdir();
list=dir([dr, '/*.tif']);        %here jpg is file extension of the images

for x=1:length(list)
    
    x
    
   % original '0' | forged '1'
    if( isempty(findstr(list(x).name,'t.')) == 0 )
        label(x) = 1 ;
    else
        label(x) = 0;
    end
   
    
    imagePath = [dr, '/', list(x).name];
    img = rgb2gray(imread(imagePath));
    
    [or e] = Interpolate(img);
    h = hist(e(:),0:255);
     
    h = h/sum(sum(h)) ; 
    
    feature_error_hist(x,1:256) = h;
    feature_error_hist(x,257) = label(x);
    
end   

 filename = 'New_Coverage_wmean_err_hist_norm.csv';
 csvwrite(filename,feature_error_hist);
