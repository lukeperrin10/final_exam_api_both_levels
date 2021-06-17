RSpec.describe 'POST api/articles/comments', type: :request do
  let(:article) { create(:article) }

  describe 'successfully add a comment to an article' do
    before do
      post "/api/articles/#{article.id}/comments", params: {
        body: 'This article is really great'
      }
    end

    it 'is expected to respond with HTTP status 201 ' do
      expect(response).to have_http_status 201
    end

    it 'is expected to repsond with a success message' do
      expect(response_json['message']).to eq 'Your comment has been successfully created'
    end
  end

  describe 'unsuccessfully add a comment to an article' do
    before do
      post "/api/articles/#{article.id}/comments"
    end

    it "is expected to respond with a HTTP status 422" do
      expect(response).to have_http_status 422  
    end

    it "is expected to return and error message" do
      expect(response_json['error_message']).to eq 'Your comment was not created'
    end
    
    
  end
end
