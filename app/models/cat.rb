class Cat < ApplicationRecord
  has_many :subject, dependent: :destroy
end
