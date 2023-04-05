require 'rails_helper'

RSpec.describe User, type: :model do
  subject do
    User.create(name: 'Raihan', photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                bio: 'Teacher from Bangla.', postscounter: 1,
                created_at: '2023-03-30 12:47:48.768257', updated_at: '2023-03-30 12:47:48.768257')
  end
  before { subject.save }

  it 'Test 1 runing is it valid or not' do
    expect(subject).to be_valid
  end
  it 'subject name is Raihan' do
    expect(subject.name).to eq('Raihan')
  end
  it 'subject bio is Teacher from Bangla.' do
    expect(subject.bio).to eq('Teacher from Bangla.')
  end
  it 'subject name should not be empty' do
    subject.name = ''
    expect(subject).to_not be_valid
  end
  it 'subject postscounter should be grater than 0' do
    subject.postscounter = -1
    expect(subject).to_not be_valid
  end
  it '#recent_posts should show 3 recent posts of user' do
    first_user = User.create(id: Random.rand(300..1000), name: 'Tom',
                             photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.',
                             postscounter: 1)
    Post.create(author: first_user, title: 'Hello World', text: 'This is my first post', commentscounter: 0,
                likescounter: 0)
    Post.create(author: first_user, title: 'Hello world', text: 'This is my second post', commentscounter: 0,
                likescounter: 0)
    Post.create(author: first_user, title: 'Hello world', text: 'This is my third post', commentscounter: 0,
                likescounter: 0)
    Post.create(author: first_user, title: 'Hello world', text: 'This is my fourth post', commentscounter: 0,
                likescounter: 0)
    curr_posts = first_user.recent_posts
    result = curr_posts.size
    expect(result).to eq(3)
  end
end
