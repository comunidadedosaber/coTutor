class CreateProjectsProposals < ActiveRecord::Migration[7.1]
  def change
    create_table :projects_proposals do |t|
      t.references :project, null: false, foreign_key: true
      t.string :theme
      t.text :objectives
      t.text :summary
      t.text :literature
      t.string :state
      t.timestamps
    end
  end
end
