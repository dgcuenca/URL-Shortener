class ViewsController < ApplicationController
  before_action :set_link, only: [:show]

  def show
    #its necessary if for example you want to detect boots
    @link.views.create(ip: request.ip, user_agent: request.user_agent)
    
    redirect_to @link.url, allow_other_host: true
  end
end