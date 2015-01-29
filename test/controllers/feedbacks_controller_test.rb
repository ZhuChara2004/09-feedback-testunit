require 'test_helper'

class FeedbacksControllerTest < ActionController::TestCase
  setup do
    # @feedback = Feedback.new(name: 'Foo Bar', email: 'foo@bar.com', body: 'Some feedback text here ')
    @feedback = Feedback.first_or_create(name: 'Foo Bar', email: 'foo@bar.com', body: 'Some feedback text here ')
  end

  test "unauthorized users should get redirect" do
    get :index
    assert_response 302
  end

  test "unathorized users should get redirect on show" do
    get :show, id: @feedback.id
    assert_response 302
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create feedback" do
    assert_difference('Feedback.count') do
      post :create, feedback: { body: @feedback.body, email: @feedback.email, name: @feedback.name }
    end

    assert_redirected_to root_path
  end

  # test "should get edit" do
  #   get :edit, id: @feedback
  #   assert_response :success
  # end

  # test "should update feedback" do
  #   patch :update, id: @feedback, feedback: { body: @feedback.body, email: @feedback.email, name: @feedback.name }
  #   assert_redirected_to feedback_path(assigns(:feedback))
  # end
  #
  # test "should destroy feedback" do
  #   assert_difference('Feedback.count', -1) do
  #     delete :destroy, id: @feedback
  #   end
  #
  #   assert_redirected_to feedbacks_path
  # end
end
