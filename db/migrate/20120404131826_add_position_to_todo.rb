class AddPositionToTodo < ActiveRecord::Migration
  def change
    add_column :todos, :position, :integer

  end
end
