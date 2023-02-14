class BlogsController < ApplicationController
    # GET - show all blogs
    def index
        @blogs = Blog.all
    end

    # GET - request page to create a blog
    def new
        @blog = Blog.new
    end

    # POST - create blog
    def create
        @blog = Blog.new(blog_params)

        if @blog.save
            flash[:notice] = "Blog successfully saved!"
            redirect_to blogs_path
        else
            flash[:notice] = "There was an error when creating a blog"
            render :new, status: :unprocessable_entity
        end
    end

    private
    def blog_params
        params.require(:blog).permit(:title, :content, :image_path)
    end
end
