class Admin::WordsController < ApplicationController
  def index
    @words = Word.all
    respond_to do |format|
      format.html
      format.csv {send_data @words.to_csv}
    end
  end

  def new
    @word = Word.new
    @courses = Course.all.pluck :name, :id
    4.times{@word.options.build}
  end

  def create
    @word = Word.new word_params
    @courses = Course.all.pluck :name, :id
    if @word.save
      flash[:success] = t"messages.word.new.success"
      redirect_to [:admin, @word]
    else
      render :new
    end
  end

  def show
    @word = Word.find params[:id]
  end

  def edit
    @courses = Course.all.pluck :name, :id
    @word = Word.find params[:id]
  end

  def update
    @courses = Course.all.pluck :name, :id
    @word = Word.find params[:id]
    if @word.update_attributes word_params
      flash[:success] = t"messages.word.update.success"
      redirect_to [:admin, @word]
    else
      render :edit
    end
  end

  def destroy
    Word.find(params[:id]).destroy
    flash[:success] = t"messages.word.destroy.success"
    redirect_to admin_words_url
  end

  private
  def word_params
    params.require(:word).permit :content, :course_id, options_attributes: [:id, :content, :correct, :_destroy]
  end
end
