function [t, r] = continuousramp(varargin)
%CONTINUOUSRAMP Creates a ramp function with various parameters.
%   Creates a continuous time ramp function r of variable t. Both t
%   and r have product and summation variables for operations on
%   the ramp function output.

% Function default arguments.
if sum(strcmp('tProd', varargin))
    tProd = varargin{find(strcmp('tProd', varargin)) + 1};
else
    tProd = 1;
end

if sum(strcmp('tAdd', varargin))
    tAdd = varargin{find(strcmp('tAdd', varargin)) + 1};
else
    tAdd = 0;
end

if sum(strcmp('rProd', varargin))
    rProd = varargin{find(strcmp('rProd', varargin)) + 1};
else
    rProd = 1;
end

if sum(strcmp('rAdd', varargin))
    rAdd = varargin{find(strcmp('rAdd', varargin)) + 1};
else
    rAdd = 0;
end

% Continuous time ramp function creation.
t1 = linspace(-20, 0, 800);
t2 = linspace(0, 20, 800);
t = ([t1 t2].*(1/tProd)) - tAdd;

r1 = zeros(size(t1));
r2 = t2;
rtemp = [r1 r2];
r = (rtemp.*rProd) + rAdd; 
end

