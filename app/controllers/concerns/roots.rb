module Roots

  extend ActiveSupport::Concern

  def roots
    @roots = Category.roots
  end

end
