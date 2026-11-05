%[text] [⇦ Return to CopilotForLearners.m](file:../Scripts/CopilotForLearners.m:M_4df9)
% Mesh Analysis using Kirchhoff's Laws
Rmat = [1320 -220   0;
    -220  231  -1;
    0   -1  201];
V = [12; 0; 3];

I = Rmat \ V;   % [i1; i2; i3] in A

i1 = I(1);
i2 = I(2);
i3 = I(3);

fprintf('i1 = %.6f A\n', i1);
fprintf('i2 = %.6f A\n', i2);
fprintf('i3 = %.6f A\n', i3);
%[text] [⇦ Return to CopilotForLearners.m](file:../Scripts/CopilotForLearners.m:M_4df9)
%%
%[text] ## Help us Improve
%[text] [Share your feedback](<matlab: ShareFeedback>) to help us improve this module.

%[appendix]{"version":"1.0"}
%---
%[metadata:view]
%   data: {"layout":"onright","rightPanelPercent":40}
%---
