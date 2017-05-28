class QuestionsController < ApplicationController
  before_action :set_questionnaire
  before_action :set_question, only: :show

  def index
    @questions = Question.all
  end

  def show; end

  private

  def set_question
    @question = Question.find(params[:id])
  end

  def set_questionnaire
    @questionnaire = Questionnaire.find(params[:questionnaire_id])
  end

  def question_params
    params.require(:answer).permit(:questionnaire_id, :no, :title, :question_type, :text)
  end
end
