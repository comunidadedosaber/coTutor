class ProjectsArchives < ActiveRecord::Migration[7.1]
  def change
    create_table :projects_archives do |t|
      t.bigint :project_id, null: false
      t.string :type, null: true
      t.string :archive, null: true
      t.timestamps
    end

    add_foreign_key :projects_archives, :projects, column: :project_id, on_delete: :cascade
  end
end
