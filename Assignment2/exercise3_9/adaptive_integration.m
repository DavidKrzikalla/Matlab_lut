% Adaptive calculation of integral by trapeziodal method
% This function calculates intergral of given function f(x) within interval(a,b)

%Input parameters are:
%f - function for integration
%a - lower limit
%b - upper limit
%eps - desired tolerance

function adaptive_integration(f, a, b, eps)

    %setting of initial values
    array_error=zeros(1,30);
    array_n=zeros(1,30);
    n=1;
    I_last=0;
    c=1;

    %working loop
    while true
        I=trapezoidal(f, a, b, n);  
        error=abs(I-I_last);
        array_error(c)=error;
        array_n(c)=n;

        if error<=eps 
            break
        else 
            c=c+1;
            n=n*2;
            I_last=I;
            continue
        end
    end

    fprintf('Achieved n is %d and error is %.11f \n',n,error)

    new_array_error=array_error(array_error ~= 0);
    new_array_n=array_n(array_n ~= 0);

    semilogy(new_array_n,new_array_error)
    axis([1 n+10 1e-10 1e-1])
    xlabel('Number of divisions, N')
    ylabel('Error')
    title('Number of divisions vs Error')
end
