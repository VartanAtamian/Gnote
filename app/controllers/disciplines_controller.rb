class DisciplinesController < ApplicationController
  before_action :authenticate_user!

  def index
    @disciplines = Discipline.all
  end

  def new
    @discipline = Discipline.new
  end

  def create
    @discipline = Discipline.new(discipline_params)

    if @discipline.save
      redirect_to @discipline
    else
      render 'new'
    end
  end

private
  def discipline_params
    params.require(:discipline).permit(:disciplineTitle)
  end
end
