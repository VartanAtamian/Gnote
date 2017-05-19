class CreateDisciplines < ActiveRecord::Migration[5.1]
  def change
    create_table :disciplines do |t|
      t.string :disciplineTitle
      t.integer :teacherID
      t.date :startDate
      t.date :endDate

      t.timestamps
    end
  end
end
