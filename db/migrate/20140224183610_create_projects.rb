class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :title
      t.text :body
      t.integer :user_id
      t.integer :category_id
      t.string :slug

      t.timestamps
    end
  end
end
