class LessonRequestsController < ApplicationController
  def new
    @sensei = Sensei.find(params[:format])
    @lesson_request = LessonRequest.new
    @sensei_subjects = SenseiSubject.where(sensei_id: @sensei.id)
  end

  def create
    @lesson_request = LessonRequest.new(params_lesson_request)
    @lesson_request.user = current_user
    @lesson_request.amount = @lesson_request.duration * SenseiSubject.where(subject_id: @lesson_request.subject_id, sensei_id: @lesson_request.sensei_id).first.price_per_hour / 60
    if @lesson_request.save
      raise
      redirect @lesson_request
    else
      raise
    end
  end

  def show
  end

  def index
  end

  def destroy
  end

  def params_lesson_request
    params.require(:lesson_request).permit(:sensei_id, :subject_id, :duration, :description)
  end
end
