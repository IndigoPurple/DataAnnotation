clear;
close all;
clc;
warning off;


listOfFiles = dir(['./*.jpg']);
for i = 1 : length(listOfFiles)
	fileName = listOfFiles(i).name;
	image_info = cutImg(fileName)
end








