S = sparameters('default.s2p');
S11 = squeeze(S.Parameters(1,1,:));
S12 = squeeze(S.Parameters(1,2,:));
S21 = squeeze(S.Parameters(2,1,:));
S22 = squeeze(S.Parameters(2,2,:));
f = linspace(min(S.Frequencies), max(S.Frequencies), 10000);
S11_interp = interp1(S.Frequencies, S11, f, 'linear');
S12_interp = interp1(S.Frequencies, S12, f, 'linear');
S21_interp = interp1(S.Frequencies, S21, f, 'linear');
S22_interp = interp1(S.Frequencies, S22, f, 'linear');
S_interp = [S11_interp.', S12_interp.'; S21_interp.', S22_interp.'];
imp_resp = ifft(S_interp);
t = linspace(0, 1/(f(2)-f(1)), length(imp_resp));
plot(t, abs(imp_resp(:,2)), 'LineWidth', 2);
xlim([0 10e-8])
xlabel('Time (s)');
ylabel('Magnitude');
title('Channel Impulse Response');
