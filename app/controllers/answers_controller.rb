class AnswersController < ApplicationController
  before_filter :authenticate_user!
  def create
    @question = Question.find(params[:question_id])
    @answer = @question.answers.build(params[:answer])
    @answer.answer_user = current_user

    if @answer.save
      redirect_to question_path(@question)
    else
      render 'questions/show'
    end
  end
end
