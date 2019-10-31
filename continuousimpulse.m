function [t, d] = continuousimpulse(varargin)
%CONTINUOUSIMPULSE Creates a unit step function with various parameters.
%   Creates a continuous time impulse function d of variable t. Both t
%   and d have product and summation variables for operations on
%   the impulse function output.

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

if sum(strcmp('dProd', varargin))
    dProd = varargin{find(strcmp('dProd', varargin)) + 1};
else
    dProd = 1;
end

if sum(strcmp('dAdd', varargin))
    dAdd = varargin{find(strcmp('dAdd', varargin)) + 1};
else
    dAdd = 0;
end

% Continuous time ramp function creation.
t1 = linspace(-20, 0, 800);
t2 = linspace(0, 20, 800);
t = ([t1 t2].*(1/tProd)) - tAdd;

d1 = zeros(size(t1));
d1(end) = d1(end) + 1;
d2 = zeros(size(t2));
d2(1) = d2(1) + 1;
dtemp = [d1 d2];
d = (dtemp.*dProd) + dAdd;
end

