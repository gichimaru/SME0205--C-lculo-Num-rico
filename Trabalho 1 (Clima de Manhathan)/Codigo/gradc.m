function [v, k] = gradc(A,b,v0,erro,kmax)
r0 = A*v0-b;
p0 = -r0;
q  = r0'*r0/(r0'*A*r0);
v = v0+ q*p0;
r= r0+q*A*p0;
p = p0;
k = 1;

while norm(v-v0,2)>= norm(v,2)*erro && k < kmax
    v0 =v;
    p0 = p;
    a  = r'*r/(r0'*r0);
    p = -r+a*p0;
    q  = r'*r/(p'*A*p);
    r0 = r;
    v = v0+q*p;
    r = r0+q*A*p;
    k = k+1;
end

return
end