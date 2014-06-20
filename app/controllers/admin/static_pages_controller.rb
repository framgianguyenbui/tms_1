class Admin::StaticPagesController < ApplicationController
  before_action :signed_in_admin
  def home
  end
end
