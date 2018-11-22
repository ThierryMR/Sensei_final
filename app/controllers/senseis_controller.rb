class SenseisController < ApplicationController
  skip_before_action :authenticate_user!

  def new
    @user = current_user
    @sensei = Sensei.new
  end

  def create
    @sensei = Sensei.new
    @sensei.user = current_user
    # @sensei.school_subject = SchoolSubject.find_by(title: params[:sensei][:school_subject])
    if @sensei.save
      redirect_to @sensei
    else
      render :new
    end
  end

  def index
    if params[:query].present?
      @senseis = Sensei.search_by_subject(params[:query])
    else
      @senseis = Sensei.all
    end
  end

  def show
    @sensei = Sensei.find(params[:id])
    @senseisubs = SenseiSubject.where(sensei_id: params[:id])
    @user = @sensei.user
    @lesson_requests = LessonRequest.where(sensei_id: @user)

    rating_array = LessonRequest.where(sensei_id: @sensei.id).map{ |e| e[:rating]}
    if rating_array.compact.empty?
      @sensei_rating = nil
    else
      @sensei_rating = rating_array.compact.sum / rating_array.compact.length
    end
  end
end
