class CreateProjects < ActiveRecord::Migration[7.1]
  def change
    create_table :projects do |t|
      t.string :title
      t.string :project_type
      t.string :department
      t.string :area
      t.string :course
      t.string :category
      t.text :description
      t.string :state
      t.integer :lective_year
      t.timestamps
    end
  end
end
