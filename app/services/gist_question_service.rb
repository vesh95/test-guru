class GistQuestionService

  class Result
    def initialize(result)
      @result = result
    end

    def [](key)
      @result[key]
    end

    def success?
      !@result[:html_url].nil?
    end
  end

  def initialize(question, client: default_client)
    @question = question
    @test = @question.test
    @client = client
  end

  def call
    GistQuestionService::Result.new(@client.create_gist(gist_params))
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
