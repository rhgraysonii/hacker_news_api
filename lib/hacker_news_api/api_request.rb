module HackerNewsApi
  class ApiRequest

    def driver
      HttpDriver
    end

    def request_url
      # get base url for here
    end

    def host
      uri.host
    end

    def path
      uri.path
    end

    def port
      (uri.scheme == 'https') ? 443 : 80
    end

    def uri
      URI.parse(request_url)
    end

    def param_string(params)
      param_string = params.keys.sort.map do |key|
        "#{CGI.escape(key.to_s)}=#{CGI.escape(params[key].to_s)}"
      end.join("&")
    end

    private

    def default_params
      {client_id: HackerNewsApi.config.app_id, timestamp: Time.now.to_i}
    end
  end
end
