function pd = get_diversity(nest,maxpd)
    [n, nd] = size(nest);
    nest_mean = zeros(1, nd);
    pd = zeros(1, nd);
    for j = 1:nd
        temp = 0;
        for i = 1:n
            temp = temp + nest(i,j);
        end
        nest_mean(1,j) = temp / n;
    end
    for j = 1:nd
        nest_sum(j) = 0;
        for i = 1:n
            nest_medium(i,j) = abs(nest(i,j) - nest_mean(1,j));
            nest_sum(j) = nest_sum(j) + nest_medium(i,j);
        end
        nest_final(j) = nest_sum(j) ./ n;
        pd(1,j) = nest_final(j) / maxpd(j);
    end