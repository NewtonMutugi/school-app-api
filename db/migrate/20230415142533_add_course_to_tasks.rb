class AddCourseToTasks < ActiveRecord::Migration[7.0]
  def change
    add_reference :tasks, :course, null: false, foreign_key: true
  end
end
