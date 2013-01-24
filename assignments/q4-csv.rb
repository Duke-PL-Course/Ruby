module ActsAsCsv
  def self.included(base)
    base.extend ClassMethods
  end

  module ClassMethods
    def acts_as_csv
      include InstanceMethods
    end
  end

  module InstanceMethods
    attr_accessor :headers, :csv_contents
    def initialize(rows)
      first, *rest = rows
      @headers = first.split(', ')
      @csv_contents = rest.map { |row| row.split(', ') }
    end
  end
end

class RubyCsv
  include ActsAsCsv
  acts_as_csv
end

