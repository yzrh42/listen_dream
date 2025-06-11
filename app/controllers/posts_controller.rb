class PostsController < ApplicationController
    before_action :authenticate_user!

    def index
        @posts = Post.all
        case params[:sort]
        when 'date'
          @posts = @posts.order(date: :desc)
        else
          @posts = @posts.order(created_at: :desc)
        end
    end
    
    def new
        @post = Post.new
    end
    
    def create
        @post = current_user.posts.new(post_params)
        if @post.save
          redirect_to posts_path, success: '作成しました'
        else
          flash.now[:danger] = '作成できませんでした'
          render :new
        end
    end

    def show
        @post = Post.find(params[:id])
    end

    def edit
        @post = current_user.posts.find(params[:id])
    end

    def update
        @post = current_user.posts.find(params[:id])
        if @post.update(post_params)
          redirect_to posts_path, success: '投稿内容を更新しました'
        else
          flash.now[:danger] = '投稿内容を更新できませんでした'
          render :edit
        end
    end
    
    def destroy
        @post = Post.find(params[:id])
        @post.destroy!
        redirect_to posts_path, success: '投稿を削除しました'
    end
    
    private
    
     def post_params
        params.require(:post).permit(:user_id, :body, :date, :image)
    end
end
