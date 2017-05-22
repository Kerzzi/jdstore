class WelcomeController < ApplicationController

  class WelcomeController < ApplicationController

    def index
      fetch_home_data

      @products = Product.onshelf.page(params[:page] || 1).per_page(params[:per_page] || 12)
        .order("id desc").includes(:product_images)
    end

  end

end
