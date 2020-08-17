class QuestionsController < ApplicationController
	before_action :authenticate_user!
	before_action :set_question, only: :show

	def index
		@question = Question.all
	end

	def new
	end

	def create
		question = current_user.questions.new(question_params)
		if question.save
			redirect_to questions_path, notice: 'Question created successfully'
		else
			render 'new'
		end
	end


	def show
	end


	private

	def question_params
		params.require(:question).permit(:body, :topic_id)
	end

	def set_question
		@question = Question.find(params[:id])
	end
end
