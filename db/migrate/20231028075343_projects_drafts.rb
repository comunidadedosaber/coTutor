class ProjectsDrafts < ActiveRecord::Migration[7.1]
  def change
    create_table :projects_drafts do |t|
      t.bigint :project_id, null: false
      t.string :theme
      t.text :introdution, null: true
      t.text :problem, null: true
      t.text :study_object, null: true
      t.text :action_field, null: true
      t.text :general_objective, null: true
      t.text :specific_objective, null: true
      t.text :justification, null: true
      t.text :hypothesis, null: true
      t.text :variables, null: true
      t.text :methodology, null: true
      t.text :search, null: true
      t.text :methods, null: true
      t.text :techniques, null: true
      t.text :structure, null: true
      t.text :references, null: true
      t.string :state, default: "Analisando"
      t.timestamps
    end

    add_foreign_key :projects_drafts, :projects, column: :project_id, on_delete: :cascade 
    add_index :projects_drafts, :theme, unique: true   
  end
end
