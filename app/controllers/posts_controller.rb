class PostsController < ApplicationController
  def show
    @post = Post.normal.find params[:id]
  end
end
