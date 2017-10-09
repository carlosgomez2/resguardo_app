class DashboardController < ApplicationController
  before_action :authenticate_user!
  def index
    # Retrieve last 10 packages added to the database in DESC order
    @packages = Package.all.limit(10).reverse
  end
end
