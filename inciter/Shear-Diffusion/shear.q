# vim: filetype=sh:
# This is a comment
# Keywords are case-sensitive

title "Dispersion from a point source in simple shear flow"

inciter
  
  t0   0.1     # Start time
  term 0.3     # Max time
  cfl 0.5
  ttyi 10      # TTY output interval

  transport
    physics advdiff
    problem shear_diff
    ncomp 1
    depvar c
    diffusivity 3.0 2.0 1.0 end
    u0 10.0 end
    lambda 0.5 1.0 end
  end
  
  field_output
    interval 50
  end

end
