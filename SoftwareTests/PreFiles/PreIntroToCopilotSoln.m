%  Pre-run script for IntroToCopilotSoln.mlx
% ---- Known Issues     -----
KnownIssuesID = "MATLAB:Editor:Document:NotAvailable";
% ---- Pre-run commands -----
 
curloc = "N/A";
rootdir = pwd;


open = @(str)MyOpen(str)

function MyOpen(str)
assert(exist(str,"file"))
disp("Opening the file" + str)
end