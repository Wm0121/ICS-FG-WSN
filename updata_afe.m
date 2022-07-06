function n_afe = updata_afe(pa, pd)
    [n, nd] = size(pa);
    for j = 1:n
        for i = 1:nd
            if pd(i) < 0.7
                new_pa(i) = 0.015 + 0.005 * rand;
            elseif pd(i) > 1
                new_pa(i) = 0.005 + 0.005 * rand;
            else
                new_pa(i) = 0.01 + 0.005 * rand;
            end
        end
        n_afe(j, :) = new_pa;
    end