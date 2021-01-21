# frozen_string_literal: true

class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  include DeviseTokenAuth::Concerns::User

  has_one :folder

  has_many :custom_categories, through: :folder

  after_create :create_folder

  private

  def create_folder
    self.create_folder!
  end
end
