function [ a ] = signal_filtering( a, filter_n, filter_F3dB1, filter_F3dB2, f)
%SIGNAL_FILTERING Summary of this function goes here
%   Detailed explanation goes here

D = fdesign.bandpass('N,F3dB1,F3dB2', filter_n,  filter_F3dB1*1000, filter_F3dB2*1000, f);
% Hd = design(D, 'butter', 'matchexactly', 'passband');
Hd = design(D, 'butter');

size_of_data = size(a); % получаем размеры пачки сигналов
counter = size_of_data(2); % получаем количество сигналов
for i=1:counter
    a(:, i) =  filter(Hd, a(:, i));
end

end

