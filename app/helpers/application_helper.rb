module ApplicationHelper
  TITLES = {new: 'Create new', edit: 'Edit', show: nil}.freeze
  def question_header(test)
    "#{TITLES[action_name.to_sym]} #{test.title} question"
  end

  def current_year
    DateTime.now.strftime('%Y')
  end

  def github_ulr(author, repo)
    link_to repo, "https://github.com/#{author}/#{repo}"
  end
end
