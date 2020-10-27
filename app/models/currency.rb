class Currency < ApplicationRecord
  def calculate_value(amount)
    (current_price.to_f * amount.to_f)
  end

  def current_price
    headers = {
      "X-CMC_PRO_API_KEY" => "8eb899fe-6513-4727-8a80-a595d693a45e"
    }
    url = "https://pro-api.coinmarketcap.com/v1/cryptocurrency/quotes/latest?slug=#{self.slug}"
    request = HTTParty.get(
      url,
      'Content-Type' => 'application/json',
      :headers => headers
    )
    response = JSON.parse(request.body)
    id = get_id(response.dig('data')).first
    usd_price = response.dig('data', id, 'quote', 'USD', 'price')
  end

  def get_id(data)
    id = data.keys
  end
end
