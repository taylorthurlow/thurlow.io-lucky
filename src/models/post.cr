class Post < BaseModel
  table :posts do
    column title : String
    column tagline : String
    column contents : String
    column slug : String
    column published : Bool
    column last_updated : Time?
  end
end
