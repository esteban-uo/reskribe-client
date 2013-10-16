module ReskribeApi
  class Request

    def self.request(path, method=:get, data = {})
      req = self.new([path, 'api_token=' + ReskribeApi.api_token].join('?'), method)
      req.data = data
      req.make && req.success? ? req.output : false
    end
  
    attr_reader :path, :method
    attr_accessor :data
  
    def initialize(path, method = :get)
      @path = path
      @method = method
    end
  
    def success?
      @success || false
    end
  
    def output
      @output || nil
    end

    def make
      protocol = (ReskribeApi.ssl) ? 'https://' : 'http://'
      path = (ReskribeApi.api_base) ? ReskribeApi.api_base : 'api.reskribe.com/v1'

      uri = URI.parse([protocol + path, @path].join('/'))
      
      http_request = http_class.new(uri.request_uri)
      http_request.initialize_http_header({"User-Agent" => "ReskribeApiRubyClient/#{ReskribeApi::VERSION}"})
      http_request.initialize_http_header({"Accept" => "application/json"})
      http_request.content_type = "application/json"
    
      http = Net::HTTP.new(uri.host, uri.port)
    
      if ReskribeApi.ssl
        http.use_ssl = true
        http.verify_mode = OpenSSL::SSL::VERIFY_NONE
      end

      http_result = http.request(http_request, @data.to_json)
      
      if http_result.body == 'true'
        @output = true
      elsif http_result.body == 'false'
        @output = false
      else
        http_result.body ? @output = JSON_parse(http_result.body) : @output
      end

      @success = case http_result
      when Net::HTTPSuccess
        true
      when Net::HTTPServiceUnavailable
        raise ReskribeApi::Errors::ServiceUnavailable
      when Net::HTTPForbidden, Net::HTTPUnauthorized
        raise ReskribeApi::Errors::AccessDenied, "Access Denied"
      when Net::HTTPNotFound
        json = JSON_parse(http_result.body)
        raise ReskribeApi::Errors::NotFound, json
      when Net::HTTPBadRequest, Net::HTTPUnauthorized, Net::HTTPMethodNotAllowed
        json = JSON_parse(http_result.body)
        raise ReskribeApi::Errors::AccessDenied, "Access Denied: #{json}"
      else
        raise ReskribeApi::Errors::CommunicationError, http_result.body
      end
      self
    end
  
    private

    def JSON_parse json
      return JSON.parse(json, :symbolize_names => true)  
      
      rescue JSON::ParserError
        raise ReskribeApi::Errors::UnexpectedResponse, "Wrong JSON response" 
    end  
  
    def http_class  
      case @method
      when :post    then Net::HTTP::Post
      when :put     then Net::HTTP::Put
      when :delete  then Net::HTTP::Delete
      else
        Net::HTTP::Get
      end
    end
  
  end
end