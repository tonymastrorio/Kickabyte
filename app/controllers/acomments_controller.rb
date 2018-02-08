class AcommentsController < ApplicationController
    def new
        @acomment = Acomment.new(:parent_id => params[:parent_id])
    end

    def create
      @answer = Answer.find params[:answer_id]
      @acomment = @answer.acomments.new comment_params
   end


    private

    def acomment_params
        params.require(:acomment).permit(:parent_id, :body)
    end

end


