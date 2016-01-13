class AddUserToLiquorstore < ActiveRecord::Migration
  def change
    add_reference :liquorstores, :user, index: true, foreign_key: true
  end
end
