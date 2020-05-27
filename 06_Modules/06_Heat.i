[Mesh]
  file = media/mug.e
[]

[Variables]
  [./temperature]
    order = FIRST
    family = LAGRANGE
    initial_condition = 330 # Start at room temperature
  [../]
[]

[Kernels]
  [./heat_conduction]
    type = HeatConduction
    variable = temperature
  []
  [./heat_conduction_time_derivative]
    type = HeatConductionTimeDerivative
    variable = temperature
  []
[]


[AuxVariables]
  [./flux_z]
    order = FIRST
    family = MONOMIAL
  []
[]

[AuxKernels]
  [./flux_z]
    type = DiffusionFluxAux
    diffusivity = 'thermal_conductivity'
    variable = flux_z
    diffusion_variable = temperature
    component = z
  [../]
[]

[Materials]
  [./k]
    type = GenericConstantMaterial
    prop_names = 'thermal_conductivity specific_heat density'
    prop_values = '18 0.466 8000' # W/m*K, J/kg-K, kg/m^3 @ 296K
  []
[]

[BCs]
  [./bottom] # arbitrary user-chosen name
    type = DirichletBC
    variable = temperature
    boundary = 'bottom' # This must match a named boundary in the mesh file
    value = 500 # (K)
  [../]

  [./top] # arbitrary user-chosen name
    type = DirichletBC
    variable = temperature
    boundary = 'top' # This must match a named boundary in the mesh file
    value = 330 # (K)
  [../]
[]

[Executioner]
  type = Transient
  dt = 20
  num_steps = 50
  solve_type = NEWTON
[]

[Outputs]
  execute_on = 'timestep_end'
  exodus = true
[]
