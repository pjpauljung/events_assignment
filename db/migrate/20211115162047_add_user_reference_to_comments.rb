class AddUserReferenceToComments < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :comments, :users
    add_index :comments, :user_id
    change_column_null :comments, :user_id, false
  end
end
