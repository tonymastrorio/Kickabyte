class QuestionsController < ApplicationController
    def index
        @questions = Question.order('created_at DESC').page(params[:page]).per(10)
    end

    def show
        @question = Question.find(params[:id])
        @answer = Answer.new
    end

    def new
        @question = Question.new
    end

    def create
        @question = Question.new(question_params)
        @question.user = current_user
        if @question.save
            redirect_to root_path
        else
            render :new
        end
    end

    def edit
        @question = Question.find_by(id: params[:id])
    end

    def upvote
        @question = Question.find(params[:question_id])
        @question.upvote_by current_user
        redirect_back(fallback_location: root_path)
    end

    def downvote
        @question = Question.find(params[:question_id])
        @question.downvote_by current_user
        redirect_back(fallback_location: root_path)
    end

    def unvote
        @question = Question.find(params[:question_id])
        @question.unvote_by current_user
        redirect_back(fallback_location: root_path)
    end

    private

    def question_params
        params.require(:question).permit(:title, :body)
    end
end
