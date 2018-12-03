class PagesController < ApplicationController
  skip_before_action :require_login

  def about
    @heading = 'Page with my contacts'
  end
end
