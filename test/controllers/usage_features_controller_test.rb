# frozen_string_literal: true

require 'test_helper'

class UsageFeaturesControllerTest < ActionDispatch::IntegrationTest
  test 'should get show' do
    get usage_features_show_url
    assert_response :success
  end

  test 'should get edit' do
    get usage_features_edit_url
    assert_response :success
  end

  test 'should get update' do
    get usage_features_update_url
    assert_response :success
  end

  test 'should get index' do
    get usage_features_index_url
    assert_response :success
  end
end
