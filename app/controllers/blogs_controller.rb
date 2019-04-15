class BlogsController < ApplicationController

  def index
    @blogs = Blog.all
  end

  def new
    @blog = Blog.new
    print @blog.id
  end

  def create
    @blog = Blog.new(blog_params)
    @blog.save
    print @blog
    redirect_to blog_path(@blog)
  end

  def show
    @blog = Blog.find_by(id: params[:id])
  end

  def edit
    @blog = Blog.find_by(id: params[:id])
  end

  def update
    @blog = Blog.find_by(id: params[:id])
    puts params.inspect
    @blog.update(title: blog_params[:title], content: blog_params[:content])

    redirect_to @blog
  end

  def destroy
    @blog = Blog.find_by(id: params[:id])
    @blog.destroy
    redirect_to blogs_path
  end

  private

  def blog_params
    params.require(:blog).permit(:title, :content, :id)
  end
end
