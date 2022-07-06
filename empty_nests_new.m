function new_nest = empty_nests_new(~, c_nest ,nest, Lb, Ub, pa, iter, ~)
% function new_nest = empty_nests(c_nest ,nest,Lb,Ub,pa,iter)
    [np, nd] = size(nest);
    K = rand(size(nest)) > pa;
    for i = 1:np
        temp_x = (log(iter) / iter) .* (c_nest - nest(i,:));
        stepsize = nest(randperm(np,1),:) - nest(randperm(np,1),:);  
%         Cauchy = (1/pi).*((temp_x+1e-100)./((nest(i,:)-c_nest).^2 + (temp_x+1e-100).^2));%柯西函数
%         Cauchy = (1/pi)*((iter*log(iter)).*(c_nest - nest(i,:)))./(iter^2.*(nest(i,:)-c_nest).^2 + (log(iter).*(c_nest-nest(i,:)).^2));
        Cauchy = tan(((temp_x+1e-10) - rand(size(nest(i,:)))) .* pi);
%         nest(i,:)
        Gaussian = 1./((temp_x+1e-10).*(2*pi)^(1/2)).*exp((-1/2).*((c_nest-nest(i,:))./(temp_x+1e-100)).^2);%高斯函数
%         Gaussian
        new_nest(i,:) = Gaussian + Cauchy.*stepsize;
        for j = 1:nd
            if K(i,j) == 0
                new_nest(i,j) = nest(i,j);
            end
        end
        s = new_nest(i,:);
        new_nest(i,:) = simplebounds(s,Lb,Ub);
    end
    
%     [np, nd] = size(nest);
%     K = rand(size(nest)) > pa;
%     for i = 1:np
%         temp_x = (log(iter) / iter) .* (c_nest - nest(i,:));
%         stepsize = nest(randperm(np,1),:) - nest(randperm(np,1),:);  
%         Cauchy = tan(((temp_x+1e-10) - rand) .* pi);
%         Gaussian = 1./((temp_x+1e-10).*(2*pi)^(1/2)).*exp((-1/2).*((c_nest-nest(i,:))./(temp_x+1e-100)).^2);
%         new_nest(i,:) = Gaussian + Cauchy.*stepsize;
%         fnew = test_function(new_nest(i,:), evaAttrs);
% %         fnew = benchmark_funcs(new_nest(i,:), num_f); % real-world
%         if fnew < fitness(i)
%             fitness(i) = fnew;
%             nest(i,:) = new_nest(i,:);
%         end
%         new_nest(i,:) = imp_local(nest(i,:), np, nest);
%         new_nest(i,:) = simplebounds(new_nest(i,:),Lb,Ub);
%         fnew = test_function(new_nest(i,:), evaAttrs);
% %         fnew = benchmark_funcs(new_nest(i,:), num_f); % real-world
%         num = sum(K(i,:) == 0);
%         if fnew < fitness(i) || num >= nd/3
%             fitness(i) = fnew;
%             nest(i,:) = new_nest(i,:);
%         end
%         s = nest(i,:);
%         new_nest(i,:) = simplebounds(s,Lb,Ub);
% %         new_nest(i,:) = s;
%     end

% function new_nest = empty_nests(bestnest,nest,Lb,Ub,pa, iter, Itermax)  
%     n = size(nest,1);  
%     K = rand(size(nest)) > pa;  
%     for i = 1:n
%         stepsize = bestnest - nest(randperm(n,1),:);  
%         cauchy = 0.1./(pi*((nest(i,:)-bestnest).^2 + 0.01));
%         fn = 1/2 * (sin(2*pi*cauchy*iter)*((Itermax-iter)/Itermax)+1);
%         new_nest(i,:) = nest(i,:) + fn .* stepsize .* K(i,:); 
%     end
%     for j = 1:size(new_nest,1)  
%         s = new_nest(j,:);  
%         new_nest(j,:) = simplebounds(s,Lb,Ub);    
%     end  

% function new_nest = empty_nests(bestnest,nest,Lb,Ub,pa)  
%     n = size(nest,1);  
%     K = rand(size(nest)) > pa;  
%     for i = 1:n
%         stepsize = rand * (bestnest - nest(randperm(n,1),:));  
%         new_nest(i,:) = nest(i,:) + stepsize .* K(i,:); 
%     end
%     for j = 1:size(new_nest,1)  
%         s = new_nest(j,:);  
%         new_nest(j,:) = simplebounds(s,Lb,Ub);    
%     end  
