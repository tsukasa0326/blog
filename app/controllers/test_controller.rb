class TestController < ApplicationController
    
    def index
        
        @users = User.all.order(created_at: 'asc')
        
    end
    
end
