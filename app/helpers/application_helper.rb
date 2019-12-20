module ApplicationHelper
  def current_year
    DateTime.current.strftime('%Y')
  end

  def github_ulr(author, repo)
    link_to repo, "https://github.com/#{author}/#{repo}", target: '_blank'
  end

  def show_flash
    content_tag(:p, flash[:alert], class: 'alert flash') if flash[:alert]
  end
end
