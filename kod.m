%imaqreset;
%clc;
%clear all;

global a;
a = arduino('COM4');

servoAttach(a,3);
servoAttach(a,4);
servoAttach(a,5);
servoAttach(a,6);

servoWrite(a,3,5);
servoWrite(a,4,75);
servoWrite(a,5,120);
servoWrite(a,6,12);


pause(1);

vid = videoinput('winvideo','USB PC Camera (SN9C120)');

set(vid, 'FramesPerTrigger', Inf);
set(vid, 'ReturnedColorspace', 'rgb')
vid.FrameGrabInterval = 3;
%s=serial('COM4','BaudRate',9600);
%fopen(s);
start(vid);



while(vid.FramesAcquired<=2000)

    data=getsnapshot(vid);
    diff_im = imsubtract(data(:,:,1), rgb2gray(data));
    diff_im1 = imsubtract(data(:,:,2), rgb2gray(data));
    diff_im2 = imsubtract(data(:,:,3), rgb2gray(data));
    
    diff_im = medfilt2(diff_im, [3 3]);
    diff_im1 = medfilt2(diff_im1, [3 3]);
    diff_im2 = medfilt2(diff_im2, [3 3]);
    
    diff_im = im2bw(diff_im,0.3);
    diff_im1 = im2bw(diff_im1,0.1);
    diff_im2 = im2bw(diff_im2,0.3);
    
    diff_im = bwareaopen(diff_im,200);
    diff_im1 = bwareaopen(diff_im1,200);
    diff_im2 = bwareaopen(diff_im2,200);
    
    bw = bwlabel(diff_im, 4);
    bw1 = bwlabel(diff_im1, 4);
    bw2 = bwlabel(diff_im2, 4);

imshow(data,'Border','tight','InitialMagnification', 255);
hold on
toplam=sum(sum(bw)); % KIRMIZI PAR�AYI ALGILADI�INDA GER�EKLE�ECEK ��LEMLER
if (toplam>20)
    pause(1);
    
servoAttach(a,3);
servoAttach(a,4);
servoAttach(a,5);
servoAttach(a,6);

servoWrite(a,3,5);
servoWrite(a,4,75);
servoWrite(a,5,120);
servoWrite(a,6,25);

pause(3);

b=0.0125;

for i=120: -1: 40   % e�ilme
   servoWrite(a,5,i);
   pause(b);
end

for i=25:-1:12
   servoWrite(a,6,i); % a��z kapa=par�a al
   pause(b);
end 

for i=40:120
   servoWrite(a,5,i); % kald�r
   pause(b);
end

for i=5:65
    servoWrite(a,3,i); %d�n (k�rm�z� kutu)
    pause(b);
end

for i=75: -1: 50   % uzuma (k�rm�z� kutu)
   servoWrite(a,4,i);
   pause(b);
end

for i=120: -1: 40   % e�ilme (k�rm�z� kutu)
   servoWrite(a,5,i);
   pause(b);
end


   servoWrite(a,6,25); % a��z a��l(k�rm�z� kutu)



for i=40:120
   servoWrite(a,5,i); % kald�r(k�rm�z� kutu)
   pause(b);
end

for i=50:75  % k�salma (k�rm�z� kutu)
   servoWrite(a,4,i);
   pause(b);
end

for i=65: -1 :5
    servoWrite(a,3,i); %d�n ( sistem s�f�ra geldi)
    pause(b);
end

end 

toplam=sum(sum(bw1)); % YE��L PAR�A ALGILANDI�INDA

if (toplam>20)
      pause(1);
servoAttach(a,3);
servoAttach(a,4);
servoAttach(a,5);
servoAttach(a,6);

servoWrite(a,3,5);
servoWrite(a,4,75);
servoWrite(a,5,120);
servoWrite(a,6,25);
pause(3);

b=0.0125;

for i=120: -1: 40   % e�ilme
   servoWrite(a,5,i);
   pause(b);
end

for i=25:-1:12
   servoWrite(a,6,i); % a��z kapa=par�a al
   pause(b);
end 

for i=40:120
   servoWrite(a,5,i); % kald�r
   pause(b);
end

for i=5:105
    servoWrite(a,3,i); %d�n (YE��L kutu)
    pause(b);
end

for i=75: -1: 50   % uzuma (YE��L kutu)
   servoWrite(a,4,i);
   pause(b);
end

for i=120: -1: 40   % e�ilme (YE��L kutu)
   servoWrite(a,5,i);
   pause(b);
end


   servoWrite(a,6,25); % a��z a��l(YE��L kutu)



for i=40:120
   servoWrite(a,5,i); % kald�r(YE��L kutu)
   pause(b);
end

for i=50:75  % k�salma (YE��L kutu)
   servoWrite(a,4,i);
   pause(b);
end

for i=105: -1 :5
    servoWrite(a,3,i); %d�n ( sistem s�f�ra geldi)
    pause(b);
end

end 
    
toplam=sum(sum(bw2)); %MAV� PAR�A ALGILANDI�INDA
if (toplam>20)
     pause(1);
servoAttach(a,3);
servoAttach(a,4);
servoAttach(a,5);
servoAttach(a,6);

servoWrite(a,3,5);
servoWrite(a,4,75);
servoWrite(a,5,120);
servoWrite(a,6,25);
pause(3);

b=0.0125;

for i=120: -1: 40   % e�ilme
   servoWrite(a,5,i);
   pause(b);
end

for i=25:-1:12
   servoWrite(a,6,i); % a��z kapa=par�a al
   pause(b);
end 

for i=40:120
   servoWrite(a,5,i); % kald�r
   pause(b);
end

for i=5:150
    servoWrite(a,3,i); %d�n (MAV� kutu)
    pause(b);
end

for i=75: -1: 50   % uzuma (MAV� kutu)
   servoWrite(a,4,i);
   pause(b);
end

for i=120: -1: 40   % e�ilme (MAV� kutu)
   servoWrite(a,5,i);
   pause(b);
end


   servoWrite(a,6,25); % a��z a��l(MAV� kutu)


for i=40:120
   servoWrite(a,5,i); % kald�r(MAV� kutu)
   pause(b);
end

for i=50:75  % k�salma (MAV� kutu)
   servoWrite(a,4,i);
   pause(b);
end

for i=150: -1 :5
    servoWrite(a,3,i); %d�n ( sistem s�f�ra geldi)
    pause(b);
end
end

%hold on
        
hold off
        
end


stop(vid);

flushdata(vid);

%imaqreset
imaqreset;
clc;
clear all;



