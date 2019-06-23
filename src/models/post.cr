class Post < BaseModel
  table :posts do
    column title : String
    column tagline : String
    column contents : String
    column slug : String
    column published : Bool
    column last_updated : Time?

    has_many taggings : Tagging
    has_many tags : Tag, through: :taggings
  end

  def all_tags
    tags!.map(&.name).join(", ")
  end
end
