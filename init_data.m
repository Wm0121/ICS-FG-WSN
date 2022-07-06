function [Lb, Ub, nest, fitness] = init_data(num_f, nd, n)
    if num_f == 1 || num_f == 3 || num_f == 4 || num_f == 6 || num_f == 16 || num_f == 24
        Lb = -100 * ones(1, nd);
        Ub = 100 * ones(1, nd);
    elseif num_f == 13 || num_f == 26
        Lb = -500 * ones(1, nd);
        Ub = 500 * ones(1, nd);
    elseif num_f == 5
        Lb = -30 * ones(1, nd);
        Ub = 30 * ones(1, nd);
    elseif num_f == 7
        Lb = -1.28 * ones(1, nd);
        Ub = 1.28 * ones(1, nd);
    elseif num_f == 14
        Lb = -5.12 * ones(1, nd);
        Ub = 5.12 * ones(1, nd);
%     elseif num_f == 11
%         Lb = -20 * ones(1, nd);
%         Ub = 20 * ones(1, nd);
    elseif num_f == 2 || num_f == 9 || num_f == 12 || num_f == 19 || num_f == 22
        Lb = -10 * ones(1, nd);
        Ub = 10 * ones(1, nd);
    elseif num_f == 17 || num_f == 18
        Lb = -50 * ones(1, nd);
        Ub = 50 * ones(1, nd);
    elseif num_f == 8
        Lb = -5 * ones(1, nd);
        Ub = 10 * ones(1, nd);
    elseif num_f == 10 || num_f == 23
        Lb = -5 * ones(1, nd);
        Ub = 5 * ones(1, nd);
    elseif num_f == 15 || num_f == 20
        Lb = -35 * ones(1, nd);
        Ub = 35 * ones(1, nd);
    elseif num_f == 25
        Lb = -2 * ones(1, nd);
        Ub = 2 * ones(1, nd);
    elseif num_f == 21 || num_f == 11
        Lb = -2*pi * ones(1, nd);
        Ub = 2*pi * ones(1, nd);
    end
    for i = 1:n,  
        nest(i,:) = Lb + (Ub - Lb) .* rand(size(Lb));  
%         nest(i,:) = rand(1, nd); %real-world 
%         nest(i,:) = fminsearch(@(nest) test_function(nest,nd,num_f),nest(i,1:nd));
%         nest(i,:) = patternsearch(@(nest) test_function(nest,nd,num_f),nest(i,1:nd));
%         nest(i,:) = fminunc(@(nest) test_function(nest,nd,num_f),nest(i,1:nd));
    end  
    fitness = 10^100 * ones(n,1);  