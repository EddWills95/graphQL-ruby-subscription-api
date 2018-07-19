class Types::QueryType < Types::BaseObject
  
  field :counter, Types::CounterType, null: false do
    argument :id, ID, required: false
  end

  def counter(args)
    Counter.find(args[:id])
  end

end
