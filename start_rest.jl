#
# Run the REST server on 127.0.0.1:9009
# Note that the host/port are defined in config/env/dev.jl (for the devpt environment)
#
#


using Genie, Genie.Router, Genie.Renderer.Html
using FileIO, Images, ImageMagick, Base64


include("bootstrap.jl")

"""
    force_compile!()

Force precompilation of the routes.
https://genieframework.github.io/Genie.jl/dev/tutorials/80--Force_Compiling_Routes.html
"""
function force_compile!()
    # Wait for package loading including initialisers
    sleep(5)

    for (name, r) in Router.named_routes()
        Genie.Requests.HTTP.request(
            r.method,
            "http://$(Genie.config.server_host):$(Genie.config.server_port)" * tolink(name),
        )
    end
end
@async force_compile!()


Genie.up(async = true, open_browser = false)
