require "active_support/concern"

module ActorError
  extend ActiveSupport::Concern

  def actor_error(type, message)
    {actor: self.class, type: type, message: message}
  end
end