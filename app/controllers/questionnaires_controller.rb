class QuestionnairesController < ApplicationController
  before_action :set_questionnaire, only: %i[show edit update destroy]

  def index
    @questionnaires = Questionnaire.all.page(params[:page])
  end

  def show; end

  def new
    @questionnaire = Questionnaire.new
  end

  def edit; end

  def create
    @questionnaire = Questionnaire.new(questionnaire_params)

    if @questionnaire.save
      redirect_to @questionnaire, notice: 'アンケートを追加しました'
    else
      render :new
    end
  end

  def update
    if @questionnaire.update(questionnaire_params)
      redirect_to @questionnaire, notice: 'アンケートを更新しました'
    else
      render :edit
    end
  end

  def destroy
    @questionnaire.destroy
    redirect_to questionnaires_url, notice: 'アンケートを削除しました'
  end

  def finish; end

  def result
    set_questionnaire
  end

  private

  def set_questionnaire
    @questionnaire = Questionnaire.find(params[:id])
  end

  def questionnaire_params
    params.require(:questionnaire).permit(:title, :start_date, :end_date)
  end
end
