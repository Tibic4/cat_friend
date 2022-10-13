# frozen_string_literal: true

class CatForm
  include ActiveModel::Model

  SUBJECT_COLUMNS = %i[id name]

  attr_accessor :cat_name, :subjects

  validates :cat_name, presence: true
  validate :validate_subjects_name_must_present

  def initialize(attributes = nil, cat: Cat.new)
    @cat = cat
    super(attributes || default_attributes)
  end

  def save
    @cat.attributes = @cat_params
    @cat.save && subjects.all?(&:save)
  end

  def save
    return if invalid?

    ActiveRecord::Base.transaction do
      @cat.update!(name: cat_name) if @cat.name != cat_name
      update_subjects!
    end
  rescue ActiveRecord::RecordInvalid
    false
  end

  private

  def default_attributes
    {
      cat_name: @cat.name,
      subjects: @cat.subjects.pluck(SUBJECT_COLUMNS).map { SUBJECT_COLUMNS.zip(_1).to_h }
    }
  end

  def update_subjects!
    subjects.map do |subject|
      if subject[:id].blank?
        @cat.subjects.create!(name: subject[:name])
      else
        Subject.find(subject[:id]).update!(name: subject[:name])
      end
    end
  end

  def validate_subjects_name_must_present
    return if subjects.all? { |subject| subject[:name].present? }

    errors.add(:subjects, I18n.t('errors.messages.required'))
  end
end
