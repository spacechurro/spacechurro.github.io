require 'yaml'

class Compose
  attr_reader :title, :body

  def initialize(title: nil, body:)
    @title = title
    @body = body
  end

  def call
    post = {'layout' => 'post',
            'date'   => Time.now.strftime('%F %R'),
            'body'   => body
    }
    post['title'] = title if title
    
    YAML.dump(post)
  end
end
