class StaticPagesController < ApplicationController
  before_action :require_current_user!, except: [:login]

  def root
  end

  def login
  end
end
