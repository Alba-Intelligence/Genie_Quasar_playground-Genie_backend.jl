module Genie_Vue3_Plotly_Babylon_playground__Genie_side

using Genie, Logging, LoggingExtras

function main()
    Core.eval(Main, :(const UserApp = $(@__MODULE__)))

    Genie.genie(; context = @__MODULE__)

    Core.eval(Main, :(const Genie = UserApp.Genie))
    Core.eval(Main, :(using Genie))
end

end
