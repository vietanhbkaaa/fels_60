class Admin::WordsController < ApplicationController
  def index
    @words = Word.all
    respond_to do |format|
      format.html
      format.csv {send_data @words.to_csv}
    end
  end
end
