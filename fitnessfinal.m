function g=fitnessfinal(x,le)
f=stewartfitness(x);
sizef=size(f);
gi=0;
for i=1:sizef(2)
    %gi=gi+abs((f(i)^2-length(i)^2));
    gi=gi+(f(i)-le(i))^2;
end
g=abs(gi);
end