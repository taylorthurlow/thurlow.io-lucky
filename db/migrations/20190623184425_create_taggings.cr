class CreateTaggings::V20190623184425 < Avram::Migrator::Migration::V1
  def migrate
    create :taggings do
      # When a tag is deleted, delete all of its associated taggings
      add_belongs_to tag : Tag, on_delete: :cascade

      # When a post is deleted, delete all of its associated taggings
      add_belongs_to post : Post, on_delete: :cascade
    end
  end

  def rollback
    drop :taggings
  end
end
