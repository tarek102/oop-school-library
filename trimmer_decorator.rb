require_relative 'base_decorate'

class TrimmerDecorator < BaseDecorate
  def correct_name
    @nameable.correct_name[0, 10]
  end
end
