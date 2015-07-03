class AnswersController < ApplicationController
  def index
    @lesson = Lesson.find params[:lesson_id]
  end
end
