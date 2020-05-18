class CreateTodos < ActiveRecord::Migration[6.0]
  def change
    create_table :todos do |t|
      t.string :title
      t.string :note
      t.date :deadline

      t.timestamps
    end
  end
end
