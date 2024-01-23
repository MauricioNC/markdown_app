require 'rails_helper'

RSpec.describe "Posts", type: :request do
  let(:valid_attributes) do
    {
      title: 'Ruby on Rails authentication',
      content: "We'll learn how to create a loging with bcrypt gem in Rails"
    }
  end

  let(:invalid_attributes) do
    {
      title: '',
      content: "We'll learn how to create a loging with bcrypt gem in Rails"
    }
  end

  describe "GET /index" do
    it "returns http success" do
      get posts_path
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /show' do
    it 'returns http success' do
      get post_path
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /new' do
    it 'returns http success' do
      get new_post_path
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /edit' do
    it 'returns http success' do
      get edit_post_path
      expect(response).to have_http_status(:success)
    end
  end

  describe 'POST /posts' do
    context 'with valid parameters' do
      it 'creates a new post' do
        expect do
          post = Post.new(valid_attributes)
          post.save
          post posts_path, params: { post: valid_attributes } # this is the POST request
        end.to change(Post, :count).by(1)
      end

      it 'redirects to the created post' do
        post posts_path, params: { post: valid_attributes }
        expect(response).to be_succesfull
      end
    end

    context 'with invalid parameters' do
      it "doesn't creates a new post" do
        expect do
          post = Post.new(invalid_attributes)
          post.save
          post posts_path, params: { post: invalid_attributes } # this is the POST request
        end.to change(Post, :count).by(0)
      end

      it 'renders a successfull response' do
        post posts_path, params: { post: valid_attributes }
        expect(response).to be_succesfull
      end
    end
  end
end
