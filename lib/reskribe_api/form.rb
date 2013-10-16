module ReskribeApi
  class Form
    
    class << self
      def create(plan_code, uid)
        ReskribeApi::Request.request("forms", :post, { :plan_code => plan_code, :uid => uid })
      end

    end

  end
end