clc;
clear;
close all;

% Define data
ranges = [1 30; 31 59; 60 63; 64 100; 101 130; 131 159; 160 200; 201 255];
fq = [2048, 2048, 2048, 2048, 819, 819, 3277, 3277];
pb = fq / sum(fq);

% Sort data
[pb, id] = sort(pb, 'descend');
ranges = ranges(id, :);

% Init encoding
cds = cell(1, length(pb));
cum_pb = cumsum(pb);

% Shannon-Fano encoding
for i = 1:length(pb)
    if i == 1
        cds{i} = '0';
    elseif i == length(pb)
        cds{i} = '1';
    else
        hsum = sum(pb) / 2;
        if cum_pb(i-1) < hsum && cum_pb(i) >= hsum
            cds{i} = '1';
        else
            cds{i} = '0';
        end
        if mod(i, 2) == 0
            cds{i} = strcat(cds{i-1}, '1');
        else
            cds{i} = strcat(cds{i-1}, '0');
        end
    end
end

% Display output
for i = 1:length(cds)
    fprintf('Range: %d-%d, Code: %s\n', ranges(i, 1), ranges(i, 2), cds{i});
end
