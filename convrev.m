clear;clc;

%import audio file
[in,Fs] = audioread('guitar-single-note-d_120bpm_C_minor.wav');
mono_audio = mean(in, 2)
audiowrite('guitarmono_audio_file.wav', mono_audio, Fs)
b = audioread('guitarmono_audio_file.wav')
%import IR
[y, Fs] = audioread ('room_impulse_response.wav');
mono_audio = mean(y, 2)
audiowrite('irmono_audio_file.wav', mono_audio, Fs)

h = audioread('irmono_audio_file.wav')

out = conv(b,h)

sound(out,Fs)











