function [data, output] = createData(file,limit,n_images)
    r = randperm(limit,n_images)
    for i=1:n_images
        i
        currentfilename = strcat('images/',file.textdata{r(i)},'.jpg')
        image = double(imread(currentfilename));
        image = imresize(image, [25 50]); 
        image = image / 255;
        img_vector = image(:);
        size_vector = size(img_vector);
        for j=1:size_vector
            data(i,j) = img_vector(j);
        end
        output(i) = file.data(r(i),2)-1;
    end
end