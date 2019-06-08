class CreatePosts::V20190608130559 < Avram::Migrator::Migration::V1
  def migrate
    create :posts do
      add title : String
      add tagline : String
      add contents : String
      add slug : String
      add published : Bool
      add last_updated : Time?
    end
  end

  def rollback
    drop :posts
  end
end
