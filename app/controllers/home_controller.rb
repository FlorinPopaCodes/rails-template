class HomeController < ApplicationController
  layout "inertia"

  def show
    render inertia: "Home", props: {
      greeting: "Welcome to Rails Template"
    }
  end
end
