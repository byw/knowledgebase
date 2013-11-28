class QuestionsController < ApplicationController
  before_filter :authenticate_user!

  def index
    render text: 'asd'
  end

  def new
    build_question
  end

  def create
    if build_question.save
      redirect_to question_path(@question)
    else
      render :new
    end
  end

  def show
    @question = Question.find(params[:id])
    @new_answer = Answer.new
  end

  def dashboard
    @recent_questions = Question.all
    @unanswered_questions = Question.unanswered
  end

  def search
    @questions = Question.full_text_search(params[:search_term])
  end

  protected

  def build_question
    @question ||= current_user.questions.build(params[:question])
  end
end

