class RemoveUsers::V20190608123654 < Avram::Migrator::Migration::V1
  def migrate
    drop :users
    # create :things do
    #   add title : String
    #   add description : String?
    # end

    # Run custom SQL with execute
    #
    # execute "CREATE UNIQUE INDEX things_title_index ON things (title);"
  end

  def rollback
    create :users do
      add email : String
      add encrypted_password : String
    end

    create_index :users, :email, unique: true
  end
end
