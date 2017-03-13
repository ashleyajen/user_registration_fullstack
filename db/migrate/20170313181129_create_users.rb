class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :surname
      t.string :address
      t.string :city
      t.string :state
      t.string :postalcode
      t.string :country
      t.string :email
      t.string :username
      t.string :password

      t.timestamps
    end
  end
end
