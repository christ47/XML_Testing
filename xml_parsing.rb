require 'nokogiri'

class GuiseppesMenu

      attr_accessor :menu, :prices, :calories_array

      def initialize
        @menu = Nokogiri::XML(File.open('./xml_menu.xml'))
        @prices = @menu.search('price')
        @calories = @menu.search('calories')
        @calories_array = []
      end

      def removing_pound_sign
          prices = @prices.text.split ('£')
          prices.drop(1)
      end

      def calories_check

        @calories.each do |value|
        @calories_array << value.text.to_i
        end
        @calories_array
      end

      def calories_above_1000
        true_values = 0
        for i in 0..(@calories_array.length-2) do
          if @calories_array[i] < 1000
            true_values += 1
          end
        end
        if true_values == @calories_array.length-1
          return true
        else
          return false

        end
      end
end
test1 = GuiseppesMenu.new
p test1.calories_check
p test1.calories_above_1000
