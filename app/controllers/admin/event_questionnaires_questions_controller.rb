class Admin::EventQuestionnairesQuestionsController < ApplicationController
  before_action :authenticate_admin!
  layout 'admin_header'

  def new
    @event_questionnaires_question = EventQuestionnairesQuestion.new
  end

  def create
    @event_questionnaires_question =  EventQuestionnairesQuestion.new(event_questionnaires_question_params)
    if @event_questionnaires_question.save
      flash[:notice] = "イベントアンケート説明情報が登録されました"
      redirect_to admin_event_questionnaires_questions_path
    else
      render 'new'
    end
  end

  def index
    @event_questionnaires_questions = EventQuestionnairesQuestion.all
  end

  def show
    @event_questionnaires_question = EventQuestionnairesQuestion.find(params[:id])
    @event_questionnaires_answers = @event_questionnaires_question.event_questionnaires_answers
  end

  def edit
    @event_questionnaires_question = EventQuestionnairesQuestion.find(params[:id])
  end

  def update
    @event_questionnaires_question = EventQuestionnairesQuestion.find(params[:id])
    if @event_questionnaires_question.update(event_questionnaires_question_params)
      flash[:notice] = "イベントアンケート説明情報が更新されました"
      redirect_to admin_event_questionnaires_question_path(@event_questionnaires_question)
    else
      render 'edit'
    end
  end

  private

  def event_questionnaires_question_params
    params.require(:event_questionnaires_question).permit(:title, :content)
  end
end
