require "rails_helper"

RSpec.describe QuizGuessesController, type: :routing do
  describe "routing" do
    it "routes to #new" do
      expect(get: "/quiz_guesses/new").to route_to("quiz_guesses#new")
    end

    it "routes to #show" do
      expect(get: "/quiz_guesses/1").to route_to("quiz_guesses#show", id: "1")
    end

    it "routes to #create" do
      expect(post: "/quiz_guesses").to route_to("quiz_guesses#create")
    end
  end
end
