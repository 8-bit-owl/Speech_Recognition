%% Cut file into segments
% 2016 Mark Berardi
% 2017 hunter & hunter with small edits
% 2021 ver3 hunter, added an overlap if you wish
% 2021 ver3b hunter, added option to smooth ends


%%
clear
uihelp = 0;

%% if uihelp = 0, set parameters here
files = 'C:\Users\ganjaisa\Desktop\Speech_Recog\Speech_Recognition\priority3';
% Choose folder containing files
fdir = 'C:\Users\ganjaisa\Desktop\Speech_Recog\Speech_Recognition\priority3_split';
%'Choose folder for the segmented files to be saved'

% setbatch = 1; % 0 for ui selection
% 1 for 'FilenamesByExt.m
loadstr = 'wav';
nfilelength = 300; % length of segments in seconds
steplength= 60; % steps through the file at this length so to add more smoothness to analysis, to have no overlap, just make it the same as file length
tosslength = 3; % if leftover is under this amount in seconds, do not write new file. If 0 then all files will be kept.
nnamedefault = 0; % the default is to add two digits at the end of the file
% if nnamedefault = 0, set parameters here
nnamepre = '_cut'; % add any prefix to the 2-digit minute number, can be ''
nnamepost = ''; % add any postfix to the 2-digit minute number, can be ''
nnamenum = 15; % where in the file to add the nname
nnamefront = ''; % add any front of the filename, can be ''
smoothenddur = .1; % amount of ramp to zero, if a short 1/4 sec ramp is desired, put in 0.25




% %% show UI for options
% if uihelp == 1
%     files = uigetdir(cd,'Choose folder containing files');
%     fdir = uigetdir(cd,'Choose folder for the segmented files to be saved');
%     setbatch = menu('How would you like to select the files to batch?',...
%         'UI Selection','Auto (FilenamesByExt.m)')-1;
%     nfilelengthcell = inputdlg('How long in seconds do you want the segmented files to be?');
%     nfilelength = str2double(nfilelengthcell{1});
%     tosslengthcell = inputdlg(['What minimum length in seconds is required to save the last file segement?'...
%         char(10) '(Put 0 if you want to keep everything)']);
%     tosslength = str2double(tosslengthcell{1});
%     nnamedefault = menu('Use default naming?','Yes','No')-1;
%     if nnamedefault == 1;
%         nnamedefault = 0;
%         nnameprecell = inputdlg(['What text would like to put prior to the minute number?'...
%             char(10) '(Leave blank if you want no extra characters)']);
%         nnamepostcell = inputdlg(['What text would like to put after the minute number?'...
%             char(10) '(Leave blank if you want no extra characters)']);
%         nnamepre = nnameprecell{1};
%         nnamepost = nnamepostcell{1};
%         nnamenumcell = inputdlg('What number character of the filename should the minute number be inserted?');
%         nnamenum = str2double(nnamenumcell{1});
%     else
%         nnamedefault = 1;
%     end
% end
%%  get file names
cd(files)
% if setbatch == 0
%     filenames = uigetfile('*.wav;*.WAV','Choose file(s) to segment',files,'MultiSelect','on');
% elseif setbatch == 1
    tmp2 = length(loadstr);
    d = dir;
    str = {d.name};
    cntr = 0;
    for n = 1:length(str)
        tmp = str{n};
        if length(tmp) > tmp2,
            if tmp(end-tmp2+1:end) == loadstr
                cntr = cntr+1;
            end
        end
    end
    str2 = cell(cntr,1);
    cntr = 0;
    for n = 1:length(str)
        tmp = str{n};
        if length(tmp) > tmp2,
            if tmp(end-tmp2+1:end) == loadstr
                cntr = cntr+1;
                str2{cntr} = tmp;
            end
        end
    end
    str=str2;
    clear str2 tmp cntr d
    filenames = str;
% end
%% prepare to segment

if iscell(filenames) == 1
    cnt = length(filenames);
else
    cnt = 1;
end
diary off
delete([fdir '\segmentation report.txt'])
diary([fdir '\segmentation report.txt'])  %create a segment report

for iter = 1:cnt
    disp(['-------------------------' char(10)...
        'Segmenting file ' num2str(iter) ' of ' num2str(cnt)])
    if cnt == 1
        fname = filenames;
    else
        fname = filenames{iter};
    end
    [ytemp Fs] = audioread(fname);
    Fm = nfilelength*Fs; % number of audio samples in each saved segment
    Sm = steplength*Fs; % number of audio samples in step
    h = ceil(length(ytemp)/Sm);
    if h == 1
        y{h} = ytemp;
    else
        for iter2 = 1:h
%             y{iter2} = ytemp((iter2-1)*Fm+1:iter2*Fm);
            ytemp2=ytemp((iter2-1)*Sm+1:min([(iter2-1)*Sm+Fm length(ytemp)]));
            if smoothenddur>0
                tmpramp=floor(Fs*smoothenddur);
                tmpramp=[0:1/tmpramp:1]; %#ok<NBRAK>
                ytemp3=ytemp2;
                ytemp3(1:length(tmpramp))=ytemp3(1:length(tmpramp)).*tmpramp';
                ytemp3(end-length(tmpramp)+1:end)=ytemp3(end-length(tmpramp)+1:end).*flip(tmpramp');
                ytemp2=ytemp3;
            end
            y{iter2} = ytemp2;
        end
        if length(y{h})<tosslength*Fs
            fl = length(ytemp((h-1)*Fm+1:end))/Fs;
            disp([num2str(length(y{h})) ' seconds exlcuded'])
            h = h-1;
        end
    end
    for k = 1:h
        if k < 10
            sk = ['00' num2str(k)];
        elseif k < 100
            sk = ['0' num2str(k)];
        else
            sk = num2str(k);
        end
        if nnamedefault == 1
            nname = [fname(1:end-4) sk '.wav'];
        elseif nnamedefault == 0
            if nnamenum == 1
                nname = [nnamepre sk nnamepost fname];
            else
                nname = [nnamefront fname(1:nnamenum-1) nnamepre sk nnamepost fname(nnamenum:end)];
            end
        end
        audiowrite([fdir '\' nname],y{k},Fs)
        fl = length(y{k})/Fs;
    end
    disp([fname ' was split into ' num2str(h) ' segment(s).'...
        char(10) 'The last segment was ' num2str(fl) ' seconds long.'])
    clear y nname h sk
end
disp([char(10) 'Your files have been processed'])
diary off