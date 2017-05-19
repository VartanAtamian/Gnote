class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :email
      t.string :firstName
      t.string :lastName
      t.string :secretHash
      t.boolean :isTeacher
      t.boolean :isAdmin

      t.timestamps
    end
  end
end
