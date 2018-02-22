class QcommentsController < ApplicationController
    def new
      @qcomment = Qcomment.new
      @qcomment.question = Question.find_by(id: params[:question_id])
      @qcomment.parent = Qcomment.find_by(id: params[:parent_id])
    end

    def create
      @qcomment = Qcomment.new(qcomment_params)
      @qcomment.user = current_user
      if @qcomment.save
        redirect_to question_path(@qcomment.question)
      end
    end


    private

    def qcomment_params
        params.require(:qcomment).permit(:parent_id, :question_id, :body, :user_id)
    end
end
