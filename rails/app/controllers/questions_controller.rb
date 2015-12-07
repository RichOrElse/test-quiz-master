class QuestionsController < ApplicationController
  before_filter :find_question, only: [:show, :edit, :update, :answer]
  before_filter :decorate_question, only: [:show, :answer]

  def index
    @questions = QuestionDecorator::Collection.new(Question.all, view_context)
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new question_params
    if @question.save
      redirect_to root_path, notice: 'Question created successfully.'
    else
      render :new
    end
  end

  def update
    if @question.update_attributes question_params
      redirect_to root_path, notice: 'Question saved successfully.'
    else
      render :edit
    end
  end

  def answer
    if @question.is_correct?(answer_params[:answer])
      redirect_to root_path, notice: "Correct answer. Pick another question."
    else
      flash[:notice] = "Wrong answer. Try again."
      render action: "show"
    end
  end

  private

  def decorate_question
    @question = QuestionDecorator[ @question, view_context ]
  end

  def find_question
    @question = Question.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:question, :answer)
  end
  
  def answer_params
    params.require(:answer).permit(:answer)
  end  
end
