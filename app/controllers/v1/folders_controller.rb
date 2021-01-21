module V1
  class FoldersController < BaseController
    def show
      render_successful_response(folder, FolderSerializer)
    rescue ActiveRecord::RecordNotFound
      render_not_found
    end

    def update
      folder.update!(folder_params)

      render_successful_response(folder, FolderSerializer)
    rescue ActiveRecord::RecordNotFound
      render_not_found
    rescue ActiveRecord::RecordInvalid
      render_unprocessable_entity
    end

    private

    def folder_params
      params.require(:folder).permit(:enable_voice_playback)
    end

    def folder
      raise ActiveRecord::RecordNotFound unless current_user.folder.present?
      @folder ||= current_user.folder
    end
  end
end
