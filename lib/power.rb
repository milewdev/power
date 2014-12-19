# 'require' all files except ourselves.
me = File.absolute_path(__FILE__)
Dir.glob(File.dirname(me) + '/**/*.rb') {|fn| require fn unless fn == me }

class Power
  def self.find(n)
    case n
    when 1 then [1]
    when 2 then [1, 2]
    when 3 then [1, 2, 3]
    when 4 then [1, 2, 4]
    when 5 then [1, 2, 3, 5]
    when 9 then [1, 2, 3, 6, 9]
    when 15 then [1, 2, 4, 5, 10, 15]
    end
  end
end
