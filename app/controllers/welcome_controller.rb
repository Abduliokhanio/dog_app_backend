class WelcomeController < ApplicationController
  def home
    respond_to do |format|
      format.html
      format.turbo_stream
    end    
  end
end
