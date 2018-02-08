class AnswersController < ApplicationController
    respond_to :js, :json, :html

    def upvote
        @answer = Answer.find(params[:answer_id])
        if current_user.disliked? @answer
            @answer.upvote_by current_user
            @answer.addPoints
            @answer.addPoints
        elsif !current_user.liked? @answer
            @answer.upvote_by current_user
            @answer.addPoints
        elsif current_user.liked? @answer
            @answer.unvote_by current_user
            @answer.subtractPoints
        end
    end

    def create
        @answer = Answer.new(answer_params)
        @question = @answer.question
        if !@answer.url.include?("www.useloom.com") && !@answer.url.include?("www.vimeo.com") && !@answer.url.include?("www.youtube.com")
                flash[:notice] = "The format of your URL is incorrect. Try again"
                @anchor = "anchor_point"
                render "questions/show"
        elsif @answer.save
            UserMailer.welcome_email(@answer.question.user).deliver_now
            redirect_to question_path(@answer.question)
        else
            flash[:notice] = @answer.errors.full_messages.to_sentence
            redirect_back(fallback_location: root_path)
        end
    end

    def edit
        require_permission_answers_controller
        @answer = Answer.find_by(id: params[:id])
        @question = @answer.question
    end

    def update
        require_permission_answers_controller
        @answer = Answer.find_by(id: params[:id])
        @question = @answer.question
        @answer.update(answer_params)

        redirect_to question_path(@question)
    end

    def downvote
        @answer = Answer.find(params[:answer_id])
        if current_user.liked? @answer
            @answer.downvote_by current_user
            @answer.subtractPoints
            @answer.subtractPoints
        elsif !current_user.disliked? @answer
            @answer.downvote_by current_user
            @answer.subtractPoints
        elsif current_user.disliked? @answer
            @answer.unvote_by current_user
            @answer.addPoints
        end
    end

    def unvote
        @answer = Answer.find(params[:answer_id])
        @answer.unvote_by current_user
        # redirect_back(fallback_location: root_path)
    end

    private

    def answer_params
        params.require(:answer).permit(:body, :user_id, :question_id, :url)
    end

    def require_permission_answers_controller
        if current_user != Answer.find(params[:id]).user
            redirect_to root_path
        end
    end

end
