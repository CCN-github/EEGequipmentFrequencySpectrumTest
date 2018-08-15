%% Based on
% Analyzing Neural Time Series Data
% Matlab code for Chapter 16
% Mike X Cohen
%
% This code accompanies the book, titled "Analyzing Neural Time Series Data"
% (MIT Press). Using the code without following the book may lead to confusion,
% incorrect data analyses, and misinterpretations of results.
% Mike X Cohen assumes no responsibility for inappropriate or incorrect use of this code.

%% Adapted by Esther, 2018
% let the fun begin!

% Declare variables of the script
num_time        = 25000;                                    % 25.000 samples 
e               = 10;                                       % electrode to plot 
f1000           = 1000/num_time*(0:(floor(num_time/2)+2));  % all the frequencies for the 1000 Hz recording
f1024           = 1024/num_time*(0:(floor(num_time/2)+2));  % all the frequencies for the 1024 Hz recording
start           = 100;                                      % start at approximately 4 Hz

% Open EEGLAB
eeglab

% Main folder for all the files
parentfolder    = [pwd '\Data\'];
newfolder       = [pwd '\Figures_e10\'];

%% BrainProducts data from FA1
names           = { 'Clay01'};

plotnames       = { 'Combined EEG and eyetracking lab'};

for s = 1:length(names)

    % load in the data
    EEG = pop_loadset('filename', [parentfolder [names{s} '.set']]);  
    
    % make the plot
    Y       = fft(EEG.data(e,:),num_time);
    Pyy     = Y.*conj(Y)/num_time;
    plot(f1000(start:num_time/10),Pyy(start:num_time/10))
    title(plotnames{s})
    xlabel('Frequency (Hz)')
    saveas(gcf, [newfolder 'FA1_raw_' names{s} '.jpg'])
    ylim([0 4e+4])
    saveas(gcf, [newfolder 'FA1_e4_' names{s} '.jpg'])   
end

%% BrainProducts data from FA1
names           = { '1_FA1_doorsclosed_only EEG cable',...
                    '2_FA1_FA1dooropen_only EEG cable',...
                    '3_FA1_FA2dooropen_only EEG cable',...
                    '4_FA1_all doors closed_mouse cable',...
                    '5_FA1_all doors open_mouse cable'};

plotnames      	= { 'FA1 / all doors closed / only EEG cable',...
                    'FA1 / FA1 door open / only EEG cable',...
                    'FA1 / FA2 door open / only EEG cable',...
                    'FA1 / all doors closed / EEG and mouse cable',...
                    'FA1 / all doors open / EEG and mouse cable'};
                
for s = 1:length(names)

    % load in the data
    EEG = pop_loadset('filename', [parentfolder [names{s} '.set']]);  
    
    % make the plot
    Y       = fft(EEG.data(e,:),num_time);
    Pyy     = Y.*conj(Y)/num_time;
    plot(f1000(start:num_time/10),Pyy(start:num_time/10))
    title(plotnames{s})
    xlabel('Frequency (Hz)')
    saveas(gcf, [newfolder 'FA1_raw_' names{s} '.jpg'])
    ylim([0 4e+4])
    saveas(gcf, [newfolder 'FA1_e4_' names{s} '.jpg'])   
end

%% Bio-Semi data from FA2
names           = { '1_doorsclosed_cablesremoved',...
                    '2_fa1openfa2closed_cablesremoved',...
                    '3_fa1closedfa2open_cablesremoved',...
                    '4_doorsclosed_eegcablefa1_eegfa1on',...
                    '5_doorsclosed_mousecablefa1_eegfa1off',...
                    '5_doorsopen_allcablesfa1',...
                    '6_doorsclosed_disconnectedeegcablefa1'};
                
plotnames    	= { 'FA2 / all doors closed / cables removed',...
                    'FA2 / FA1 door open / cables removed',...
                    'FA2 / FA2 door open / cables removed',...
                    'FA2 / all doors closed / EEG cable FA1 / EEG FA1 on',...
                    'FA2 / all doors closed / mouse cable FA1 / EEG FA1 off',...
                    'FA2 / all doors open / all cables FA1',...
                    'FA2 / all doors closed / disconnected EEG cable FA1'};

for s = 1:length(names)

    % load in the data
    EEG = pop_loadset('filename', [parentfolder [names{s} '.set']]);  

    % make the plot
    Y       = fft(EEG.data(e,:),num_time);
    Pyy     = Y.*conj(Y)/num_time;
    plot(f1024(start:num_time/10),Pyy(start:num_time/10))
    title(plotnames{s})
    xlabel('Frequency (Hz)')
    saveas(gcf, [newfolder 'FA2_raw_' names{s} '.jpg'])    
    ylim([0 4e+4])
    saveas(gcf, [newfolder 'FA2_e4_' names{s} '.jpg'])   
end

%% Bio-Semi data from FA2: salt water bath
names           = { 'WaterBathDoorClosed',...
                    'WaterBathDoorOpen'};
                
plotnames       = { 'FA2 / SaltWaterBath / FA2 door closed',...
                    'FA2 / SaltWaterBath / FA2 door open'};
                   
for s = 1:length(names)

    % load in the data
    EEG = pop_loadset('filename', [parentfolder [names{s} '.set']]);  

    % make the plot
    Y       = fft(EEG.data(e,:),num_time);
    Pyy     = Y.*conj(Y)/num_time;
    plot(f1024(start:num_time/10),Pyy(start:num_time/10))
    title(plotnames{s})
    xlabel('Frequency (Hz)')
    ylim([0 10])
    saveas(gcf, [newfolder 'FA2_raw_' names{s} '.jpg'])    
end

%% Bio-Semi data from FA2: pneumatic headphones
names           = { 'gewone_oortjes_1',...
                    'pneumatische_oortjes_1'};
                
plotnames       = { 'FA2 / Normal headphones',...
                    'FA2 / Pneumatic headphones'};
                   
for s = 1:length(names)

    % load in the data
    EEG = pop_loadset('filename', [parentfolder [names{s} '.set']]);  

    % make the plot
    Y       = fft(EEG.data(e,:),num_time);
    Pyy     = Y.*conj(Y)/num_time;
    plot(f1024(start:num_time/10),Pyy(start:num_time/10))
    title(plotnames{s})
    xlabel('Frequency (Hz)')
    saveas(gcf, [newfolder 'FA2_raw_' names{s} '.jpg'])    
    ylim([0 4e+4])
    saveas(gcf, [newfolder 'FA2_e4_' names{s} '.jpg'])     
end