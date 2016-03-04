class PostsController < ApplicationController

  before_action :require_logged_in

  def new
    @post = Post.new
    render :new
  end

  def create
    @post = Post.new(post_params)
    @post.author_id = current_user.id

    if @post.save
      redirect_to sub_url(params[:sub_id])
    else
      flash.now[:errors] = @post.errors.full_messages
      render :new
    end

  end

  def edit
    @post = Post.find(params[:id])
    render :edit
  end

  def update
    @post = Post.find(params[:id])

    if @post.update_attributes(post_params)
      redirect_to sub_url(params[:sub_id])
    else
      render :edit
    end
  end

  def show
    @post = Post.find(params[:id])
    render :show
  end

  def destroy
    @post = Post.find(params[:id])
    sub_id = @post.sub_id

    @post.destroy
    redirect_to sub_url(sub_id)

  end

  def post_params
    params.require(:post).permit(:title, :url, :content, sub_ids: [])
  end

end
