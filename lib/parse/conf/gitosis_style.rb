module Parse
  module Conf
    class GitosisStyle
      attr_reader :config_raw, :data, :empty_group_name
      
      Helper = Parse::Conf::ParserHelper

      def initialize(config_raw, separator = " ")
        @config_raw = config_raw
        @data = {}
        
        @empty_group_name = 'without_group'
        @separator = separator 
        @data[empty_group_name] = []        
      end

      def result
        parse unless @parsed
        @data 
      end

      def self.run(config_raw, separator = " ")
        obj = new(config_raw, separator)
        obj.result
      end
      
      private
      def parse
        @parsed = true

        group_name = nil
        config_raw.lines.each do |line|
          next if line == "\n" || line =~ /^\#.*/
          
          if line =~ /\[.*\]/i
            group_name = Helper.trim_and_remove_ugly_symbol(line)
            data[group_name] = [] 
          else
            item = line.split("=").map{ |it| Helper.trim_and_remove_ugly_symbol(it) }
            key, value = item[0], item[1].split(@separator)
            
            insert_etntry = {key => value}
            insert_key = group_name ? group_name : empty_group_name
            
            data[insert_key].push(insert_etntry)
          end          
        end
      end
    end
  end
end
