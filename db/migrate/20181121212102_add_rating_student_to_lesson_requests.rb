class AddRatingStudentToLessonRequests < ActiveRecord::Migration[5.2]
  def change
    add_column :lesson_requests, :rating_student, :integer
  end
end
