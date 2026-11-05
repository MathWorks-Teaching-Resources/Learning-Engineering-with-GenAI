%[text] # Instructor Resources Videos
%[text] 
%[text] The videos in this folder are for demo purposes and show how Ollama and the Mistral NeMo LLM can be integrated into MATLAB workflows. Here are some talking points for each video.
%[text] 
%[text] ## OllamaDemoPt1
%[text] The purpose of this demo is to show the interaction between Ollama and MATLAB after providing a prompt. The prompt asks to show the equation for solving a projectile motion problem.
%[text] The first part of the demonstration is setting a time out value for Ollama. If it does not provide a response within this limit, it will error. Since response time varies by machine, a slider was provided to allow a longer time out limit. The demo begins with a print out of the call to Ollama with a confirmation of the model being used and the value set for the time out limit in seconds. 
%[text] A response is provided in plain text for the equation and may not be portable into a MATLAB script. In addition, the time it took to execute the call to Ollama is printed out.
%[text] 
%[text] ## OllamaDemoPt2
%[text] This is a continuation to part 1. A new prompt is introduced that focuses on generating MATLAB code to solve a projectile motion problem. The prompt also asks to use functions from the symbolic toolbox.
%[text] A response is provided in plain text with a section dedicated to MATLAB code for solving the projectile motion problem. You can see the Symbolic toolbox is explicitly used in the code. This part of the code could be copied and pasted into another script and evaluated to see if it works as intended. In addition, the time it took to execute the call to Ollama is printed out.
%[text] 
%[text] ## OllamaExercise
%[text] The purpose of this exercise is to introduce the use of tools (or function calls) with an LLM. In this exercise, a tool is defined for plotting a given dataset. The tool is defined and then passed to Ollama as a resource to use. The LLM (Mistral-NeMo), then decides whether or not to use the available tool given the prompt that is provided.
%[text] This exercise starts with defining a task to be performed. A dataset is then provided that includes information labeled as X and Y. The user is then requested to enter a prompt to achieve the task. Last, the prompt can be executed to see how the LLM responds. If successful, you will see a plot of the X and Y data. If not, you will see a note that the LLM did not call the tool and then provide a response that may include request for additional information from the user.
%[text] You can view the tools (or function calls) used in this exercise by making the code visible ![](text:image:34d2) in the script. 
%[text] 
%[text] ## OllamaReflection
%[text] The purpose of this reflection is to utilize the same prompt from the exercise, but without the tool calling. The supplied sample code is provided for the user to try out in another script. Upon trying it, they should see that the LLM provides a different result without access to the tool.
%[text] The main point to remember is that LLMs excel at generating text from patterns, but they do not inherently solve mathematical problems without additional support. This support tends to be in the form of tool or function calling through APIs.


%%
%[text] ## Help us Improve
%[text] [Share your feedback](<matlab: ShareFeedback>) to help us improve this module.

%[appendix]{"version":"1.0"}
%---
%[metadata:view]
%   data: {"layout":"hidecode","rightPanelPercent":40}
%---
%[text:image:34d2]
%   data: {"align":"baseline","height":28,"src":"data:image\/png;base64,iVBORw0KGgoAAAANSUhEUgAAAB8AAAAcCAYAAACZOmSXAAABIGlDQ1BzUkdCAAAYlWNgYHzAAAQsDgwMuXklRUHuTgoRkVEKDEggMbm4gAEv+HaNgRFEX9YNLGHjwK8WA3AVAS0E0n+AWCQdzGYUALGTIGwVELu8pKAEyLYAsZMLikBsHyBbKTkjMQXIBrlPpygkyBnIngNkK6QjsZOQ2CmpxclA9h4gWwXhz\/z5DAwWXxgYmCcixJKmMTBsb2dgkLiDEFNZyMDA38rAsO0yQuyzP9jvjGKHcnNKk6F+AonwpOaFBgNpNiCWYfBj0GdwZGAoTjM2gqjgcWBgYL37\/\/9nLQYG9kkMDH\/7\/\/\/\/vej\/\/7+Lge64xcBwoL0gsSgRrJYZiJnS0hgYPi1nYOCNZGAQvgAMtmgc9nGA7StmCGJwZ3ACAHaFTnIw7xNCAAAACXBIWXMAAA7DAAAOwwHHb6hkAAAA5UlEQVRIie2XwQmDMBSG\/0jv7tAeSofIBkIgF8coOIjQBbx7eRBwA4coPdQtvKonwQZTUxNiS\/1uiTGf74enhrVt22MjDqYLZVkijmNUVeUs4ZwjTVN7eV3XKIoCUkpnORHNzkfOO1tgSs9Y+ZTb+fQyvj6e7k9kK\/cl0wkSuwmrykeUUlBKAQCEEBBChJP7EE75ndhHfMW\/Su4r\/u+P\/ZI36D78\/EQMuGdHd3nXA7l8v5FORs3imk1j3+W7PChWrRYxu9bR7\/EiX3pZrCVI7EmSzM4bK+ecg4i8\/TrPwbY8NPxvqw1\/kUAJfbI4dAAAAABJRU5ErkJggg==","width":31}
%---
