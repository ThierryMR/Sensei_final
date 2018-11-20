class ChatRoomsController < ApplicationController
  def show
    @chat_room = ChatRoom.includes(messages: :user).find(params[:id])
  end

  def new
    @chat_room = ChatRoom.new
    @chat_room.lesson_request_id = params[:format]
    @chat_room.name = "Teste"
    @chat_room.save
    redirect_to @chat_room
  end

  def close
    raise
    chat_room = ChatRoom.find(params[:chat_room_id])
    chat_room.destroy
    redirect_to lesson_requests_path("sensei")
  end

  def rating
    @chat_room = ChatRoom.find(params[:chat_room_id])
    @lesson_request = @chat_room.lesson_request
  end
end
