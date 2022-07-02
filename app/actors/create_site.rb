# frozen_string_literal: true

class CreateSite < Actor
  include ActorError
  input :name, type: String

  input :user, type: User
  output :site
  def call
    site = user.sites.new name: name
    if site.save
      self.site = site

    else

      fail_with_validation_errors! site
    end
  end
end
