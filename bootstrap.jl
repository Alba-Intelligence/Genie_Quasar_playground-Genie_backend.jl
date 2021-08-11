#
# DO NOT MODIFY
#

# If started from bin, move back up to the module top directory @__DIR__
pwd() == joinpath(@__DIR__, "bin") && cd(@__DIR__)

using Genie_Vue3_Plotly_Babylon_playground__Genie_side

# This is executed only ONCE
Genie_Vue3_Plotly_Babylon_playground__Genie_side.main()
