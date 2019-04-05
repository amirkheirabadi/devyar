  class AuthMiddleware
    def initialize(app)
      @app = app
    end
  
    def call(env)
      @req = Rack::Request.new(env)
      if is_dashboard_route?
        if !@req.session[:user_id]
          return [301, {"Location" => '/auth'}, self]
        end

        user = User.where(id: @req.session[:user_id]).take
        unless user
          return [301, {"Location" => '/auth'}, self]
        end


        @req.session[:current_user] = user

        if @req.path != "/dashboard/account"
          companies = user.companies
          # if companies.count == 0
          #   return [301, {"Location" => '/dashboard/account'}, self]
          # end

          # if !@req.session[:current_company]
          #   @req.session[:current_company] = companies[0].id
          # end
        end
      elsif @req.session[:user_id] && is_auth_route? && @req.path != "/auth/signout"
        return [301, {"Location" => '/dashboard'}, self]
      end

      status, headers, body = @app.call(env)
      return [status, headers, body]
    end
  
    def is_dashboard_route?
      @req.path =~ /^\/dashboard/
    end 

    def is_auth_route?
      @req.path =~ /^\/auth/
    end
  end
