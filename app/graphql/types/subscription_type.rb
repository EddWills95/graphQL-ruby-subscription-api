class Types::SubscriptionType < Types::BaseObject

  field :counterIncremented, Types::CounterType, null: true do
    argument :id, ID, required: true
  end

  def counter_incremented(args)
    counter = Counter.find(args[:id])
  end
end