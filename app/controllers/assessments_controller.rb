class AssessmentsController < ApplicationController
  before_action :authenticate_user!

  def index
    @assessments = Assessment.all
  end

  def new
    @assessment = Assessment.new
  end

end
