class CollaborationsController < ApplicationController

  def index
    @wiki = Wiki.find(params[:wiki_id])
  end

  def create
    wiki = Wiki.find(params[:wiki_id])
    collab = wiki.collaborations.new(collaboration_params)
    authorize collab

    if collab.save
      flash[:notice] = "Added Collaborator"
    else
      flash[:alert] = "An error occured saving the collaborator"
    end

    redirect_to wiki_collaborations_path(wiki, collab)
  end

  def destroy
    wiki = Wiki.find(params[:wiki_id])
    collab = wiki.collaborations.find(params[:id])
    authorize collab

    if collab.destroy
      flash[:notice] = "Collaborator removed"

    else
      flash[:alert] = "There was an error removing the collaborator"
    end
    redirect_to wiki_collaborations_path(wiki, collab)
  end

  private

  def collaboration_params
    params.require(:collaboration).permit(:user_id)
  end
end
