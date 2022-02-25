class HomeController < ApplicationController
  def index
  end

  def about 
    @about_me = "my name is sean"
  end

end
