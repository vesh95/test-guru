class GistQuestionService

  def initialize(question, user, client: default_client)
    @question = question
    @user = user
    @test = @question.test
    @client = client
  end

  def call
    @result = @client.create_gist(gist_params)
  end

  def success?
    !@result[:html_url].nil?
  end

  private

  def gist_params
    {
      description: "A question about #{@test.title} from TestGuru",
      public: true,
      files: {
        'test-guru-question.txt' => {
          content: gist_content
        }
      }
    }
  end

  def gist_content
    content = [@question.body]
    content += @question.answers.pluck(:body)
    content.join("\n")
  end

  def default_client
    Octokit::Client.new(access_token: ENV['ACCESS_TOKEN'])
  end
end
