function display_obj(obj)
%
% function display_obj(obj,texture)
%
% displays an obj structure with texture
%
% INPUTS:  obj:     object data
%                   - obj.v:    vertices
%                   - obj.vt:   texture coordinates
%                   - obj.f.v:  face definition vertices
%                   - obj.f.vt: face definition texture
%
%       : texture -  texture image full path
%
% Author: Bernard Abayowa
% University of Dayton
% 6/16/08
%texture = imread(texture);
%texture_img = flipdim(texture,1);
%[sy sx sz] = size(texture_img);
%texture_img =  reshape(texture_img,sy*sx,sz);
% make image 3D if grayscale
%if sz == 1
%    texture_img = repmat(texture_img,1,3);
%end
% select what texture correspond to each vertex according to face
% definition
%[vertex_idx fv_idx] = unique(obj.f.v);
%texture_idx = obj.f.vt(fv_idx);
%x = abs(round(obj.vt(:,1)*(sx-1)))+1;
%y = abs(round(obj.vt(:,2)*(sy-1)))+1;
%xy = sub2ind([sy sx],y,x);
%texture_pts = xy(texture_idx);
%tval = double(texture_img(texture_pts,:))/255;
sz = size(obj.v);
tval = zeros(sz);
tval(451, 3) = 1;
tval(48, 3) = 2;
tval(1078, 3) = 3;
tval(1101, 3) = 4;
tval(1750, 3) = 5;
% display object
figure;
p = patch('vertices',obj.v,'faces',obj.f.v,'FaceVertexCData', tval);
shading interp
colormap gray(256);
lighting phong;
camproj('perspective');
axis square; 
axis off;
axis equal
axis tight;
cameramenu;
u = 1;
for colonne = u:u+1
   pause(0.1);
    delete(p);
    tval(colonne,1) = colonne/500;
    disp(colonne);
    p = patch('vertices',obj.v,'faces',obj.f.v,'FaceVertexCData', tval);
    shading interp
    colormap gray(256);
end

%tval(100, 1) = val2;
%tval(200, 1) = val3;
%tval(300, 1) = val4;
%tval(400, 1) = val5;
end