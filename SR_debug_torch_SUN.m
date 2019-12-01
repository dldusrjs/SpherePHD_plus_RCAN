clear;
clc;
close all;

addpath('./index');
addpath('./faceNormalGroup');

%% SpherePHD parameter 불러오기
% 적절한 faceNormalGroupN을 불러오고 시작해야한다. 9번은 생성시간이 너무 오래 걸리더라.
load 'faceNormalGroup7';
normalVector7 = transpose(faceNormalGroup7);
% RGB맵 생성 후 인덱스에 맞도록 파일을 만들기 위해 indexN을 불러와야 한다.
load 'sortingIndex7';
sortingIndex7 = transpose(sortingIndex);
 %% 인덱스를 고쳐줘야 한다!
numberOfPixel = size(normalVector7,1)/20;
for j = 1:20
    tmpSectionPixels = normalVector7(1+(j-1)*numberOfPixel:(j)*numberOfPixel,:);
    normalVector7(1+(j-1)*numberOfPixel:(j)*numberOfPixel,:) = tmpSectionPixels(sortingIndex7,:);
end

load 'faceNormalGroup6';
normalVector6 = transpose(faceNormalGroup6);
load 'sortingIndex6';
sortingIndex6 = transpose(sortingIndex);% faceNormalGroup1 일 때에는 sortedIndex
 %% 인덱스를 고쳐줘야 한다!
numberOfPixel2 = size(normalVector6,1)/20;
for j = 1:20
    tmpSectionPixels = normalVector6(1+(j-1)*numberOfPixel2:(j)*numberOfPixel2,:);
    normalVector6(1+(j-1)*numberOfPixel2:(j)*numberOfPixel2,:) = tmpSectionPixels(sortingIndex6,:);
end

%% main
folder_name = './test_output_SUN_div6_new.mat';

test_output = load(folder_name);

I_div7 = test_output.Input;
I_div7 = I_div7';

I_div8 = test_output.Output;
I_div8 = squeeze(I_div8);
I_div8 = I_div8';

GT = test_output.gt;
GT = GT';

iteration = 1;

for data = 1:iteration

    %% 포인트클라우드 띄우기
        PC = pointCloud(normalVector7,'color',I_div8);
        close all;
        b_fig = figure('Name', 'back car view', 'pos',[10 0 600 600]);
        hold on
        pcshow(PC,'MarkerSize',20)
        view([90,20]);
        ax = gca;
        ax.LineWidth = 1.5;
        ax.XAxis.Color = 'r';
        ax.YAxis.Color = 'g';
        ax.ZAxis.Color = 'b';
        
        close all
        
                %% 포인트클라우드 띄우기
        PC = pointCloud(normalVector6,'color',I_div7);
        close all;
        b_fig = figure('Name', 'back car view', 'pos',[10 0 600 600]);
        hold on
        pcshow(PC,'MarkerSize',20)
        view([90,20]);
        ax = gca;
        ax.LineWidth = 1.5;
        ax.XAxis.Color = 'r';
        ax.YAxis.Color = 'g';
        ax.ZAxis.Color = 'b';
        
        close all
        
        %% 포인트클라우드 띄우기
        PC = pointCloud(normalVector7,'color',GT);
        close all;
        b_fig = figure('Name', 'back car view', 'pos',[10 0 600 600]);
        hold on
        pcshow(PC,'MarkerSize',20)
        view([90,20]);
        ax = gca;
        ax.LineWidth = 1.5;
        ax.XAxis.Color = 'r';
        ax.YAxis.Color = 'g';
        ax.ZAxis.Color = 'b';

    %% stop here

end
