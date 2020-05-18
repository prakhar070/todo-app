class AddPriorityToTodos < ActiveRecord::Migration[6.0]
  def change
    add_column :todos, :priority, :integer
  end
end
