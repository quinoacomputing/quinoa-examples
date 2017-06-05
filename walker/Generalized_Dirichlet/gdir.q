title "Generalized Dirichlet for JMP paper"

walker
  term  140.0   # Max time
  dt    0.025   # Time step size
  npar  10000   # Number of particles
  ttyi  1000    # TTY output interval

  rngs
    mkl_mrg32k3a seed 0 end
  end

  gendir        # Select generalized Dirichlet SDE
    depvar y
    init zero
    coeff const
    ncomp 2   # = K = N-1
    b     0.1    1.5 end
    S     0.625  0.4 end
    kappa 0.0125 0.3 end
    c     -0.0125    end
    rng mkl_mrg32k3a    
  end

  statistics    # Estimate statistics
    <Y1>
    <Y2>
    <y1y1>
    <y2y2>
    <y1y2>
  end
end
