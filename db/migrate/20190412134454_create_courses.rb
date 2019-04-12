class CreateCourses < ActiveRecord::Migration[5.2]
  def change
    create_table :courses do |t|
      t.string :course_name
      t.text :description
      t.date :start_date
      t.date :end_date

      t.timestamps
    end
  end
end
