class CreateProjectUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :project_users do |t|
      t.string :title
      t.integer :user_id
      t.integer :project_id

      t.timestamps
    end
  end
end
