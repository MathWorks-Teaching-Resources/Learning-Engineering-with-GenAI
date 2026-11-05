%[text] [⇦ Return to IntroToCopilot.m](file:../Scripts/IntroToCopilot.m:M_3c9c)
% Example demonstrating Nyquist sampling theorem in a real-life scenario:
% Audio recording of speech. We simulate an analog speech-like signal,
% show aliasing when undersampled, and show correct reconstruction when
% sampled above the Nyquist rate.

fs_analog = 20000;            % high-resolution "analog" sampling (Hz)
t = 0:1/fs_analog:0.5;        % 0.5 second duration

% Construct a synthetic speech-like signal: combination of low-frequency
% components (fundamental and formants) and higher-frequency noise
f0 = 120; % fundamental frequency ~120 Hz (male voice)
signal = 0.8*sin(2*pi*f0*t) + 0.5*sin(2*pi*800*t) + 0.3*sin(2*pi*2500*t);
signal = signal + 0.05*randn(size(t));  % small broadband noise

% Define sampling rates for demonstration
fs_high = 8000;    % above Nyquist for highest speech component (2.5 kHz)
fs_low  = 3000;    % close to Nyquist border (may alias components >1.5 kHz)
fs_undersamp = 2000;% below Nyquist for 2.5 kHz component -> clear aliasing

% Function to downsample (ideal sampling) and optionally reconstruct with lowpass filter
downsample_and_reconstruct = @(fs_samp) ...
    struct(...
    'fs', fs_samp, ...
    't_samp', 0:1/fs_samp:0.5, ...
    'x_samp', interp1(t, signal, 0:1/fs_samp:0.5, 'linear') ...
    );

d_high = downsample_and_reconstruct(fs_high);
d_low  = downsample_and_reconstruct(fs_low);
d_under= downsample_and_reconstruct(fs_undersamp);

% Design a simple reconstruction low-pass filter (idealized using FIR)
nyq_rec = fs_high/2; % use highest sampling to design filter for plotting
lpFilt = designfilt('lowpassfir','PassbandFrequency',3000,'StopbandFrequency',4000, ...
    'PassbandRipple',1,'StopbandAttenuation',60,'SampleRate',fs_analog);

% Reconstruct sampled signals by zero-order-hold interpolation (for plotting)
recon_high = interp1(d_high.t_samp, d_high.x_samp, t, 'previous');
recon_low  = interp1(d_low.t_samp, d_low.x_samp, t, 'previous');
recon_under= interp1(d_under.t_samp, d_under.x_samp, t, 'previous');

% Plot time-domain comparison (short segment)
segIdx = find(t<=0.03);
figure('Position',[100 100 900 600]);

subplot(4,1,1)
plot(t(segIdx), signal(segIdx))
title('Original (high-res "analog") signal — first 30 ms')
xlabel('Time (s)'); ylabel('Amplitude')

subplot(4,1,2)
stem(d_high.t_samp(d_high.t_samp<=0.03), d_high.x_samp(d_high.t_samp<=0.03), 'filled')
hold on
plot(t(segIdx), recon_high(segIdx),'r')
hold off
title(sprintf('Sampled at %d Hz (above Nyquist for speech). Reconstruction (ZOH) in red', fs_high))
xlabel('Time (s)'); ylabel('Amplitude')

subplot(4,1,3)
stem(d_low.t_samp(d_low.t_samp<=0.03), d_low.x_samp(d_low.t_samp<=0.03), 'filled')
hold on
plot(t(segIdx), recon_low(segIdx),'r')
hold off
title(sprintf('Sampled at %d Hz (near Nyquist). Some high components may be lost/aliased', fs_low))
xlabel('Time (s)'); ylabel('Amplitude')

subplot(4,1,4)
stem(d_under.t_samp(d_under.t_samp<=0.03), d_under.x_samp(d_under.t_samp<=0.03), 'filled')
hold on
plot(t(segIdx), recon_under(segIdx),'r')
hold off
title(sprintf('Sampled at %d Hz (below Nyquist) — aliasing visible', fs_undersamp))
xlabel('Time (s)'); ylabel('Amplitude')

% Frequency-domain comparison
nfft = 2^14;
X_orig = abs(fft(signal, nfft));
f = (0:nfft-1)/nfft*fs_analog;

figure('Position',[150 150 900 400]);
plot(f(1:nfft/2),20*log10(X_orig(1:nfft/2)/max(X_orig)))
xlim([0 6000])
ylim([-80 5])
xlabel('Frequency (Hz)')
ylabel('Magnitude (dB)')
title('Spectrum of original signal (shows components up to ~2.5 kHz)')

% Show explanation in command window
fprintf(['Real-life example: audio recording and playback.\n' ...
    'Speech contains energy up to a few kHz (e.g. formants around 800 Hz and 2.5 kHz).\n' ...
    'Nyquist theorem says sample rate must be > 2x highest signal frequency to avoid aliasing.\n' ...
    'Here: 8 kHz sampling safely preserves components up to 4 kHz; 2 kHz sampling aliases\n' ...
    'components above 1 kHz, causing distortion. This is why telephone audio uses 8 kHz\n' ...
    'sampling (4 kHz bandwidth) and high-quality audio uses 44.1 kHz or 48 kHz.\n']);
%[text] [⇦ Return to IntroToCopilot.m](file:../Scripts/IntroToCopilot.m:M_3c9c)
%%
%[text] ## Help us Improve
%[text] [Share your feedback](<matlab: ShareFeedback>) to help us improve this module.

%[appendix]{"version":"1.0"}
%---
%[metadata:view]
%   data: {"layout":"inline","rightPanelPercent":40}
%---
