class CreateProjectsArchives < ActiveRecord::Migration[7.1]
  def change
    create_table :projects_archives do |t|
      t.references :user, null: false, foreign_key: true
      t.references :project, null: false, foreign_key: true
      t.string :archive
      t.string :description
      t.string :project_type
      t.timestamps
    end
  end
end
