require 'net/http'
require 'json'
module PinterestApi
  class HttpDriver

    def self.put(host, port, path, body = nil)
      req = Net::HTTP::Put.new(path)
      req.body = body if body
      net_http = Net::HTTP.new(host, port)
      net_http.use_ssl = true

      response = net_http.start { |http| http.request(req) }
    end

    def self.post(host, port, path, body = nil)
      req = Net::HTTP::Post.new(path)
      req.body = body if body
      net_http = Net::HTTP.new(host, port)
      net_http.use_ssl = true

      response = net_http.start { |http| http.request(req) }
    end

    def self.get(host, port, path)
      req = Net::HTTP::Get.new(path)
      net_http = Net::HTTP.new(host, port)
      net_http.use_ssl = true

      response = net_http.start { |http| http.request(req) }
    end
  end
end
