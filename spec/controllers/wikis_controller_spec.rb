require 'rails_helper'

RSpec.describe WikisController, type: :controller do
  let(:user) { FactoryBot.create(:user) }
  let(:my_wiki) { Wiki.create!(title: "New Title!", body: "A bunch of stuff.", private: false) }

  login_user

    describe "GET #index" do
      it "returns http success" do
        get :index
        expect(response).to have_http_status(:success)
      end

      it "assigns [my_wiki] to @wikis" do
        get :index
        expect(assigns(:wikis)).to eq([my_wiki])
      end
    end



    describe "GET #show" do
      it "returns http success" do
        get :show, {id: my_wiki.id}
        expect(response).to have_http_status(:success)
      end

      it "renders the #show view" do
        get :show, {id: my_wiki.id}
        expect(response).to render_template :show
      end

      it "assigns my_wiki to @wikis" do
        get :show, {id: my_wiki.id}
        expect(assigns(:wiki)).to eq(my_wiki)
      end
    end

    describe "GET #new" do
      it "returns http success" do
        get :new
        expect(response).to have_http_status(:success)
      end

      it "renders the #new view" do
        get :new
        expect(response).to render_template :new
      end

      it "instantiates @wiki" do
        get :new
        expect(assigns(:wiki)).not_to be_nil
      end
    end

    # describe "GET #edit" do
    #   it "returns http success" do
    #     get :edit, {id: my_wiki.id}
    #     expect(response).to have_http_status(:success)
    #   end
    # end

    describe "POST create" do
      it "increases the number of posts by 1" do
        count = Wiki.where({id: my_wiki.id}).count
        expect{ post :create, wiki: {title: my_wiki.title, body: my_wiki.body} }.to change(Wiki,:count).by(1)
      end

      it "assigns the new post to @wiki" do
        post :create, wiki: {title: RandomData.random_sentence, body: RandomData.random_paragraph}
        expect(assigns(:wiki)).to eq Wiki.last
      end

      it "redirects to the new post" do
        post :create, wiki: {title: RandomData.random_sentence, body: RandomData.random_paragraph }
        expect(response).to redirect_to Wiki.last
      end
    end

    describe "DELETE destroy" do
      it "deletes the wiki" do
        delete :destroy, {id: my_wiki.id}
        count = Wiki.where({id: my_wiki.id}).size
        expect(count).to eq 0
      end

      it "redirects to the wiki index" do
        delete :destroy, {id: my_wiki.id}
        expect(response).to redirect_to wikis_path
      end
    end

    describe "PUT update" do
      it "updates the wiki with the new attributes" do
        new_title = RandomData.random_sentence
        new_body = RandomData.random_paragraph

        put :update, id: my_wiki.id, wiki: {title: new_title, body: new_body}

        updated_wiki = assigns(:wiki)
        expect(updated_wiki.id).to eq my_wiki.id
        expect(updated_wiki.title).to eq new_title
        expect(updated_wiki.body).to eq new_body
      end
    end

end
