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

  def new
    @author = Author.new
  end

  def edit
    @author = Author.find_by(id: params[:id])
  end

  def create
    author = Author.new(author_params)

    if author.save
      redirect_to authors_path
      return
    else
      render :new, :bad_request
      return
    end
  end
  
  def update
    author = Author.find_by(id: params[:id])

    if author.nil?
      redirect_to authors_path
    else
      if author.update(author_params)
        redirect_to author_path(author.id)
        return
      else
        render :edit, :bad_request
        return
      end
    end
  end

  def destroy
    author = Author.find_by(id: params[:id])
    if author.nil?
      head :not_found
      return
    else
      author.destroy
      redirect_to authors_path
    end
  end

  private

  def author_params
    return params.require(:author).permit(:name, :bio_url)
  end
end
