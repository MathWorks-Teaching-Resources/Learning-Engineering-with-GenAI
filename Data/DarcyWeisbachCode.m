%[text] [⇦ Return to IntroToCopilot.m](file:../Scripts/IntroToCopilot.m:M_7e96)
function [D, info] = solveDiameterNR(Q, L, rho, mu, epsA, dp_target, D0)
% solveDiameterNR Solve for pipe diameter using Darcy-Weisbach + Newton-Raphson
% Inputs:
%   Q         - volumetric flow (m^3/s)
%   L         - pipe length (m)
%   rho       - fluid density (kg/m^3)
%   mu        - dynamic viscosity (Pa·s)
%   epsA       - absolute roughness (m)
%   dp_target - target pressure loss (Pa)
%   D0        - initial diameter guess (m), use 2
% Outputs:
%   D     - solved diameter (m)
%   info  - struct with iterations, residual, converged flag

maxit = 100;
tol = 1e-6;
D = D0;
relstep_max = 0.5;
h_fd = 1e-6; % finite difference step (m)

for k = 1:maxit
    % compute g(D) = dp(D) - dp_target
    g = dp_of_D(D,Q,L,rho,mu,epsA) - dp_target;
    if abs(g) < tol
        converged = true;
        break
    end
    % finite-difference derivative
    Dp = D + h_fd;
    gp = dp_of_D(Dp,Q,L,rho,mu,epsA) - dp_target;
    gprime = (gp - g) / (Dp - D);
    if gprime == 0
        converged = false;
        break
    end
    % NR update with step control
    delta = - g / gprime;
    % limit relative step
    delta = max(min(delta, relstep_max*D), -relstep_max*D);
    D = D + delta;
    % enforce positive diameter
    if D <= 0
        D = h_fd;
    end
    converged = false;
end

info.iterations = k;
info.residual = g;
info.converged = converged;

if ~converged
    warning('Newton-Raphson did not converge in %d iterations, last residual = %g', k, g);
end
end

function dp = dp_of_D(D,Q,L,rho,mu,epsA)
% compute pressure loss for given D with Swamee-Jain friction factor
A = pi*D^2/4;
V = Q ./ A;
Re = rho .* V .* D ./ mu;
% protect against very low Re
Re = max(Re, 1);
% Swamee-Jain (valid for turbulent, Re > ~5000)
f = 0.25 ./ ( log10( epsA./(3.7*D) + 5.74 ./ (Re.^0.9) ).^2 );
% fallback: laminar regime
laminar_mask = Re < 2000;
f(laminar_mask) = 64 ./ Re(laminar_mask);
dp = f .* (L ./ D) .* (rho .* V.^2 ./ 2);
end

% Run example for finding optimal pipe diameter
Q = 0.1;
L = 100;
rho = 1000;
mu = 1e-3;
epsA = 1.5e-5;
dp_target = 1e5;
D0 = 2;

[D, info] = solveDiameterNR(Q,L,rho,mu,epsA,dp_target,D0);
fprintf('D = %.6f m, iter = %d, residual = %.3g, converged = %d\n', D, info.iterations, info.residual, info.converged);
%[text] [⇦ Return to IntroToCopilot.m](file:../Scripts/IntroToCopilot.m:M_7e96)
%%
%[text] ## Help us Improve
%[text] [Share your feedback](<matlab: ShareFeedback>) to help us improve this module.

%[appendix]{"version":"1.0"}
%---
%[metadata:view]
%   data: {"layout":"inline","rightPanelPercent":40}
%---
