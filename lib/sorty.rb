require "sorty/version"
require "sorty/sort"
require "sorty/helpers"

module Sorty

end

module ActiveRecord
  class Base
    include Sorty::Sort
  end
end

module ApplicationHelper
  include Sorty::Helpers
end
