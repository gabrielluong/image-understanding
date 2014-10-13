im_test = imreadbw('../test.png');
im_reference = imreadbw('../reference.png');

[testFrames, testDescr] = sift(im_test);
[refFrames, refDescr] = sift(im_reference);

figure; imshow(im_test);
hold on;
h = plotsiftframe(testFrames); set(h, 'LineWidth', 1, 'Color', 'g');

figure; imshow(im_test);
hold on;
h = plotsiftdescriptor(testDescr); set(h, 'LineWidth', 1, 'Color', 'g');
% 
% figure; imshow(im_reference);
% hold on;
% h = plotsiftframe(refFrames(:,1:100)); set(h, 'LineWidth', 1, 'Color', 'g');

% Compare the Euclidean distances of all descriptor pairs
% result = [];
% threshold = 0.3;
% for i = 1:size(testDescr, 2)
%     minDist1 = inf; % closest match
%     minDist2 = inf; % second closest match
%     minIndex = 0;
%     for j = 1:size(refDescr, 2)
%         testDescriptor = testDescr(:,i);
%         refDescriptor = refDescr(:,j);
%         dist = dist2(testDescriptor, refDescriptor);
%         
%         if dist < minDist1
%             minDist2 = minDist1;
%             minDist1 = dist;
%             minIndex = j;
%         end
%     end
%     
%     ratio = minDist1 / minDist2;
%     if ratio > threshold
%         result = [result ; [i j ratio]];
%     end
% end
% 
% result = sortrows(result, 3);
% correspondences = result(1:3, :);
% plotsiftdescriptor
