class ProjectsBoards < ActiveRecord::Migration[7.1]
  def change
    create_table :projects_boards do |t|
      t.bigint :user_id, null: false
      t.bigint :project_id, null: false
      t.string :type, null: true
      t.timestamps
    end

    add_foreign_key :projects_boards, :users, column: :user_id, on_delete: :cascade
    add_foreign_key :projects_boards, :projects, column: :project_id, on_delete: :cascade  
  end
end
