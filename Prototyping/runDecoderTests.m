% Script to test the DTMF Decoder using the test data generated by 'generateTestData.m'
%clc
tic
disp('--------++++++-------');
disp('This WILL take a while');
disp('Starting with the -1dBm to 0dBm files');
results = 'Results:';
% filepaths to the different power folders
%
power1 = 'copy of Test Data/-1dBm to 0dBm/';
power2 = 'copy of Test Data/-3dBm to -1dBm/';
power3 = 'copy of Test Data/-10dBm to -3dBm/';
power4 = 'copy of Test Data/-27dBm to -10dBm/';

% power1 = 'Test Data/-1dBm to 0dBm/';
% power2 = 'Test Data/-3dBm to -1dBm/';
% power3 = 'Test Data/-10dBm to -3dBm/';
% power4 = 'Test Data/-27dBm to -10dBm/';


% decode first folder (power1)

folderDIR = dir(strcat(power1,'*.wav'));

parfor file = 1:numel(folderDIR) % for each .wav file inside the folder
    filename = strcat(power1,folderDIR(file).name);
    result = testDecoder(filename);
    results = char(results,result);
    if (file == floor(file/2))
        disp('Halfway through the first power range');
    end
end

disp('Testing the -3dBm to -1dBm');

folderDIR = dir(strcat(power2,'*.wav'));

parfor file = 1:numel(folderDIR) % for each .wav file inside the folder
    filename = strcat(power2,folderDIR(file).name);
    result = testDecoder(filename);
    results = char(results,result);
    if (file == floor(file/2))
        disp('Halfway through the second power range');
    end
end

disp('Testing the -10dBm to -3dBm');

folderDIR = dir(strcat(power3,'*.wav'));

parfor file = 1:numel(folderDIR) % for each .wav file inside the folder
    filename = strcat(power3,folderDIR(file).name);
    result = testDecoder(filename);
    results = char(results,result);
    if (file == floor(file/2))
        disp('Halfway through the third power range');
    end
end

disp('Testing the -27dBm to -10dBm');

folderDIR = dir(strcat(power4,'*.wav'));

parfor file = 1:numel(folderDIR) % for each .wav file inside the folder
    filename = strcat(power4,folderDIR(file).name);
    result = testDecoder(filename);
    results = char(results,result);
    if (file == floor(file/2))
        disp('Halfway through the forth power range');
    end
end

%disp(results);
% TODO print the success rate
success = 0;
for i = 2:size(results,1)
    if results(i) == '$'
        success = success + 1;
    end
end

rate = 100 * success/(size(results,1) - 1);
disp(strcat('Success rate is: ',num2str(rate,4),'%.'));
disp(strcat(num2str(size(results,1)-1), ' files were tested.'));
disp(strcat('elapsed time is: ', num2str(toc,2), 'seconds.'));
disp('--------++++++-------');
