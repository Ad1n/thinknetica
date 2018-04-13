class AnswersController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_question
  before_action :load_answer, only: [:update, :edit, :destroy]
  def index
    @answers = Answer.all
  end

  def new
    @answer = Answer.new
  end

  def show

  end

  def edit
  end

  def create
    @answer = @question.answers.new(answers_params)
    if @answer.save
      redirect_to @question
    else
      render :new
    end
  end

  def update
    if @answer.update(answers_params)
      redirect_to @question
    else
      render :edit
    end
  end

  def destroy
    if @answer.destroy
    redirect_to question_path(@question), notice: 'Ответ успешно удалён'
    end
  end

  private

  def load_answer
    @answer = @question.answers.find(params[:id])
  end

  def set_question
    @question = Question.find(params[:question_id])
  end

  def answers_params
    params.require(:answer).permit(:body).merge(user: current_user)
  end
end
