function n_pa = updata_pa(pa, pd)
    [n, nd] = size(pa);
    for j = 1:n
        for i = 1:nd
            if pd(i) < 0.7
                new_pa(i) = 0.1 + 0.1 * rand;
            elseif pd(i) > 1
                new_pa(i) = 0.3 + 0.1 * rand;
            else
                new_pa(i) = 0.2 + 0.1 * rand;
            end
        end
        n_pa(j, :) = new_pa;
    end