function [z, g] = test_function(x, D, num_f)  
    ps = size(x,1);
    switch num_f
        case 1
            z = sum(x.^2,2);
        case 2 
            z = sum(abs(x),2) + prod(abs(x),2);
        case 3
            z = 0;
            for i = 1:D
              z = z + sum(x(:,1:i),2).^2;
            end
        case 4 
            z = max(abs(x),[],2);
        case 5  
            z = sum(100*(x(:,2:D)-x(:,1:D-1).^2).^2 + (x(:,1:D-1) - 1).^2, 2);
        case 6  
            z = sum(floor(abs(x)), 2);
        case 7  
            f = 0;
            for i = 1:D
                f = f + i * (x(:,i).^4);
            end
            z = f + rand;
        case 8 
            sum_1 = 0;
            for i = 1:D
                sum_1 = sum_1 + 0.5 * i * x(:,i);
            end
            z = sum(x.^2, 2) + sum_1^2 + sum_1^4;
        case 9  
            x2 = x .^2;
            I = repmat(1:D, ps, 1);
            z = sum( I .* x2, 2);
        case 10 
            z = x(:,1) + sqrt(sum(x(:,2:D).^2, 2));
        case 11 
            beta = 15;
            m = 5;
            z = exp(-sum((x / beta).^(2*m), 2)) - (2 * exp(-sum(x .^ 2, 2)) .* prod(cos(x) .^ 2, 2));
        case 12 
            f = 0;
            for i = 2:D
                f = f + i*(2 * x(:,i).^2 - x(:,i-1)).^2;
            end
            z = (x(:,1)-1).^2 + f;
        case 13
            z = -(1/D) * sum(x.*sin(sqrt(abs(x))),2);
        case 14 
            z = sum(x.^2-10*cos(2*pi.*x)+10);
        case 15 
            f = sum(x.^2,2);
            z = 20 - 20 * exp(-0.2*sqrt(f/D))-exp(sum(cos(2*pi*x),2)/D)+exp(1);
        case 16 
            f = 1;
            for i = 1:D
                f = f .* cos(x(:,i) ./ sqrt(i));
            end
            z = sum(x.^2,2)./4000 - f + 1;
        case 17 %
            y = 1 + (x + 1)./4;
            u = (x > 10).*100.*((x-10).^4) + (x<=10).*0;
            u = ( x <- 10).*100.*((-x-10).^4) + (x>=-10).*0;
            sum1 = 0;
            for i = 1:D-1
                sum1 = sum1 + (y(:,i)-1).^2.*(1+10*sin(pi*y(:,i+1)).^2);
            end
            z = pi / 30 * (10*(sin(pi*y(:,1))).^2 + sum1 + (y(:,D)-1).^2 ) + sum(u,2);
        case 18
            u = (x>5).*100.*((x-5).^4) + (x<=5).*0;
            u = (x<-5).*100.*((-x-5).^4) + (x>=-5).*0;
            sum1 = 0;
            for i = 1:D-1
                sum1 = sum1+(x(:,i)-1).^2.*(1+sin(3*pi*x(:,i+1)).^2);
            end
            z = 0.1*(sin(3*pi*x(:,1)).^2 + sum1 + (x(:,D)-1).^2.*(1+sin(2*pi*x(:,D)).^2)) + sum(u,2);
        case 19
            sin2x = sin(x) .^ 2;
            sumx2 = sum(x .^2, 2); 
            z = 1 + sum(sin2x, 2) -0.1 * exp(-sumx2);
        case 20
            z = 0;
            for i = 1:(D-1)
                z = z + exp(-0.2).*sqrt(x(:,i).^2+x(:,i+1).^2)+3*(cos(2*x(:,i)+sin(2*x(:,i+1))));
            end
        case 21
            z = sum(abs(x),2) .* exp(-sum(sin(x.^2),2));
        case 22
            z = (sum(sin(x) .^2, 2) - exp(-sum(x .^ 2, 2))) .* exp(-sum(sin(sqrt(abs(x))) .^2, 2));
        case 23
            f = 0;
            for i = 1:D
                f = f + x(:,i).^4 - 16*x(:,i).^2 + 5*x(:,i);
            end
            z = f/2;
        case 24
            f = sqrt(sum(x.^2, 2));
            z = 1 - cos(2*pi.*f) + 0.1 * f;
        case 25
            f = sum(x.*x, 2);
            z = ((f - D).^2).^0.5 + (1/D)*(0.5.*f + sum(x,2)) + 0.5;
        case 26
            z = 0;
            for i = 1:D
                z = z + (x(:,i).^2 - i).^2;
            end
    end