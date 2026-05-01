%  Pre-run script for GenAIFundamentals.mlx
% ---- Known Issues     -----
KnownIssuesID = "llms:mustBeMessagesOrTxt";
% ---- Pre-run commands -----

Chat = "N/A";
LLM_Response = "N/A";
% ollamaChat = @(x) disp("... Running Ollama "+x);
% generate = @(x) disp("... Running Ollama "+x);
% openAIFunction = @(x) disp("... Running Ollama "+x);
% addParameter = @(x) disp("... Running Ollama "+x);

NData = 50;
X = linspace(-5,5,NData)';
Y = X.^2;

Response.tool_calls.function.arguments.X = X;
Response.tool_calls.function.arguments.Y = Y;

Prompt = "Create a plot for the variables X and Y using MATLAB";
