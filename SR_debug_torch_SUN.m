clear;
clc;
close all;

addpath('./index');
addpath('./faceNormalGroup');

%% SpherePHD parameter �ҷ�����
% ������ faceNormalGroupN�� �ҷ����� �����ؾ��Ѵ�. 9���� �����ð��� �ʹ� ���� �ɸ�����.
load 'faceNormalGroup7';
normalVector7 = transpose(faceNormalGroup7);
% RGB�� ���� �� �ε����� �µ��� ������ ����� ���� indexN�� �ҷ��;� �Ѵ�.
load 'sortingIndex7';
sortingIndex7 = transpose(sortingIndex);
 %% �ε����� ������� �Ѵ�!
numberOfPixel = size(normalVector7,1)/20;
for j = 1:20
    tmpSectionPixels = normalVector7(1+(j-1)*numberOfPixel:(j)*numberOfPixel,:);
    normalVector7(1+(j-1)*numberOfPixel:(j)*numberOfPixel,:) = tmpSectionPixels(sortingIndex7,:);
end

load 'faceNormalGroup6';
normalVector6 = transpose(faceNormalGroup6);
load 'sortingIndex6';
sortingIndex6 = transpose(sortingIndex);% faceNormalGroup1 �� ������ sortedIndex
 %% �ε����� ������� �Ѵ�!
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

    %% ����ƮŬ���� ����
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
        
                %% ����ƮŬ���� ����
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
        
        %% ����ƮŬ���� ����
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
