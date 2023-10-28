class ProjectsKeywords < ActiveRecord::Migration[7.1]
  def change
    create_table :projects_keywords do |t|
      t.bigint :project_id, null: false
      t.string :type, null: true
      t.string :keyword, null: true
      t.timestamps
    end

    add_foreign_key :projects_keywords, :projects, column: :project_id, on_delete: :cascade  
    add_index :projects_keywords, :keyword
  end
end
