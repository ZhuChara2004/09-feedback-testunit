class FeedbacksController < ApplicationController
  before_filter :authenticate_user!, except: [:new, :create]

  before_action :set_feedback, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @feedbacks = Feedback.all
    respond_with(@feedbacks)
  end

  def show
    respond_with(@feedback)
  end

  def new
    @feedback = Feedback.new
    respond_with(@feedback)
  end

  # def edit
  # end

  def create
    @feedback = Feedback.new(feedback_params)
    @feedback.save

    redirect_to root_path
  end

  # def update
  #   @feedback.update(feedback_params)
  #   respond_with(@feedback)
  # end

  # def destroy
  #   @feedback.destroy
  #   respond_with(@feedback)
  # end

  private
    def set_feedback
      @feedback = Feedback.find(params[:id])
    end

    def feedback_params
      params.require(:feedback).permit(:name, :email, :body)
    end
end
