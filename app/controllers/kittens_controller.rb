class KittensController < ApplicationController
  before_action :find_kitten, only: [:show, :edit, :update, :destroy]

  def index
    @kittens = Kitten.all
  end

  def new
    @kitten = Kitten.new
  end

  def create
    @kitten = Kitten.new(kitten_params)
    if @kitten.save
      flash[:success] = "New kitten created!"
      redirect_to kittens_path
    else
      flash.now[:warning] = "Some error occured!"
      render 'new'
    end
  end

  def show
  end

  def edit
  end

  def update
    if @kitten.update_attributes(kitten_params)
      flash[:success] = "The kitten updated!"
      redirect_to kittens_path
    else
      flash.now[:warning] = "Some error occured!"
      render 'edit'
    end
  end

  def destroy
    @kitten.destroy
    flash[:success] = "The kitten deleted!"
    redirect_to kittens_path
  end

private

  def kitten_params
    params.require(:kitten).permit(:name, :age, :cuteness, :softness)
  end

  def find_kitten
    @kitten = Kitten.find(params[:id])
  end
end
