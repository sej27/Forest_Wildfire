%% Spectrogram Audio Signal Analyzing Testing
clear
fireDir = 'fire_sounds/*.mp3';
fireFolder = 'fire_sounds/';
forestDir = 'forest_sounds/*.mp3';
forestFolder = 'forest_sounds/';

csvDir = 'CSV_files/';

%% Spectrograms, Frequency Domain and Time Domains of All Fire Audio Files
files = dir(fireDir);
N = length(files);
count = 1;
for i = 1:N
    name = files(i).name;
    fileDir = [fireFolder name];
    [y,Fs] = audioread(fileDir);
    y = y(:);
    figure(count);
    count = count + 1;
    %eval(['Fire' num2str(i) '= y']);
    %Spectrogram
    subplot(1,3,1);
    spectrogram(y)
    title(name,'Interpreter', 'none');
    
    %Frequency Domain
    % Question - Do we only care about the positive values in this given
    % that they are duplicated on the negative side
    yFFT = fftshift(fft(y));
    nfft = length(yFFT);
    dF = Fs/nfft;
    %x = Fs./2.*[-1:2./nfft:1-2./nfft];
    x = -Fs/2:dF:Fs/2-dF;
    subplot(1,3,2);
    plot(x,abs(yFFT));
    title(name,'Interpreter', 'none');
    xlabel('Frequency (Hz)');
    ylabel('Magnitude');
    
    %fileNameLength = length(name);
    %fileName = name(1 : (fileNameLength - 4));
    
    % Write Frequency Domain Values to CSV file
    
    %csv_file = [csvDir fileName '_frequency.csv'];
    %csvwrite(csv_file,[x' abs(yFFT)]);

    % csv_file = [csvDir fileName '_frequency.csv'];
    % csvwrite(csv_file,[x' abs(yFFT)]);
    
    %Time Domain
    x = 0:length(y)-1;
    subplot(1,3,3);
    plot(x,y);
    xlabel('Samples');
    ylabel('Magnitude');
    title(name,'Interpreter', 'none');
end

%% Spectrograms, Frequency Domain and Time Domains of All Forest Audio Files
files = dir(forestDir);
N = length(files);
for i = 1:N
    name = files(i).name;
    fileDir = [forestFolder name];
    [y,Fs] = audioread(fileDir);
    y = y(:);
    figure(count);
    count = count+1;
    
    %Spectrogram
    subplot(1,3,1);
    spectrogram(y)
    title(name,'Interpreter', 'none');
    
    %Frequency Domain
    yFFT = fftshift(fft(y));
    nfft = length(yFFT);
    dF = Fs/nfft;
    %x = Fs./2.*[-1:2./nfft:1-2./nfft];
    x = -Fs/2:dF:Fs/2-dF;
    subplot(1,3,2);
    plot(x,abs(yFFT));
    title(name,'Interpreter', 'none');
    xlabel('Frequency (Hz)');
    ylabel('Magnitude');
    
    %Time Domain
    x = 0:length(y)-1;
    subplot(1,3,3);
    plot(x,y);
    xlabel('Samples');
    ylabel('Magnitude');
    title(name,'Interpreter', 'none');
end

