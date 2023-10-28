class ProjectsMonographs < ActiveRecord::Migration[7.1]
  def change
    create_table :projects_monographs do |t|
      t.bigint :project_id, null: false
      t.string :theme
      t.string :editor, default: "Comunidade do Saber - CS"
      t.string :language, default: "Português"
      t.string :country, default: "Angola"
      t.string :type, default: "Monografia/TCC"
      t.string :pages, null: true
      t.text :terms_use, null: true
      t.text :objective, null: true
      t.string :keywords, null: true
      t.text :index, null: true
      t.text :summary, null: true
      t.string :state, default: "Analisando"
      t.string :privacy, default: "Privado"
      t.integer :lective_year, default: 2021
      t.timestamps
    end

    add_foreign_key :projects_monographs, :projects, column: :project_id, on_delete: :cascade 
    add_index :projects_monographs, :theme, unique: true    
  end
end
