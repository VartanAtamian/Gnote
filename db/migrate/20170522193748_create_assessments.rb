class CreateAssessments < ActiveRecord::Migration[5.1]
  def change
    create_table :assessments do |t|
      t.integer :examID
      t.integer :studentID
      t.float :grade

      t.timestamps
    end
  end
end
