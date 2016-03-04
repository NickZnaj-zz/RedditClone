class SubsController < ApplicationController

  before_action :require_moderator, only: :edit
  before_action :require_logged_in
  
  def new
    @sub = Sub.new
    render :new
  end

  def create
    @sub = Sub.new(sub_params)
    @sub.moderator_id = current_user.id

    if @sub.save
      redirect_to subs_url
    else
      render :new
    end
  end

  def edit
    @sub = Sub.find(params[:id])
    render :edit
  end

  def update
    @sub = Sub.find(params[:id])

    if @sub.update_attributes(sub_params)
      redirect_to sub_url(@sub)
    else
      render :edit
      #flash.now messages...
    end
  end

  def show
    @sub = Sub.find(params[:id])
    render :show
  end

  def index
    @subs = Sub.all
    render :index
  end

  def require_moderator
    current_sub = Sub.find(params[:id])
    redirect_to subs_url unless current_user.id == current_sub.moderator_id
  end

  private
  def sub_params
    params.require(:sub).permit(:title, :description, :moderator_id)
  end
end
