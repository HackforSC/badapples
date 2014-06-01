class ConsumerComplaintQuery
  attr_accessor :relation

  def initialize(relation = ConsumerComplaint.scoped)
    @relation = relation.extending(Scopes)
  end
  
  def in_state(state_code = nil)
    if state_code.present?
      relation.with_state_code(state_code).sort! { |a, b| a.created_at <=> b.created_at }
    else
      relation.sort! { |a, b| a.created_at <=> b.created_at }
    end
  end
 
  module Scopes
    def with_state_code(state_code)
      where("state = ?", state_code)
    end
  end
end
