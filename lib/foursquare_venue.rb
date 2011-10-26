module Foursquare
  class Venue < Foursquare::Node
    #Venues
    def add(params={})
      params = {:name => "",
                :address => "",
                :crossStreet => "",
                :city=>"San Francisco",
                :state=>"California",
                :zip=>"94108",
                :phone=>"",
                :primaryCategoryId => "4bf58dd8d48988d1e1931735"}.merge!(params)

      perform_graph_request("venues/add", params, "post")
    end

    def self.categories(params={})
      perform_graph_request("venues/categories", params)
    end

    def categories(params={})
      perform_graph_request("venues/categories", params)
    end

    def self.search(params={})
      params = { :limit=>"50" }.merge!(params)
      perform_graph_request("venues/search", params)
    end
    
    def search(params={})
      params = { :limit => "50" }.merge!(params)
      perform_graph_request("venues/search", params)
    end

    def search(params={})
      self.class.search(params.merge(:oauth_token => @access_token))
    end

    #Aspects
    def herenow(venue_id)
      perform_graph_request("venues/#{venue_id}/herenow", {})
    end

    #sort = recent or popular
    def tips(venue_id, params={:sort => "recent"})
      perform_graph_request("venues/#{venue_id}/tips", params)
    end

    #marktodo
    def marktodo(venue_id, params={})
      params = {:text => ""}.merge!(params)

      perform_graph_request("venues/#{venue_id}/marktodo", params, "post")
    end

    def flag(venue_id, params={})
      params = {:problem => "mislocated"}.merge!(params)

      perform_graph_request("venues/#{venue_id}/flag", params, "post")
    end

    def proposeedit(venue_id, params={})
      params = {:name => "",
                :address => "",
                :crossStreet => "",
                :city=>"San Francisco",
                :state=>"California",
                :zip=>"94108",
                :phone=>"",
                :primaryCategoryId => "4bf58dd8d48988d1e1931735"}.merge!(params)

      perform_graph_request("venues/#{venue_id}/proposeedit", params, "post")
    end
  end
end
