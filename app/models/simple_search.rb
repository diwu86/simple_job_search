class SimpleSearch < ActiveRecord::Base
  attr_accessor :search_client
  validates :keywords, :location, presence: true

  # set up a new Faraday client to make api call
  def set_up_client
    # TODO here we should put the url in a search client config file for easy update
    self.search_client = ::Faraday.new(:url => 'https://hhyxfft5x7.execute-api.us-east-1.amazonaws.com') do |faraday|
      faraday.request  :url_encoded
      faraday.response :logger
      faraday.adapter  Faraday.default_adapter
    end
  end

  # get search results by calling API
  #TODO url and body should be configurable instead of hard code
  def get_search_result(page)
    begin
      search_client.post do |req|
        req.url '/prod/search'
        req.headers['Content-Type'] = 'application/json'
        req.body = simple_search_body(page)
      end
    rescue => e
      Rails.logger.error "API connection error " + e.message
    end
  end

  private

  #TODO This is not desired, should think about injection.
  #The reason we have to do it this way now is api does not take the syntax for ruby api.
  def simple_search_body(page)
    '{"keywords":"'+"#{keywords}".to_s+'","location":"'+"#{location}"+'","page":'+"#{page}}"
  end
end
