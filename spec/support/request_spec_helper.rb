# helper to parse response body in tests
module RequestSpecHelper
  def json
    JSON.parse(response.body)
  end
end
