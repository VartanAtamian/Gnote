class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :userId
      t.string :firstName
      t.string :lastName
      t.string :email
      t.string :secretHash
      t.boolean :teacher
      t.boolean :admin

      t.timestamps
    end
  end
end
