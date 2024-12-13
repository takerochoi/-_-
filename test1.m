% �T���v�����O���g���� 40 kHz
Sample_Hz = 40000;

% �O���t�̍��[ [s]
ta = 0;

% �O���t�̉E�[ [s]
tb = 10;

% �_�o�����f�[�^�� mat �t�@�C������ϐ��Ƃ��ēǂݍ���
load('CD_Group1_Jihatsu_KeisokuData.mat');

% �T���v�����O���g���ɍ��킹�����Ԃ̕ϐ� t ���쐬
t = ta:1/Sample_Hz:tb;

% �㑤�Ƀv���b�g
subplot(2,1,1); 
plot(t, SPKC05(1:length(t)), 'k'); % t �ɑ΂��� SPKC05 ���v���b�g
xlim([0 6]); % x ���͈̔͂��Œ�l�Ŏw��i������ς���Ǝ��ԕ���ς�����j
ylim([-0.09 0.09]); % y ���͈̔͂��Œ�l�Ŏw��
title('�`�����l��5�̓d�ʕϓ��f�[�^');
xlabel('���� [s]');
ylabel('�d�� [mV]');

% �����Ƀv���b�g
subplot(2,1,2); 
plot(t, SPKC13(1:length(t)), 'k'); % t �ɑ΂��� SPKC13 ���v���b�g
xlim([0 6]); % x ���͈̔͂��Œ�l�Ŏw��i������ς���Ǝ��ԕ���ς�����j
ylim([-0.09 0.09]); % y ���͈̔͂��Œ�l�Ŏw��
title('�`�����l���P3�̓d�ʕϓ��f�[�^');
xlabel('���� [s]');
ylabel('�d�� [mV]');
