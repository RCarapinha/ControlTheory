%Find which F that makes systems asymptoticaly stable

function [d] = stableF(A,B,F,lambda)
    i=eye(size(A,1));
    d=det([lambda*i-(A-B*F)])
end