
Genie.newcontroller("Books")

using SearchLight
SearchLight.Generator.newresource("Book")




using Genie.Router, Genie.Renderer.Html
using FileIO, Images, ImageMagick, Base64

route("/") do
    randimage = rand(RGB, 1000, 1000)
    buffer = Base.IOBuffer()
    ImageMagick.save(Stream(format"PNG", buffer), randimage)
    data = base64encode(take!(buffer))
    close(buffer)
    html("""<img src="data:image/pmg;base64,$(data)">""")

end
