class Test

  def method_missing(method_name)
    p "This is not right"
  end
end

test = Test.new

test.what!
