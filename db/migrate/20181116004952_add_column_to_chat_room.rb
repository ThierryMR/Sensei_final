class AddColumnToChatRoom < ActiveRecord::Migration[5.2]
  def change
    add_reference :chat_rooms, :lesson_request, foreign_key: true
    add_column :chat_rooms, :closed, :boolean, default: false
    add_column :chat_rooms, :rating, :integer
  end
end
