class CreateAssessments < ActiveRecord::Migration[5.1]
  def change
    create_table :assessments do |t|
      t.string :assessmentId
      t.real :grade

      t.timestamps
    end
  end
end
