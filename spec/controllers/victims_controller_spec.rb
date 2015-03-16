require 'rails_helper'

RSpec.describe VictimsController, type: :controller do

  let(:valid_attributes) { attributes_for(:victim) }
  let(:invalid_attributes) { attributes_for(:victim, age: -10) }
  let(:valid_session) { {} }

  describe "GET #index" do
    it "assigns all victims as @victims" do
      victim = Victim.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:victims)).to eq([victim])
    end
  end

  describe "GET #show" do
    it "assigns the requested victim as @victim" do
      victim = Victim.create! valid_attributes
      get :show, {:id => victim.to_param}, valid_session
      expect(assigns(:victim)).to eq(victim)
    end
  end

  describe "GET #new" do
    it "assigns a new victim as @victim" do
      get :new, {}, valid_session
      expect(assigns(:victim)).to be_a_new(Victim)
    end
  end

  # describe "GET #edit" do
  #   it "assigns the requested victim as @victim" do
  #     victim = Victim.create! valid_attributes
  #     get :edit, {:id => victim.to_param}, valid_session
  #     expect(assigns(:victim)).to eq(victim)
  #   end
  # end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Victim" do
        expect {
          post :create, {:victim => valid_attributes}, valid_session
        }.to change(Victim, :count).by(1)
      end

      it "assigns a newly created victim as @victim" do
        post :create, {:victim => valid_attributes}, valid_session
        expect(assigns(:victim)).to be_a(Victim)
        expect(assigns(:victim)).to be_persisted
      end

      it "redirects to the created victim" do
        post :create, {:victim => valid_attributes}, valid_session
        expect(response).to redirect_to(victims_path)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved victim as @victim" do
        post :create, {:victim => invalid_attributes}, valid_session
        expect(assigns(:victim)).to be_a_new(Victim)
      end

      it "re-renders the 'new' template" do
        post :create, {:victim => invalid_attributes}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  # describe "PUT #update" do
  #   context "with valid params" do
  #     let(:new_attributes) { attributes_for(:victim, name: "Major Update Major") }
  #
  #     it "updates the requested victim" do
  #       victim = Victim.create! valid_attributes
  #       put :update, {:id => victim.to_param, :victim => new_attributes}, valid_session
  #       victim.reload
  #       expect(victim.name).to eq("Major Update Major")
  #     end
  #
  #     it "assigns the requested victim as @victim" do
  #       victim = Victim.create! valid_attributes
  #       put :update, {:id => victim.to_param, :victim => valid_attributes}, valid_session
  #       expect(assigns(:victim)).to eq(victim)
  #     end
  #
  #     it "redirects to the victim" do
  #       victim = Victim.create! valid_attributes
  #       put :update, {:id => victim.to_param, :victim => valid_attributes}, valid_session
  #       expect(response).to redirect_to(victim)
  #     end
  #   end
  #
  #   context "with invalid params" do
  #     it "assigns the victim as @victim" do
  #       victim = Victim.create! valid_attributes
  #       put :update, {:id => victim.to_param, :victim => invalid_attributes}, valid_session
  #       expect(assigns(:victim)).to eq(victim)
  #     end
  #
  #     it "re-renders the 'edit' template" do
  #       victim = Victim.create! valid_attributes
  #       put :update, {:id => victim.to_param, :victim => invalid_attributes}, valid_session
  #       expect(response).to render_template("edit")
  #     end
  #   end
  # end
  #
  # describe "DELETE #destroy" do
  #   it "destroys the requested victim" do
  #     victim = Victim.create! valid_attributes
  #     expect {
  #       delete :destroy, {:id => victim.to_param}, valid_session
  #     }.to change(Victim, :count).by(-1)
  #   end
  #
  #   it "redirects to the victims list" do
  #     victim = Victim.create! valid_attributes
  #     delete :destroy, {:id => victim.to_param}, valid_session
  #     expect(response).to redirect_to(victims_url)
  #   end
  # end

end
