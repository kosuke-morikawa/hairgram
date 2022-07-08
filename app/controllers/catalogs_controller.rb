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
    if @catalog.save
      redirect_to catalog_path(@catalog), notice: '投稿に成功しました。'
    else
      render :new
    end
  end

  def edit
    @catalog = Catalog.find(params[:id])
    if @catalog.user != current_user
      redirect_to catalogs_path, alert: '不正なアクセスです。'
    end
  end

  def update
    @catalog = Catalog.find(params[:id])
    if @catalog.update(catalog_params)
      redirect_to catalog_path(@catalog), notice: '更新に成功しました。'
    else
      render :edit
    end
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
