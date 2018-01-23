class AnswersController < ApplicationController
    def upvote
        @answer = Answer.find(params[:answer_id])
        @answer.upvote_by current_user
        redirect_back(fallback_location: root_path)
    end

    def create
        @answer = Answer.new(answer_params)
        if @answer.save
            redirect_to root_path
        else
            flash[:notice] = @answer.errors.full_messages
            redirect_back(fallback_location: root_path)
        end
    end

    def downvote
        @answer = Answer.find(params[:answer_id])
        @answer.downvote_by current_user
        redirect_back(fallback_location: root_path)
    end

    def unvote
        @answer = Answer.find(params[:answer_id])
        @answer.unvote_by current_user
        redirect_back(fallback_location: root_path)
    end

    private

    def answer_params
        params.require(:answer).permit(:body, :user_id, :question_id)
    end

end
