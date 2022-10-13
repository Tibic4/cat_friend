# frozen_string_literal: true

class CatsController < ApplicationController
  before_action :set_cat, only: %i[edit update destroy]

  def index
    @cats = Cat.all
  end

  def new
    @cat = Cat.new
  end

  def edit; end

  def create
    @cat = Cat.new(cat_params)

    if @cat.save
      redirect_to cats_path, notice: I18n.t('cats.successfully_created', cat: @cat.name)
    else
      render :new, status: :unprocessable_entity, alart: I18n.t('cats.failed_to_create')
    end
  end

  def update
    if @cat.update(cat_params)
      redirect_to cats_path, notice: I18n.t('cats.successfully_updated', cat: @cat.name)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @cat.destroy

    redirect_to cats_path, notice: I18n.t('cats.successfully_destroyed', cat: @cat.name)
  end

  private

  def set_cat
    @cat = Cat.find(params[:id])
  end

  def cat_params
    params.require(:cat).permit(:name)
  end
end
