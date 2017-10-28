
require 'rails_helper'

describe "Routing", type: :controller do

  context "Seasons Routing" do
    it "route GET /seasons to seasons#index" do
      expect(:get => '/seasons').to route_to('seasons#index')
    end
  end

end
