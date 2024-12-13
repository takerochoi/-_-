clear; % �O�̕ϐ��ɉe������Ȃ��悤�ɁA�܂��ϐ����N���A

Sample_Hz = 40000; % �T���v�����O���g���� 40 kHz


% �f�[�^�̓ǂݍ���
load CD_Group1_Jihatsu_KeisokuData.mat; % �_�o�����f�[�^�� mat �t�@�C������ϐ��Ƃ��ēǂݍ���

ta = 1; % �ǂݍ��ޑS�f�[�^�̎n�_ [s]
tb = 100; % �ǂݍ��ޑS�f�[�^�̏I�_ [s]
Th = -0.09; % 臒l [mV] ������ς����臒l���ς��C���o����g�`�Z�b�g���ς��
t1 = 250; % �g���K�[���_���牽�}�C�N���b�O����d�˕`�����邩 [��s]
t2 = 1000; % �g���K�[���_���牽�}�C�N���b��܂ŏd�˕`�����邩 [��s]

t = [ta:1/Sample_Hz:tb]; % �T���v�����O���g���ɍ��킹�����Ԃ̕ϐ� t ���쐬

% �񎟌��z��փg���K�[���z�����g�`�݂̂�ۑ�
n = 1; % �ۑ�����X�p�C�N�g�`�̒ʂ��ԍ�
for i = floor(t1/1000000*Sample_Hz) + 1 : size(t, 2)
    if (SPKC11(i-1) > Th && SPKC11(i) < Th)
        % Th ���傫���l���珬�����l�֕ω������Ƃ���
        Temp(:, n) = SPKC11(floor(i - t1 / 1000000 * Sample_Hz) + 1 : i + floor(t2 / 1000000 * Sample_Hz) + 1);
        TimeStamp(n) = t(i); % ���̎��� Time Stamp ��ۑ�
        n = n + 1; % �ۑ������X�p�C�N�g�`�̒ʂ��ԍ��� 1 �i�߂�
    end
end

% �������d�˕`�����ăO���t�`��
hold on; % �d�˕`�����[�h�n�m
tt = 1 : 1000000 / Sample_Hz : t2 + t1 + 1; % ���Ԏ��̕ϐ����쐬
for i = 1 : n - 1
    plot(tt', Temp(:, i), 'k'); % �g�`������v���b�g����
end
xlim([0 t2 + t1 + 1]); % ���Ԃ͈̔͂𖾎�
ylim([-0.3 0.3]); % �d���̐U�ꕝ�ɂȂ�ׂ����킹��
axis square on; % �O���t�𐳕��`��
title('���o�����X�p�C�N�g�`'); 
xlabel('���� [��s]'); 
ylabel('�d�� [mV]');
hold off; % �d�˕`�����[�h�n�e�e

% �؂�o�����X�p�C�N�g�`��ۑ����� Temp �� mat �t�@�C���ŏ����o��
save 'Temp.mat' Temp TimeStamp;
