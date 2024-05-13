[audioData, SampleRate] = audioread('task1sig.wav');

% Call the noisefilter function to obtain the filter object
Hd = noisefilter;

% Apply the filter to the audio data
filtered_audioData = filter(Hd, audioData);

% Plot the filtered audio data in the time domain
duration = length(filtered_audioData) / SampleRate;
time = linspace(0, duration, length(filtered_audioData));
plot(time, filtered_audioData);

% Labeling the axes
xlabel('Time (seconds)');
ylabel('Amplitude');

% Title
title('Non Filtered then Filtered Audio Data');

% Play the original audio
sound(audioData, SampleRate);

% Pause to allow the original audio to finish
pause(length(audioData) / SampleRate);

% Play the filtered audio
sound(filtered_audioData, SampleRate);