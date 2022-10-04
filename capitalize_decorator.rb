require_relative 'base_decorate'

class CapitalizeDecorator < BaseDecorate
  def correct_name
    @nameable.correct_name.capitalize
  end
end
