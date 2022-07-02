# frozen_string_literal: true

require 'active_support/concern'

module ActorError
  extend ActiveSupport::Concern

  def fail_with_validation_errors!(record)
    fail! actor: self.class, type: :validation, errors: record.errors
  end
end
