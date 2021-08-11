# Genie+Vue3+Plotly+Babylon playground / Genie side

This repo is a playground of mixing Vue3 / Babylon as packaged by `Quasar`, along with Julia `Genie.jl` REST API end points delivering `PlotlyJS` plots.

This is to be used with the partner repo `Genie_Vue3_Plotly_Babylon_playground__Quasar_side`

## How-to

This is currently tested as a development server. All configs are in `config/env/dev.jl`. The port is fixed at 9009. The only requirement is that it be different from the Quasar server (currently 9001).

Look into `start_rest.jl` and execute line-by-line.

All the routes are defined in `routes.jl`. They are in increasing order of difficulty. And they are a WIP. Typically, only a couple at the very bottom are the actual WIP and probably not yet working.


## Notes

Logging is set to maximum at `Logging.BelowMinLevel` and filed under the `log` directory.

Methods are usually fully qualified to better remember in which package they are defined.

Code formatting should not be a matter of personal preference when on a repo; life is too short. Any commit is subjected to `julia --eval "using JuliaFormatter; format(@__DIR__)" ;; git add "*"` beforehand.

