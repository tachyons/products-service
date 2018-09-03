module RequestSpecHelper
  def valid_headers
    {
      'Authorization' => 'samplevalue',
      'Content-Type' => 'application/json'
    }
  end
end
