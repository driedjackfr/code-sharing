class User::PostsController < User::ApplicationController
  before_action :current_post, only: :show

  def new
    @post = current_user.posts.new
  end

  def create
    @post = current_user.posts.create(post_params)
    return redirect_to user_post_path(@post), notice: t('.success') if @post
    render :new
  end

  def show; end

  private

  def current_post
    @post = current_user.posts.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :body)
  end
end
