class PostsController < ApplicationController


    # Method provided by Devise. It will allow only logged in users to all actions
    before_filter :authenticate_user!, except: [:show, :index]
    before_filter :find_post, only: [:show, :edit, :update, :destroy]

	# Displays posts
    def index
      # @posts = Post.all we will replace this old code - you can delete this line
        @posts = Post.order('created_at DESC').page(params[:page]).per(15)
    end

    def show
    	#@post = Post.find(params[:id]) // Moved to before_filter
    end	

    # Creates posts
    def new
        @post = Post.new
    end

    # Create action
    def create

        # Allows to see who's the post author
        @user = current_user

        @post = @user.posts.build(allowed_params)

        if @post.save
            flash[:success] = "Your post was created."
            redirect_to @post
        else
            render 'new'
        end
    end

    # Allows to edt posts
    def edit
        #@post = Post.find(params[:id]) // Moved to before_filter
            # make sure the owner of the post is the only one allow to have access and make changes
            redirect_to posts_path unless @post.user == current_user
    end

    # "Update" action allows to save changes
    def update
        #@post = Post.find(params[:id]) // Moved to before_filter
        if @post.user == current_user
            if @post.update_attributes(allowed_params)
                flash[:success] = "Updated post"
                redirect_to @post
            else
                render 'edit'
            end
        else
            redirect_to posts_path
            flash[:notice] = "You can't to this"
        end
    end

    # Allows to erase a post
    def destroy
        #@post = Post.find(params[:id]) // Moved to before_filter
        
        if @post.user == current_user
            @post.destroy
            redirect_to posts_path
        else
            redirect_to root_path
            flash[:danger] = "You can't do this"
        end
    end

    # we have to add all parameters you are including in the form to "permitted" params. Otherwise, they won't be saved upon submission.
    private
        def allowed_params
            params.require(:post).permit(:title, :body)
    end
    
    def find_post
        @post = Post.find(params[:id])
    end

 end

