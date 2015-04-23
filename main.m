clear;
close all;

tic

confusionMatrix = zeros(4);

imageDirectory = ('Images/OtherTest');
filePattern = fullfile(imageDirectory, '*.gif');
files = dir(filePattern);
for k = 1:length(files)
    baseFileName = files(k).name;
    fullFileName = fullfile(imageDirectory, baseFileName);

    tester = fullFileName;
    
    theAlien = alien(tester);
    theButterfly = butterfly(tester);
    theFace = face(tester);
    theStar = star(tester);

    currentMax = theAlien;
    currentBiggest = 'Alien';

    if theButterfly > currentMax
        currentMax = theButterfly;
        currentBiggest = 'Butterfly';
    elseif theFace > currentMax
        currentMax = theFace;
        currentBiggest = 'Face';
    elseif theStar > currentMax;
        currentMax = theStar;
        currentBiggest = 'Star';
    end

    %fprintf('Alien is %d\n', theAlien); 
    %fprintf('Butterfly is %d\n', theButterfly); 
    %fprintf('Face is %d\n', theFace); 
    %fprintf('Star is %d\n', theStar); 

    fprintf('The image is %s.\n',currentBiggest);

    [pathstr,name,ext] = fileparts(tester);

    if name(1:1) == 'A' && currentBiggest(1:1) == 'A'
        confusionMatrix(1,1) = confusionMatrix(1,1) + 1; 
    elseif name(1:1) == 'A' && currentBiggest(1:1) == 'B'
        confusionMatrix(1,2) = confusionMatrix(1,2) + 1;
    elseif name(1:1) == 'A' && currentBiggest(1:1) == 'F'
        confusionMatrix(1,3) = confusionMatrix(1,3) + 1;
    elseif name(1:1) == 'A' && currentBiggest(1:1) == 'S'
        confusionMatrix(1,4) = confusionMatrix(1,4) + 1;
    elseif name(1:1) == 'B' && currentBiggest(1:1) == 'A'
        confusionMatrix(2,1) = confusionMatrix(2,1) + 1;
    elseif name(1:1) == 'B' && currentBiggest(1:1) == 'B'
        confusionMatrix(2,2) = confusionMatrix(2,2) + 1;
    elseif name(1:1) == 'B' && currentBiggest(1:1) == 'F'
        confusionMatrix(2,3) = confusionMatrix(2,3) + 1;
    elseif name(1:1) == 'B' && currentBiggest(1:1) == 'S'
        confusionMatrix(2,4) = confusionMatrix(2,4) + 1;
    elseif name(1:1) == 'F' && currentBiggest(1:1) == 'A'
        confusionMatrix(3,1) = confusionMatrix(3,1) + 1;
    elseif name(1:1) == 'F' && currentBiggest(1:1) == 'B'
        confusionMatrix(3,2) = confusionMatrix(3,2) + 1;
    elseif name(1:1) == 'F' && currentBiggest(1:1) == 'F'
        confusionMatrix(3,3) = confusionMatrix(3,3) + 1;
    elseif name(1:1) == 'F' && currentBiggest(1:1) == 'S'
        confusionMatrix(3,4) = confusionMatrix(3,4) + 1;    
    elseif name(1:1) == 'S' && currentBiggest(1:1) == 'A'
        confusionMatrix(4,1) = confusionMatrix(4,1) + 1;
    elseif name(1:1) == 'S' && currentBiggest(1:1) == 'B'
        confusionMatrix(4,2) = confusionMatrix(4,2) + 1;
    elseif name(1:1) == 'S' && currentBiggest(1:1) == 'F'
        confusionMatrix(4,3) = confusionMatrix(4,3) + 1;
    elseif name(1:1) == 'S' && currentBiggest(1:1) == 'S'
        confusionMatrix(4,4) = confusionMatrix(4,4) + 1;
    end

end

printmat(confusionMatrix, 'Confusion Matrix', 'Alien Butterfly Face Star', 'Alien Butterfly Face Star')
correct = confusionMatrix(1,1) + confusionMatrix(2,2) + confusionMatrix(3,3) + confusionMatrix(4,4);
incorrect = sum(confusionMatrix(:)) - correct;
display(correct)
display(incorrect)

toc