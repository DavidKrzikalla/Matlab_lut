%% Function sinesum returning function values for given b and t.

function [S_N]=sinesum(t, b)
    S_N=zeros(1,length(t));

    for n=1:length(t)
        for i=1:length(b)
            S_N(1,n)=(b(1,i)*sin(i*t(1,n)))+S_N(1,n);
        end
    end
end