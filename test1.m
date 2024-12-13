% サンプリング周波数は 40 kHz
Sample_Hz = 40000;

% グラフの左端 [s]
ta = 0;

% グラフの右端 [s]
tb = 10;

% 神経活動データの mat ファイルから変数として読み込み
load('CD_Group1_Jihatsu_KeisokuData.mat');

% サンプリング周波数に合わせた時間の変数 t を作成
t = ta:1/Sample_Hz:tb;

% 上側にプロット
subplot(2,1,1); 
plot(t, SPKC05(1:length(t)), 'k'); % t に対して SPKC05 をプロット
xlim([0 6]); % x 軸の範囲を固定値で指定（ここを変えると時間幅を変えられる）
ylim([-0.09 0.09]); % y 軸の範囲を固定値で指定
title('チャンネル5の電位変動データ');
xlabel('時間 [s]');
ylabel('電位 [mV]');

% 下側にプロット
subplot(2,1,2); 
plot(t, SPKC13(1:length(t)), 'k'); % t に対して SPKC13 をプロット
xlim([0 6]); % x 軸の範囲を固定値で指定（ここを変えると時間幅を変えられる）
ylim([-0.09 0.09]); % y 軸の範囲を固定値で指定
title('チャンネル１3の電位変動データ');
xlabel('時間 [s]');
ylabel('電位 [mV]');
