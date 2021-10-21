% a is the output voltage
% b is the output voltage expressed in bits
%% Standard scenario with 0<v_input<v_ref
clc
clear all
number_of_bits=4;
v_ref=1;
v_input=0.54;
[a,b]=successive_app_adc(number_of_bits,v_ref,v_input)
%% Invalid input scenario v_input<0
clc
clear all
number_of_bits=8;
v_ref=1;
v_input=0.3;
[a,b]=successive_app_adc(number_of_bits,v_ref,v_input)
%% Out of range input scenario v_input>v_ref
clc
clear all
number_of_bits=16;
v_ref=1;
v_input=3;
[a,b]=successive_app_adc(number_of_bits,v_ref,v_input)
%% Graphical Illustration of Successive Approximation ADC
clear all
clc
number_of_bits=3;
v_ref=1;
v_input=0:0.01:1;
x = [];
for i=1:length(v_input)
    [a,b]=successive_app_adc(number_of_bits,v_ref,v_input(i));
    x=[x a];
end

plot(v_input,x)
title('Analog Input vs Digital Output');
xlabel('analog input (V)');
ylabel('digital output (V)');

%% Time Performance of DAC for varying bit numbers
clear all
clc
number_of_bits=1:100;
v_ref=100;
v_input=45;
x = [];
for i=1:length(number_of_bits)
    tic
    [a,b]=successive_app_adc(number_of_bits(i),v_ref,v_input);
    x=[x toc];
end
plot(number_of_bits,x)
title('Number of Bits vs Time');
xlabel('number of bits');
ylabel('Time (s)');

%% Time Performance of DAC for varying inputs
clear all
clc
number_of_bits=16;
v_ref=100;
v_input=0:5:100;
x = [];
for i=1:length(v_input)
    tic 
    [a,b]=successive_app_adc(number_of_bits,v_ref,v_input(i));
    x=[x toc];
end
plot(v_input,x)
title('Time vs Analog Input');
xlabel('Analog Input (V)');
ylabel('Time (s)');











