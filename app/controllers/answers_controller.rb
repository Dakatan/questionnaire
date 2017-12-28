class AnswersController < ApplicationController
  before_action :set_questionnaire
  before_action :set_question
  before_action :set_answer, only: :update

  def create
    @answer = Answer.new(answer_params)

    if @answer.save!
      redirect_to root_path, notice: '回答を追加しました'
    else
      render :new
    end
  end

  def update
    if @answer.update(answer_params)
      redirect_to root_path, notice: '回答を更新しました'
    else
      render :edit
    end
  end

  private

  def set_answer
    @answer = Answer.find(params[:id])
  end

  def set_question
    @question = Question.find(params[:question_id])
  end

  def set_questionnaire
    @questionnaire = Questionnaire.find(params[:questionnaire_id])
  end

  def answer_params
    params.require(:answer).permit(:question_id, :respondent_id, :text)
  end
end
