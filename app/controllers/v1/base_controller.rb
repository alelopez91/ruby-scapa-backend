module V1
  class BaseController < ApplicationController
    before_action :authenticate_user!

    def current_folder
      current_user.folder
    end
  end
end
