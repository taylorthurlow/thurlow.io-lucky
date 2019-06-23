class CreateTags::V20190623184241 < Avram::Migrator::Migration::V1
  def migrate
    create :tags do
      add name : String, unique: true
    end
  end

  def rollback
    drop :tags
  end
end
