%[text] [⇦ Return to CopilotForLearners.m](file:../Scripts/CopilotForLearners.m:M_0398)
% Monte Carlo for defective parts / detection
rng(0);                % for reproducibility
Ntrials = 1e5;         % number of Monte Carlo trials
nParts = 2000;         % parts shipped per month

% 1) Choose a defect-rate distribution. Example options:
%    - Beta(a,b) to model rates in (0,1) with flexible shape
%    - Normal with truncation (not below 0)
% Here: example Beta with mean ~0.02 (2% defect rate) as a starting point.
a = 2; b = 98;                         % adjust to your expected mean/variance
defectRates = betarnd(a,b,[Ntrials,1]);

% 2) Detection probability: uniform between 0.50 and 0.60
detectProb = 0.50 + (0.60-0.50).*rand(Ntrials,1);

% 3) Simulate true defective counts and detected counts
trueDefective = binornd(nParts, defectRates);    % true defective count each trial
detected = binornd(trueDefective, detectProb);   % how many are detected during inspection

% 4) Summaries
meanTrue = mean(trueDefective);
stdTrue  = std(trueDefective);
qTrue = quantile(trueDefective, [0.025 0.5 0.975]);

meanDetected = mean(detected);
stdDetected  = std(detected);
qDetected = quantile(detected, [0.025 0.5 0.975]);

fprintf('True defective per month: mean=%.2f, std=%.2f, 95%% CI=[%d, %d]\n',...
    meanTrue, stdTrue, qTrue(1), qTrue(3));
fprintf('Detected defective per month: mean=%.2f, std=%.2f, 95%% CI=[%d, %d]\n',...
    meanDetected, stdDetected, qDetected(1), qDetected(3));

% 5) Optional: plot histograms
figure;
subplot(2,1,1);
histogram(trueDefective, 'Normalization','probability');
xlabel('True defective count'); ylabel('Probability');
title('Distribution of True Defective Parts per Month');

subplot(2,1,2);
histogram(detected, 'Normalization','probability');
xlabel('Detected defective count'); ylabel('Probability');
title('Distribution of Detected Defective Parts per Month');
%[text] [⇦ Return to CopilotForLearners.m](file:../Scripts/CopilotForLearners.m:M_0398)
%%
%[text] ## Help us Improve
%[text] [Share your feedback](<matlab: ShareFeedback>) to help us improve this module.

%[appendix]{"version":"1.0"}
%---
%[metadata:view]
%   data: {"layout":"inline","rightPanelPercent":40}
%---
