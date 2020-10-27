module Api
  class Coinbase
    def request
      super(:get, url)
    end

    def parsed_response(response)
      response.dig('data', 'amount')
    end

    def url
      pair = @options.fetch(:pair, 'usd')
      "api.coinbase.com/v2/prices/#{@options[:symbol ]}-usd/spot"
    end
  end
end