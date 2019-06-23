class Tag < BaseModel
  table :tags do
    column name : String

    has_many taggings : Tagging
    has_many posts : Post, through: :taggings
  end
end
