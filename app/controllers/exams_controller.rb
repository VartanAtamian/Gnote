class ExamsController < ApplicationController


	def new
		@exam=Exam.new
	end

	def show
		@exam=Exam.find(params[:id])
	end

end
