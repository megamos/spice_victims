require 'rails_helper'

RSpec.describe LinksController, type: :controller do

  let(:user) { create(:user)  }
  let(:valid_attributes) { attributes_for(:link)  }
  let(:invalid_attributes) { attributes_for(:link, topic: "OK") }
  let(:valid_session) { {} }

  describe "visitor actions" do
    describe "GET #new" do
      it "assigns a new link as @link" do
        get :new, {}, valid_session
        expect(assigns(:link)).to be_a_new(Link)
      end
    end

    describe "POST #create" do
      context "with valid params" do
        it "creates a new Link" do
          expect {
            post :create, {:link => valid_attributes}, valid_session
          }.to change(Link, :count).by(1)
        end

        it "assigns a newly created link as @link" do
          post :create, {:link => valid_attributes}, valid_session
          expect(assigns(:link)).to be_a(Link)
          expect(assigns(:link)).to be_persisted
        end

        it "redirects to root path" do
          post :create, {:link => valid_attributes}, valid_session
          expect(response).to redirect_to(root_path)
        end
      end

      context "with invalid params" do
        it "assigns a newly created but unsaved link as @link" do
          post :create, {:link => invalid_attributes}, valid_session
          expect(assigns(:link)).to be_a_new(Link)
        end

        it "re-renders the 'new' template" do
          post :create, {:link => invalid_attributes}, valid_session
          expect(response).to render_template("new")
        end
      end
    end
  end

  describe "user actions" do
    describe "PUT upvote" do
      context "when logged in" do
        before :each do
          sign_in(user)
        end

        it "increases the number of upvotes" do
          link = Link.create! valid_attributes
          put :upvote, id: link
          link.reload
          expect(link.cached_votes_up).to eq(1)
        end

        it "increases the total number of votes" do
          link = Link.create! valid_attributes
          expect{
            put :upvote, id: link
            link.reload
          }.to change(link, :cached_votes_total).from(0).to(1)
        end
      end

      context "when not logged in" do
        it "redirects to the login page" do
          link = Link.create! valid_attributes
          put :upvote, id: link
          expect(response).to redirect_to(new_user_session_path)
        end
      end
    end

    describe "PUT downvote" do
      context "when logged in" do
        before :each do
          sign_in(user)
        end

        it "increases the number of downvotes" do
          link = Link.create! valid_attributes
          put :downvote, id: link
          link.reload
          expect(link.cached_votes_down).to eq(1)
        end

        it "increases the total number of votes" do
          link = Link.create! valid_attributes
          expect{
            put :downvote, id: link
            link.reload
          }.to change(link, :cached_votes_total).from(0).to(1)
        end
      end

      context "when not logged in" do
        it "redirects to the login page" do
          link = Link.create! valid_attributes
          put :downvote, id: link
          expect(response).to redirect_to(new_user_session_path)
        end
      end
    end
  end

  describe "admin actions" do
    describe "GET #edit" do
      before :each do
        authorize_admin
      end

      it "assigns the requested link as @link" do
        link = Link.create! valid_attributes
        get :edit, {:id => link.to_param}, valid_session
        expect(assigns(:link)).to eq(link)
      end
    end

    describe "PUT #update" do
      context "with valid params" do
        let(:new_attributes) { attributes_for(:link, topic: "Cooking With Woopie") }

        before :each do
          authorize_admin
        end

        it "updates the requested link" do
          link = Link.create! valid_attributes
          put :update, {:id => link.to_param, :link => new_attributes}, valid_session
          link.reload
          expect(link.topic).to eq("Cooking With Woopie")
        end

        it "assigns the requested link as @link" do
          link = Link.create! valid_attributes
          put :update, {:id => link.to_param, :link => valid_attributes}, valid_session
          expect(assigns(:link)).to eq(link)
        end

        it "redirects to the link" do
          link = Link.create! valid_attributes
          put :update, {:id => link.to_param, :link => valid_attributes}, valid_session
          expect(response).to redirect_to(admin_path)
        end
      end

      context "with invalid params" do
        before :each do
          authorize_admin
        end

        it "assigns the link as @link" do
          link = Link.create! valid_attributes
          put :update, {:id => link.to_param, :link => invalid_attributes}, valid_session
          expect(assigns(:link)).to eq(link)
        end

        it "re-renders the 'edit' template" do
          link = Link.create! valid_attributes
          put :update, {:id => link.to_param, :link => invalid_attributes}, valid_session
          expect(response).to render_template("edit")
        end
      end
    end

    describe "DELETE #destroy" do
      before :each do
        authorize_admin
      end

      it "destroys the requested link" do
        link = Link.create! valid_attributes
        expect {
          delete :destroy, {:id => link.to_param}, valid_session
        }.to change(Link, :count).by(-1)
      end

      it "redirects to the links list" do
        link = Link.create! valid_attributes
        delete :destroy, {:id => link.to_param}, valid_session
        expect(response).to redirect_to(admin_path)
      end
    end
  end
end
