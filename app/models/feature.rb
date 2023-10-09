# frozen_string_literal: true

class Feature < ApplicationRecord
  belongs_to :plan

  has_many :usage_features, dependent: :destroy
  has_many :subscriptions, through: :usage_features

  validates :feature_name, :feature_code, :feature_unit_price, :feature_max_unit_limit, presence: true
  validates :feature_name, :feature_code, uniqueness: true
  validates :feature_unit_price, :feature_max_unit_limit,
            numericality: { message: 'It seems wrong, it must be in integer' }
end
