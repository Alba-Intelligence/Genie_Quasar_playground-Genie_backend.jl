#
# Skeleton created in scratchpad
# Genie.newcontroller("Books")
#
module BooksController

using Genie.Renderer.Html, Genie.Renderer.Json

struct Book
    title::String
    author::String
end

const BillGatesBooks = Book[
    Book("The Best We Could Do", "Thi Bui"),
    Book("Evicted: Poverty and Profit in the American City", "Matthew Desmond"),
    Book("Believe Me: A Memoir of Love, Death, and Jazz Chickens", "Eddie Izzard"),
    Book("The Sympathizer!", "Viet Thanh Nguyen"),
    Book("Energy and Civilization, A History", "Vaclav Smil"),
]

function billgatesbooks()
    # json(resource, action, )
    json(:books, :billgatesbooks; books = BooksController.BillGatesBooks)
end


# function billgatesbooks()
#     html(:books, :billgatesbooks; layout = :admin, books = BillGatesBooks)
# end


#
# Submodule within BooksController
#
module API

using ..BooksController
using Genie.Renderer.Json

function billgatesbooks()
    json(BooksController.BillGatesBooks)
end

end # end module API

end # end module BooksController
