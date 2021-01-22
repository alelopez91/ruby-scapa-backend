class Folder < ApplicationRecord
  validates :enable_voice_playback, presence: true

  belongs_to :user

  has_many :custom_categories
end
