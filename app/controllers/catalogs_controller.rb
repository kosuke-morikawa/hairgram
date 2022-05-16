class CatalogsController < ApplicationController
  def index
  end

  def show
  end

  def new
    @catalog = Catalog.new
  end

  def create
    @catalog = Catalog.new(catalog_params)
    @catalog.user_id = current_user.id
    @catalog.save
    redirect_to catalog_path(@catalog)
  end

  def edit
  end

  private
  def catalog_params
    params.require(:catalog).permit(:title, :body, :image)
  end

end
