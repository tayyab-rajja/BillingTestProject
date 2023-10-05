# frozen_string_literal: true

class DashboardsController < ApplicationController
  before_action :authorize_user

  def index
    @user = User.all.where(role: :buyer)
  end

  def show
    @user = User.find_by(id: params[:id])
    redirect_to root_path, notice: 'User Not Exits' if @user.blank?
  end

  private

  def authorize_user
    authorize Dashboard
  end
end
