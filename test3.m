clear; % 前の変数に影響されないように、まず変数をクリア

% データの読み込み
load Temp.mat; % 切り出した波形データと TimeStamp データを変数として読み込み

% 主成分分析を実行 (zscore で標準化してから主成分分析)
[coeff, score, latent, tsquared] = pca(zscore(Temp'));

% 寄与率の計算と表示
fprintf('第１主成分の寄与率 = %f\n', sum(latent(1)) / sum(latent));
fprintf('第２主成分までの寄与率 = %f\n', sum(latent(1:2)) / sum(latent));
fprintf('第３主成分までの寄与率 = %f\n', sum(latent(1:3)) / sum(latent));
fprintf('第４主成分までの寄与率 = %f\n', sum(latent(1:4)) / sum(latent));
fprintf('第５主成分までの寄与率 = %f\n', sum(latent(1:5)) / sum(latent));

% 主成分平面でプロット (2次元)
figure(1); % 一つ目のウインドウ（グラフ）
plot(score(:,1), score(:,2), 'ko', 'MarkerSize', 2); % 主成分得点をプロット
title('抽出したスパイク波形の主成分分析（２次元）');
xlabel('第一主成分 (PC1)');
ylabel('第二主成分 (PC2)');
axis square on;
grid on;

% 3次元プロット
figure(2); % 二つ目のウインドウ（グラフ）
plot3(score(:,1), score(:,2), score(:,3), 'ko', 'MarkerSize', 2); % 3次元プロット
title('抽出したスパイク波形の主成分分析（３次元）');
xlabel('第一主成分 (PC1)');
ylabel('第二主成分 (PC2)');
zlabel('第三主成分 (PC3)');
axis square on;
grid on;
