class CreateProjectsMembers < ActiveRecord::Migration[7.1]
  def change
    create_table :projects_members do |t|
      t.references :user, null: false, foreign_key: true
      t.references :project, null: false, foreign_key: true
      t.string :perfil_type
      t.timestamps
    end
  end
end
