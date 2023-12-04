class LinksController < ApplicationController
  before_action :set_link, only: [:show, :edit, :update, :destroy]

  def index
    # @links = Link.order(created_at: :desc)
    # implement as a shorcut because it is common this is comming from the model using scope
    @links = Link.recent_first
    # if the @link is already defined lets skipped but its not then create a new necessary since we are coling index from else statement from create action
    @link ||= Link.new
  end

  def show
  end

  def create
    @link = Link.new(link_params)
    if @link.save
      redirect_to root_path
    else
      #we have to have the instance variable before render the index action because in the 
      #index view we are rendering @links and if we dont have we are going to get an error
      #@links = Link.recent_first
      #also we can call the index action:
      index
      render :index, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @link.update(link_params)
      redirect_to @link
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
  end

  private

  def link_params
    params.require(:link).permit(:url)
  end
end