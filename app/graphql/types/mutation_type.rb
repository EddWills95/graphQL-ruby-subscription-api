class Types::MutationType < Types::BaseObject
  field :increment_counter, Types::CounterType, null: false do
    argument :id, ID, required: true
  end

  def increment_counter(args)
    counter = Counter.find(args[:id])
    counter.increment
    counter
  end
end
