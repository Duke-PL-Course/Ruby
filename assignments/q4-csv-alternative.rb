# Alternative 2 using method_missing on CsvRow
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
      @csv_contents = rest.map { |row|
        row_arr = row.split(', ')
        row_hash = row_arr.each.with_index.inject({}) { |memo, (value, i)|
          memo[@headers[i]] = value
          memo
        }
        CsvRow.new(row_hash)
      }
    end
  end
end

class CsvRow
  attr_accessor :values
  def initialize(values)
    @values = values
  end
  def method_missing name, *args
    @values[name.to_s]
  end
end

class RubyCsv
  include ActsAsCsv
  acts_as_csv

  def each(&block)
    @csv_contents.each {|row| block.call row}
  end
end

lines = [
  'one, two',
  'lions, tigers'
]
csv = RubyCsv.new(lines)
csv.each {|row| puts row.one}
