# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: temporal/enums/v1/query.proto

require 'google/protobuf'

Google::Protobuf::DescriptorPool.generated_pool.build do
  add_file("temporal/enums/v1/query.proto", :syntax => :proto3) do
    add_enum "temporal.enums.v1.QueryResultType" do
      value :QUERY_RESULT_TYPE_UNSPECIFIED, 0
      value :QUERY_RESULT_TYPE_ANSWERED, 1
      value :QUERY_RESULT_TYPE_FAILED, 2
    end
    add_enum "temporal.enums.v1.QueryRejectCondition" do
      value :QUERY_REJECT_CONDITION_UNSPECIFIED, 0
      value :QUERY_REJECT_CONDITION_NOT_OPEN, 1
      value :QUERY_REJECT_CONDITION_NOT_COMPLETED_CLEANLY, 2
    end
  end
end

module Temporal
  module Proto
    module Enums
      module V1
        QueryResultType = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("temporal.enums.v1.QueryResultType").enummodule
        QueryRejectCondition = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("temporal.enums.v1.QueryRejectCondition").enummodule
      end
    end
  end
end
