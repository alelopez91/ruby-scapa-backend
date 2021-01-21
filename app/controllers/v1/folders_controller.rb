module V1
  class FoldersController < BaseController
    def show
      render_successful_response(folder, FolderSerializer)
    rescue ActiveRecord::RecordNotFound
      render_not_found
    end

    private

    def folder_params
      params.require(:folder).permit(:enable_voice_playback)
    end

    def folder
      @folder ||= current_user.folder
    end
  end
end
