%{
Prepare  Images to introduce
numImages = 20;
files = cell(1, numImages);
for i = 1:numImages
    files{i} = fullfile('C:','Users','Anna','MATLAB Drive','Published','Measuring Planar Objects with a Calibrated Camera', 'Calibration Images for Test6', sprintf('image%d.jpg', i));
end
%}
% Display one of the calibration images
magnification = 25;

I = imread('Imagen.jpg');
figure; imshow(I, 'InitialMagnification', magnification);
title('One of the Calibration Images');
size(I);


%getting the threshold limits under and above color saturation pixel 
% Convert the image to the HSV color space.
imHSV = rgb2hsv(I);

% Get the saturation channel.
saturation = imHSV(:, :, 2);

% Threshold the image
t = graythresh(saturation);



%convertin into a gray_scale image:
gray_x = rgb2gray(I);
%to binary image:
bw_x = im2bw(gray_x,t);
imshow(bw_x);

%invertin binary

bw = ~bw_x;
imshow(bw);

%reducing the noising componetnts 
%cada objeto que tengoa menos de 1000 pixeles va ser removido de la imagen

bw_new = bwareaopen(bw,1000);
imshow(bw_new);%no lo tem en cuenta para el paper 

%finding the number of conectivity and conected componets 
[bw_newLabel,num] = bwlabel(bw_new,8); %8 number of conectivity tome como numero la unit del image principal a analizar (I)

%getting properties
s = regionprops(bw_newLabel,'all');


%rectangle

imshow(I);
hold on;
rectangle('Position',s.BoundingBox);
hold off;

%sacando a una matriz separada el centroide del bounding box
cent = cat(1,s.Centroid);
%plotting the rectangle y centroid 
imshow(I);
hold on;
plot(cent(:,1),cent(:,2),'g*');
rectangle('Position',s.BoundingBox);
hold off;

%-------------


% Read in the chosen standard MATLAB demo image.
originalImage = imread('Imagen.jpg');
% Get the dimensions of the image.
% numberOfColorBands should be = 1.
[rows, columns, numberOfColorBands] = size(originalImage);
% Display the original gray scale image.
figureHandle = figure;
subplot(1,2, 1);
imshow(originalImage, []);
axis on;
title('Original Grayscale Image');
% Enlarge figure to full screen.
set(gcf, 'units','normalized','outerposition',[0 0 1 1]);
% Give a name to the title bar.
set(gcf,'name','Demo by ImageAnalyst','numbertitle','off')

%calibration----------
[cx, cy, rgbValues, xi,yi] = improfile(1000);
	% rgbValues is 1000x1x3.  Call Squeeze to get rid of the singleton dimension and make it 1000x3.
	rgbValues = squeeze(rgbValues);
	distanceInPixels = sqrt( (xi(2)-xi(1)).^2 + (yi(2)-yi(1)).^2);
	if length(xi) < 2
		return;
    end
    
	% Plot the line.
	hold on;
	lastDrawnHandle = plot(xi, yi, 'y-', 'LineWidth', 2);

	% Ask the user for the real-world distance.
	userPrompt = {'Enter real world units (e.g. microns):','Enter distance in those units:'};
	dialogTitle = 'Specify calibration information';
	numberOfLines = 1;
	def = {'microns', '500'};
	answer = inputdlg(userPrompt, dialogTitle, numberOfLines, def);
	if isempty(answer)
		return;
	end
    
	calibration.units = answer{1};
	calibration.distanceInPixels = distanceInPixels;
	calibration.distanceInUnits = str2double(answer{2});
	calibration.distancePerPixel = calibration.distanceInUnits / distanceInPixels;
	success = true;
	
	message = sprintf('The distance you drew is %.2f pixels = %f %s.\nThe number of %s per pixel is %f.\nThe number of pixels per %s is %f',...
		distanceInPixels, calibration.distanceInUnits, calibration.units, ...
		calibration.units, calibration.distancePerPixel, ...
		calibration.units, 1/calibration.distancePerPixel);
	uiwait(msgbox(message));
    
    
    %------------
%Drawing
distanceInRealUnits_centroid = s.Centroid.* calibration.distancePerPixel;
distanceInRealUnitsx = distanceInRealUnits_centroid (1);
distanceInRealUnitsy = distanceInRealUnits_centroid (2);

centroide_unidadesreales_en_la_escalaEscrita = [distanceInRealUnitsx distanceInRealUnitsy];
