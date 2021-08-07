module Books

import SearchLight: AbstractModel, DbId, save!
import Base: @kwdef

export Book

@kwdef mutable struct Book <: AbstractModel
  id::DbId = DbId()
  title::String = ""
  author::String = ""
end

function seed()
  BillGatesBooks = [
    ("The Best We Could Do", "Thi Bui"),
    ("Evicted: Poverty and Profit in the American City", "Matthew Desmond"),
    ("Believe Me: A Memoir of Love, Death, and Jazz Chickens", "Eddie Izzard"),
    ("The Sympathizer!", "Viet Thanh Nguyen"),
    ("Energy and Civilization, A History", "Vaclav Smil")
  ]

  for b in BillGatesBooks
    Book(title = b[1], author = b[2]) |> save!
  end
end

end