function map = star(tester)
frequenciesToKeep = 7;

output = zeros(35,frequenciesToKeep);
for a = 1:35;
im = imread(sprintf('Images/StarTraining/Star%1d.gif', a));
im = logical(im); %Convert the original intensity values into logical 1s and 0s
c = chainCode(im);
%% filter using the FT of the angles of the chaincode
angles = c(3,:)*(2*pi/8);
anglesFFT = fft(angles); %fast fourier transform
filteredFFT = anglesFFT(1:frequenciesToKeep); % Apply the filter by scalar multipliacation
% feature vector
output(a,:) = abs(filteredFFT)/100;
end

im = imread(tester);
im = logical(im); %Convert the original intensity values into logical 1s and 0s
c = chainCode(im);
angles = c(3,:)*(2*pi/8);
anglesFFT = fft(angles); %fast fourier transform
filteredFFT = anglesFFT(1:frequenciesToKeep); % Apply the filter by scalar multipliacation
training = abs(filteredFFT)/100;

themean = mean(output);
thecovariance = cov(output,1);
transposedMean = (themean)';
transposedTraining = (training)';

map = log(35/227) - 0.5*log(det(thecovariance)) - 0.5*((transposedTraining-transposedMean)'*(thecovariance^-1)*(transposedTraining-transposedMean));
