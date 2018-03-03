class QuestionsController < ApplicationController
    skip_before_action :authenticate_user!, only: [:show, :index]
    respond_to :js, :json, :html
    
    def index
        if params[:search]
            @questions = Question.search do
                fulltext params[:search]
                paginate page: params[:page], per_page: 20
            end.results
        else
            @questions = Question.order('created_at DESC').page(params[:page]).per(20)
        end
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
        if !@question.url.include?("www.useloom.com") && !@question.url.include?("www.vimeo.com") && !@question.url.include?("www.youtube.com") && !@question.url.empty?
            flash[:notice] = "The format of your URL is incorrect. Try again"
            redirect_to new_question_path
        elsif @question.save
            redirect_to root_path
        else
            render :new
        end
    end

    def edit
        require_permission_questions_controller
        @question = Question.find_by(id: params[:id])
    end

    def update
        require_permission_questions_controller
        @question = Question.find_by(id: params[:id])
        @question.update(question_params)

        redirect_to question_path(@question)
    end

    def upvote
        @question = Question.find(params[:question_id])
        if current_user.disliked? @question
            @question.upvote_by current_user
            @question.addPoints
            @question.addPoints
        elsif !current_user.liked? @question
            @question.upvote_by current_user
            @question.addPoints
        elsif current_user.liked? @question
            @question.unvote_by current_user
            @question.subtractPoints
        end
    end

    def downvote
        @question = Question.find(params[:question_id])
        if current_user.liked? @question
            @question.downvote_by current_user
            @question.subtractPoints
            @question.subtractPoints
        elsif !current_user.disliked? @question
            @question.downvote_by current_user
            @question.subtractPoints
        elsif current_user.disliked? @question
            @question.unvote_by current_user
            @question.addPoints
        end
    end

    def unvote
        @question = Question.find(params[:answer_id])
        @question.unvote_by current_user
    end

    def destroy
        require_permission_questions_controller
        @question = Question.find(params[:id])
        @question.destroy
        
        redirect_to root_path
    end

    private

    def question_params
        params.require(:question).permit(:title, :body, :url)
    end

    def require_permission_questions_controller
        if current_user != Question.find(params[:id]).user
            redirect_to root_path
        end
    end
end
