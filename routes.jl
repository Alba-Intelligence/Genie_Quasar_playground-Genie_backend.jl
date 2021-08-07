#
# START THE SERVER FROM COMAND LINE "julia start_rest.jl"
#
using Genie, Genie.Router, Genie.Renderer.Json, Genie.Requests

using SearchLightSQLite


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
        "http://localhost:8000/json/echo",
        [("Content-Type", "application/json")],
        """{"message":"hello", "repeat":3}""",
    )

    response.body |> String |> json
end



using Genie.Renderer.Html
using FileIO, Images, ImageMagick, Base64

route("/randomimage") do
    randimage = rand(RGB, 1000, 1000)
    buffer = Base.IOBuffer()
    ImageMagick.save(Stream(format"PNG", buffer), randimage)
    data = base64encode(take!(buffer))
    close(buffer)
    html("""<img src="data:image/pmg;base64,$(data)">""")

end


#
# Load the controller BooksController
#
using BooksController

route("/bgbooks", BooksController.billgatesbooks)
route("/api/v1/bgbooks", BooksController.API.billgatesbooks)
