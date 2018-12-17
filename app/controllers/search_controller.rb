class SearchController < ApplicationController
  def results
    if params[:search_field].present?
      @res = Post.search_for(params[:search_field]).all
    end
  end

  def search; end

end
