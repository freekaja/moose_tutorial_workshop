[Mesh]
  # We use a pre-generated mesh file (in exodus format).
  # This mesh file has 'top' and 'bottom' named boundaries defined inside it.
  file = media/mug.e
[]

[Variables]
  [./diffused]
    order = FIRST
    family = LAGRANGE
  [../]
[]

[Kernels]
  [./diff]
    type = Diffusion
    variable = diffused
  [../]
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
    diffusion_variable = diffused
    component = z
  [../]
[]

[Materials]
  [./k]
    type = GenericConstantMaterial
    prop_names = 'thermal_conductivity'
    prop_values = '10' # in W/mK
  []
[]


[BCs]
  [./bottom] # arbitrary user-chosen name
    type = DirichletBC
    variable = diffused
    boundary = 'bottom' # This must match a named boundary in the mesh file
    value = 1
  [../]

  [./top] # arbitrary user-chosen name
    type = DirichletBC
    variable = diffused
    boundary = 'top' # This must match a named boundary in the mesh file
    value = 0
  [../]
[]

[Postprocessors]
  [./Average]
    type = ElementAverageValue
    variable = diffused
  [../]
[]
[Executioner]
  type = Steady
  solve_type = 'Newton'
[]

[Outputs]
  execute_on = 'timestep_end'
  exodus = true
  csv= true
[]
