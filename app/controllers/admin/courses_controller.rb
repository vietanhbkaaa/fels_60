class Admin::CoursesController < ApplicationController
  def index
    @courses = Course.all
    respond_to do |format|
      format.html
      format.csv {send_data @words.to_csv}
    end
  end

  def new
    @course = Course.new
  end

  def create
    @course = Course.new course_params
    if @course.save
      flash[:success] = t"messages.course.new.success"
      redirect_to [:admin, @course]
    else
      render :new
    end
  end

  def show
    @course = Course.find params[:id]
  end

  def edit
    @course = Course.find params[:id]
  end

  def update
    @course = Course.find params[:id]
    if @course.update_attributes course_params
      flash[:success] = t"messages.course.update.success"
      redirect_to [:admin, @course]
    else
      render :edit
    end
  end

  def destroy
    Course.find(params[:id]).destroy
    flash[:success] = t"messages.course.destroy.success"
    redirect_to admin_courses_url
  end

  private
  def course_params
    params.require(:course).permit :name, :description
  end
end
