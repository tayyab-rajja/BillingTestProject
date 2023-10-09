# frozen_string_literal: true

class FeaturesController < ApplicationController
  before_action :set_plan
  before_action :set_feature, only: %i[show edit update destroy]
  before_action :autherize_obj, only: %i[create edit update destroy]
  before_action :autherize_user, only: %i[new show]

  def index
    @features = if current_user.admin?
                  Feature.all
                else
                  Feature.where(plan_id: current_user.plans.pluck(:id))
                end
  end

  def new
    @feature = @plan.features.new
  end

  def create
    @plan = Plan.find_by(id: params[:plan_id])
    @feature = @plan.features.new(feature_params)
    if @feature.save
      redirect_to root_path, notice: 'Feature successfully created.'
    else
      redirect_to [@plan, @feature], notice: 'Feature Not Created'
    end
  end

  def show; end

  def edit; end

  def update
    if @feature.update(feature_params)
      redirect_to [@plan, :features], notice: 'Feature successfully updated.'
    else
      redirect_to edit_plan_feature_path, notice: 'Feature not Updated'
    end
  end

  def destroy
    @feature.destroy
    redirect_to [@plan, :features], notice: 'Feature successfully destroyed.'
  end

  private

  def set_plan
    @plan = Plan.find_by(id: params[:plan_id])
  end

  def set_feature
    @feature = Feature.find_by(id: params[:id])
  end

  def feature_params
    params.require(:feature).permit(:feature_name, :feature_code, :feature_unit_price, :feature_max_unit_limit)
  end

  def autherize_obj
    authorize @feature
  end

  def autherize_user
    authorize Feature
  end
end
