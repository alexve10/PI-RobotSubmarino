clc, clear all, close all;

%% Accelerometro
Lista_AX=[];
Lista_AY=[];
Lista_AZ=[];

Lista_AccX = 'https://pi3---iot.firebaseio.com/Arduino_Reader/Sensor_Acelerometro/S_A_DatoX.json';
Lista_AccY = 'https://pi3---iot.firebaseio.com/Arduino_Reader/Sensor_Acelerometro/S_A_DatoY.json';
Lista_AccZ = 'https://pi3---iot.firebaseio.com/Arduino_Reader/Sensor_Acelerometro/S_A_DatoZ.json';

Lista_AccX = webread(Lista_AccX);
Lista_AX=String2Number(Lista_AccX);

Lista_AccY = webread(Lista_AccY);
Lista_AY=String2Number(Lista_AccY);

Lista_AccZ = webread(Lista_AccZ);
Lista_AZ=String2Number(Lista_AccZ);

%% Giroscopio
Lista_GX=[];
Lista_GY=[];
Lista_GZ=[];

Lista_AnX = 'https://pi3---iot.firebaseio.com/Arduino_Reader/Sensor_Giroscopio/S_G_DatoX.json';
Lista_AnY = 'https://pi3---iot.firebaseio.com/Arduino_Reader/Sensor_Giroscopio/S_G_DatoY.json';
Lista_AnZ = 'https://pi3---iot.firebaseio.com/Arduino_Reader/Sensor_Giroscopio/S_G_DatoZ.json';

Lista_AnX = webread(Lista_AnX);
Lista_GX=String2Number(Lista_AnX);

Lista_AnY = webread(Lista_AnY);
Lista_GY = String2Number(Lista_AnY);

Lista_AnZ = webread(Lista_AnZ);
Lista_GZ = String2Number(Lista_AnZ);


%% Plot

t=linspace(0,length(Lista_GX), length(Lista_GX));

figure(1),
subplot(2,3,1);
plot(t, Lista_AX);
title('Aceleraccion en X');
xlabel('tiempo');
% ylim([-0.5 0.5]);
grid on;

subplot(2,3,2);
plot(t, Lista_AY);
title('Aceleraccion en Y');
xlabel('tiempo');
% ylim([-0.5 0.5]);
grid on;

subplot(2,3,3);
plot(t, Lista_AZ);
title('Aceleraccion en Z');
xlabel('tiempo');
% ylim([9.7 9.8]);
grid on;

subplot(2,3,4);
plot(t, Lista_GX);
title('Velocidad Angular en X');
xlabel('tiempo');
% ylim([-0.5 0.5]);
grid on;

subplot(2,3,5);
plot(t, Lista_GY);
title('Velocidad Angular en Y');
xlabel('tiempo');
% ylim([-0.5 0.5]);
grid on;

subplot(2,3,6);
plot(t, Lista_GZ);
title('Velocidad Angular en Z');
% ylim([-0.5 0.5]);
xlabel('tiempo');
grid on;

% figure(1),
% subplot(4,3,1);
% plot(t, Lista_OAz);
% title('Orientacion Azimuth');
% xlabel('tiempo');
% grid on;
% 
% subplot(4,3,2);
% plot(t, Lista_OPi);
% title('Orientacion Pitch');
% xlabel('tiempo');
% grid on;
% 
% subplot(4,3,3);
% plot(t, Lista_ORo);
% title('Orientacion Pitch');
% xlabel('tiempo');
% grid on;
% 
% subplot(4,3,4);
% plot(t, Lista_AX);
% title('Aceleraccion en X');
% xlabel('tiempo');
% % ylim([-0.5 0.5]);
% grid on;
% 
% subplot(4,3,5);
% plot(t, Lista_AY);
% title('Aceleraccion en Y');
% xlabel('tiempo');
% % ylim([-0.5 0.5]);
% grid on;
% 
% subplot(4,3,6);
% plot(t, Lista_AZ);
% title('Aceleraccion en Z');
% xlabel('tiempo');
% % ylim([9.7 9.8]);
% grid on;
% 
% subplot(4,3,7);
% plot(t, Lista_GX);
% title('Velocidad Angular en X');
% xlabel('tiempo');
% % ylim([-0.5 0.5]);
% grid on;
% 
% subplot(4,3,8);
% plot(t, Lista_GY);
% title('Velocidad Angular en Y');
% xlabel('tiempo');
% % ylim([-0.5 0.5]);
% grid on;
% 
% subplot(4,3,9);
% plot(t, Lista_GZ);
% title('Aceleraccion Angular en Z');
% % ylim([-0.5 0.5]);
% xlabel('tiempo');
% grid on;
% 
% subplot(4,3,10);
% plot(t, Lista_MX);
% title('Magnetometro en X');
% % ylim([-0.5 0.5]);
% xlabel('tiempo');
% grid on;
% 
% subplot(4,3,11);
% plot(t, Lista_MY);
% title('Magnetometro en Y');
% % ylim([-0.5 0.5]);
% xlabel('tiempo');
% grid on;
% 
% subplot(4,3,12);
% plot(t, Lista_MZ);
% title('Magnetometro en Z');
% % ylim([-0.5 0.5]);
% xlabel('tiempo');
% grid on;