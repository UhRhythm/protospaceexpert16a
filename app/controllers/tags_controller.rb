class TagsController < ApplicationController

  def show
    @tag = Tag.find(params[:id])
    @prototypes = Prototype.includes(:tags).where(tags: {id: (params[:id])})
  end

end
