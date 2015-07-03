class LessonsController < ApplicationController

  def create
    @course = Course.find params[:course_id]
    @lesson = Lesson.new
    @lesson.user = current_user
    @lesson.course = @course
    if @lesson.save
      flash[:success] = t("messages.lesson.success")
      redirect_to @lesson
    else
      flash[:danger] = t("messages.lesson.danger")
      redirect_to request.referrer
    end
  end

  def show
    @lesson = Lesson.find params[:id]
    @words = @lesson.words.order("RANDOM()").
    paginate page: params[:page], per_page: Settings.per_page.word
  end
end
