class AddStatusToLessonRequests < ActiveRecord::Migration[5.2]
  def change
    add_column :lesson_requests, :status, :string, default: "Aguardando Sensei"
  end
end
