# 05 Post Processor

In additions, user might want to aggregate data into a single scalar value. such as maximum or average of the values. This comes in the forms of the post processor.

There are a number of post processor available in MOOSE, some includes

  * `ElementAverageValue` - Average values
  * `ElementL2Norm` - L2 Norm of the elements


Suppose we want to calculate the average `diffused` value for the whole domain:

    [Postprocessors]
      [./Average]
        type = ElementAverageValue # Average value
        variable = diffused # Variable it operating on
      [../]
    []

    [Outputs]
      execute_on = 'timestep_end'
      exodus = true
      csv= true  # Need this to be true for it to output data
    []

Running this `05_PostProcessor.i` will give us a csv file.
