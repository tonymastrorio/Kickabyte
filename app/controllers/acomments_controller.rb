class AcommentsController < ApplicationController

    def new
      @acomment = Acomment.new
      @acomment.answer = Answer.find_by(id: params[:answer_id])
      @acomment.parent = Acomment.find_by(id: params[:parent_id])
    end

    def create
      @acomment = Acomment.new(acomment_params)
      @acomment.user = current_user
      if @acomment.save
        redirect_to question_path(@acomment.answer.question)
      end
    end


    private

    def acomment_params
        params.require(:acomment).permit(:parent_id, :answer_id, :body, :user_id)
    end

end


