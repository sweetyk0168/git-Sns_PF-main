class Public::EventQuestionnairesAnswersController < ApplicationController
  before_action :authenticate_customer!

  def new
    @event_questionnaires_question = EventQuestionnairesQuestion.find(params[:question_id])
    @event_questionnaires_answer = EventQuestionnairesAnswer.new(event_questionnaires_question_id: params[:question_id])
  end

  def create
    @event_questionnaires_answer = EventQuestionnairesAnswer.new(event_questionnaires_answer_params)
    @event_questionnaires_answer.event_questionnaires_question_id = event_questionnaires_answer_params[:event_questionnaires_question_id]
    if @event_questionnaires_answer.save
      flash[:notice] = "イベントアンケート情報が投稿されました"
      redirect_to complete_event_questionnaires_answers_path
    else
      render 'new'
    end
  end

  def confirm
    @event_questionnaires_answer = EventQuestionnairesAnswer.new(event_questionnaires_answer_params)
    if @event_questionnaires_answer.invalid?
      @event_questionnaires_answer = EventQuestionnairesAnswer.new
      render 'new'
    end
  end

  def complete
  end

  # def index
  #   @event_questionnaires_questions = EventQuestionnairesQuestion.all
  # end

  # def show
  #   @event_questionnaires_question = EventQuestionnairesQuestion.find(params[:id])
  # end

  private

  def event_questionnaires_answer_params
    params.require(:event_questionnaires_answer).permit(:gender, :reason, :satisfaction, :reason_for_satisfaction, :participation, :impressions, :event_questionnaires_question_id)
  end
end
