module ApplicationHelper
	def site_name
    # Change the value below between the quotes.
    "Marcos Pletcher - Rails App"
  end

  def site_url
    if Rails.env.production?
      # Place your production URL in the quotes below
      "https://quiet-taiga-9011.herokuapp.com"
    else
      # Our dev & test URL
      "http://localhost:3000"
    end
  end

  def meta_author
    # Change the value below between the quotes.
    "Marcos Pletcher"
  end

  def meta_description
    # Change the value below between the quotes.
    "First Rails Application"
  end

  def meta_keywords
    # Change the value below between the quotes.
    "pletcher, marcos, rails, code, app, application, framework, developer, c, java, javascript, html, css"
  end

  # Returns the full title on a per-page basis.
  # No need to change any of this we set page_title and site_name elsewhere.
  def full_title(page_title)
    if page_title.empty?
      site_name
    else
      "#{page_title} | #{site_name}"
    end
  end

  def link_to_image(image_path, target_link,options={})
  link_to(image_tag(image_path, :border => "0"), target_link, options)
  end

end
