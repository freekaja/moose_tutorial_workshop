[GlobalParams]
  displacements = 'disp_x disp_y disp_z'
[]

[Mesh]
  file = media/mug.e
[]

[Variables]

[]

[Modules/TensorMechanics/Master]
  [./block1]
    strain = SMALL #Small linearized strain, automatically set to XY coordinates
    add_variables = true #Add the variables from the displacement string in GlobalParams
  [../]
[]



[Materials]
  [./elasticity_tensor]
    # Standard Isotropic Elasticty Tensor
    type = ComputeIsotropicElasticityTensor
    youngs_modulus = 2.1e6 # MPa
    poissons_ratio = 0.3  #
  [../]
  [./stress]
    type = ComputeLinearElasticStress
  [../]
[]

[BCs]
  [./bottom] # arbitrary user-chosen name
    type = DirichletBC
    variable = disp_z
    boundary = 'bottom' # This must match a named boundary in the mesh file
    value = 0 # displacement
  [../]

  [./top] # arbitrary user-chosen name
    type = DirichletBC
    variable = disp_z
    boundary = 'top' # This must match a named boundary in the mesh file
    value = 0.1 # displacement
  [../]


  [./disp_x_fix] # arbitrary user-chosen name
    type = DirichletBC
    variable = disp_x
    boundary = 'top bottom' # This must match a named boundary in the mesh file
    value = 0.0 # displacement
  [../]

  [./disp_y_fix] # arbitrary user-chosen name
    type = DirichletBC
    variable = disp_y
    boundary = 'top bottom' # This must match a named boundary in the mesh file
    value = 0.0 # displacement
  [../]
[]

[Preconditioning]
  [./SMP]
    type = SMP
    full = true
  [../]
[]

[Executioner]
  type = Steady

  solve_type = 'NEWTON'

  petsc_options = '-snes_ksp_ew'
  petsc_options_iname = '-pc_type -sub_pc_type -pc_asm_overlap -ksp_gmres_restart'
  petsc_options_value = 'asm lu 1 101'

  nl_rel_tol = 5e-9
  nl_abs_tol = 1e-10
  nl_max_its = 15
  l_tol = 1e-3
  l_max_its = 50
[]


[Outputs]
  exodus = true
  perf_graph = true
[]
