module UsersHelper
  def get_new_or_existing_web_link(site, user)
    user.web_links.find_or_initialize_by_title(site)
  end
end
