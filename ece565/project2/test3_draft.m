github_img_host = 'https://github.com/yuanoook/thruple/raw/master/ece565/project2/';

circular_stroke = imread([github_img_host 'circular_stroke.tif']);

size(circular_stroke)
imshow(circular_stroke);

circular_stroke_smooth = smoothimage(circular_stroke, 9);
imshow(circular_stroke_smooth, []);

circular_stroke_smooth_otsu = otsu_global_thresholding(circular_stroke_smooth);
imshow(circular_stroke_smooth_otsu, []);

% Get outer boundaries
B = bwboundaries(circular_stroke_smooth_otsu, 'noholes');
outerb = cell2mat(B(1));
outerb_img = bound2im(outerb, 570, 570);
imshow(outerb_img, []);

[s, sUnit] = bsubsamp(outerb, 50)

outerb_polygon = connectpoly(s(:, 1), s(:, 2));
outerb_polygon_img = bound2im(outerb_polygon, 570, 570);
imshow(outerb_polygon_img, []);

fchcode(sUnit, 8)
% mat2str(fchc.fcc')      '[2 2 2 2 0 2 2 0 2 0 0 0 0 6 0 6 6 6 6 6 6 6 6 4 4 4 4 4 4 2 4 2]'
% mat2str(fchc.diff')     '[0 0 0 0 6 2 0 6 2 6 0 0 0 6 2 6 0 0 0 0 0 0 0 6 0 0 0 0 0 6 2 6]'
% mat2str(fchc.mm')       '[0 0 0 0 6 0 6 6 6 6 6 6 6 6 4 4 4 4 4 4 2 4 2 2 2 2 2 0 2 2 0 2]'
% mat2str(fchc.diffmm')   '[6 0 0 0 6 2 6 0 0 0 0 0 0 0 6 0 0 0 0 0 6 2 6 0 0 0 0 6 2 0 6 2]'
% mat2str(fchc.x0y0)      '[2 6]'

fchcode(sUnit, 4)
% mat2str(fchc.fcc')      '[1 1 1 1 0 1 1 0 1 0 0 0 0 3 0 3 3 3 3 3 3 3 3 2 2 2 2 2 2 1 2 1]'
% mat2str(fchc.diff')     '[0 0 0 0 3 1 0 3 1 3 0 0 0 3 1 3 0 0 0 0 0 0 0 3 0 0 0 0 0 3 1 3]'
% mat2str(fchc.mm')       '[0 0 0 0 3 0 3 3 3 3 3 3 3 3 2 2 2 2 2 2 1 2 1 1 1 1 1 0 1 1 0 1]'
% mat2str(fchc.diffmm')   '[3 0 0 0 3 1 3 0 0 0 0 0 0 0 3 0 0 0 0 0 3 1 3 0 0 0 0 3 1 0 3 1]'
% mat2str(fchc.x0y0)      '[2 6]'
