function new_solu = imp_local(solu, n, S)
    sel = randperm(n);
    solu = solu + rand .* (S(sel(1)) - solu) + 0.5 * (S(sel(2)) - S(sel(3)));
    new_solu = solu;