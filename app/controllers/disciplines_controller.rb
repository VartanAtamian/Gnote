class DisciplinesController < ApplicationController

  def index
    @disciplines = Discipline.all
  end

  def new
    @discipline = Discipline.new
  end

  def show
    @discipline = Discipline.find(params[:id])
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
