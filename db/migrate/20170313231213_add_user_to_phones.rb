class AddUserToPhones < ActiveRecord::Migration[5.0]
  def change
    add_reference :phones, :user, index: true, foreign_key: true
  end
end
