# vim: filetype=sh:
# This is a comment
# Keywords are case-sensitive

title "Zalesak's slotted cylinder"

inciter
  
  #nstep 10  # Max number of time steps
  #term 6.28318530718  # Max time = 2*pi
  term 1.57079632679  # Max time = pi/2
  #term 0.78539816339  # Max time = pi/4
  #term 0.39270  # Max time = pi/8
  cfl  0.5
  ttyi 10      # TTY output interval
  ctau 1.0  # FCT mass diffusivity
    
  transport
    physics advection
    problem slot_cyl
    ncomp 1
  end

  plotvar
    interval 100
  end

end
