module SimpleSearchesHelper
  def build_paginator_url(page)
    simple_searches_path + "?keywords=#{@simple_search.keywords}&location=#{@simple_search.location}&page=#{page}"
  end

  def can_have_previous(page)
    page != 1
  end

  def can_have_last(current_page, total_page)
    current_page != total_page
  end
end
