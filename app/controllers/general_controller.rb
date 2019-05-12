class GeneralController < ApplicationController
  def top
    @posts = Post.select(:id, :created_at, :title).sort_new
                 .group_by {|p| p.created_at.strftime('%d/%m/%Y')}
  end
end
