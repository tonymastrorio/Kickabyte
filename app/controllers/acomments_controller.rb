class AcommentsController < ApplicationController

    def new
      @acomment = Acomment.new(:parent_id => params[:parent_id])
    end

    def create
      @acomment = Acomment.new(acomment_params)
      @acomment.user = current_user
      if @acomment.save
        redirect_to root_path
      else
        binding.pry
      end
    end


    private

    def acomment_params
        params.require(:acomment).permit(:parent_id, :answer_id, :body)
    end

end


