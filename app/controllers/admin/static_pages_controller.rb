class Admin::StaticPagesController < ApplicationController
  before_action :signed_in_admin
  layout "layouts/admin"
  def home
  end
end
