class ExamsController < ApplicationController

	def new
		@exam=Exam.new
	end

	def show
		@exam=Exam.find(params[:id])
	end

  def create
    @exam = Exam.new(exam_params)

    if @exam.save
      redirect_to @exam
    else
      render 'new'
    end
  end

private
  def exam_params
    params.require(:exam).permit(:examTitle)
  end

end
