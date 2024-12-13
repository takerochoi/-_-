clear; % �O�̕ϐ��ɉe������Ȃ��悤�ɁA�܂��ϐ����N���A

% �f�[�^�̓ǂݍ���
load Temp.mat; % �؂�o�����g�`�f�[�^�� TimeStamp �f�[�^��ϐ��Ƃ��ēǂݍ���

% �听�����͂����s (zscore �ŕW�������Ă���听������)
[coeff, score, latent, tsquared] = pca(zscore(Temp'));

% ��^���̌v�Z�ƕ\��
fprintf('��P�听���̊�^�� = %f\n', sum(latent(1)) / sum(latent));
fprintf('��Q�听���܂ł̊�^�� = %f\n', sum(latent(1:2)) / sum(latent));
fprintf('��R�听���܂ł̊�^�� = %f\n', sum(latent(1:3)) / sum(latent));
fprintf('��S�听���܂ł̊�^�� = %f\n', sum(latent(1:4)) / sum(latent));
fprintf('��T�听���܂ł̊�^�� = %f\n', sum(latent(1:5)) / sum(latent));

% �听�����ʂŃv���b�g (2����)
figure(1); % ��ڂ̃E�C���h�E�i�O���t�j
plot(score(:,1), score(:,2), 'ko', 'MarkerSize', 2); % �听�����_���v���b�g
title('���o�����X�p�C�N�g�`�̎听�����́i�Q�����j');
xlabel('���听�� (PC1)');
ylabel('���听�� (PC2)');
axis square on;
grid on;

% 3�����v���b�g
figure(2); % ��ڂ̃E�C���h�E�i�O���t�j
plot3(score(:,1), score(:,2), score(:,3), 'ko', 'MarkerSize', 2); % 3�����v���b�g
title('���o�����X�p�C�N�g�`�̎听�����́i�R�����j');
xlabel('���听�� (PC1)');
ylabel('���听�� (PC2)');
zlabel('��O�听�� (PC3)');
axis square on;
grid on;
