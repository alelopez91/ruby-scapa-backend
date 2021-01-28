class Folder < ApplicationRecord
  belongs_to :user

  has_many :custom_categories
  has_many :remembrances
end
