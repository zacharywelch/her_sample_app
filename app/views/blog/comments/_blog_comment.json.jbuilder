json.extract! blog_comment, :id, :content, :created_at, :updated_at
json.url blog_comment_url(blog_comment, format: :json)
