% read audio file
[audioData, SampleRate] = audioread('task1sig.wav');

% create a time and duration function
duration = length(audioData) / SampleRate;
time = linspace(0, duration, length(audioData));

% plot audio file x against y, time against amplitude
plot(time, audioData);

% axes labels and units
xlabel('Time (seconds)');
ylabel('Amplitude');

% title
title('Non filtered audio signal');

% Find the top 10 original magnitude values
[sortedValues, sortedIndices] = maxk(abs(audioData), 10);

% Display the top 10 magnitude values
disp('Top 10 Magnitude Values:');
disp(sortedValues);

% Convert the audio data to floating-point values
audioData_float = double(audioData); % Convert to double precision floating-point values

% Find the top 10 maximum magnitude values of the floating-point data
[sortedFloatValues, sortedFloatIndices] = maxk(abs(audioData_float), 10);

% Display the top 10 maximum magnitude values of the floating-point data
disp('Top 10 Maximum Magnitude Values (Float):');
disp(sortedFloatValues);

maxAbsValue = max(abs(audioData));

% Normalize the audio data
normalizedAudioData = audioData / maxAbsValue;

[sortedNormValues, sortedNormIndices] = maxk(abs(normalizedAudioData), 10);

% Display the top 10 maximum magnitude values of the normalized data
disp('Top 10 Maximum Magnitude Values (Normalized):');
disp(sortedNormValues);

combinedValues = [sortedValues, sortedFloatValues, sortedNormValues];

% Display the combined values in three columns
disp('Top 10 Maximum Magnitude Values:');
disp('Native Values Float Values Normalised Values');
disp(combinedValues);

%the Fast Fourier Transform (FFT) of the audio signal is assigned to
%fftData
fftData = fft(audioData);

% Create the frequency axis
nfft = length(fftData);
f = (0:nfft-1) * (SampleRate / nfft); % create indices for freq. bins, calc. freq. res. of each bin, freq values up to nyquist, overall creates axes

% Plot the magnitude spectrum
plot(f, abs(fftData));

% Labeling the axes and appropriate units
xlabel('Frequency (Hz)');
ylabel('Magnitude');

% Title
title('FFT-based Spectrum Diagram');

% Define filter parameters
Fs = 48000;             % Sampling Frequency
Fpass = 5000;           % Passband Frequency 
Fstop = 7500;           % Lower Stopband Frequency to remove noise above 7500 Hz
Dpass = 0.0575; % Passband Ripple 
Dstop = 0.0001;         % Stopband Attenuation 
dens = 16;              % Density Factor 

% Calculate the filter coefficients
[N, Fo, Ao, W] = firpmord([Fpass, Fstop]/(Fs/2), [1, 0], [Dpass, Dstop]);
b = firpm(N, Fo, Ao, W, {dens});

% Create the filter object
Hd = dfilt.dffir(b);


% Apply the filter to the audio data
filtered_audioData = filter(Hd, audioData);

% Plot the filtered audio data in the time domain
duration = length(filtered_audioData) / SampleRate;
time = linspace(0, duration, length(filtered_audioData));
plot(time, filtered_audioData);

figure;
subplot(2, 1, 1); % Making sure both graphs are shown

% Create a time vector
duration = length(audioData) / SampleRate;
time = linspace(0, duration, length(audioData));

% Plot audio file in the time domain
plot(time, audioData);

% Labeling the axes
xlabel('Time (seconds)');
ylabel('Amplitude');

% Title
title('Filtered Audio Data');


% Read audio file
[audioData, SampleRate] = audioread('task1sig.wav');


% Axes labels
xlabel('Time (seconds)');
ylabel('Amplitude');

% Title
title('non filtered audio');


% Play the original audio
sound(audioData, SampleRate);

% Pause to allow the original audio to finish
pause(length(audioData) / SampleRate);

% Play the filtered audio
sound(filtered_audioData, SampleRate);
