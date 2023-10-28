class Projects < ActiveRecord::Migration[7.1]
  def change
    create_table :projects do |t|
      t.string :department
      t.string :area
      t.string :course
      t.string :category, default: "TCC"
      t.string :state, default: "Iniciado"
      t.integer :lective_year
      t.timestamps
    end
  end
end
