class AddRatingToLessonRequests < ActiveRecord::Migration[5.2]
  def change
    add_column :lesson_requests, :rating, :integer
  end
end
