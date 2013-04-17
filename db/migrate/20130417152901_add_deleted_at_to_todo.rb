class AddDeletedAtToTodo < ActiveRecord::Migration
  def change
    add_column :todos, :deleted_at, :datetime
  end
end
