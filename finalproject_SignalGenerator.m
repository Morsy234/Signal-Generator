%-------------------------------------------------------------
%Part 2
clc
% get data of signal from user
fs = input('Enter Sampling Frequency of Signal: ');
starttime = input('Enter a Start for Time Scale: ');
endtime = input('Enter an End for Time Scale: '); 
breakPointsNumber = input('Enter Number of Break Points: '); 
breakPoints = [];
for i = 1:breakPointsNumber
  breakPoints(i) = input(['Enter Position for Break Point ' num2str(i) ' : ']);   
end
breakPoints(breakPointsNumber+1)= endtime;

%signal drawing

areaStartTime = starttime;
signal = [];
time = [];
polysignal = [];

%make signal in each region
for i = 1:breakPointsNumber+1      
  Area = strcat(int2str(areaStartTime), '  at breakingPoint ', int2str(breakPoints(i)),' : ');
  disp("1-DC Signal");
  disp("2-Ramp Signal");
  disp("3-General order Polynomial Signal");
  disp("4-Exponential Signal");
  disp("5-Sinosoidal Signal");
  signalType = input(strcat('Choose signal type for region ', Area));
  
  
  no_of_samples = (breakPoints(i)-areaStartTime)*fs;  
  t = linspace(areaStartTime, breakPoints(i), no_of_samples);

   if signalType==1
        %DC 
        amp = input('Enter the amplitude of DC signal: '); 
        s = amp.*ones(1,no_of_samples);
   
   elseif signalType==2
       %Ramp 
       slope = input('Enter the slope of Ramp signal: '); 
       intercept = input('Enter its intercept: '); 
       s = slope*t + intercept;
      
   elseif signalType==3
       %General Order Polynomial 
       highestPower = input('Enter the highest power of amplitude: ');
       for j=0:highestPower
          power = input(strcat('Enter coefficient of X^' , int2str(j), ' : '));
          polysignal = [polysignal power];
       end
       s = polyval( fliplr(polysignal),t); 
   
   elseif signalType==4 
       %Exponential 
       amp = input('Enter the amplitude of Exponential signal: '); 
       ex = input('Enter its exponent: '); 
       s = amp.*exp(ex.*abs(t));
   
   elseif signalType==5 
       %Sinusoidal 
        amp = input('Enter the amplitude of Sinosoidal signal: '); 
        freq = input('Enter its frequency: '); 
        phase = input('Enter its phase: '); 
        s = amp*sin(2*pi*freq*t + phase);
   else
   end
  
   areaStartTime = breakPoints(i);
   %concatunate signals of each region together 
   signal = [signal s];
   %concatunate the time of regions together
   time = [time t];
end
plot(time,signal);
title('Signal choosen before operation');

%Operations done on the signal
while(1)
  disp("1-Amplitude Scaling");
  disp("2-Time Reversal");
  disp("3-Time Shift");
  disp("4-Expanding the signal");
  disp("5-Compressing the signal");
  disp("0-None");
  disp("Perform Some Operations:");
  operation =input('Choose your operation:');
    operationTime = time;
    operationSignal = signal;
  
 if operation== 1 
     %Amplitude Scaling
      scale = input('Enter value of scaling: '); 
      operationSignal = scale*signal;
      disp("Amplitude Scaled..!");

 elseif operation==2 
     %Time Reversal
      operationTime = fliplr(-time);
      operationSignal = fliplr(signal);
      disp("Time Reversed..!");
 
 elseif operation==3 
     %Time Shift
      shift = input('Enter value of shifting: '); 
      operationTime = time + shift;
      disp("Time Shifted..!");
 
 elseif operation==4
     %Expanding the signal
      x = input('Enter value of expanding: ');
      if x ~= 0
        operationTime = time*x;
        disp("Signal Expanded..!");
      end
 
 elseif operation==5 
     %Compressing the signal
      x = input('Enter value of compressing: ');
      if x ~= 0
        operationTime = time/x;
        disp("Signal Compressed..!");
      end
 
 else
     break;
 end
     
  plot(operationTime, operationSignal)
  title('Signal after operation');
end
























