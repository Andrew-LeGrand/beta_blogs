class BlogsController < ApplicationController

    before_action :set_blog, only: [:show, :edit, :update, :destroy]

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

    # GET - show specific blog
    def show        
    end

    # GET - Edit a blog
    def edit        
    end

    def update       
        if @blog.update(blog_params)
            redirect_to blogs_path
        else
            render :edit, status: :unprocessable_entity
        end
    end

    def destroy        
        @blog.destroy
        redirect_to blogs_path
    end

    private
    def blog_params
        params.require(:blog).permit(:title, :content, :image_path)
    end

    def set_blog
        @blog = Blog.find(params[:id])
    end
end
