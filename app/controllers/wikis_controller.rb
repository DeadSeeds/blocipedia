class WikisController < ApplicationController

  before_action :authenticate_user!, :except => [:show, :index]


  def index
    @wikis = Wiki.all
    @user = current_user
    authorize @wikis
  end

  def show
    @wiki = Wiki.find(params[:id])
    authorize @wiki
  end

  def new
    @wiki = Wiki.new
    authorize @wiki
  end

  def edit
    @wiki = Wiki.find(params[:id])
    authorize @wiki
  end

  def create
    @wiki = Wiki.new(wiki_params)
    @wiki.user = current_user
    authorize @wiki

    if @wiki.save
      flash[:notice] = "Post was saved."
      redirect_to @wiki
    else
      flash.now[:alert] = "There was an error saving the wiki.  Please try again."
      render :new
    end
  end

  def update
    @wiki = Wiki.find(params[:id])
    @wiki.assign_attributes(wiki_params)

    authorize @wiki

    if @wiki.save
      flash[:notice] = "Wiki was saved."
      redirect_to @wiki
    else
      flash.now[:alert] = "There was an error saving the wiki.  Please try again."
      render :new
    end
  end

  def destroy
    @wiki = Wiki.find(params[:id])

    authorize @wiki

    if @wiki.destroy
      flash[:notice] = "\"#{@wiki.title}\" was deleted."
      redirect_to wikis_path
    else
      flash.now[:alert] = "Sorry, but there was an error deleting the wiki."
      render :show
    end
  end



  private

  def wiki_params
    params.require(:wiki).permit(:title, :body, :private)
  end

end
