require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'create new post' do
    context 'with invalid fields' do
      it 'fails if title is empty' do
        post = Post.create(
          title: '',
          content: 'We will learn how to create a login with the bcryp gem'
        )
        expect(post.errors.full_messages).to eq(["Title can't be blank"])
      end

      it 'fails if content is empty' do
        post = Post.create(
          title: 'Ruby on Rails authentication',
          content: ''
        )
        expect(post.errors.full_messages).to eq(["Content can't be blank"])
      end

      it 'fails if both title and content are empty' do
        post = Post.create(
          title: '',
          content: ''
        )
        expect(post.errors.full_messages).to eq(["Title can't be blank", "Content can't be blank"])
      end
    end

    context 'with valid fields' do
      it 'creates a new post' do
        Post.create(
          title: 'Ruby on Rails authentication',
          content: 'We will learn how to create a login with the bcryp gem'
        )
        expect(Post.count).to eq(1)
      end
    end
  end
end
