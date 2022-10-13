# frozen_string_literal: true

class SubjectsController < ApplicationController
  def create
    @subject = Subject.new(subject_params)

    if @subject.save
      @cat = Cat.find(subject_params[:cat_id])
      columns = %i[id name]
      @cat_form = CatForm.new(
        {
          cat_name: @cat.name,
          subjects: @cat.subjects.pluck(*columns).map { columns.zip(_1).to_h }
        },
        cat: @cat
      )
      flash.now.notice = I18n.t('flash_messages.subjects.successfully_created', subject: @subject.name)
    end
  end

  private

  def subject_params
    params.require(:subject).permit(:name, :cat_id)
  end
end
