class AnswersController < ApplicationController
	before_action :authenticate_user!

	def new
		Answer.new
	end

	def create
		answer = Answer.new(answer_params)
		if answer.save
			redirect_to question_path(answer.question), notice: 'Answer created successfully'
		else
			render 'new'
		end	end

	private 

	def answer_params
		params.require(:answer).permit(:body, :user_id, :question_id)
	end
end
