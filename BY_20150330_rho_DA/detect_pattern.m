function [ num ] = detect_pattern( sol )
%  num: how much is the initial pertubation amplified in the final pattern
% if the pde solver fails, time points will be smaller than 200
% in this case, num=NaN
num=NaN;
if size(sol,1)==200 %200 is total time points
p_init = sol(1,:,1);
p_end = sol(200,:,1); 
%
amp_init = max(p_init)-min(p_init);
amp_end = max(p_end)-min(p_end);
num = amp_end/amp_init;
end

end

