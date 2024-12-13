clear; % 前の変数に影響されないように、まず変数をクリア

Sample_Hz = 40000; % サンプリング周波数は 40 kHz


% データの読み込み
load CD_Group1_Jihatsu_KeisokuData.mat; % 神経活動データの mat ファイルから変数として読み込み

ta = 1; % 読み込む全データの始点 [s]
tb = 100; % 読み込む全データの終点 [s]
Th = -0.09; % 閾値 [mV] ここを変えると閾値が変わり，抽出する波形セットが変わる
t1 = 250; % トリガー時点から何マイクロ秒前から重ね描きするか [μs]
t2 = 1000; % トリガー時点から何マイクロ秒後まで重ね描きするか [μs]

t = [ta:1/Sample_Hz:tb]; % サンプリング周波数に合わせた時間の変数 t を作成

% 二次元配列へトリガーを越えた波形のみを保存
n = 1; % 保存するスパイク波形の通し番号
for i = floor(t1/1000000*Sample_Hz) + 1 : size(t, 2)
    if (SPKC11(i-1) > Th && SPKC11(i) < Th)
        % Th より大きい値から小さい値へ変化したところ
        Temp(:, n) = SPKC11(floor(i - t1 / 1000000 * Sample_Hz) + 1 : i + floor(t2 / 1000000 * Sample_Hz) + 1);
        TimeStamp(n) = t(i); % その時の Time Stamp を保存
        n = n + 1; % 保存したスパイク波形の通し番号を 1 進める
    end
end

% それらを重ね描きしてグラフ描画
hold on; % 重ね描きモードＯＮ
tt = 1 : 1000000 / Sample_Hz : t2 + t1 + 1; % 時間軸の変数を作成
for i = 1 : n - 1
    plot(tt', Temp(:, i), 'k'); % 波形を一つずつプロットする
end
xlim([0 t2 + t1 + 1]); % 時間の範囲を明示
ylim([-0.3 0.3]); % 電圧の振れ幅になるべく合わせる
axis square on; % グラフを正方形に
title('抽出したスパイク波形'); 
xlabel('時間 [μs]'); 
ylabel('電位 [mV]');
hold off; % 重ね描きモードＯＦＦ

% 切り出したスパイク波形を保存した Temp を mat ファイルで書き出し
save 'Temp.mat' Temp TimeStamp;
