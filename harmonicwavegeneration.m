% Harmonic Wave Generation in MATLAB

% Parameters
fs = 1000;         % Sampling frequency (Hz)
T = 1;             % Duration (seconds)
t = 0:1/fs:T;     % Time vector

% Sine wave parameters (frequency and amplitude for each harmonic)
frequencies = [5, 10, 15];   % Frequencies (Hz)
amplitudes = [1, 0.5, 0.25];  % Amplitudes

% Initialize the combined wave
combined_wave = zeros(size(t));

% Generate the harmonic wave
for i = 1:length(frequencies)
    combined_wave = combined_wave + amplitudes(i) * sin(2 * pi * frequencies(i) * t);
end

% Plotting the individual waves
figure;
subplot(2, 1, 1);
hold on;
for i = 1:length(frequencies)
    y = amplitudes(i) * sin(2 * pi * frequencies(i) * t);
    plot(t, y, 'DisplayName', sprintf('Frequency: %d Hz, Amplitude: %.2f', frequencies(i), amplitudes(i)));
end
title('Individual Harmonics');
xlabel('Time (s)');
ylabel('Amplitude');
legend show;
grid on;

% Plotting the combined wave
subplot(2, 1, 2);
plot(t, combined_wave, 'r', 'LineWidth', 1.5);
title('Combined Waveform');
xlabel('Time (s)');
ylabel('Amplitude');
grid on;

% Additional settings for better visualization
xlim([0 T]);
ylim([-max(amplitudes)-0.5 max(amplitudes)+0.5]);
