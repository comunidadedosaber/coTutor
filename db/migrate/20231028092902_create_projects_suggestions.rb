class CreateProjectsSuggestions < ActiveRecord::Migration[7.1]
  def change
    create_table :projects_suggestions do |t|
      t.references :user, null: false, foreign_key: true
      t.references :project, null: false, foreign_key: true      
      t.text :suggestion
      t.string :project_type
      t.timestamps
    end
  end
end
