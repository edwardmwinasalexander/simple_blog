class BlogPostsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @blog_posts = BlogPost.all
  end

  def show
    @blog_post = BlogPost.find(params[:id])
  end

  def new
    @blog_post = BlogPost.new
  end

  def edit
    @blog_post = BlogPost.find(params[:id])
  end

  def create
    @blog_post = BlogPost.new(blog_post_params)
    if @blog_post.save
      redirect_to @blog_post, notice: "Blog post was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @blog_post = BlogPost.find(params[:id])
    if @blog_post.update(blog_post_params)
      redirect_to @blog_post, notice: "Blog post was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @blog_post = BlogPost.find(params[:id])
    @blog_post.destroy
    redirect_to root_path
  end

  private


  def blog_post_params
    params.require(:blog_post).permit(:title, :body)
  end
end
