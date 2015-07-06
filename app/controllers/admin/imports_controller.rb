class Admin::ImportsController < ApplicationController
  before_action :require_admin
  def create
    import params[:model].safe_constantize, params[:file]
    redirect_to :back, notice: t("messages.import.success")
  end

  private
  def import model, file
    CSV.foreach file.path, headers: true do |row|
      m = model.find_by_id(row["id"]) || model.new
      m.attributes = row.to_hash.slice *row.to_hash.keys
      m.save!
    end
  end

  def require_admin
    redirect_to root_path unless current_user.admin?
  end
end
