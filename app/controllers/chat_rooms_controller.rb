class ChatRoomsController < ApplicationController
  def show
    @chat_room = ChatRoom.includes(messages: :user).find(params[:id])
    @lesson_request = @chat_room.lesson_request
  end

  def new
    @chat_room = ChatRoom.new
    @chat_room.lesson_request_id = params[:format]
    @chat_room.name = "Aula com #{@chat_room.lesson_request.sensei.user.username}"
    @chat_room.save
    redirect_to @chat_room
  end

  def rating
    @chat_room = ChatRoom.find(params[:chat_room_id])
    @lesson_request = @chat_room.lesson_request
    # if @lesson_request.save && @lesson_request.rating.nil? == false && current_user.id == @lesson_request.user.id
    #   @lesson_request.sensei.avg_rating << @lesson_request.rating
    #   @lesson_request.sensei.save
    # end
  end
end
