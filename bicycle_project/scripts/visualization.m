% 提取数据
t = out.states.time;       % 时间向量
% 以下各项因为标准为[0;0;0;0]所以可以直接当作误差
y_error = out.states.signals.values(:,1);  % 横向位置误差
psi_error = out.states.signals.values(:,3); % 航向角误差
x_pos = 10 * t;        % 纵向位置（假设车速10m/s）

% 创建并排的两个图形
figure('Position', [100, 100, 800, 400]);

% 误差曲线
subplot(1,2,1);
plot(t, y_error, 'b', 'LineWidth', 1.5);
hold on; % 实现在同一个图上绘制
plot(t, psi_error, 'r', 'LineWidth', 1.5);
title('控制误差');
xlabel('时间(s)');
ylabel('误差值');
legend('横向误差(m)', '航向角误差(rad)'); % 设置图例
grid on; % 用于添加网格线

% 车辆轨迹
subplot(1,2,2);
plot(x_pos, y_error, 'm-', 'LineWidth', 2);
xlabel('纵向位置(m)');
ylabel('横向位置(m)');
title('车辆轨迹');
grid on;

% 保存图像
saveas(gcf,'simulation_results.png')