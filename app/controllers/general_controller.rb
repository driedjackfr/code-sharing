class GeneralController < ApplicationController
  def top
    @posts = Post.normal.select(:id, :created_at, :title, :category_id).sort_new
                 .includes(:category).group_by {|p| p.created_at.strftime('%d/%m/%Y')}
  end

  def history
    @post = Post.history.first
  end
end
