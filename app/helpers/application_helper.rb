module ApplicationHelper
  
def site_name
    # Change the value below between the quotes.
  "Trevor Day School Math Department - Problem Based Learning"
  end

  def site_url
    if Rails.env.production?
      # Place your production URL in the quotes below
      "https://www.nitrous.io/app#/boxes/22805/ide"
    else
      # Our dev & test URL
      "https://www.nitrous.io/app#/boxes/22805/ide"
    end
  end

  def meta_author
    # Change the value below between the quotes.
    "Eric Lindow"
  end

  def meta_description
    # Change the value below between the quotes.
    "This is a site for Trevor Day School's Problem Based Math Curriculum"
  end

  def meta_keywords
    # Change the value below between the quotes.
    "PBL, Math, Trevor"
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

  
end
