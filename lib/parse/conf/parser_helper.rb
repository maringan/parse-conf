module Parse
  module Conf
    class ParserHelper
      attr_reader :string

      def initialize(string)
        @string = string
      end

      def self.trim_and_remove_ugly_symbol(string)
        obj = new(string)
        obj.trim!
        obj.remove_ugly_symbol!
        obj.string
      end

      def trim!
        string.strip!
      end

      def remove_ugly_symbol!
        string.gsub!(/(\[|\])/, '')
      end
    end
  end
end
