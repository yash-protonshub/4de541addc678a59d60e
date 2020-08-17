class TopicsController < ApplicationController
	before_action :authenticate_user!

	def new
		@topic = Topic.new
	end

	def create
		topic = Topic.new(topic_params)
		if topic.save
			redirect_to questions_path, notice: 'Topic created successfully'
		else
			render 'new'
		end
	end


	def show
	end

	def follow_topic
		user_topic = UserTopic.create(user_id: current_user.id, topic_id: params[:id])
		if user_topic.save
			redirect_to questions_path, notice: 'Topic followed successfully'
		else
			redirect_to questions_path, notice: user_topic.errors.messages[:topic].to_sentence
		end
	end

	private

	def topic_params
		params.require(:topic).permit(:body)
	end
end
