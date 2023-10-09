# frozen_string_literal: true

class UsageFeature < ApplicationRecord
  belongs_to :subscription
  belongs_to :feature

  validates :subscription, presence: true
  validates :feature, presence: true
end
