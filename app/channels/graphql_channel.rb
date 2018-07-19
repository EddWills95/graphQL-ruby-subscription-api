class GraphqlChannel < ActionCable::Channel::Base
  
  def subscribed
    @subscription_ids = []
    # counter = Counter.find(args[:id])
    # stream_for counter
  end

  def execute(data)
    query = data["query"]
    variables = data["variables"] || {}
    operation_name = data["operationName"]
    context = {
      # Make sure the channel is in the context
      channel: self,
    }

    result = GraphQLSchema.execute({
      query: query,
      context: context,
      variables: variables,
      operation_name: operation_name
    })

    payload = {
      result: result.to_h,
      more: result.subscription?,
    }

    # Track the subscription here so we can remove it
    # on unsubscribe.
    if result.context[:subscription_id]
      @subscription_ids << result.context[:subscription_id]
      binding.pry
    end

    transmit(payload)
  end


  def unsubscribed
    @subscription_ids.each { |sid|
      GraphQLSchema.subscriptions.delete_subscription(sid)
    }
  end
end