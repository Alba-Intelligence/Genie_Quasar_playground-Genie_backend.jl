#
# START THE SERVER FROM COMAND LINE "julia bin/start_rest.jl" or "julia bootstrap.jl"
#
using Genie, Genie.Router
using Genie.Renderer, Genie.Renderer.Json, Genie.Requests


#
# Default Hello page
#
route("/") do
    serve_static_file("welcome.html")
end


route("/echo", method = POST) do
    message = jsonpayload()
    (:echo => (message["message"] * " ")^message["repeat"]) |> json
end


using HTTP
route("/send") do
    response = HTTP.request(
        "POST",
        "http://$(Genie.config.server_host):$(Genie.config.server_port)/echo",
        [("Content-Type", "application/json")],
        """{"message":"hello", "repeat":3}""",
    )

    response.body |> String |> json
end



#
# Various "Hello World"'s
#
using Genie.Renderer.Html
route("/hello.html") do
    html("Hello World")
end

using Genie.Renderer.Json
route("/hello.json") do
    json("Hello World")
end


# This requires the generic Genie.Renderer
route("/hello.txt") do
    Genie.Renderer.respond("Hello World", :text)
end


#
# Completely random raster image encoded as PNG Base 64
#
using FileIO, Images, ImageMagick, Base64, Pipe
route("/randomimage") do
    buffer = Base.IOBuffer()
    @pipe rand(RGB, 640, 480) |> ImageMagick.save(Stream(format"PNG", buffer), _)
    data = buffer |> take! |> base64encode
    close(buffer)

    html("""<img src="data:image/pmg;base64,$(data)">""")
end




#
# Contour plot prepared by PlotlyJS, returned as a fully functional html page by the API
# This uses NO temporary file.
#
using Plots, PlotlyJS
route("/contour") do
    plotlyjs()
    # create a plot with 3 subplots - No layout
    default(legend = false)

    x = y = range(-5, 5, length = 50)
    f(x, y) = sin(x + 10sin(π / 3)) + cos(y)

    plot_contour = Plots.plot(x, y, f, st = :contourf)

    # PlotlyJS is required for this method to be available.
    Plots.embeddable_html(plot_contour)
end



#
# 3D surface plot prepared by PlotlyJS, returned as a fully functional html page by the API
#
using Plots, PlotlyJS
route("/surface3d") do
    plotlyjs()
    # create a plot with 3 subplots - No layout
    default(legend = false)

    x = y = range(-5, 5, length = 50)
    f(x, y) = sin(x + 10sin(π / 3)) + cos(y)

    plot_surface = Plots.plot(x, y, f, st = :surface)

    # Origin = https://github.com/JuliaPlots/Plots.jl/blob/master/src/backends/plotlyjs.jl
    Plots.embeddable_html(plot_surface)
end
