# frozen_string_literal: true

class Cat < ApplicationRecord
  has_many :subjects, dependent: :destroy
end
