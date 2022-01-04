class TeaService
  def self.teas
    response = conn.get("/tea")
    parse_json(response)
  end

  private

  def self.conn
    Faraday.new(url: "https://tea-api-vic-lo.herokuapp.com")
  end

  def self.parse_json(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end
