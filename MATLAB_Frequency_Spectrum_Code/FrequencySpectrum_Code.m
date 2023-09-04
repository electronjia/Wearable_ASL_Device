load F0000CH1.csv
%%
y=F0000CH1;
plot(y)

title("38 kHz Wafeform Generator using 555 Timer")
xlabel("3V input")
ylabel("Square Waveform Output")

freq=meanfreq(y)
%%
ft=fftshift(abs(fft(y)))
figure
time=linspace(0,2500/38000,length(ft))
plot(time,ft)

% Find local maxima
peak = islocalmax(ft,'MaxNumExtrema',1,'SamplePoints',time);

idx=find(peak==1)

peakk=time(idx(1))

frequency=1/peakk;

title("Frequency Spectrum of obtained signal")
xlabel('Time fs=38 kHz')
ylabel("Amplitude")