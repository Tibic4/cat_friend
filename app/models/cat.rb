class Cat < ApplicationRecord
  has_many :subjects, dependent: :destroy
end
