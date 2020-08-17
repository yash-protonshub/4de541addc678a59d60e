class UsersController < ApplicationController
	before_action :authenticate_user!

	def follow_user
		user_following = UserFollowing.create(user_id: current_user.id, following_id: params[:id])
		if user_following.save
			redirect_to questions_path, notice: 'User followed successfully'
		else
			redirect_to questions_path, notice: user_following.errors.messages[:user].to_sentence
		end
	end
end
