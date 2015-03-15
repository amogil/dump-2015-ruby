module Demo
  Owner = Struct.new :title, :castle, :words, :account do
    extend OwnersFactory
  end
end