class FilesController < ApplicationController
  def new

  end

  def create
    logger.info params[:file].inspect

    tab_file = params[:file].read

    redirect_to new_file_path
  end
end
