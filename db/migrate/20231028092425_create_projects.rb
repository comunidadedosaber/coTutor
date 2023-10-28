class CreateProjects < ActiveRecord::Migration[7.1]
  def change
    create_table :projects do |t|
      t.string :department
      t.string :area
      t.string :course
      t.string :category
      t.string :state
      t.integer :lective_year
      t.timestamps
    end
  end
end
