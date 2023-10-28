class CreateProjectsDrafts < ActiveRecord::Migration[7.1]
  def change
    create_table :projects_drafts do |t|
      t.references :project, null: false, foreign_key: true
      t.string :theme
      t.text :introduction
      t.text :problem
      t.text :study_object
      t.text :action_field
      t.text :general_objective
      t.text :specific_objective
      t.text :justification
      t.text :hypothesis
      t.text :variables
      t.text :methodology
      t.text :search
      t.text :methods
      t.text :techniques
      t.text :structure
      t.text :references
      t.string :state
      t.timestamps
    end
  end
end
