class GeneralController < ApplicationController
  def top
    @posts = Post.select('id, date(created_at), title').sort_new.group_by(&:date)
  end
end
