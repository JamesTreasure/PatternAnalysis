function map = alien(tester)


output = zeros(42,30);
for a = 1:42;
im = imread(sprintf('Images/AlienTraining/alien%1d.gif', a));
im = logical(im); %Convert the original intensity values into logical 1s and 0s
c = chainCode(im);
%% filter using the FT of the angles of the chaincode
angles = c(3,:)*(2*pi/8);
anglesFFT = fft(angles); %fast fourier transform

N = 30; %number of lowest frequencies to keep

filteredFFT = anglesFFT(1:N); % Apply the filter by scalar multipliacation
% feature vector
output(a,:) = abs(filteredFFT)/100;
end

im = imread(tester);
im = logical(im); %Convert the original intensity values into logical 1s and 0s
c = chainCode(im);
angles = c(3,:)*(2*pi/8);
anglesFFT = fft(angles); %fast fourier transform
N = 30; %number of lowest frequencies to keep
filteredFFT = anglesFFT(1:N); % Apply the filter by scalar multipliacation
training = abs(filteredFFT)/100;


themean = mean(output);
thecovariance = cov(output,1);


transposedMean = (themean)';
transposedTraining = (training)';



map = log(42/430) - 0.5*log(det(thecovariance)) - 0.5*((transposedTraining-transposedMean)'*(thecovariance^-1)*(transposedTraining-transposedMean))
