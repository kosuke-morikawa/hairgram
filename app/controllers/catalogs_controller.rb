class CatalogsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  def index
    @catalogs = Catalog.all
  end

  def show
    @catalog = Catalog.find(params[:id])
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
    @catalog = Catalog.find(params[:id])
  end

  def update
    @catalog = Catalog.find(params[:id])
    @catalog.update(catalog_params)
    redirect_to catalog_path(@catalog)
  end

  def destroy
    catalog = Catalog.find(params[:id])
    catalog.destroy
    redirect_to catalogs_path
  end

  private
  def catalog_params
    params.require(:catalog).permit(:title, :body, :image)
  end

end
