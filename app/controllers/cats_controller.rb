# frozen_string_literal: true

class CatsController < ApplicationController
  before_action :set_cat, only: %i[show edit update destroy]

  def index
    @cats = Cat.all
  end

  def show; end

  def new
    @cat = Cat.new
  end

  def edit; end

  def create
    @cat = Cat.new(cat_params)

    if @cat.save
      redirect_to cat_url(@cat), notice: 'Cat was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @cat.update(cat_params)
      redirect_to cat_url(@cat), notice: 'Cat was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @cat.destroy

    redirect_to cats_url, notice: 'Cat was successfully destroyed.'
  end

  private

  def set_cat
    @cat = Cat.find(params[:id])
  end

  def cat_params
    params.require(:cat).permit(:name)
  end
end
