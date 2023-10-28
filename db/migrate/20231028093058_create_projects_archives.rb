class CreateProjectsArchives < ActiveRecord::Migration[7.1]
  def change
    create_table :projects_archives do |t|
      t.references :project, null: false, foreign_key: true
      t.string :project_type
      t.string :archive
      t.timestamps
    end
  end
end
