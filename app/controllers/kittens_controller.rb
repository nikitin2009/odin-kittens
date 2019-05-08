class KittensController < ApplicationController
  before_action :find_kitten, only: [:show, :edit, :update]

  def index
    @kittens = Kitten.all
  end

  def new
    @kitten = Kitten.new
  end

  def create
    @kitten = Kitten.new(:kitten_params)
  end

  def show
  end

  def edit
  end

  def update
  end

private

  def kitten_params
    params.require[:kitten].permit(:name, :age, :cuteness, :softness)
  end

  def find_kitten
    @kitten = Kitten.find_by(id: params[:id])
  end
end
