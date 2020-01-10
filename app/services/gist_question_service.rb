class GistQuestionService

  def initialize(question, user, client: nil)
    @question = question
    @user = user
    @test = @question.test
    @client = client || GitHubClient.new
  end

  def call
    result = @client.create_gist(gist_params)
    if result
      Gist.create(
        question: @question, link_to: result[:html_url],
        user: @user
      )
    else
      return
    end
    result
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
end
