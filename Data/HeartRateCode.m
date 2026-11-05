%[text] [⇦ Return to CopilotForLearners.m](file:../Scripts/CopilotForLearners.m:M_148a)
%%\ Simulated heart rate data

% Time (minutes)
t = linspace(0,30,300);

% Underlying heart rate trend
hrTrend = 75 + 70*(1 - exp(-t/8));

% Simulated physiological variation
hrVariation = 4*sin(0.8*t) + 2*sin(3*t);

% Measurement noise
noise = 50*randn(size(t));

% Recorded heart rate
heartRate = hrTrend + hrVariation + noise;

% Plot trend line
figure
plot(t,heartRate,'.-','MarkerSize',8)
hold on
plot(t,hrTrend,'k','LineWidth',2)

xlabel('Time (min)')
ylabel('Heart Rate (bpm)')
title('Exercise Heart Rate Measurements')
legend('Measured Heart Rate','Underlying Trend',"Location","southeast")
grid on
%[text] [⇦ Return to CopilotForLearners.m](file:../Scripts/CopilotForLearners.m:M_148a)
%%
%[text] ## Help us Improve
%[text] [Share your feedback](<matlab: ShareFeedback>) to help us improve this module.

%[appendix]{"version":"1.0"}
%---
%[metadata:view]
%   data: {"layout":"onright","rightPanelPercent":40}
%---
