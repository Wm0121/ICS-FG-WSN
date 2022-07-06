function [fmin,best,nest,fitness] = get_best_nest(nest, newnest, fitness, D, num_f)  
    for j = 1:size(nest,1),  
        fnew = test_function(newnest(j,:), D, num_f);
        if fnew <= fitness(j),  
           fitness(j) = fnew;  
           nest(j,:) = newnest(j,:);  
        end  
    end  
    [fmin,K] = min(fitness) ;  
    best = nest(K,:);  