class CreateProjectsSuggestions < ActiveRecord::Migration[7.1]
  def change
    create_table :projects_suggestions do |t|
      t.references :project, null: false, foreign_key: true      
      t.text :sugestions
      t.timestamps
    end
  end
end
