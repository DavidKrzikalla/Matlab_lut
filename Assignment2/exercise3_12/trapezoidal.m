function I=trapezoidal(f, a, b, n)
    h=(b-a)/n;
    I=h*(f(a)+f(b))/2;
    
    for i=a+h:h:b-h
        I=I+h*f(i);
    end
end