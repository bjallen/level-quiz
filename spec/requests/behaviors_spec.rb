require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to test the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator. If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails. There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.

RSpec.describe "/behaviors", type: :request do
  
  # This should return the minimal set of attributes required to create a valid
  # Behavior. As you add validations to Behavior, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    pillar = Pillar.create!(name: "a")
    competency = Competency.create!(name: "b", pillar: pillar)
    level = Level.create!(name: "c")
    {
      description: "stuff",
      competency_id: competency.id,
      level_id: level.id
    }
  }

  let(:invalid_attributes) {
    pillar = Pillar.create!(name: "a")
    competency = Competency.create!(name: "b", pillar: pillar)
    level = Level.create!(name: "c")
    {
      description: nil,
      competency_id: nil,
      level_id: level.id
    }
  }

  describe "GET /index" do
    it "renders a successful response" do
      Behavior.create! valid_attributes
      get behaviors_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      behavior = Behavior.create! valid_attributes
      get behavior_url(behavior)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_behavior_url
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "renders a successful response" do
      behavior = Behavior.create! valid_attributes
      get edit_behavior_url(behavior)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Behavior" do
        expect {
          post behaviors_url, params: { behavior: valid_attributes }
        }.to change(Behavior, :count).by(1)
      end

      it "redirects to the created behavior" do
        post behaviors_url, params: { behavior: valid_attributes }
        expect(response).to redirect_to(behavior_url(Behavior.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Behavior" do
        expect {
          post behaviors_url, params: { behavior: invalid_attributes }
        }.to change(Behavior, :count).by(0)
      end

      it "renders an unsuccessful response (i.e. 422 Unprocessable Entity)" do
        post behaviors_url, params: { behavior: invalid_attributes }
        expect(response.code).to eq("422")
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        pillar = Pillar.create!(name: "a")
        competency = Competency.create!(name: "b", pillar: pillar)
        level = Level.create!(name: "c")
        {
          description: "stuff",
          competency_id: competency.id,
          level_id: level.id
        }
      }

      it "updates the requested behavior" do
        behavior = Behavior.create! valid_attributes
        patch behavior_url(behavior), params: { behavior: new_attributes }
        behavior.reload
        expect(behavior.id).to be_present
        expect(behavior.description).to eq("stuff")
        expect(behavior.competency_id).to be_present
        expect(behavior.level_id).to be_present
      end

      it "redirects to the behavior" do
        behavior = Behavior.create! valid_attributes
        patch behavior_url(behavior), params: { behavior: new_attributes }
        behavior.reload
        expect(response).to redirect_to(behavior_url(behavior))
      end
    end

    context "with invalid parameters" do
      it "renders an unsuccessful response (i.e. 422 Unprocessable Entity)" do
        behavior = Behavior.create! valid_attributes
        patch behavior_url(behavior), params: { behavior: invalid_attributes }
        expect(response.code).to eq("422")
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested behavior" do
      behavior = Behavior.create! valid_attributes
      expect {
        delete behavior_url(behavior)
      }.to change(Behavior, :count).by(-1)
    end

    it "redirects to the behaviors list" do
      behavior = Behavior.create! valid_attributes
      delete behavior_url(behavior)
      expect(response).to redirect_to(behaviors_url)
    end
  end
end
