clear;
close all;

correct = 0;
incorrect = 0;

imageDirectory = ('Images/AllTest');
filePattern = fullfile(imageDirectory, '*.gif');
files = dir(filePattern);
for k = 1:length(files)
    baseFileName = files(k).name;
    fullFileName = fullfile(imageDirectory, baseFileName);

    tester = fullFileName;
    %do some stuff
    
    %tester = ('Images/AllTest/Butterfly70.gif');

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

    fprintf('Alien is %d\n', theAlien); 
    fprintf('Butterfly is %d\n', theButterfly); 
    fprintf('Face is %d\n', theFace); 
    fprintf('Star is %d\n', theStar); 

    fprintf('The image is %s.\n',currentBiggest);

    [pathstr,name,ext] = fileparts(tester);

    if name(1:1) == currentBiggest(1:1)
        fprintf('This is correct!');
        correct = correct + 1;
    else
        fprintf('This is incorrect.');
        incorrect = incorrect + 1;
    end

end

display(correct)
display(incorrect)