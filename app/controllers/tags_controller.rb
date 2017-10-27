class TagsController < ApplicationController

  def index
    @tags = Tag.group(:name)
  end

  def show
    @tag = Tag.find(params[:id])
    @prototypes = Prototype.includes(:tags).where(tags: {name: @tag.name})
    @tags = Tag.group(:name).count.find(params[:id])
  end

end
