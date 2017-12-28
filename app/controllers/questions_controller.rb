class QuestionsController < ApplicationController
  before_action :set_questionnaire
  before_action :set_question, only: %i[show edit update destroy]

  def index
    @questions = @questionnaire.questions
  end

  def show; end

  def new
    @question = @questionnaire.questions.build
  end

  def edit; end

  def create
    @question = @questionnaire.questions.build(question_params)

    if @question.save
      redirect_to questionnaire_url(@questionnaire), notice: '質問を追加しました'
    else
      render :new
    end
  end

  def update
    if @question.update(question_params)
      redirect_to questionnaire_url(@questionnaire), notice: '質問を更新しました'
    else
      render :edit
    end
  end

  def destroy
    @question.destroy
    redirect_to questionnaire_url(@questionnaire), notice: '質問を削除しました'
  end

  private

  def set_question
    @question = Question.find(params[:id])
  end

  def set_questionnaire
    @questionnaire = Questionnaire.find(params[:questionnaire_id])
  end

  def question_params
    params.require(:question).permit(:no, :title, :question_type, :text)
  end
end
