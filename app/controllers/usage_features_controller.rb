# frozen_string_literal: true

class UsageFeaturesController < ApplicationController
  before_action :set_subcriptions
  before_action :set_usage, only: %i[edit update]
  before_action :authenticate_user, only: %i[edit update show]

  def index
    authorize UsageFeature
    @subscriptions.each do |subscription|
      subscription.usage_features.each do |usage|
        usage.update(extra_usage_price: usage.feature.feature_unit_price * usage.usage)
      end
    end
  end

  def show; end

  def edit; end

  def update
    if @usage.update(usage_params)
      redirect_to usage_features_path, notice: 'Usage Updated'
    else
      redirect_to edit_usage_feature, notice: 'Updation Failed'
    end
  end

  private

  def usage_params
    params.require(:usage_feature).permit(:usage)
  end

  def set_subcriptions
    @subscriptions = current_user.subscriptions
  end

  def set_usage
    @usage = UsageFeature.find_by(id: params[:id])
  end

  def authenticate_user
    authorize @usage
  end
end
