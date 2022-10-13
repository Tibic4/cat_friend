# frozen_string_literal: true

class NotationSettingsController < ApplicationController
  before_action :set_cat

  def edit
    @subjects = @cat.subjects
  end

  def update
    render :edit, status: :unprocessable_entity
  end

  private

  def set_cat
    @cat = Cat.find(params[:cat_id])
  end
end
