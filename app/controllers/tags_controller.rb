class TagsController < ApplicationController

  def index
    @tags = Tag.all
  end

  def show
    @tag = Tag.find(params[:id])
    @prototypes = Prototype.includes(:tags).where(tags: {id: (params[:id])})
    @tags = Tag.group(:name).count.find(params[:id])
  end

end
