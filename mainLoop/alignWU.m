function WU = alignWU(WU, ops)
disp('first')
[nt0 , Nchan, Nfilt] = size(WU);
[~, imin] = min(reshape(WU, nt0*Nchan, Nfilt), [], 1);
disp('second')
iMinChan = ceil(imin/nt0);


% imin = rem(imin-1, nt0) + 1;

% [~, imax] = min(W, [], 1);
% dmax = -(imin - 20);
% dmax = min(1, abs(dmax)) .* sign(dmax);
disp('third')
dmax = zeros(Nfilt, 1);
disp('fourth')
for i = 1:Nfilt
    disp('inside')
    wu = WU(:,iMinChan(i),i);
%     [~, imin] = min(diff(wu, 1));
    [~, imin] = min(wu);
    dmax(i) = - (imin- ops.nt0min);
    
    if dmax(i)>0
        WU((dmax(i) + 1):nt0, :,i) = WU(1:nt0-dmax(i),:, i);
    else
        WU(1:nt0+dmax(i),:, i) = WU((1-dmax(i)):nt0,:, i);
    end
end




