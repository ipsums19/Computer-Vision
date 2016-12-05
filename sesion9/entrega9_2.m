images = [string('queen.png'), string('king.png'), string('bishop.png'), string('rook.png'), string('knight.png'), string('pawn.png')];
results = ones(6,2);
labels = [];
for i = 1:6
    I = rgb2gray(imread(char(images(i))));
    %filtrar
    BW = I > 128;
    SE = strel('disk', 5);
    BW = imopen(BW, SE);
    BW = ~BW;
    CC = bwconncomp(BW);
    Props = regionprops(CC, 'Area', 'Extent', 'Eccentricity', 'Solidity',  'Perimeter');
    X = cell2mat(struct2cell(Props))';
    X = [X(2:4) X(5)^2/X(1)];
    [Y, scores] = predict(f, X);
    scores = sort(scores);
    results(i, 1) = scores(6);
    results(i, 2) = scores(5);
    labels = [labels; Y];
end

suma = sum(results);
diferencia = suma(1) - suma(2)


