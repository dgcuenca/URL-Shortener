class LinksController < ApplicationController
  def index
    # @links = Link.order(created_at: :desc)
    # implement as a shorcut because it is common this is comming from the model using scope
    @links = Link.recent_first
  end

  def create
    @link = Link.new(link_params)
    if @link.save
      redirect_to root_path
    else
      #we have to have the instance variable before render the index action because in the 
      #index view we are rendering @links and if we dont have we are going to get an error
      #also we can call the index action:
      #index
      @links = Link.recent_first
      render :index, status: :unprocessable_entity
    end
  end

  private

  def link_params
    params.require(:link).permit(:url)
  end
end