class SessionsController < ApplicationController
  skip_before_filter :authenticate, only: [:new, :create]

  def new
    @user = User.new
  end
end
