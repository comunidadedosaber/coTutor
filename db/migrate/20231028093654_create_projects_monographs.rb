class CreateProjectsMonographs < ActiveRecord::Migration[7.1]
  def change
    create_table :projects_monographs do |t|
      t.references :project, null: false, foreign_key: true
      t.string :theme
      t.string :editor
      t.string :language
      t.string :country
      t.string :project_type
      t.string :pages
      t.text :terms_use
      t.text :objective
      t.string :keywords
      t.text :index
      t.text :summary
      t.string :state
      t.string :privacy
      t.integer :lective_year
      t.timestamps
    end
  end
end
