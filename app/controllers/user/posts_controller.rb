class User::PostsController < User::ApplicationController
  before_action :current_post, only: %i(show edit update destroy)

  def index
    @posts = current_user.posts.sort_new
  end

  def show; end

  def new
    @post = current_user.posts.new
  end

  def create
    @post = current_user.posts.create(post_params)
    return redirect_to user_post_path(@post), notice: t('.success') if @post
    render :new
  end

  def edit; end

  def update
    is_updated = @post.update(post_params)
    return redirect_to user_post_path(@post), notice: t('.success') if is_updated
    render :edit
  end

  def destroy
    message = @post.destroy ? { notice: t('.success') } : { alert: t('.fail') }
    return redirect_to user_posts_path, message
  end

  private

  def current_post
    @post = current_user.posts.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :body, :category_id, :form)
  end
end
