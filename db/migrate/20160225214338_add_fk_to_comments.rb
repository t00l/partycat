class AddFkToComments < ActiveRecord::Migration
  def change
    add_column :comments, :user_id, :integer, foreign_key: true
  end
end
