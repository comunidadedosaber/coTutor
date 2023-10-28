class ProjectsSugestions < ActiveRecord::Migration[7.1]
  def change
    create_table :projects_sugestions do |t|
      t.bigint :project_id, null: false
      t.string :type, null: true
      t.text :sugestions, null: true
      t.timestamps
    end

    add_foreign_key :projects_sugestions, :projects, column: :project_id, on_delete: :cascade  
  end
end
