class AddDieToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :die, :integer
  end
end
