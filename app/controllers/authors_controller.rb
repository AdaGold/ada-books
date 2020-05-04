class AuthorsController < ApplicationController
  def index
    @authors = Author.all.order(:name)
  end

  def show
    @author = Author.find_by(id: params[:id])

    if @author.nil?
      head :not_found
      return
    end
  end
end
