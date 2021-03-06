require 'test_helper'

class ActionPlansControllerTest < ActionDispatch::IntegrationTest
  setup do
    @action_plan = action_plans(:one)
  end

  test "should get index" do
    get action_plans_url
    assert_response :success
  end

  test "should get new" do
    get new_action_plan_url
    assert_response :success
  end

  test "should create action_plan" do
    assert_difference('ActionPlan.count') do
      post action_plans_url, params: { action_plan: { achievement: @action_plan.achievement, body: @action_plan.body, target: @action_plan.target, term_from: @action_plan.term_from, term_to: @action_plan.term_to } }
    end

    assert_redirected_to action_plan_url(ActionPlan.last)
  end

  test "should show action_plan" do
    get action_plan_url(@action_plan)
    assert_response :success
  end

  test "should get edit" do
    get edit_action_plan_url(@action_plan)
    assert_response :success
  end

  test "should update action_plan" do
    patch action_plan_url(@action_plan), params: { action_plan: { achievement: @action_plan.achievement, body: @action_plan.body, target: @action_plan.target, term_from: @action_plan.term_from, term_to: @action_plan.term_to } }
    assert_redirected_to action_plan_url(@action_plan)
  end

  test "should destroy action_plan" do
    assert_difference('ActionPlan.count', -1) do
      delete action_plan_url(@action_plan)
    end

    assert_redirected_to action_plans_url
  end
end
