class PostsController < ApplicationController
    def index
        posts = []

        User.all.each do |user|
            if user["active"] == true
                posts.concat(user.posts)
            end
        end

        if posts.length > 0
            render json: posts, status: :ok
        else
            render json: ["No active users with posts."], status: :ok
        end
    end

    def show
        post = Post.find(params[:id])
        user = User.find(post.user_id)

        if user.active == true
            render json: post, status: :ok
        else
            render json: ["User is not active."], status: :ok
        end
    end

    def create
        user = User.find(params[:id])
        post = Post.new(post_params)

        if user["active"] == true
            if post.save
                render json: post, status: :created
              else
                render json: post.errors, status: :unprocessable_entity
              end
        else
            render json: ["User not active."], status: :ok
        end
    end

    private

    def post_params
        params.require(:post).permit(:title, :content, :user_id)
    end
end
