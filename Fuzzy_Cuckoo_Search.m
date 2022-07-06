function Fuzzy_Cuckoo_Search()  
    for kl = 1:1
        num_f = 1;
        n = 50;
        nd = 30;
        N_iter  = 50000; 
        pa = 0.25 * ones(n, nd); 
        [Lb, Ub, nest, fitness] = init_data(num_f, nd, n); %constraint  
        [fmin, bestnest, nest, fitness] = get_best_nest(nest, nest, fitness, nd, num_f);  
        maxpd = 1 * ones(1, nd); 
        maxpd = get_diversity(nest,maxpd);
        pdnew = maxpd;
        afe = 0.01 * ones(1, nd); 
        iter = 0;  
        it = 1;
        while iter <= N_iter
%         for iter = 1:N_iter
%             iter = 1 + iter;
            new_nest = get_cuckoos(nest, bestnest, Lb, Ub, afe);
            iter = iter + n;
            pdnew = get_diversity(new_nest,maxpd);
%             afe = 0.01;
%             pa = 0.25;
            afe = updata_afe(afe, pdnew);
            pa = updata_pa(pa, pdnew);     
            [~,~, nest, fitness] = get_best_nest(nest, new_nest, fitness, nd, num_f); 
%             new_nest = empty_nets(nest,Lb,Ub,pa); 
            new_nest = empty_nests_new(fitness, bestnest, nest, Lb, Ub, pa, it, num_f);  
            iter = iter + n;
            [fnew, best, nest, fitness] = get_best_nest(nest, new_nest, fitness, nd, num_f); 
            if fnew < fmin
                fmin = fnew;  
                bestnest = best;  
            end  
            it = 1 + it;
%             p(iter,:) = pdnew;
            gf(kl,(iter+1-2*n):(iter)) = fmin;
%             f_min(iter) = fmin;
        end
%         X(kl,:) = [bestnest fmin];
%         f_min
fmin
    end
%     figure
%     set(gca,'FontName','Times New Roman','FontSize',12);
% %     f_min = log(f_min);
%     plot(p);
%     title('Population Diversity for Function 10 ')
%     ylabel('Diversity')
%     xlabel('Iterations')
    f = gf';
%     xlswrite(['C:\Users\Wm\Desktop\改进布谷鸟搜索算法在WSN节点定位中的应用\Data_D=30\F',num2str(num_f),'.xls'],f,'IterCSG')
%     xlswrite(['E:\论文\论文\改进布谷鸟搜索算法在WSN节点定位中的应用\Data_D=50\F',num2str(num_f),'.xls'],f,'IterIFGCS')
%     xlswrite(['E:\论文\论文\改进布谷鸟搜索算法在WSN节点定位中的应用\Data_D=50\F',num2str(num_f),'.xls'],X,'DataIFGCS')
%     gf = log(gf);,
%     figure
%     plot(gf);