class SessionsController < ApplicationController
  before_action :require_params, only: [:create]
  before_action :require_login, only: [:destroy]

  def create
    session[:name] = params[:name]
    redirect_to '/sessions/index'
  end

  def destroy
    session.clear
    redirect_to '/sessions/index'
  end

  def index
  end
end
