class ProjectsProposals < ActiveRecord::Migration[7.1]
  def change
    create_table :projects_proposals do |t|
      t.bigint :project_id, null: false
      t.string :theme
      t.text :objectives, null: true
      t.text :summary, null: true
      t.text :literature, null: true
      t.string :state, default: "Analisando"
      t.timestamps
    end

    add_foreign_key :projects_proposals, :projects, column: :project_id, on_delete: :cascade 
    add_index :projects_proposals, :theme, unique: true  
  end
end
