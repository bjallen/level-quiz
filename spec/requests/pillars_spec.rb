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

RSpec.describe "/pillars", type: :request do
  
  # This should return the minimal set of attributes required to create a valid
  # Pillar. As you add validations to Pillar, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  describe "GET /index" do
    it "renders a successful response" do
      Pillar.create! valid_attributes
      get pillars_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      pillar = Pillar.create! valid_attributes
      get pillar_url(pillar)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_pillar_url
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "renders a successful response" do
      pillar = Pillar.create! valid_attributes
      get edit_pillar_url(pillar)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Pillar" do
        expect {
          post pillars_url, params: { pillar: valid_attributes }
        }.to change(Pillar, :count).by(1)
      end

      it "redirects to the created pillar" do
        post pillars_url, params: { pillar: valid_attributes }
        expect(response).to redirect_to(pillar_url(Pillar.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Pillar" do
        expect {
          post pillars_url, params: { pillar: invalid_attributes }
        }.to change(Pillar, :count).by(0)
      end

      it "renders a successful response (i.e. to display the 'new' template)" do
        post pillars_url, params: { pillar: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested pillar" do
        pillar = Pillar.create! valid_attributes
        patch pillar_url(pillar), params: { pillar: new_attributes }
        pillar.reload
        skip("Add assertions for updated state")
      end

      it "redirects to the pillar" do
        pillar = Pillar.create! valid_attributes
        patch pillar_url(pillar), params: { pillar: new_attributes }
        pillar.reload
        expect(response).to redirect_to(pillar_url(pillar))
      end
    end

    context "with invalid parameters" do
      it "renders a successful response (i.e. to display the 'edit' template)" do
        pillar = Pillar.create! valid_attributes
        patch pillar_url(pillar), params: { pillar: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested pillar" do
      pillar = Pillar.create! valid_attributes
      expect {
        delete pillar_url(pillar)
      }.to change(Pillar, :count).by(-1)
    end

    it "redirects to the pillars list" do
      pillar = Pillar.create! valid_attributes
      delete pillar_url(pillar)
      expect(response).to redirect_to(pillars_url)
    end
  end
end
