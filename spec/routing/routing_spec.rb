
require 'rails_helper'

describe "Routing", type: :controller do
  # context "Sessions Routing" do
  #   it "routes GET /login to sessions#new" do
  #     expect(:get => '/login').to route_to('sessions#new')
  #   end
  #   it "routes POST /login to sessions#create" do
  #     expect(:post => '/login').to route_to('sessions#create')
  #   end
  # end

  context "Seasons Routing" do
    it "route GET /index to seasons#index" do
      expect(:get => '/seasons').to route_to('seasons#index')
    end
  end



end
