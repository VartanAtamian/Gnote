class CreateExams < ActiveRecord::Migration[5.1]
  def change
    create_table :exams do |t|
      t.string :examTitle
      t.integer :disciplineID
      t.date :examDate

      t.timestamps
    end
  end
end
