class BlogsController < ApplicationController
  before_action :set_blog, only: [:show, :edit, :update, :destroy]
  # before_action :authenticate_user!
  def index
      @blog = Blog.all
      @user = User.all
  end
  
  def new
      if params[:back]
          @blog = Blog.new(blog_params)
      else        
          @blog = Blog.new
      end

  end

  def create
      @blog = current_user.blogs.build(blog_params) 
      if params[:back]
          render :new
      else
          if @blog.save
              redirect_to blogs_path, notice: "Blogs Enregistrer"
          else
              render :new
          end
      end
  end

  def confirm
      @blog = Blog.new(blog_params)
      @blog = current_user.blogs.build(blog_params) 
      render :new if @blog.invalid?
  end

  def edit
      @blog = Blog.find(params[:id])
  end

  def update
      @blog = Blog.find(params[:id])
      if @blog.update(blog_params)
          redirect_to blogs_path, notice: "Blog Update"
      else
          render :edit
      end
  end

  def destroy
      @blog = current_user.blogs.find(params[:id])
      @blog.destroy
      redirect_to blogs_path, notice: "Blog Delete"
  end

  def show
      @blog = Blog.find(params[:id]) 
  end

  private
  def blog_params
      params.require(:blog).permit(:content, :image, :image_cache, :user_id)
  end

  def set_blog
      @blog = Blog.find(params[:id])
  end

end
