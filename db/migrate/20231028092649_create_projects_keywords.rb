class CreateProjectsKeywords < ActiveRecord::Migration[7.1]
  def change
    create_table :projects_keywords do |t|
      t.references :project, null: false, foreign_key: true
      t.string :project_type
      t.string :keyword
      t.timestamps
    end
  end
end
