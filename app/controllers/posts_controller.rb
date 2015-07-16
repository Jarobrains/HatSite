class PostsController < ApplicationController
  def show
    @post = Post.find(params['id'])
  end

  def new

  end

  def create
    @post = Post.new
    @post.title = params['title']
    @post.image_url = params['image_url']
    @post.contents = params['contents']
    @post.save

    redirect_to "/post/#{@post.id}"
  end
  def destroy
    @post = Post.find(params['id'])
    @post.destroy
    redirect_to "/"
  end

  def edit
    @post = Post.find(params['id'])
  end

  def update
    @post = Post.find(params['id'])
    @post.title = params['title']
    @post.image_url = params['image_url']
    @post.contents = params['contents']
    @post.save

    redirect_to "/post/#{@post.id}"

  end

  def index
    @posts = Post.all
  end


   def search_results

  @post = Post.find_by(:title => params["search_text"])
  if @post.nil?
  else
    redirect_to "/post/#{@post.id}"
  end

  end


end
