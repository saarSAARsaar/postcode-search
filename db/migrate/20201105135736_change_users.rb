class ChangeUsers < ActiveRecord::Migration[6.0]
  def change
    change_column_default :users, :username, ""
    change_column_null :users, :username, false
  end
end
