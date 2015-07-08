class WordsController < ApplicationController

  def index
    @courses = current_user.courses
    if params[:course_id]
      @course = Course.find params[:course_id]
      @words = @course.words.send(params[:state], current_user).paginate page: params[:page]
    else
      @words = Word.paginate page: params[:page]
    end
  end
end
