class HomeController < ApplicationController
    def index
        return render "/layouts/website/index"
    end

    def login
        return render "/login/login"
    end

    def register
        return render "/login/register"
    end
  end
  